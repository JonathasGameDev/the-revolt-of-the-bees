// Desenha o sprite do inimigo primeiro
draw_self();

// Calcula a porcentagem da vida
var vida_percent = hp / hp_max;

// Posição da barra
var barra_x = x - (barra_largura / 2);
var barra_y = y + barra_offset_y;

// Desenha o fundo da barra
draw_set_color(c_dkgray);
draw_rectangle(barra_x - 1, barra_y - 1, barra_x + barra_largura + 1, barra_y + barra_altura + 1, false);

draw_set_color(c_black);
draw_rectangle(barra_x, barra_y, barra_x + barra_largura, barra_y + barra_altura, false);

// Calcula o preenchimento da barra
var barra_preenchimento = barra_largura * vida_percent;

// Diferentes tons de vermelho baseado na vida
if (vida_percent > 0.7) {
    draw_set_color(c_red);        // Vermelho normal (vida alta)
} else if (vida_percent > 0.3) {
    draw_set_color(c_maroon);     // Vermelho escuro (vida média)
} else {
    draw_set_color(make_color_rgb(255, 100, 100)); // Vermelho claro (vida baixa)
}

// Desenha a barra de vida
if (barra_preenchimento > 0) {
    draw_rectangle(barra_x, barra_y, barra_x + barra_preenchimento, barra_y + barra_altura, false);
}

draw_set_color(c_white);
