# Tower Zeta6 user documentation

This public repository is the user-facing documentation for the Tower Zeta6
Slurm service. It contains no administrator credentials, private network
configuration or runtime secrets.

## Start here

- [Complete user manual (PDF)](manual/Tower-Zeta6-User-Manual.pdf)
- [Quick Start Guide](QUICK_START.md)
- [Ordered practical runbooks](runbook/README.md)
- [Acceptable-use policy](ACCEPTABLE_USE.md)

The PDF is the complete reference. The Quick Start is the shortest supported
path from application to a first job. Runbooks contain commands and files that
can be copied and adapted.

## Current software status

Z6 currently provides the `2026` Lmod entry point and system Python 3.12. A
centrally maintained Python/CUDA/cuDNN module stack has not yet been published.
The Python runbook therefore uses a user-owned virtual environment and a pinned
official PyTorch wheel. Re-check this notice before creating a new environment.

For access or service problems, contact `b.y.ding@tudelft.nl`. Never include a
password, private SSH key or access token in a support message.
