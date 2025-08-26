/// STEP - Movimento com colisão

// Input bruto
var move = keyboard_check(vk_right) - keyboard_check(vk_left);

// Aceleração
if (move != 0) {
    hsp += move * accel;
} else {
    // aplica atrito quando solta tecla
    if (abs(hsp) < friction) {
        hsp = 0;
    } else {
        hsp -= friction * sign(hsp);
    }
}

// Limite de velocidade
hsp = clamp(hsp, -max_spd, max_spd);


// 2) Gravidade
vsp += grav;


// 3) Pulo (só se no chão)
// Captura input de pulo
if (keyboard_check_pressed(vk_space)) {
    jump_buffer = jump_buffer_max;
} else if (jump_buffer > 0) {
    jump_buffer--;
}

// Se temos buffer E podemos pular (via coyote ou chão)
if (jump_buffer > 0 && coyote_time > 0) {
    vsp = jumpspd;
    jump_buffer = 0;
    coyote_time = 0;
}



// 4) MOVER EM X com correção
// Tenta mover em X; se colidir, aproxima da parede e zera hsp
if (place_meeting(x + hsp, y, obj_solid)) {
    // anda um pixel de cada vez na direção do movimento até encostar
    var signx = sign(hsp);
    while (!place_meeting(x + signx, y, obj_solid)) {
        x += signx;
    }
    hsp = 0; // bateu na parede
} 
x += hsp;

// 5) MOVER EM Y com correção
if (place_meeting(x, y + vsp, obj_solid)) {
    var signy = sign(vsp);
    while (!place_meeting(x, y + signy, obj_solid)) {
        y += signy;
    }
    vsp = 0; // bateu no chão/teto
} 
y += vsp;

// 6) Atualizar estado de chão
on_ground = place_meeting(x, y + 1, obj_solid);

// Atualiza coyote time
if (on_ground) {
    coyote_time = coyote_max;
} else if (coyote_time > 0) {
    coyote_time--;
}


var max_fall = 12;
if (vsp > max_fall) vsp = max_fall;

