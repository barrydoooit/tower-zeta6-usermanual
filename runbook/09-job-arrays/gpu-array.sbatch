#!/usr/bin/env bash
#SBATCH --job-name=learning-rate-sweep
#SBATCH --partition=gpu
#SBATCH --time=04:00:00
#SBATCH --array=0-3%2
#SBATCH --gpus=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=48G
#SBATCH --output=logs/%x-%A_%a.out
#SBATCH --error=logs/%x-%A_%a.err

set -euo pipefail
source /etc/profile.d/lmod.sh
module purge
module load 2026
source ~/venvs/z6-pytorch/bin/activate

cd "$SLURM_SUBMIT_DIR"
values=(0.001 0.0003 0.0001 0.00003)
learning_rate="${values[$SLURM_ARRAY_TASK_ID]}"
python -u train.py --learning-rate "$learning_rate"
