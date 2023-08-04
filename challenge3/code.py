 def get_value_by_key(data, key):
    if isinstance(data, dict):
        return data.get(key)
    else:
        raise ValueError("Input data should be a dictionary.")

# Example usage:
my_object = {
    "name": "John",
    "age": 30,
    "city": "New York"
}

key_to_find = "age"
result = get_value_by_key(my_object, key_to_find)

if result is not None:
    print(f"The value for key '{key_to_find}' is: {result}")
else:
    print(f"Key '{key_to_find}' not found in the object.")
