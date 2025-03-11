# yearplusplus

GitHub Action to automatically update year in specified files.

## Usage

| Input Name  | Description                             | Required | Default Value             |
|-------------|-----------------------------------------|----------|---------------------------|
| `files`          | Files to update                    | Yes      |                           |
| `username`       | Username for the commit            | No       | github-actions[bot]       |
| `email`          | Email for the commit               | No       | github-actions[bot] email |
| `commit_message` | Commit message                     | No       | Update copyright year     |
| `from_year`      | Year to replace (customizable)     | No       | Last year                 |
| `to_year`        | Year to replace with (customizable)| No       | Current year              |

One of these is required for this Workflow to work (otherwise you get an 403 error):

Option 1: Go to Settings of your repository, then navigate to Actions > General. Under "Workflow permissions," choose Read and write permissions.

Option 2: Create a PAT (Personal Access Token) with the necessary permissions. You can do this in your GitHub account settings. Once created, add the PAT as a secret in your repository settings and use it in your workflow.

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
        # You might not need this
        # with:
          # token: ${{ secrets.PERSONAL_ACCESS_TOKEN }} # Whichever name you decide to use.

      - name: Update year in specified files
        uses: endormi/yearplusplus@v2
        with:
          files: 'LICENSE'      # Provide the file(s) you want to update
          # username: 'Year++'  # Optional: specify a username (defaults to 'github-actions[bot]')
          # email: '<>'         # Optional: specify an email (defaults to 'github-actions[bot]@users.noreply.github.com')
          # commit_message: ''  # Optional: specify commit message (defaults to 'Update copyright year')
          # from_year: '2023'   # Optional: specify the year to replace (defaults to last year)
          # to_year: '2024'     # Optional: specify the year to replace with (defaults to current year)
```

## License

The source code is released under the [MIT License](LICENSE).
