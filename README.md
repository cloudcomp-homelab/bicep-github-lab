# bicep-github-lab

Lab repository for deploying Azure infrastructure with **Bicep** through **GitHub Actions**.

## Structure

| Path | Contents |
|---|---|
| `main.bicep` | Main template (scope: subscription) |
| `main.bicepparam` | Parameter values |
| `modules/` | Reusable Bicep modules |
| `.github/workflows/` | GitHub Actions workflows |

## Workflow

1. Create a feature branch from `main`.
2. Change the Bicep files and push the branch.
3. Open a pull request: the workflow validates the Bicep code and shows a **what-if**.
4. After merging into `main`, the changes are deployed to Azure automatically.

## Authentication

GitHub Actions signs in to Azure using **OpenID Connect (OIDC)** with an App Registration and federated credentials. No passwords or client secrets are stored.

## Cost

Free resources only (VNet).