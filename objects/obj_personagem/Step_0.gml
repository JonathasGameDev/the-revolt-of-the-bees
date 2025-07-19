// Sistema de Dash com partículas
if (mouse_check_button_pressed(mb_right) && cooldown_dash <= 0 && !is_dashing) {
    var dash_dir_x = 0;
    var dash_dir_y = 0;
    
    if (keyboard_check(ord("D"))) dash_dir_x += 1;
    if (keyboard_check(ord("A"))) dash_dir_x -= 1;
    if (keyboard_check(ord("W"))) dash_dir_y -= 1;
    if (keyboard_check(ord("S"))) dash_dir_y += 1;
    
    if (dash_dir_x == 0 && dash_dir_y == 0) {
        var mouse_dir = point_direction(x, y, mouse_x, mouse_y);
        dash_dir_x = lengthdir_x(1, mouse_dir);
        dash_dir_y = lengthdir_y(1, mouse_dir);
    }
    
    var dash_length = sqrt(dash_dir_x * dash_dir_x + dash_dir_y * dash_dir_y);
    if (dash_length > 0) {
        dash_dir_x /= dash_length;
        dash_dir_y /= dash_length;
        
        vx = dash_dir_x * dash_speed;
        vy = dash_dir_y * dash_speed;
        is_dashing = true;
        dash_timer = dash_duration;
        cooldown_dash = 120;
    }
}

// Executa o movimento do dash COM PARTÍCULAS
if (is_dashing) {
    x += vx;
    y += vy;
    
    // Cria rastro de partículas durante o dash
    part_particles_create(global.dash_particle_system, x, y, global.dash_particle, 3);
    
    dash_timer -= 1;
    if (dash_timer <= 0) {
        is_dashing = false;
        vx = 0;
        vy = 0;
        
        // Explosão de partículas no final do dash
        part_particles_create(global.dash_particle_system, x, y, global.dash_particle, 10);
    }
} else {
    // Movimento normal com WASD
    if (keyboard_check(ord("D"))) x += 4;
    if (keyboard_check(ord("A"))) x -= 4;
    if (keyboard_check(ord("W"))) y -= 4;
    if (keyboard_check(ord("S"))) y += 4;
}

// Resto do código permanece igual...
if (cooldown_dash > 0) {
    cooldown_dash -= 1;
}

image_angle = point_direction(x, y, mouse_x, mouse_y) - 90;

if (mouse_check_button(mb_left) && (cooldown < 1) && !is_dashing) {
    instance_create_layer(x, y, "tiro", obj_tiro);
    cooldown = 15;
}
cooldown -= 1;

x = clamp(x, 0, room_width - sprite_width);
y = clamp(y, 0, room_height - sprite_height);

if (cooldown_dano > 0) {
    cooldown_dano -= 1;
    if ((cooldown_dano div 4) mod 2 == 0) {
        visible = false;
    } else {
        visible = true;
    }
} else {
    visible = true;
}

if (!is_dashing) {
    x += knockback_x;
    y += knockback_y;
    knockback_x *= 0.8;
    knockback_y *= 0.8;
}
// Sistema de morte do personagem
if (vidas <= 0 && !morreu) {
    morreu = true;
    
    // Chama mensagem personalizada do controlador
    if (instance_exists(obj_controlador)) {
        obj_controlador.criar_mensagem_com_botoes("GAME OVER!\nSuas vidas acabaram!");
    }
}
