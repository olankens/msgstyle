<hr>

# <samp>MSGSTYLE</samp>

![](GITHUB.png)

Git commit message style enforcer that validates your commit messages against a set of opinionated rules. This script ensures consistency and clarity in your commit history by checking message length, format, and content.

<hr>

### Formatting Rules

- Lenght between 10 and 35
- No digits
- No scope or type
- No trailing punctuation
- No weird characters
- Start with allowed verb
- Start with capital rest lowercase

<hr>

### Global Installation

```shell
git config --global core.hooksPath "$HOME/.githooks"
curl "https://raw.githubusercontent.com/olankens/msgstyle/HEAD/src/msgstyle.sh" -o "$HOME/.githooks/commit-msg"
chmod +x "$HOME/.githooks/commit-msg"
```

<hr>
