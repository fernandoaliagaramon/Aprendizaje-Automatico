'EJERCICIO 1 - REGRESION MONOVARIABLE'
close all;
%% Cargar los datos
datos = load('PisosTrain.txt');
y = datos(:,3);  % Precio en Euros
x1 = datos(:,1); % m^2

N = length(y);

%% Dibujo de un Ajuste Monovariable
figure;
plot(x1, y, 'bx');
title('Precio de los Pisos')
ylabel('Euros'); xlabel('Superficie (m^2)');
grid on; hold on; 


X = [ones(N,1) x1];

%% Resolvemos mediante ecuacion normal
th = X \ y;

Xextr = [1 min(x1)  % Predicci�n para los valores extremos
         1 max(x1)];
yextr = Xextr * th;  
plot(Xextr(:,2), yextr, 'r-'); % Dibujo la recta de predicci�n
legend('Datos Entrenamiento', 'Prediccion')

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

%% Dibujo de un Ajuste Monovariable
figure;
plot(x1, y, 'bx');
title('Precio de los Pisos')
ylabel('Euros'); xlabel('Superficie (m^2)');
grid on; hold on; 

X = [ones(N,1) x1];
plot(Xextr(:,2), yextr, 'r-'); % Dibujo la recta de predicci�n
legend('Datos Test', 'Prediccion')

'Error en datos de test:'
r = X*th - y;
SSE = sum(r.^2);
RMSE = sqrt (SSE / N)

'Prediccion 100 m2'
x100 = sum (th .* [1 100]')