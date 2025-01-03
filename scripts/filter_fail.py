import argparse
import os
import json
import torch


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Process webarena data')
    parser.add_argument('--rollout_path', type=str, default='')
    parser.add_argument('--failed_file', type=str, default='replay_buffer/failed.jsonl')
    parser.add_argument('--phase', type=int, default=0)

    args = parser.parse_args()
    
    assert os.path.exists(args.rollout_path), f"Path {args.rollout_path} does not exist."
    if not os.path.exists(args.failed_file):
        os.makedirs(args.failed_file)
        open(args.failed_file, 'w').close()

    success_traj = []
    failed_num = 0
    success_num = 0
    with open(args.failed_file, "a") as fail:
        rollouts = os.listdir(os.path.join(args.rollout_path, "fixed_traces"))
        for rollout in rollouts:
            with open(os.path.join(args.rollout_path, "fixed_traces", rollout), "r") as file:
                lines = file.readlines()
                first_action = json.loads(lines[0])
                score = first_action["score"]
                task_id = first_action["trace_id"]
                # failed
                if score >= 0.0 and score < 0.5:
                    f = open(os.path.join(args.rollout_path, "tasks", f"{task_id}.json"))
                    task = f.read().strip()
                    f.close()
                    failed_num += 1
                    fail.write(task+'\n')
                    
    print(f"Failed: {failed_num}, Success: {success_num}")