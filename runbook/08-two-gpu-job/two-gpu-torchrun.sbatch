#!/usr/bin/env bash
#SBATCH --job-name=two-gpu
#SBATCH --partition=gpu
#SBATCH --time=08:00:00
#SBATCH --gpus=2
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=96G
#SBATCH --output=logs/%x-%j.out
#SBATCH --error=logs/%x-%j.err

set -euo pipefail
source /etc/profile.d/lmod.sh
module purge
module load 2026
source ~/venvs/z6-pytorch/bin/activate

cd "$SLURM_SUBMIT_DIR"
export PYTHONUNBUFFERED=1
export OMP_NUM_THREADS=8

python - <<'PY'
import torch
assert torch.cuda.is_available(), "CUDA is unavailable in this allocation"
assert torch.cuda.device_count() == 2, "Expected exactly two visible GPUs"
print(torch.__version__, torch.version.cuda, torch.cuda.device_count())
PY

# Replace ddp-smoke.py with the project's distributed training entry point.
torchrun --standalone --nproc-per-node=2 ddp-smoke.py
