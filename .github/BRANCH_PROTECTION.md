# Branch Protection Guidelines

## Overview
This repository requires all code changes to be made through feature branches and pull requests. Direct pushes to the `main` (or `master`) branch are not allowed.

## Setting Up Branch Protection (Repository Administrators)

To enforce branch protection on GitHub:

1. Go to your repository on GitHub
2. Navigate to **Settings** → **Branches**
3. Under "Branch protection rules", click **Add rule**
4. Configure the following settings:

### Recommended Settings:
- **Branch name pattern**: `main` (or `master`)
- ✅ **Require a pull request before merging**
  - ✅ Require approvals (at least 1)
  - ✅ Dismiss stale pull request approvals when new commits are pushed
- ✅ **Require status checks to pass before merging**
- ✅ **Require conversation resolution before merging**
- ✅ **Do not allow bypassing the above settings** (unless you need admin override)
- ✅ **Restrict who can push to matching branches** (optional: specify teams/users)

5. Click **Create** or **Save changes**

## Workflow for Team Members

### Creating a New Feature Branch

```bash
# Make sure you're on the main branch and it's up to date
git checkout main
git pull origin main

# Create a new feature branch
git checkout -b feature/your-feature-name

# Make your changes and commit
git add .
git commit -m "Your descriptive commit message"

# Push your feature branch to GitHub
git push -u origin feature/your-feature-name
```

### Creating a Pull Request

1. Go to your repository on GitHub
2. You should see a prompt to create a pull request for your recently pushed branch
3. Click **Compare & pull request**
4. Fill in the PR template with:
   - A descriptive title
   - Details about your changes
   - Any relevant issue numbers
5. Request reviews from team members
6. Click **Create pull request**

### After PR is Approved

Once your pull request is reviewed and approved:
1. Ensure all status checks pass
2. Resolve any merge conflicts if they exist
3. Click **Merge pull request** (or have a maintainer do this)
4. Delete the feature branch after merging (GitHub will prompt you)

### Updating Your Feature Branch

If the main branch has been updated while you're working:

```bash
# Switch to your feature branch
git checkout feature/your-feature-name

# Fetch the latest changes
git fetch origin

# Rebase your branch on top of main (or merge if you prefer)
git rebase origin/main
# OR
git merge origin/main

# Push the updated branch (may need --force-with-lease if rebased)
git push origin feature/your-feature-name --force-with-lease
```

## Branch Naming Conventions

Use clear, descriptive branch names:

- `feature/add-user-authentication`
- `bugfix/fix-login-error`
- `hotfix/critical-security-patch`
- `docs/update-readme`
- `refactor/improve-performance`

## What Happens If You Push Directly to Main?

- GitHub Actions workflow will fail
- The commit will be rejected if branch protection is enabled
- You'll need to revert the commit and create a proper feature branch

## Need Help?

If you accidentally pushed to main or need assistance:
1. Contact a repository administrator
2. Review this documentation
3. Check the GitHub Actions logs for specific error messages
