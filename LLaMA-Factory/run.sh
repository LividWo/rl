yaml=$1
export HF_ENDPOINT="https://hf-mirror.com"
export HOME="/cpfs01/user/wuzhiyong"
export HF_HOME="/cpfs01/user/wuzhiyong/.cache"
export FORCE_TORCHRUN=1
source /cpfs01/user/wuzhiyong/anaconda3/etc/profile.d/conda.sh
/root/anaconda3/etc/profile.d/conda.sh
conda activate fac
cd /cpfs01/user/wuzhiyong/rl/LLaMA-Factory
echo ${yaml}
llamafactory-cli train ${yaml}