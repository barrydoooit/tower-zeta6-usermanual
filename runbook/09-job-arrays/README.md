# Runbook 09 — Submit a job array

Use an array for independent runs such as a small hyperparameter sweep. The
[`gpu-array.sbatch`](gpu-array.sbatch) example contains four learning rates and
allows at most two elements to run simultaneously because Z6 has two GPUs.

```bash
mkdir -p logs
sbatch gpu-array.sbatch
squeue -u "$USER"
```

Each element receives its own GPU, CPU and memory allocation. `%A` is the array
job ID and `%a` the element ID. Avoid flooding the queue with speculative
arrays; request only experiments you intend to run.

Next: [Runbook 10](../10-monitor-and-troubleshoot/README.md).
