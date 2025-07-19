// Só spawna se a colmeia ainda existir
if (instance_exists(obj_colmeia) && !colmeia_destruida) {
    
    if (instance_number(obj_inimigo) < max_inimigos_vivos) {
        var min_dist = 100;
        var px = obj_personagem.x;
        var py = obj_personagem.y;
        var new_x, new_y;
        var tentativas = 0;
        var posicao_encontrada = false;
        
        // Procura posição próxima à colmeia, mas longe do personagem
        while (!posicao_encontrada && tentativas < 30) {
            // Gera posição ao redor da colmeia
            var angulo = random(360);
            var distancia = random_range(50, spawn_raio_colmeia);
            
            new_x = obj_colmeia.x + lengthdir_x(distancia, angulo);
            new_y = obj_colmeia.y + lengthdir_y(distancia, angulo);
            
            // Verifica se está dentro da room e longe do personagem
            if (new_x > 0 && new_x < room_width && 
                new_y > 0 && new_y < room_height &&
                point_distance(new_x, new_y, px, py) > min_dist) {
                posicao_encontrada = true;
            }
            tentativas += 1;
        }
        
        // Se não encontrou posição próxima à colmeia, usa método original
        if (!posicao_encontrada) {
            do {
                new_x = random(room_width);
                new_y = random(room_height);
            } until (point_distance(new_x, new_y, px, py) > min_dist);
        }
        
        instance_create_layer(new_x, new_y, "inimigo", obj_inimigo);
        inimigos_criados += 1;
    }
    
    // Repete o alarme enquanto a colmeia existir (spawn infinito)
    alarm[0] = spawnrate;
}
