if (cooldown_dano <= 0) {
    vidas -= 1;
    cooldown_dano = room_speed / 2; 

    audio_sound_pitch(snd_doer, random_range(0.8, 1.2));
    audio_play_sound(snd_doer, 1, false);

    var dir = point_direction(other.x, other.y, x, y);
    var knockback_force = 8;
    knockback_x = lengthdir_x(knockback_force, dir);
    knockback_y = lengthdir_y(knockback_force, dir);

    if (vidas <= 0) {
        if (show_question("Você morreu! Deseja reiniciar o jogo?")) {
            game_restart();
        } else {
            game_end();
        }
    }
}
