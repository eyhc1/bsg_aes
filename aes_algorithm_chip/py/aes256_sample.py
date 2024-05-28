from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes
from cryptography.hazmat.backends import default_backend

def aes_encrypt(plaintext, key):
    # Convert plaintext and key from hex to bytes
    plaintext_bytes = bytes.fromhex(plaintext)
    key_bytes = bytes.fromhex(key)

    # Create a new AES cipher with ECB mode
    cipher = Cipher(algorithms.AES(key_bytes), modes.ECB(), backend=default_backend())

    # Encrypt the plaintext
    encryptor = cipher.encryptor()
    ciphertext = encryptor.update(plaintext_bytes) + encryptor.finalize()

    # Convert ciphertext to hex and return
    return ciphertext.hex()

# # Example inputs from section C.3
# plaintext_example = "00112233445566778899aabbccddeeff"
# key_example = "000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f"

# test = "65e321ea0a79884cd8c5c376d4d5d306714e976ed4395179418135eff805565c1cee84b1b7ae257802b9bb0bf5959bb1"

# # Encrypt and display the output
# encrypted_output = aes_encrypt(test[:32], test[32:])
# # encrypted_output = aes_encrypt(plaintext_example, key_example)
# print("Encrypted Output:", encrypted_output)


plaintext_example = "000000000000000000000000001f2b00"
key_example = "6464646464646464646464646464646464646464646464646464646464646464"

# Encrypt and display the output
encrypted_output = aes_encrypt(plaintext_example, key_example)
print("Encrypted Output:", encrypted_output)

# inputs = open("input.txt", "r").readlines()
# outputs = open("output.txt", "r").readlines()

# for i in range(len(inputs)):
#     data = inputs[i].strip()
#     # pad the data to 96 characters if it is less than 96 characters
#     if len(data) < 96:
#         data = "0"*(96-len(data)) + data

#     # Create a new AES cipher with ECB mode
#     cipher = Cipher(algorithms.AES(bytes.fromhex(data[32:])), modes.ECB(), backend=default_backend())

#     # Encrypt the plaintext
#     encryptor = cipher.encryptor()
#     ciphertext = encryptor.update(bytes.fromhex(data[:32])) + encryptor.finalize()

#     encrypted_output = ciphertext.hex()

#     data_o = outputs[i].strip()
#     assert data_o == encrypted_output, f"Data mismatch when input is: {data}\n Expected: {data_o}, Got: {encrypted_output}"

# print("All tests passed!")