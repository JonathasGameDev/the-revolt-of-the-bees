// Só persegue o personagem se ele existir
if (instance_exists(obj_personagem)) {
    move_towards_point(obj_personagem.x, obj_personagem.y, spd);
}

// Ajusta a direção da sprite para olhar para o personagem
image_angle = point_direction(x, y, obj_personagem.x, obj_personagem.y) - 90;

// Verifica se a vida acabou (toca som e soma pontos apenas uma vez)
if (hp <= 0 && !morreu) {
    morreu = true;

    audio_sound_pitch(snd_morte, random_range(0.8, 1.2));
    audio_play_sound(snd_morte, 1, false);

    with (obj_pontos) {
        thescore += 5;
    }

    instance_destroy();
}

// Controle do efeito vermelho temporário
if (cooldown_dano > 0) {
    cooldown_dano -= 1;
    image_blend = c_red;
} else {
    image_blend = c_white;
}
