// Define posição inicial pra desenhar
var start_x = 20;
var start_y = 20;
var spacing = 10; // espaço entre os corações

// Desenha um coração para cada vida restante
for (var i = 0; i < vidas; i++) {
    draw_sprite(spr_vida, 0, start_x + i * (sprite_width + spacing), start_y);
}