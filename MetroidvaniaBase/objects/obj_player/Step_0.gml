/// STEP - Movimento com colisão

// 1) INPUT horizontal
var move = keyboard_check(vk_right) - keyboard_check(vk_left);
hsp = move * walkspd;

// 2) Gravidade
vsp += grav;


// 3) Pulo (só se no chão)
if (on_ground && keyboard_check_pressed(vk_space)) {
    vsp = jumpspd;
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
var max_fall = 12;
if (vsp > max_fall) vsp = max_fall;

