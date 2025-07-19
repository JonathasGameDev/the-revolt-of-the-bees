// Causa dano no personagem
if (other.cooldown_dano <= 0) {
    other.vidas -= 1;
    other.cooldown_dano = 60;
    
    // Knockback no personagem
    var dir = point_direction(x, y, other.x, other.y);
    other.knockback_x = lengthdir_x(6, dir);
    other.knockback_y = lengthdir_y(6, dir);
}

// Destrói o tiro
instance_destroy();
