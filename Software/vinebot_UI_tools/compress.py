# import gzip

# # Read the HTML content from a file
# html_file = "index_ov2640.html"  # Change this to your HTML file
# with open(html_file, "rb") as f:
#     html_content = f.read()

# # Compress using GZIP
# compressed_data = gzip.compress(html_content)

# # Convert to a hex array
# hex_array = [f"0x{b:02x}" for b in compressed_data]
# print(len(hex_array))
# # Save to a text file
# output_file = "compressed_hex_2640.txt"
# with open(output_file, "w") as f:
#     f.write("const uint8_t index_ov2640_html_gz[] = {\n    " + ", ".join(hex_array) + "\n};")

# print(f"Compressed hex array saved to {output_file}")


import gzip

# Read the HTML content from a file
html_file = "index_ov2640.html"  # Change this to your HTML file
with open(html_file, "rb") as f:
    html_content = f.read()

# Compress using GZIP
compressed_data = gzip.compress(html_content)

# Convert to a hex array
hex_array = [f"0x{b:02x}" for b in compressed_data]

# Save to a text file with line breaks every 26 hex values
output_file = "compressed_hex_2640.txt"
with open(output_file, "w") as f:
    f.write("const uint8_t index_ov2640_html_gz[] = {\n")

    # Insert line breaks every 26 elements
    for i in range(0, len(hex_array), 26):
        f.write("    " + ", ".join(hex_array[i:i+26]) + ",\n")

    f.write("};\n")

print(f"Compressed hex array saved to {output_file}")
