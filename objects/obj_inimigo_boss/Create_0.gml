// Sistema de vida
hp = 50;
hp_max = 50;
morreu = false;

// Movimento
spd = 1.2;

// NOVO SISTEMA DE TIRO COM TEMPO ALEATÓRIO
cooldown_tiro = 0;
tempo_proximo_tiro = 0;          // Quando vai atirar
definir_proximo_tiro();          // Define o primeiro tempo

// Visual - abelha maior
image_xscale = 2.5;
image_yscale = 2.5;

// Configurações da barra de vida
barra_largura = 80;
barra_altura = 8;
barra_offset_y = -50;

// Efeitos visuais
cooldown_dano = 0;
