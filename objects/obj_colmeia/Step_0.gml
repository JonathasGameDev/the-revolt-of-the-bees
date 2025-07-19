// Verifica se a colmeia morreu
if (hp <= 0 && !morreu) {
    morreu = true;
    
    // Efeitos de destruição (opcional)
    // audio_play_sound(snd_explosao, 1, false);
    // effect_create_above(ef_explosion, x, y, 2, c_yellow);
    
    // Destrói a colmeia
    instance_destroy();
}

// Efeito de dano visual
if (cooldown_dano > 0) {
    cooldown_dano -= 1;
    image_blend = c_red;
} else {
    image_blend = c_white;
}
