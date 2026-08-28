#!/usr/bin/env bash
#SBATCH --job-name=single-gpu
#SBATCH --partition=gpu
#SBATCH --time=04:00:00
#SBATCH --gpus=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=48G
#SBATCH --output=logs/%x-%j.out
#SBATCH --error=logs/%x-%j.err

set -euo pipefail
source /etc/profile.d/lmod.sh
module purge
module load 2026
source ~/venvs/z6-pytorch/bin/activate

cd "$SLURM_SUBMIT_DIR"
export PYTHONUNBUFFERED=1
export OMP_NUM_THREADS="$SLURM_CPUS_PER_TASK"

python - <<'PY'
import torch
assert torch.cuda.is_available(), "CUDA is unavailable in this allocation"
assert torch.cuda.device_count() == 1, "Expected exactly one visible GPU"
print(torch.__version__, torch.version.cuda, torch.cuda.get_device_name(0))
PY

# Replace this line with the project's training command.
python -u gpu-smoke.py
