<hr>

<div align="center">
  <p><img src=".assets/icon.svg" width="128"/></p>
  <sub>SCRIPTING</sub>
  <h1>MSGSTYLE</h1>
  <p>Enforce a strict Git commit message style by validating each message against a defined set of opinionated rules. This script improves consistency and clarity in your commit history by checking structure, length, formatting, and overall content quality.</p>
</div>

<hr>

### Formatting Rules

- Length between 20 and 100
- No scope or type
- No trailing punctuation
- No weird characters
- Start with a capital letter
- Start with a verb (still very naive)

<hr>

### Global Installation

```shell
git config --global core.hooksPath "$HOME/.githooks"
curl "https://raw.githubusercontent.com/olankens/msgstyle/HEAD/src/msgstyle.sh" -o "$HOME/.githooks/commit-msg"
chmod +x "$HOME/.githooks/commit-msg"
```

<hr>

### Local Installation

```shell
curl "https://raw.githubusercontent.com/olankens/msgstyle/HEAD/src/msgstyle.sh" -o ".git/hooks/commit-msg"
chmod +x ".git/hooks/commit-msg"
```

<hr>