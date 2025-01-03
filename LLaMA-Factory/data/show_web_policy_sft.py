import json
import re

data = json.load(open("web_policy_sft.json", "r"))

print("data num: ", len(data))

tasks = set()

for d in data[100:102]:
    print("-------------------------------------------------------------------------------")
    print(d["conversations"][0]["from"])
    print(d["conversations"][0]["value"][:1000])
    print("-------------------------------------------------------------------------------")
    print(d["conversations"][1]["from"])
    print(d["conversations"][1]["value"][:100])
    pattern = r"Task Instruction: (.*)\n\n"
    # 查找匹配项
    matches = re.findall(pattern, d["conversations"][0]["value"])
    for match in matches:
        tasks.add(match)


print("total tasks: ", len(tasks))