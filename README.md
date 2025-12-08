# OVERVIEW

<p><img src="GITHUB.png" height="100%"></p>

Git commit message style enforcer that validates your commit messages against a set of opinionated rules. This tool ensures consistency and clarity in your commit history by checking message length, format, and content.

---

### Lenght Between 12 and 72

Commit messages must be between 12 and 72 characters long. This ensures messages are descriptive enough to be meaningful while remaining concise and readable in Git logs and tools.

---

### No Scope or Type

Commit messages must not use conventional commit format (e.g., `feat:`, `fix(scope):`, `chore!:`). This enforces a simpler, more direct message style without type prefixes or scope annotations.

---

### No Trailing Punctuation

Commit messages must not end with punctuation marks (`.`, `,`, `;`, `:`, `!`, `?`). This keeps messages clean and follows common Git conventions where the subject line is treated as a title.

---

### No Weird Characters

Commit messages must not contain special characters like `@`, `#`, `$`, `%`, `^`, `&`, `*`, `()`, `{}`, `[]`, `<>`, `|`, `\`, `~`, or backticks. This ensures messages remain simple and compatible across different tools and platforms.

---

### Start with Allowed Verb

Commit messages must start with one of the allowed verbs:

- Accept
- Adjust
- Bundle
- Bypass
- Cancel
- Concat
- Create
- Decode
- Delete
- Deploy
- Enable
- Encode
- Ensure
- Export
- Filter
- Forbid
- Format
- Freeze
- Harden
- Ignore
- Import
- Insert
- Loosen
- Permit
- Rebase
- Refine
- Reject
- Resume
- Return
- Revert
- Reword
- Secure
- Submit
- Switch
- Unpack
- Update
- Vanish
- Verify

---

# GUIDANCE

### Global Installation

```shell
git config --global core.hooksPath "$HOME/.githooks"
curl "https://raw.githubusercontent.com/olankens/msgstyle/HEAD/src/msgstyle.sh" -o "$HOME/.githooks/commit-msg"
chmod +x "$HOME/.githooks/commit-msg"
```
