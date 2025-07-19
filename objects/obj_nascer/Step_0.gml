// Verifica se a colmeia foi destruída
if (!instance_exists(obj_colmeia) && !colmeia_destruida) {
    colmeia_destruida = true;
    boss_timer = boss_delay;

    show_debug_message("=== COLMEIA DESTRUÍDA ===");
    
    // Mensagem simples
    show_message("A ABELHA RAINHA DESPERTOU!");
}

// Sistema de spawn do boss
if (colmeia_destruida && !boss_spawnado) {
    if (boss_timer > 0) {
        boss_timer -= 1;
    }

    if (boss_timer <= 0) {
        boss_spawnado = true;
        show_debug_message("=== SPAWNANDO BOSS ===");

        var boss_x = room_width / 2;
        var boss_y = room_height / 2;

        instance_create_layer(boss_x, boss_y, "inimigo", obj_inimigo_boss);
    }
}

// CONDIÇÃO DE VITÓRIA: BOSS MORTO + TODOS OS INIMIGOS ELIMINADOS
if (boss_spawnado && !instance_exists(obj_inimigo_boss) && instance_number(obj_inimigo) == 0 && !mensagem_final_mostrada) {
    mensagem_final_mostrada = true;
    show_debug_message("=== BOSS E TODOS OS INIMIGOS DERROTADOS ===");
    
    // INICIA O DELAY DE 3 SEGUNDOS
    delay_pergunta_vitoria = true;
    timer_pergunta_vitoria = 180; // 3 segundos = 180 frames
}

// SISTEMA DE DELAY - PERGUNTA APÓS 3 SEGUNDOS
if (delay_pergunta_vitoria) {
    timer_pergunta_vitoria -= 1;
    
    if (timer_pergunta_vitoria <= 0) {
        delay_pergunta_vitoria = false;
        
        // PERGUNTA DIRETA SOBRE REINICIAR
        if (show_question("Deseja jogar novamente?")) {
            game_restart();
        } else {
            game_end();
        }
    }
}
