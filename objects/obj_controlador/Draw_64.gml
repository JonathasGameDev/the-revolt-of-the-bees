// Draw GUI Event do obj_controlador
// PRIMEIRO: Desenha as mensagens
if (mostrar_mensagem || mensagem_com_botoes) {
    show_debug_message("Desenhando mensagem na tela!");
    
    // Fundo escuro semi-transparente
    draw_set_alpha(mensagem_alpha * 0.8);
    draw_set_color(c_black);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    
    // Caixa principal da mensagem
    draw_set_alpha(mensagem_alpha);
    draw_set_color(c_dkgray);
    draw_rectangle(msg_x - msg_width/2, msg_y - msg_height/2, 
                   msg_x + msg_width/2, msg_y + msg_height/2, false);
    
    // Borda da caixa
    draw_set_color(c_ltgray);
    draw_rectangle(msg_x - msg_width/2, msg_y - msg_height/2, 
                   msg_x + msg_width/2, msg_y + msg_height/2, true);
    
    // Texto principal da mensagem
    draw_set_color(c_white);
    draw_set_font(-1);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(msg_x, msg_y - 20, texto_mensagem);
    
    // SISTEMA DE BOTÕES - ADIÇÃO PRINCIPAL
    if (mensagem_com_botoes && botoes_ativos) {
        for (var i = 0; i < 2; i++) {
            var btn_x = msg_x + (i - 0.5) * 150;  // Espaçamento entre botões
            var btn_y = msg_y + 40;
            
            // Destaca botão selecionado
            if (i == botao_selecionado) {
                // Fundo do botão selecionado
                draw_set_color(c_yellow);
                draw_set_alpha(mensagem_alpha * 0.3);
                draw_rectangle(btn_x - 60, btn_y - 15, btn_x + 60, btn_y + 15, false);
                
                // Texto do botão selecionado
                draw_set_alpha(mensagem_alpha);
                draw_set_color(c_yellow);
            } else {
                draw_set_color(c_ltgray);
            }
            
            draw_text(btn_x, btn_y, opcoes_mensagem[i]);
        }
        
        // Instruções de controle
        draw_set_color(c_white);
        draw_set_alpha(mensagem_alpha * 0.7);
        draw_text(msg_x, msg_y + 80, "Use A/D para navegar | ENTER/ESPAÇO para confirmar");
    }
    
    // Restaura configurações de desenho
    draw_set_alpha(1);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(c_white);
}

// DEPOIS: Desenha o cursor por último (sempre visível)
var mx = device_mouse_x(0);
var my = device_mouse_y(0);
draw_sprite(spr_cursor, 0, mx, my);
