def get_value_by_key(data, key):
    keys = key.split('/')
    value = data

    try:
        for k in keys:
            value = value[k]
        return value
    except (KeyError, TypeError):
        return None

# Example usage:
my_object = {
    "a": {
        "b": {
            "c": "d"
        }
    }
}

key_to_find = "a/b/c"
result = get_value_by_key(my_object, key_to_find)

if result is not None:
    print(f"The value for key '{key_to_find}' is: {result}")
else:
    print(f"Key '{key_to_find}' not found in the object.")
