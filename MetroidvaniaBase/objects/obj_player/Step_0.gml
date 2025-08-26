 // Gravidade
vsp += grav;

// Movimento horizontal
if (keyboard_check(vk_right)) {
    hsp = walkspd;
} else if (keyboard_check(vk_left)) {
    hsp = -walkspd;
} else {
    hsp = 0;
}

// Pulo
if (keyboard_check_pressed(vk_space)) {
    vsp = jumpspd;
}

// Aplicar movimento
x += hsp;
y += vsp;
