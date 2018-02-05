/// @desc control the blink effect

if image_alpha <= 0 {
    fade = 1;
} else if image_alpha >= 1 {
    fade = -1;
}

image_alpha += 0.1*fade;