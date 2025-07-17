// Movimento com WASD
if (keyboard_check(ord("D"))) x += 4;
if (keyboard_check(ord("A"))) x -= 4;
if (keyboard_check(ord("W"))) y -= 4;
if (keyboard_check(ord("S"))) y += 4;

image_angle = point_direction(x, y, mouse_x, mouse_y) - 90;

// Disparo com cooldown aumentado
if (mouse_check_button(mb_left) && (cooldown < 1)) {
    instance_create_layer(x, y, "tiro", obj_tiro);
    cooldown = 15;
}
cooldown -= 1;

// Mantém o personagem dentro da sala
x = clamp(x, 0, room_width - sprite_width);
y = clamp(y, 0, room_height - sprite_height);

if (cooldown_dano > 0) {
    cooldown_dano -= 1;

    // Piscar: alterna visibilidade a cada 4 frames
    if ((cooldown_dano div 4) mod 2 == 0) {
        visible = false;
    } else {
        visible = true;
    }
} else {
    visible = true;
}

// Aplica knockback se houver
x += knockback_x;
y += knockback_y;

// Suaviza o knockback (efeito de desaceleração)
knockback_x *= 0.8;
knockback_y *= 0.8;


