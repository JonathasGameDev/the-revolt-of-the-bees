// Desenha o sprite do personagem primeiro
draw_self();

// BARRA SEMPRE VISÍVEL - nunca desaparece
// Calcula a porcentagem do cooldown
var cooldown_percent = cooldown_dash / 120; // 120 é o cooldown total

// Posição da barra
var barra_x = x - (barra_largura / 2);
var barra_y = y + barra_offset_y;

// Desenha o fundo da barra (cinza escuro) - SEMPRE
draw_set_color(c_dkgray);
draw_rectangle(barra_x - 1, barra_y - 1, barra_x + barra_largura + 1, barra_y + barra_altura + 1, false);

// Desenha o fundo interno da barra (preto) - SEMPRE
draw_set_color(c_black);
draw_rectangle(barra_x, barra_y, barra_x + barra_largura, barra_y + barra_altura, false);

// Calcula o preenchimento da barra
var barra_preenchimento = barra_largura * (1 - cooldown_percent);

// Cor da barra baseada no status
if (cooldown_dash > 0) {
    // Durante o cooldown - barra se enchendo
    if (cooldown_percent > 0.6) {
        draw_set_color(c_red);      // Vermelho quando cooldown alto
    } else if (cooldown_percent > 0.3) {
        draw_set_color(c_orange);   // Laranja no meio
    } else {
        draw_set_color(c_lime);     // Verde quando quase pronto
    }
} else {
    // Dash pronto - barra totalmente verde
    draw_set_color(c_lime);
    barra_preenchimento = barra_largura; // Barra completamente cheia
}

// Desenha a barra de progresso - SEMPRE
draw_rectangle(barra_x, barra_y, barra_x + barra_preenchimento, barra_y + barra_altura, false);

// Volta a cor para branco
draw_set_color(c_white);
