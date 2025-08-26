// Movimento
hsp = 0;
vsp = 0;
grav = 0.7;
walkspd = 3.2;
jumpspd = -11;

// Estado
on_ground = false; // está tocando o chão?

// Controle refinado
accel = 0.5;    // aceleração
friction = 0.2; // desaceleração quando solta a tecla
max_spd = 3.5;  // velocidade máxima

coyote_time = 0; // contador
coyote_max = 10; // frames (~0.15s se 60fps)

jump_buffer = 0; 
jump_buffer_max = 10; // ~0.15s
