function criar_mensagem(texto) {
    mostrar_mensagem = true;
    mensagem_com_botoes = false;
    texto_mensagem = texto;
    timer_mensagem = duracao_mensagem;
    mensagem_alpha = 1; // FIXO ao invés de 0
    botoes_ativos = false;
    
    show_debug_message("SCRIPT: Mensagem com alpha fixo - " + texto);
}
