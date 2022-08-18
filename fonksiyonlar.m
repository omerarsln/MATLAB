function fonksiyonlar

    function translated = translate(coord , d , h ,l)
        translation = [1 0 0 0; 0 1 0 0; 0 0 1 0; d h l 1];
        x = [coord 1]*translation;
        x(end)=[];
        translated = x;
    end

    function scaled = scale(coord , a , f , k)
        scaling = [a 0 0 0; 0 f 0 0; 0 0 k 0; 0 0 0 1];
        x = [coord 1]*scaling;
        x(end) = [];
        scaled = x;
    end

    function rotated = rotate(coord,angleX,angleY,angleZ)
        rotation_z = [cos(angleZ) -sin(angleZ) 0 0; sin(angleZ) cos(angleZ) 0 0; 0 0 1 0; 0 0 0 1];
        rotation_x = [1 0 0 0; 0 cos(angleX) -sin(angleX) 0; 0 sin(angleX) cos(angleX) 0; 0 0 0 1];
        rotation_y = [cos(angleY) 0 sin(angleY) 0; 0 1 0 0; -sin(angleY) 0 cos(angleY) 0; 0 0 0 1];
        x = [coord 1]*rotation_x*rotation_y*rotation_z;
        x(end) = [];
        rotated = x;
    end
end