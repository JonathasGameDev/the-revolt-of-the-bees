with (other) {
    hp -= 1;
    cooldown_dano = room_speed / 4; // deixa vermelho por 0.25s (ajuste tempo)
}

// Destroi o tiro
instance_destroy();
