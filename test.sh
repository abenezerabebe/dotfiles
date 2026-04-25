#!/usr/bin/env zsh
# Smoke tests for the dotfiles in this repo.
# Spawns isolated zsh sessions and checks for runtime regressions.
# Run after edits: ~/src/dotfiles/test.sh

pass=0
fail=0
failed=()

ok()   { printf '  ok   %s\n' "$1"; pass=$((pass+1)); }
nope() { printf '  FAIL %s\n       %s\n' "$1" "$2"; fail=$((fail+1)); failed+=("$1"); }

# Scrub the shared-env guard so a stale value in the calling shell can't
# short-circuit sourcing in the test child.
zsh_run()    { env -u __ZSHENV_SHARED zsh -i -c "$1" 2>&1; }
zsh_nested() { env -u __ZSHENV_SHARED zsh -i -c "zsh -i -c ${(q)1}" 2>&1; }

is_error() {
  case "$1" in
    *"command not found"*|*"parse error"*|*"no such file or directory"*|\
    *"unbound variable"*|*"no matches found"*|*"bad pattern"*)
      return 0 ;;
    *) return 1 ;;
  esac
}

# Syntax check every config file zsh sources at startup.
for f in ~/.zprofile ~/.zshenv.shared ~/.zshrc ~/.zshrc.local ~/.zshrc.secrets; do
  [[ -f "$f" ]] || continue
  err=$(zsh -n "$f" 2>&1)
  if [[ -n "$err" ]]; then nope "syntax: $f" "$err"; else ok "syntax: $f"; fi
done

# Startup must be quiet — no errors emitted during sourcing.
out=$(zsh_run 'true')
is_error "$out" && nope "clean startup (parent)" "$out" || ok "clean startup (parent)"

out=$(zsh_nested 'true')
is_error "$out" && nope "clean startup (nested)" "$out" || ok "clean startup (nested)"

# _addpath must be defined in both parent and nested shells. If the .zshenv.shared
# guard ever gets exported again, the nested check will catch it.
out=$(zsh_run 'type _addpath')
[[ "$out" == *"shell function"* ]] && ok "_addpath defined (parent)" \
  || nope "_addpath defined (parent)" "$out"

out=$(zsh_nested 'type _addpath')
[[ "$out" == *"shell function"* ]] && ok "_addpath defined (nested)" \
  || nope "_addpath defined (nested)" "$out"

# __ZSHENV_SHARED must NOT be exported — otherwise child shells inherit it,
# the guard short-circuits, and shell functions never get redefined.
out=$(zsh_run 'env')
[[ "$out" == *"__ZSHENV_SHARED="* ]] \
  && nope "__ZSHENV_SHARED not exported" "found in env (would leak to children)" \
  || ok "__ZSHENV_SHARED not exported"

# Required PATH entries must be present.
path_out=$(zsh_run 'echo "$PATH"')
for p in /opt/homebrew/bin /opt/homebrew/sbin "$HOME/.local/bin"; do
  [[ ":$path_out:" == *":$p:"* ]] && ok "PATH contains $p" \
    || nope "PATH contains $p" "PATH=$path_out"
done

# Sourcing .zshenv.shared twice in the same shell must be a no-op (guard works).
out=$(zsh_run 'source ~/.zshenv.shared; source ~/.zshenv.shared; type _addpath')
[[ "$out" == *"shell function"* ]] && ok "double-source is safe" \
  || nope "double-source is safe" "$out"

echo
printf '%d passed, %d failed\n' "$pass" "$fail"
if (( fail > 0 )); then
  printf '\nfailed:\n'
  for t in "${failed[@]}"; do printf '  - %s\n' "$t"; done
  exit 1
fi
