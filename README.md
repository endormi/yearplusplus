# yearplusplus

GitHub Action to automatically update year in specified files.

## Usage

| Input Name      | Description                      | Required | Default Value          |
|-----------------|----------------------------------|----------|------------------------|
| `files`         | Files to update                  | Yes      |                        |
| `last_year`     | Custom last year                 | No       |                        |
| `current_year`  | Custom current year              | No       |                        |
| `git_user`      | Git username                     | No       | 'Year++'               |
| `git_email`     | Git email                        | No       | '<>'                   |
| `commit_message`| Commit message for Git commits   | No       | 'Update copyright year'|

## Example

```yaml
name: Update Year

on:
  schedule:
    - cron: "0 1 1 1 *" # 01:00 on January 1

jobs:
  update_year:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout Repository
        uses: actions/checkout@v3

      - name: Update Year in Specified Files
        uses: endormi/yearplusplus@v1
        with:
          files: 'LICENSE'                               # Provide the file(s) you want to update
          last_year: '2023'                              # Optional: specify a custom last year
          current_year: '2024'                           # Optional: specify a custom current year
          git_user: 'username'                           # Optional: specify the Git username
          git_email: 'email@example.com'                 # Optional: specify the Git email
          commit_message: 'Update year in license file'  # Optional: specify the commit message
```

## License

The source code is released under the [MIT License](LICENSE).
