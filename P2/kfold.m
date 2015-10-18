function [ mejor_tam, mejor_error ] = kfold( n, k , Xdatos, ydatos)

mejor_tam = 0;
mejor_error = 100000;

errores_T = [];
errores_V = [];



for grado = 1:n
    error_T = 0;
    error_V = 0;
    [Xexp] = expandir (Xdatos, [grado 1 1]);
    [ Xn, mu, sig ] = normalizar( Xexp );
    for i = 1:k
        [ Xcv, ycv, Xtr, ytr ] = particion( i, k, Xn, ydatos );
        h = Xtr\ytr;
        error_T = error_T + RMSE (h, Xtr, ytr);
        error_V = error_V + RMSE (h, Xcv, ycv);
    end
    error_T = error_T / k;
    error_V = error_V / k;
    errores_T = [errores_T error_T];
    errores_V = [errores_V error_V];
    if (error_V < mejor_error )
        fprintf('Actualizo mejor error y tamaño\n');
        fprintf('Nuevo mejor tamaño: %d\n',grado);
        fprintf('Nuevo mejor error: %d\n',error_V);
        mejor_tam = grado;
        mejor_error = error_V;
    end
end

fprintf('\nFin algoritmo k-fold\n');

figure;
grid on; hold on;
title(sprintf('Rojo -> errores entrenamiento. Azul -> errores validacion'));
plot(errores_T,'r')
plot(errores_V)



