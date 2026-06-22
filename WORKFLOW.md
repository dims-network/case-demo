# Development & integration workflow

Full, canonical documentation lives on the DIMS docs site:

- **Integration workflow:** <https://dims-network.github.io/docs/workflow.html>
- **Contributing:** <https://dims-network.github.io/docs/contributing.html>
- **System architecture:** <https://dims-network.github.io/docs/architecture.html>

In short: this repo is **canonical data + the deployed site**, and it receives
dashboard code from
[DIMS_dashboard_template](https://github.com/dims-network/DIMS_dashboard_template)
as an upstream remote. Pull the latest template code with:

```sh
scripts/update-from-template.sh
```

One-time per clone (so `config.json` auto-keeps this repo's data on merge):

```sh
git config merge.ours.driver true
```

**Golden rule:** never edit dashboard *code* here — it comes from the template.