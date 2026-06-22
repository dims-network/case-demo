# Development workflow

There are three repos, with **one source of truth for dashboard code**:

| Repo | Role | Gets template code via |
|---|---|---|
| **[DIMS_dashboard_template](https://github.com/dims-network/DIMS_dashboard_template)** | canonical **code** (frontend + `opt/` scripts). All code changes happen here. | — (it *is* the source) |
| **DIMS_Dashboard** (this repo) | canonical **data** + the deployed GitHub Pages site. Doubles as the real-data integration test bed. | `git merge template/main` |
| **DIMS_dashboard_builder** | the no-code wizard | `git subtree pull` (its `template/` subdir) |

**Golden rule:** never edit dashboard *code* directly in this repo or the builder.
All code changes originate in the template; the downstreams only *receive*. That's
what keeps merges conflict-free (this repo's `assets/` never exist upstream, and
`config.json` is auto-kept via `.gitattributes merge=ours`).

## Lifecycle of a feature

1. **Develop** on a branch of **DIMS_dashboard_template**; open a PR there.
2. **Integration-test it here, against real data:**
   ```sh
   git fetch template <feature-branch>
   git checkout -b test/<feature> && git merge template/<feature-branch>
   python serve.py 8000        # open http://localhost:8000 and check it with real data
   ```
   Throw the test branch away afterward (`git checkout main; git branch -D test/<feature>`).
3. **Bless** it: merge the PR into **`template/main`** — the single approval point.
4. **Propagate downstream** (mechanical, no re-review):
   - Here: `scripts/update-from-template.sh` → review → `git push` (Pages redeploys).
   - Builder: `scripts/update-template.sh` → `git push`.

## One-time setup (per clone)

```sh
git config merge.ours.driver true   # makes config.json auto-resolve to ours on merge
```
The `template` remote is added automatically by `scripts/update-from-template.sh`
if missing.
