// Sistema de áudio
audio_master_gain(1.0); // Volume máximo
musica_id = audio_play_sound(snd_level_music, 1, true); // priority 1, loop automático
musica_duracao = 71.76 * room_speed; // tempo em frames
musica_timer = musica_duracao;
window_set_cursor(cr_none); // Esconde o cursor

// Variáveis de controle do jogo
colmeia_destruida = false;
vitoria = false;

// Sistema de mensagem personalizada
mostrar_mensagem = false;
mensagem_com_botoes = false;
texto_mensagem = "";
timer_mensagem = 0;
duracao_mensagem = 300;  // 5 segundos
mensagem_alpha = 0;
mensagem_fade_speed = 0.03;

// Controle de botões
botao_selecionado = 0;  // 0 = Reiniciar, 1 = Sair
opcoes_mensagem = ["REINICIAR", "SAIR"];
botoes_ativos = false;

// Configurações visuais da mensagem
msg_x = display_get_gui_width() / 2;
msg_y = display_get_gui_height() / 2;
msg_width = 500;
msg_height = 150;
