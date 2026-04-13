# Git Workflow Notes

## Branches
- main: stable, production-ready code
- feature/*: new features or analysis
- fix/*: bug fixes

## Common commands
git checkout -b feature/name   # create and switch to new branch
git branch                     # list all branches
git add .                      # stage changes
git commit -m "message"        # commit
git push origin branch-name    # push branch to GitHub
git checkout main              # switch back to main
git merge feature/name         # merge branch into main
