# brew

## Files

| File | Committed | Purpose |
|---|---|---|
| `Brewfile` | Yes | Personal tools — install on any machine |
| `Brewfile.work` | No | Work-specific taps and tools. Copy from `Brewfile.work.example`. |
| `Brewfile.work.example` | Yes | Template for `Brewfile.work` |

## Install

```bash
brew bundle --file=brew/Brewfile
brew bundle --file=brew/Brewfile.work   # after work VPN/access is set up
```

## Contents

| Category | Tools |
|---|---|
| Core | `git`, `git-lfs`, `vim`, `tmux`, `fzf`, `jq`, `ffmpeg` |
| Java / JVM | `jenv`, `maven`, `gradle@7`, `bazelisk`, `buildifier`, `sbt`, `scala` |
| Languages | `pyenv`, `node`, `python@3.10` |
| Cloud / infra | `grpcurl`, `gcloud-cli`, `flytectl` |
| Apps | IntelliJ IDEA, iTerm2, Figma, Discord |
