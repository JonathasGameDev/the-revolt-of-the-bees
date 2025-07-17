if (inimigos_criados < total_inimigos_gerar && instance_number(obj_inimigo) < max_inimigos_vivos) {
    var min_dist = 100;
    var px = obj_personagem.x;
    var py = obj_personagem.y;
    var new_x, new_y;

    do {
        new_x = random(room_width);
        new_y = random(room_height);
    } until (point_distance(new_x, new_y, px, py) > min_dist);

    instance_create_layer(new_x, new_y, "inimigo", obj_inimigo);
    inimigos_criados += 1;
}

// Só repete o alarme se ainda tem inimigos pra gerar
if (inimigos_criados < total_inimigos_gerar) {
    alarm[0] = spawnrate;
}
