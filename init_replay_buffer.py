# 从 result 中,按 gen_task.py 的要求提取失败任务
import json
import os
import torch

if __name__ == "__main__":
    success_traj = []
    with open("replay_buffer/failed.jsonl", "w") as fail:
        for task_id in range(165):
            action = json.load(open("result/llama-3.1-8b-sft/actions/"+str(task_id)+".json"))
            score = action["score"]
            if score >= 0.0 and score < 0.5:
                task_config = json.load(open("test_webarena_lite/"+str(task_id)+".json"))
                task = task_config["intent"]
                sites = task_config["sites"]
                fail_task = {
                    "web": sites[0],
                    "task": task,
                }
                fail.write(json.dumps(fail_task)+'\n')
            elif score >= 0.5 and score <= 1.0:
                traj = []
                with open("result/llama-3.1-8b-sft/traces/"+str(task_id)+".jsonl") as f:
                    for line in f:
                        traj.append(json.loads(line))
                success_traj.append(traj)
                
                os.system("cp result/llama-3.1-8b-sft/traces/"+str(task_id)+".jsonl replay_buffer/success/")
    
    torch.save(success_traj, "replay_buffer/init_success_traj.pt")

    
