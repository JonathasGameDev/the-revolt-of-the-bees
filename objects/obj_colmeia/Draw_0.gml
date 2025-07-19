// Desenha a colmeia
draw_self();

// Barra de vida sempre visível
if (hp > 0) {
    var vida_percent = hp / hp_max;
    
    // Posição da barra
    var barra_x = x - (barra_largura / 2);
    var barra_y = y + barra_offset_y;
    
    // Fundo da barra
    draw_set_color(c_dkgray);
    draw_rectangle(barra_x - 1, barra_y - 1, barra_x + barra_largura + 1, barra_y + barra_altura + 1, false);
    
    draw_set_color(c_black);
    draw_rectangle(barra_x, barra_y, barra_x + barra_largura, barra_y + barra_altura, false);
    
    // Barra de vida (amarela para diferenciar dos inimigos)
    var barra_preenchimento = barra_largura * vida_percent;
    
    if (vida_percent > 0.6) {
        draw_set_color(c_yellow);       // Amarela quando com muita vida
    } else if (vida_percent > 0.3) {
        draw_set_color(c_orange);       // Laranja quando média
    } else {
        draw_set_color(c_red);          // Vermelha quando crítica
    }
    
    if (barra_preenchimento > 0) {
        draw_rectangle(barra_x, barra_y, barra_x + barra_preenchimento, barra_y + barra_altura, false);
    }
    
    draw_set_color(c_white);
}
