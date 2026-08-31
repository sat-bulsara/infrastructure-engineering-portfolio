#input name
name = input("Requester:").strip();
issue = input("Issue").strip().lower(); 
impact = input("impact").strip().lower(); 
urgency = input("urgency").strip().lower(); 

levels = ("low", "medium", "high")

if impact not in levels or urgency not in levels:
    print("Invalid impact or urgency")
    raise SystemExit

def choose_priority(is_critical, is_password_issue):
    if is_critical:
        return 1
    elif is_password_issue:
        return 2
    else:
        return 3

print(f"Requester: {name}")
print(f"Issue: {issue}")
is_password_issue = issue == "password reset"


is_critical = impact == "high" and urgency == "high"

priority = choose_priority(is_critical, is_password_issue)

print(f"Priority: P{priority}")

assert choose_priority(True, False) == 1
assert choose_priority(False, True) == 2
assert choose_priority(False, False) == 3