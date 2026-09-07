# DIMS Dashboard — reference study

The reference DIMS dashboard with real data: time series, video, transcript,
RQA, cross-RQA, cross-wavelet coherence and ELAN annotations.

This is a **case repository**. It holds its configuration and its data; the
dashboard code is a pinned copy of
[dims-network/dims](https://github.com/dims-network/dims) under `vendor/`,
written by tooling and verified by CI.

**Do not edit `vendor/`.** Fix the core and bump `dimsCore` in `dims-case.json`.

## Run it locally

```sh
python serve.py 8000     # then open http://localhost:8000
```

## Recompute the analyses

```sh
pip install -e ../dims/packages/dims-analysis
dims-analysis run --config config.json
```

## History

This repository was previously `dims-network/DIMS_Dashboard`, which is now
archived. Its full history is preserved here.

## Citation

Miao, G. Q., Trujillo, J., Bulls, L. S., Thornton, M. A., Dale, R., & Pouw, W.
(2025). *DIMS Dashboard for Exploring Dynamic Interactions and Multimodal
Signals.* CogSci 2025.
