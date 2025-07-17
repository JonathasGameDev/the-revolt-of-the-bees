audio_master_gain(1.0); // Volume máximo
musica_id = audio_play_sound(snd_level_music, 1, true); // priority 1, loop automático
musica_duracao = 71.76 * room_speed; // tempo em frames
musica_timer = musica_duracao;

