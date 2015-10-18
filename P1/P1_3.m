'EJERCICIO 2 - REGRESION MULTIVARIABLE'
close all;
%% Cargar los datos
datos = load('PisosTrain.txt');
y = datos(:,3);  % Precio en Euros
x1 = datos(:,1); % m^2
x2 = datos(:,2); % Habitaciones
N = length(y);

%% Dibujo de un Ajuste con dos Variables

X = [ones(N,1) x1 x2];

th = X \ y;

yest = X * th;

% Dibujar los puntos de entrenamiento y su valor estimado 
figure;  
plot3(x1, x2, y, '.r', 'markersize', 20);
axis vis3d; hold on;
plot3([x1 x1]' , [x2 x2]' , [y yest]', '-b');

% Generar una ret�cula de np x np puntos para dibujar la superficie
np = 20;
ejex1 = linspace(min(x1), max(x1), np)';
ejex2 = linspace(min(x2), max(x2), np)';
[x1g,x2g] = meshgrid(ejex1, ejex2);
x1g = x1g(:); %Los pasa a vectores verticales
x2g = x2g(:);

% Calcula la salida estimada para cada punto de la ret�cula
Xg = [ones(size(x1g)), x1g, x2g];
yg = Xg * th;

% Dibujar la superficie estimada
surf(ejex1, ejex2, reshape(yg,np,np)); grid on; 
title('Precio de los Pisos')
zlabel('Euros'); xlabel('Superficie (m^2)'); ylabel('Habitaciones');

'Error en datos de entrenamiento:'
r = X*th - y;
SSE = sum(r.^2);
RMSE = sqrt (SSE / N)

%% Cargar los datos
datos = load('PisosTest.txt');
y = datos(:,3);  % Precio en Euros
x1 = datos(:,1); % m^2
x2 = datos(:,2); % Habitaciones
N = length(y);

%% Dibujo de un Ajuste con dos Variables

X = [ones(N,1) x1 x2];
yest = X * th;

% Dibujar los puntos de entrenamiento y su valor estimado 
figure;  
plot3(x1, x2, y, '.r', 'markersize', 20);
axis vis3d; hold on;
plot3([x1 x1]' , [x2 x2]' , [y yest]', '-b');

% Generar una ret�cula de np x np puntos para dibujar la superficie
np = 20;
ejex1 = linspace(min(x1), max(x1), np)';
ejex2 = linspace(min(x2), max(x2), np)';
[x1g,x2g] = meshgrid(ejex1, ejex2);
x1g = x1g(:); %Los pasa a vectores verticales
x2g = x2g(:);

% Calcula la salida estimada para cada punto de la ret�cula
Xg = [ones(size(x1g)), x1g, x2g];
yg = Xg * th;

% Dibujar la superficie estimada
surf(ejex1, ejex2, reshape(yg,np,np)); grid on; 
title('Precio de los Pisos')
zlabel('Euros'); xlabel('Superficie (m^2)'); ylabel('Habitaciones');

'Error en datos de test:'
r = X*th - y;
SSE = sum(r.^2);
RMSE = sqrt (SSE / N)

'Prediccion 100 m2 y 2 dormitorios'
x1002 = sum (th .* [1 100 2]')

'Prediccion 100 m2 y 3 dormitorios'
x1003 = sum (th .* [1 100 3]')

'Prediccion 100 m2 y 4 dormitorios'
x1004 = sum (th .* [1 100 4]')

'Prediccion 100 m2 y 5 dormitorios'
x1005 = sum (th .* [1 100 5]')

th