yaml=$1
export HF_ENDPOINT="https://hf-mirror.com"
export HOME="/cpfs01/user/chenyinghao"
export HF_HOME="/cpfs01/user/chenyinghao/.cache"
export FORCE_TORCHRUN=1
source /cpfs01/user/chenyinghao/anaconda3/etc/profile.d/conda.sh

conda activate llama_fac
cd /cpfs01/user/chenyinghao/WebRL/LLaMA-Factory
echo ${yaml}
llamafactory-cli train ${yaml}