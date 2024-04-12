# yearplusplus

GitHub Action to automatically update year in specified files.

## Usage

| Input Name  | Description                        | Required | Default Value |
|-------------|------------------------------------|----------|---------------|
| `files`     | Files to update                    | Yes      |               |
| `from_year` | Year to replace (customizable)     | No       | Last year     |
| `to_year`   | Year to replace with (customizable)| No       | Current year  |

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
        uses: endormi/yearplusplus@v1
        with:
          files: 'LICENSE'    # Provide the file(s) you want to update
          # from_year: '2023' # Optional: specify a custom year to replace (defaults to last year)
          # to_year: '2024'   # Optional: specify a custom year to replace with (defaults to current year)

      - name: Setup Git configuration
        run: |
          git config user.name "Year++"
          git config user.email "<>"

      - name: Commit changes
        run: |
          if [ -n "$(git status --porcelain)" ]; then
            git commit -am "Update copyright year"
            git push origin ${{ github.head_ref }}
          else
            echo "No changes to commit."
          fi
```

## License

The source code is released under the [MIT License](LICENSE).
