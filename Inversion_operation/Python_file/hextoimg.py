import numpy as np
import matplotlib.pyplot as plt

# Read hex data from the file
def read_hex_file(filename):
    with open(filename, 'r') as file:
        data = file.read()
    # Split hex values and convert to integers
    hex_values = data.split()
    pixels = [int(h, 16) for h in hex_values]
    return np.array(pixels).reshape(8, 8)  # Reshape into 8x8 matrix

# Generate the image
def generate_image(image_array, save_path):
    plt.imshow(image_array, cmap='gray', vmin=0, vmax=255)
    plt.title("8x8 Grayscale Image")
    plt.axis('off')
    plt.savefig(save_path, bbox_inches='tight', pad_inches=0)  # Save the image
    plt.show()

# Main Execution
filename = 'output.hex'  # Name of your hex file
save_path = 'output_image.png'  # Path to save the image
image_array = read_hex_file(filename)
generate_image(image_array, save_path)
print(f"Image saved as {save_path}")
