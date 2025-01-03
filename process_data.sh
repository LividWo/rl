python scripts/process_data.py \
--rollout_path result/generated/2 \
--output_path result/processed/2.pt \
--add_reward \
--orm_path webrl-orm-llama-3.1-8b \
--num_gpu 1 \
--stage 1

python scripts/process_data.py \
--output_path result/processed/2.pt \
--actor_path scripts/phase_1/actor \
--experience_path result/processed/0.pt result/processed/1.pt \
--num_gpu 1 \
--stage 2