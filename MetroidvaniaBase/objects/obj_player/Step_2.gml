// Escolhe animação
if (!on_ground) {
    sprite_index = spr_player_jump;
} else if (hsp != 0) {
    sprite_index = spr_player_run;
    image_speed = 0.2; // velocidade da animação
} else {
    sprite_index = spr_player_idle;
    image_speed = 0.05;
}

// Flip horizontal conforme direção
if (hsp != 0) {
    image_xscale = sign(hsp);
}

