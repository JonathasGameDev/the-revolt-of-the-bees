// SISTEMA DE MÚSICA E DEBUG
// Debug das variáveis de mensagem
if (keyboard_check_pressed(ord("M"))) {
    show_debug_message("=== DEBUG MENSAGENS ===");
    show_debug_message("mostrar_mensagem: " + string(mostrar_mensagem));
    show_debug_message("mensagem_com_botoes: " + string(mensagem_com_botoes));
    show_debug_message("texto_mensagem: " + texto_mensagem);
    show_debug_message("mensagem_alpha: " + string(mensagem_alpha));
}
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

// SISTEMA DE MENSAGENS PERSONALIZADA
// Controle da mensagem personalizada
if (mostrar_mensagem || mensagem_com_botoes) {
    
    // Fade in
    if (mensagem_alpha < 1) {
        mensagem_alpha += mensagem_fade_speed;
        
        // Ativa botões quando fade termina
        if (mensagem_alpha >= 1 && mensagem_com_botoes) {
            botoes_ativos = true;
        }
    }
    
    // Controle de botões (só funciona quando botões estão ativos)
    if (botoes_ativos) {
        // Navegar entre opções
        if (keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A"))) {
            botao_selecionado = 0;
        }
        if (keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"))) {
            botao_selecionado = 1;
        }
        
        // Confirmar seleção
        if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("E"))) {
            if (botao_selecionado == 0) {
                game_restart();
            } else {
                game_end();
            }
        }
    }
    
    // Timer para mensagens simples (sem botões)
    if (mostrar_mensagem && !mensagem_com_botoes) {
        timer_mensagem -= 1;
        
        if (timer_mensagem <= 0) {
            mensagem_alpha -= mensagem_fade_speed;
            
            if (mensagem_alpha <= 0) {
                mostrar_mensagem = false;
                texto_mensagem = "";
            }
        }
    }
}

// VERIFICAÇÕES DE VITÓRIA/DERROTA
if (colmeia_destruida && instance_number(obj_inimigo) == 0 && !vitoria) {
    vitoria = true;
    criar_mensagem_com_botoes("VITÓRIA!\nColmeia destruída e todas as abelhas eliminadas!");
}
