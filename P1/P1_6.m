close all;
%% Cargar los datos
datos = load('PisosTrain.txt');
y = datos(:,3);  % Precio en Euros
x1 = datos(:,1); % m^2
x2 = datos(:,2); % Habitaciones
N = length(y);
alfa = 100;

X = [ones(N,1) x1 x2];
th = [5000 1000 1000]';  % Pongo un valor cualquiera de pesos

%% Normalizamos los atributos
mu = mean(X(:,2:end));
sig = std(X(:,2:end));
X(:,2:end) = (X(:,2:end) - repmat(mu,N,1))./ repmat(sig,N,1);


i = 0;

 [J,grad] = CosteL2(th,X,y);
 th = th - alfa*grad;
 J_old = J + 100
 
 Jotas=[];

while (J_old - J > 0.1)
    i = i+1;
    J_old=J
    [J,grad] = CosteHuber(th,X,y,1);
    Jotas = [Jotas J];
    th = th - alfa*grad
end

plot(Jotas);

%% Desnormalizamos los pesos
th(2:end) = th(2:end)./sig';
th(1) = th(1)-(mu * th(2:end));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%DIBUJOS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% Dibujo de un Ajuste con dos Variables

X = [ones(N,1) x1 x2];

th = X \ y;

yest = X * th;

% Dibujar los puntos de entrenamiento y su valor estimado 
figure;  
plot3(x1, x2, y, '.r', 'markersize', 20);
axis vis3d; hold on;
plot3([x1 x1]' , [x2 x2]' , [y yest]', '-b');

% Generar una retícula de np x np puntos para dibujar la superficie
np = 20;
ejex1 = linspace(min(x1), max(x1), np)';
ejex2 = linspace(min(x2), max(x2), np)';
[x1g,x2g] = meshgrid(ejex1, ejex2);
x1g = x1g(:); %Los pasa a vectores verticales
x2g = x2g(:);

% Calcula la salida estimada para cada punto de la retícula
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

% Generar una retícula de np x np puntos para dibujar la superficie
np = 20;
ejex1 = linspace(min(x1), max(x1), np)';
ejex2 = linspace(min(x2), max(x2), np)';
[x1g,x2g] = meshgrid(ejex1, ejex2);
x1g = x1g(:); %Los pasa a vectores verticales
x2g = x2g(:);

% Calcula la salida estimada para cada punto de la retícula
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