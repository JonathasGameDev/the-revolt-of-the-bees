function definir_proximo_tiro() {
    // Define um tempo aleatório entre 1 e 5 segundos
    // 60 frames = 1 segundo, então 300 frames = 5 segundos
    tempo_proximo_tiro = random_range(60, 300);
}