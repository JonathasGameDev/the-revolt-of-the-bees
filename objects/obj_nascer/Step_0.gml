if (inimigos_criados == total_inimigos_gerar && instance_number(obj_inimigo) == 0 && !mensagem_final_mostrada) {
    mensagem_final_mostrada = true;

    if (show_question("Você venceu! Deseja reiniciar o jogo?")) {
        game_restart();
    } else {
        game_end();
    }
}
