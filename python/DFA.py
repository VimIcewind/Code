DFA_func = {0:{"a": 1, "b": 0},
            1:{"a": 1, "b": 2},
            2:{"a": 1, "b": 3},
            3:{"a": 1, "b": 0}
            }
input_symbol = ["a", "b"]
current_state = 0
accept_stat = 3

strings = ["ababaaabb",
           "ababcaabb",
           "abbab"]

for string in strings:
    for char in string:
        if char not in input_symbol:
            break
        else:
            currnet_state = DFA_func[current_state][char]

    if current_state == 3:
        print string, "---> Match!"
    else:
        print string, "---> No match!"
    current_state = 0
    """output:
    ababaaabb ---> Match!
    ababcaabb ---> No match!
    abbab ---> No match!
    """
