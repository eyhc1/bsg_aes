def xor_bytes(a, b):
    return bytes(x ^ y for x, y in zip(a, b))

def add_round_key(state, key):
    return xor_bytes(state, key)

def sub_bytes(state):
    # Simplified and not using the actual S-box
    return bytes(((((s * 0x2d) + 0xb3) % 0x100) for s in state))

def shift_rows(state):
    rows = [state[i::4] for i in range(4)]
    shifted_rows = [rows[i][i:] + rows[i][:i] for i in range(4)]
    return bytes(sum(shifted_rows, []))

def mix_columns(state):
    # This is a simplified and incorrect mix_columns just for illustration.
    new_state = []
    for i in range(0, 16, 4):
        col = state[i:i+4]
        new_state.append(col[0] ^ col[1] ^ col[2] ^ col[3])  # Not the actual MixColumns
        new_state.append(col[0])
        new_state.append(col[1])
        new_state.append(col[2])
    return bytes(new_state)

def expand_key(master_key):
    # Simplified key expansion
    expanded_keys = [master_key]
    for i in range(1, 15):  # 14 rounds for AES-256
        expanded_keys.append(xor_bytes(expanded_keys[i-1], b'\x01\x02\x03\x04'*4))  # Simplified
    return expanded_keys

def aes_encrypt(plaintext, master_key):
    assert len(plaintext) == 16  # 128-bit blocks
    assert len(master_key) == 32  # 256-bit key

    expanded_keys = expand_key(master_key)
    state = add_round_key(plaintext, expanded_keys[0])

    for i in range(1, 14):  # 14 rounds for AES-256
        state = sub_bytes(state)
        state = shift_rows(state)
        state = mix_columns(state)
        state = add_round_key(state, expanded_keys[i])

    # Final round
    state = sub_bytes(state)
    state = shift_rows(state)
    state = add_round_key(state, expanded_keys[-1])

    return state

# Example usage
plaintext = b"Hello World12345"  # 16 bytes
master_key = b"0123456789abcdef0123456789abcdef"  # 32 bytes
encrypted = aes_encrypt(plaintext, master_key)
print("Encrypted:", encrypted)
