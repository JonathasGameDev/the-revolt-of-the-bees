var empurrao_forca = 5;
var empurrao_suave = 3;

// Verificar se está tocando nas bordas
var tocando_esquerda = other.x <= 0;
var tocando_direita = other.x >= room_width - other.sprite_width;
var tocando_cima = other.y <= 0;
var tocando_baixo = other.y >= room_height - other.sprite_height;

// Empurrar horizontalmente
if (tocando_esquerda && other.x < x) {
    other.x += empurrao_suave;
} else if (tocando_direita && other.x > x) {
    other.x -= empurrao_suave;
} else {
    // Empurrão normal caso não esteja em quina
    if (other.x < x) {
        other.x -= empurrao_forca;
    } else if (other.x > x) {
        other.x += empurrao_forca;
    }
}

// Empurrar verticalmente
if (tocando_cima && other.y < y) {
    other.y += empurrao_suave;
} else if (tocando_baixo && other.y > y) {
    other.y -= empurrao_suave;
} else {
    if (other.y < y) {
        other.y -= empurrao_forca;
    } else if (other.y > y) {
        other.y += empurrao_forca;
    }
}
