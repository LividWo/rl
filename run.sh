cd /cpfs01/user/chenyinghao/WebRL/scripts
export HF_ENDPOINT="https://hf-mirror.com"
export HOME="/cpfs01/user/chenyinghao"
export HF_HOME="/cpfs01/user/chenyinghao/.cache"
export FORCE_TORCHRUN=1
source /cpfs01/user/chenyinghao/anaconda3/etc/profile.d/conda.sh

conda activate webrl
 
export VLLM_USE_MODELSCOPE="False"
export NCCL_IB_TC=160
export NCCL_IB_SL=5
export NCCL_IB_GID_INDEX=3
export NCCL_SOCKET_IFNAME=eth0
export NCCL_IB_HCA=mlx5
export NCCL_IB_TIMEOUT=120
export NCCL_TIMEOUT=1200
export NCCL_IB_QPS_PER_CONNECTION=4
export NCCL_MIN_NCHANNELS=4
export NCCL_NET_PLUGIN=none

export NCCL_P2P_DISABLE=0
#export NCCL_P2P_LEVEL=PXB
export NCCL_P2P_LEVEL=NVL

export NCCL_PXN_DISABLE=0
export NCCL_NET_GDR_LEVEL=2
export NCCL_MIN_CTAS=4
export NCCL_IB_RETRY_CNT=7

export NCCL_IB_DISABLE=0

echo $NCCL_P2P_LEVEL

export GLOO_SOCKET_IFNAME=eth0 
export CUDA_DEVICE_MAX_CONNECTIONS=1 

export PYTORCH_CUDA_ALLOC_CONF=expandable_segments:True

CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7 torchrun \
    --nproc_per_node 8 \
    run.py \
    --config_path config/main \
    --config_name webrl  2>&1 | tee ../logs/2.log