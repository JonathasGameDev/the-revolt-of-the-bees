// Desenha a abelha rainha
draw_self();

// Barra de vida sempre visível
var vida_percent = hp / hp_max;

// Posição da barra
var barra_x = x - (barra_largura / 2);
var barra_y = y + barra_offset_y;

// Fundo da barra
draw_set_color(c_dkgray);
draw_rectangle(barra_x - 1, barra_y - 1, barra_x + barra_largura + 1, barra_y + barra_altura + 1, false);

draw_set_color(c_black);
draw_rectangle(barra_x, barra_y, barra_x + barra_largura, barra_y + barra_altura, false);

// Barra de vida (dourada para a rainha)
var barra_preenchimento = barra_largura * vida_percent;

if (vida_percent > 0.6) {
    draw_set_color(c_yellow);       // Dourado quando com muita vida
} else if (vida_percent > 0.3) {
    draw_set_color(c_orange);       // Laranja quando média
} else {
    draw_set_color(c_red);          // Vermelho quando crítica
}

if (barra_preenchimento > 0) {
    draw_rectangle(barra_x, barra_y, barra_x + barra_preenchimento, barra_y + barra_altura, false);
}

// Título da boss
draw_set_color(c_white);
draw_set_font(-1);
draw_set_halign(fa_center);
draw_text(x, barra_y - 30, "ABELHA RAINHA");
draw_set_halign(fa_left);

draw_set_color(c_white);
