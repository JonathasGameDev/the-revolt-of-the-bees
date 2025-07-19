

// Suas variáveis existentes
cooldown = 0
vx = 0;
vy = 0;
vidas = 5;
cooldown_dano = 0;
knockback_x = 0;
knockback_y = 0;
image_blend = c_white;
piscar = false;

// Variáveis do dash
cooldown_dash = 0;
dash_speed = 12;
dash_duration = 8;
dash_timer = 0;
is_dashing = false;

// Sistema de partículas para o dash
global.dash_particle_system = part_system_create();
part_system_depth(global.dash_particle_system, -100);

// Tipo de partícula do dash
global.dash_particle = part_type_create();
part_type_shape(global.dash_particle, pt_shape_cloud);
part_type_size(global.dash_particle, 0.3, 0.8, -0.01, 0);
part_type_color3(global.dash_particle, c_white, c_ltgray, c_gray);
part_type_alpha3(global.dash_particle, 0.8, 0.5, 0);
part_type_speed(global.dash_particle, 0.5, 2, -0.1, 0);
part_type_direction(global.dash_particle, 0, 360, 0, 5);
part_type_life(global.dash_particle, 15, 25);

// Configurações da barra de cooldown
barra_largura = 40;        // Largura da barra
barra_altura = 4;          // Altura da barra
barra_offset_y = -30;      // Distância acima do personagem