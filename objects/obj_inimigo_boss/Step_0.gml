// Persegue o personagem
if (instance_exists(obj_personagem)) {
    move_towards_point(obj_personagem.x, obj_personagem.y, spd);
}

// Rotação
image_angle = point_direction(x, y, obj_personagem.x, obj_personagem.y) - 90;

// Sistema de tiro aleatório
if (instance_exists(obj_personagem)) {
    tempo_proximo_tiro -= 1;
    
    if (tempo_proximo_tiro <= 0) {
        // Atira
        var tiro = instance_create_layer(x, y, "tiro", obj_tiro_boss);
        tiro.direction = point_direction(x, y, obj_personagem.x, obj_personagem.y);
        tiro.speed = 8;
        tiro.image_angle = tiro.direction - 90;
        
        // Define próximo tempo (1 a 5 segundos)
        tempo_proximo_tiro = random_range(60, 180);
    }
}

// SISTEMA DE MORTE - ADICIONAR ESTA PARTE
if (hp <= 0 && !morreu) {
    morreu = true;
    
    // Efeito de explosão
    repeat(8) {
        effect_create_above(ef_explosion, 
            x + random_range(-20, 20), 
            y + random_range(-20, 20), 
            1, c_yellow);
    }
    
    // Som opcional
    // audio_play_sound(snd_boss_morte, 1, false);
    
    // DESTRUIR O BOSS
    instance_destroy();
}

// Efeito de dano visual
if (cooldown_dano > 0) {
    cooldown_dano -= 1;
    image_blend = c_red;
} else {
    image_blend = c_white;
}
