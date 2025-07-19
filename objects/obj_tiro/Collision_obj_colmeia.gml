// Causa dano na colmeia
other.hp -= 2;
other.cooldown_dano = 15;

// Destrói o tiro
instance_destroy();

// Efeito sonoro opcional
// audio_play_sound(snd_hit, 1, false);
