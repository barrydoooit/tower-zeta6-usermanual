# Runbook 07 — Submit a single-GPU job

Copy [`single-gpu.sbatch`](single-gpu.sbatch) and [`gpu-smoke.py`](gpu-smoke.py)
to the same project directory:

```bash
mkdir -p jobs logs
cp single-gpu.sbatch jobs/
cp gpu-smoke.py .
sbatch jobs/single-gpu.sbatch
squeue -u "$USER"
```

The example requests one GPU, 8 CPUs and 48 GiB for up to four hours. Adjust
time, CPUs and memory to the workload. Keep `--gpus=1` for a single-GPU run.

The final command is a runnable GPU smoke test. For training, replace only:

```bash
python -u gpu-smoke.py
```

with the project entry point, for example `python -u train.py --config
configs/model.yaml`. Retain the environment activation and CUDA preflight.

Next: [Runbook 08](../08-two-gpu-job/README.md).
