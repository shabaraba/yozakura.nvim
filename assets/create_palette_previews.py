#!/usr/bin/env python3
"""
Create palette preview images for yozakura.nvim README
"""

from PIL import Image, ImageDraw, ImageFont
import os

# Palette definitions (from lua/yozakura/palette.lua)
palettes = {
    "soft_contrast": {
        "bg0": "#1e1e2e",
        "fg0": "#d9b8cf",
        "fg1": "#cba6c3", 
        "fg2": "#c386b8",
        "fg3": "#8a8aa5",
        "sakura": "#cba6c3",
        "sakura_light": "#d9b8cf",
        "sakura_dark": "#c386b8"
    },
    "warm_gray": {
        "bg0": "#242220",
        "fg0": "#e0b5c5",
        "fg1": "#d5a0b5",
        "fg2": "#cc8fa5", 
        "fg3": "#8a7f75",
        "sakura": "#d5a0b5",
        "sakura_light": "#e0b5c5",
        "sakura_dark": "#cc8fa5"
    },
    "muted_rose": {
        "bg0": "#212029",
        "fg0": "#d6b5c0",
        "fg1": "#c79fad",
        "fg2": "#b88a9a",
        "fg3": "#7d7b85", 
        "sakura": "#c79fad",
        "sakura_light": "#d6b5c0",
        "sakura_dark": "#b88a9a"
    },
    "night_blue": {
        "bg0": "#1a1a26",
        "fg0": "#e0c0d5", 
        "fg1": "#d0a5c8",
        "fg2": "#c090b8",
        "fg3": "#6d7195",
        "sakura": "#d0a5c8",
        "sakura_light": "#e0c0d5", 
        "sakura_dark": "#c090b8"
    }
}

def hex_to_rgb(hex_color):
    """Convert hex color to RGB tuple"""
    hex_color = hex_color.lstrip('#')
    return tuple(int(hex_color[i:i+2], 16) for i in (0, 2, 4))

def create_palette_preview(name, colors, output_path):
    """Create a small palette preview image"""
    width, height = 300, 80
    img = Image.new('RGB', (width, height), hex_to_rgb(colors['bg0']))
    draw = ImageDraw.Draw(img)
    
    # Title
    title = name.replace('_', ' ').title()
    draw.text((10, 10), title, fill=hex_to_rgb(colors['fg0']))
    
    # Color swatches
    swatch_size = 15
    y_pos = 35
    x_start = 10
    
    color_keys = ['sakura_light', 'sakura', 'sakura_dark', 'fg0', 'fg1', 'fg2', 'fg3']
    
    for i, key in enumerate(color_keys):
        if key in colors:
            x_pos = x_start + i * (swatch_size + 5)
            draw.rectangle(
                [x_pos, y_pos, x_pos + swatch_size, y_pos + swatch_size],
                fill=hex_to_rgb(colors[key])
            )
    
    img.save(output_path)
    print(f"Created {output_path}")

# Create preview images
for name, colors in palettes.items():
    output_path = f"palette_{name}.png"
    create_palette_preview(name, colors, output_path)

print("All palette previews created!")