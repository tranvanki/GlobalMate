# GlobalMate
Master GitHub link for mini project

## 🔒 Branch Protection Policy

**Important:** Direct pushes to the `main` branch are not allowed. All code changes must be made through feature branches and pull requests.

### Quick Start for Team Members

1. **Install Git Hooks** (recommended):
   ```bash
   .github/hooks/install-hooks.sh
   ```
   This installs a client-side hook that prevents accidental pushes to main.

2. **Create a Feature Branch**:
   ```bash
   git checkout main
   git pull origin main
   git checkout -b feature/your-feature-name
   ```

3. **Make Changes and Push**:
   ```bash
   git add .
   git commit -m "Your descriptive message"
   git push -u origin feature/your-feature-name
   ```

4. **Create a Pull Request** on GitHub and request reviews from team members.

### Documentation

- **[Branch Protection Guidelines](.github/BRANCH_PROTECTION.md)** - Complete workflow and setup instructions
- **Repository administrators**: See the guidelines for setting up GitHub branch protection rules

### Why This Policy?

- Ensures code review before merging
- Maintains a clean and stable main branch
- Enables better collaboration and code quality
- Prevents accidental breaking changes
