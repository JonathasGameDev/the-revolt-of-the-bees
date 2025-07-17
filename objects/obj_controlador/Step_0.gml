

// STEP EVENT - CÓDIGO DE DEBUG

// Debug: mostra no Output se a música está tocando
if (keyboard_check_pressed(vk_space)) {
    if (audio_is_playing(musica_id)) {
        show_debug_message("Música está tocando");
    } else {
        show_debug_message("Música NÃO está tocando");
    }
}

if (!audio_is_playing(musica_id)) {
    show_debug_message("Tentando tocar música...");
    musica_id = audio_play_sound(snd_level_music, 1, true);
    
    if (musica_id == -1) {
    show_debug_message("ERRO: Falha ao tocar música no create");
	}
}
