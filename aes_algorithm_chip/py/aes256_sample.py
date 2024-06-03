from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes
from cryptography.hazmat.backends import default_backend
# harware encrypt: 360000ns
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

# test = "004336842f7e28abc11a612991a6947f714e976ed4395179418135eff805565c1cee84b1b7ae257802b9bb0bf5959bb15a5a5f888e630ef1cfe23b1e37e76d42867ab89d31d49de5336d26eec6f8bd5f1920903c97439ecd58a1a5d36f46c8912e20501c1ff4cdf92c99eb17ea615648f291c2bb65d25c763d73f9a5523531342eb6970431425afd1ddbb1eaf7bae7a20e05f8d36bd7a4a556a45d0004916c34dc37c71ced759de1f0ae2c0b0714cba9e41a2b168fcd8fb3d969d2b3ddf8be871d76690bf003f4ea00add8e107b91348926779d31daaf660c4c324d3193b9a54c994d12b399725c1393afd203e83ee683e4f3c6123e5ca01e726eed2fe1d7486"
# test_bin = str(bin(int(test, 16))[2:])

# if len(test_bin) < 2048:
#     test_bin = "0"*(2048-len(test_bin)) + test_bin
    
# print(test_bin)

# print("0"*2048)

# # # Encrypt and display the output
# encrypted_output = aes_encrypt(test[:32], test[32:])
# # # encrypted_output = aes_encrypt(plaintext_example, key_example)
# print("Encrypted Output:", encrypted_output)


# plaintext_example = "000000000000000000000000000000af"
# key_example = "6464646464646464646464646464646464646464646464646464646464646464"

# # Encrypt and display the output
# encrypted_output = aes_encrypt(plaintext_example, key_example)
# print("Encrypted Output:", encrypted_output)

plaintext_example = "00000000000000000000000000031624"
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