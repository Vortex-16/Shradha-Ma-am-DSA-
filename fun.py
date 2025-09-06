import pyautogui
import time
import random

print("👉 You have 5 seconds to click inside your VS Code editor...")
time.sleep(5)

types = ["int", "double", "String", "boolean", "long"]
simple_names = ["alpha", "beta", "count", "total", "name", "flag", "index", "value", "result", "score"]
verbs = ["compute", "process", "transform", "print", "calc", "update", "format", "build"]
adjectives = ["Quick", "Bright", "Smart", "Lazy", "Crazy", "Epic", "Tiny", "Mighty"]

def random_literal(t):
    if t == "int": return str(random.randint(0,100))
    if t == "double": return f"{random.uniform(0,100):.2f}"
    if t == "String": return '"' + random.choice(["hello","world","java","chatgpt"]) + '"'
    if t == "boolean": return random.choice(["true","false"])
    if t == "long": return str(random.randint(0,100000)) + "L"
    return "null"

def generate_method():
    return_type = random.choice(types + ["void"])
    name = random.choice(verbs) + random.choice(simple_names).capitalize() + str(random.randint(1,999))
    body = []
    if return_type != "void":
        body.append(f"return {random_literal(return_type)};")
    code = [f"    public static {return_type} {name}() {{"]
    for line in body:
        code.append("        " + line)
    code.append("    }")
    return code

def generate_class():
    cname = random.choice(adjectives) + "Class" + str(random.randint(1,99))
    code = [f"public class {cname} {{"]
    for _ in range(random.randint(1,3)):
        code.extend(generate_method())
        code.append("")  # blank line
    code.append("    public static void main(String[] args) {")
    code.append(f'        System.out.println("Hello from {cname}");')
    code.append("    }")
    code.append("}")
    return code

# Bot will type random classes continuously
for _ in range(45):  # number of classes to type
    lines = generate_class()
    for line in lines:
        pyautogui.write(line, interval=0.45)  # typing effect
        pyautogui.press("enter")
    pyautogui.press("enter")  # extra line between classes
    time.sleep(1)
