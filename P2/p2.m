%% Pracrica 2 - Regularizacion y seleccion de modelos
% Fernando Aliaga Ramon
% NIA : 610610


%% Cargar los datos
close all;

datos = load('CochesTrain.txt');
ydatos = datos(:, 1);   % Precio en Euros
Xdatos = datos(:, 2:4); % A�os, Km, CV
x1dibu = linspace(min(Xdatos(:,1)), max(Xdatos(:,1)), 100)'; %para dibujar

datos2 = load('CochesTest.txt');
ytest = datos2(:,1);  % Precio en Euros
Xtest = datos2(:,2:4); % A�os, Km, CV
Ntest = length(ytest);


%% Ejercicio 2 - Seleccion del grado del polinomio para la antig�edad del
% coche

fprintf('\nEjercicio 2 - Seleccion del grado del polinomio para la antig�edad del coche\n');
fprintf('\nInicio algoritmo k-fold\n\n');

% Buscamos el mejor grado del polinomio dejando fijos los kilometros y la
% potencia (grado 1)
[ mejor_tam, mejor_error ] = kfold ( 10, 10 , Xdatos, ydatos);

% Volvemos a entrenar con todos los datos. Calculamos el error RMSE.
[Xn2] = expandir (Xdatos, [mejor_tam 1 1]);
[ Xn, mu, sig ] = normalizar( Xn2 );
h = Xn\ydatos;
[ wdes ] = desnormalizar( h, mu, sig );
[Xt] = expandir (Xtest, [mejor_tam 1 1]);
error1 = RMSE (wdes, Xt, ytest);
fprintf('\nMejor grado del polinomio = [%d,1,1]', mejor_tam);
fprintf('\nError RMSE con datos de test = %d\n', error1);
fprintf('\nPulsar ENTER para seguir con el ejercicio 3\n\n');
pause;

%% Ejercicio 3 - Seleccion del grado del polinomio para los kilometros

fprintf('\nEjercicio 3 - Seleccion del grado del polinomio para los kilometros\n');
fprintf('\nInicio algoritmo k-fold\n\n');

% Buscamos el mejor grado del polinomio dejando fija la antig�edad y la
% potencia (mejor_tam, 1)
[ mejor_tam2, mejor_error ] = kfold2 ( 10, 10 , Xdatos, ydatos, mejor_tam);

% Volvemos a entrenar con todos los datos. Calculamos el error RMSE.
[Xn3] = expandir (Xdatos, [mejor_tam mejor_tam2 1]);
[ Xn, mu, sig ] = normalizar( Xn3 );
h = Xn\ydatos;
[ wdes ] = desnormalizar( h, mu, sig );
[Xt2] = expandir (Xtest, [mejor_tam mejor_tam2 1]);
error2 = RMSE (wdes, Xt2, ytest);
fprintf('\nMejor grado del polinomio = [%d,%d,1]', mejor_tam, mejor_tam2);
fprintf('\nError RMSE con datos de test = %d\n', error2);
fprintf('\nPulsar ENTER para seguir con el ejercicio 4\n\n');

pause;

%% Ejercicio 4 - Regularizacion

fprintf('\nEjercicio 4 - Regularizacion\n');
fprintf('\nInicio algoritmo regularizacion\n\n');

% Buscamos el mejor valor de lambda usando el polinomio [10,5,5]
[ mejor_lambda, mejor_error ] = regularizacion ( 10, 10 , Xdatos, ydatos);

% Volvemos a entrenar con todos los datos. Calculamos el error RMSE.
[Xn4] = expandir (Xdatos, [10 5 5]);
[ Xn, mu, sig ] = normalizar( Xn4 );
[nrows,ncols] = size(Xn);
h = Xn'*Xn + mejor_lambda*diag([0 ones(1,ncols-1)]);
theta = h \ (Xn'*ydatos);
[ wdes ] = desnormalizar( theta, mu, sig );
[Xt4] = expandir (Xtest, [10 5 5]);
error3 = RMSE (wdes, Xt4, ytest);

fprintf('\nMejor lambda encontrado = %d', mejor_lambda);
fprintf('\nError RMSE con datos de test = %d\n', error3);

% Imprimimos por pantalla los 3 errores obtenidos con los datos de test
fprintf('\nComparativa errores:\n');
fprintf('Error RMSE (2) = %d\n', error1);
fprintf('Error RMSE (3) = %d\n', error2);
fprintf('Error RMSE (4) = %d\n', error3);
