# Ordered Z6 runbooks

Follow these in order when onboarding. Return to the relevant step later when
changing a key, environment or workload.

| Step | Runbook | Outcome |
|---:|---|---|
| 01 | [Account application](01-account-application/README.md) | Request submitted |
| 02 | [Portal activation](02-portal-activation/README.md) | Portal account active and provisioned |
| 03 | [SSH key and access](03-ssh-key-and-access/README.md) | Key-based `ssh z6` works |
| 04 | [Storage and transfer](04-storage-and-transfer/README.md) | Project path found and data placed correctly |
| 05 | [Python environment](05-python-environment/README.md) | Reproducible user environment created |
| 06 | [Interactive allocation](06-interactive-allocation/README.md) | Slurm and GPU visibility verified |
| 07 | [Single-GPU job](07-single-gpu-job/README.md) | One-GPU batch template submitted |
| 08 | [Two-GPU job](08-two-gpu-job/README.md) | Two-worker PyTorch job submitted |
| 09 | [Job arrays](09-job-arrays/README.md) | Independent runs queued safely |
| 10 | [Monitor and troubleshoot](10-monitor-and-troubleshoot/README.md) | Jobs inspected, diagnosed or cancelled |

The [Quick Start Guide](../QUICK_START.md) selects the minimum path through
these runbooks. The [complete manual](../manual/Tower-Zeta6-User-Manual.pdf)
provides the governing explanations and policies.
