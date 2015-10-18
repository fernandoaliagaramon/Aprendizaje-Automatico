'EJERCICIO 3 - REGRESION MONOVARIABLE - GRADIENTE'
close all;
%% Cargar los datos
datos = load('PisosTrain.txt');
y = datos(:,3);  % Precio en Euros
x1 = datos(:,1); % m^2
x2 = datos(:,2); % Habitaciones
N = length(y);
alfa = 0.001;

X = [ones(N,1) x1];
th = [5000 1000]';  % Pongo un valor cualquiera de pesos

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
    [J,grad] = CosteL2(th,X,y);
    Jotas = [Jotas J];
    th = th - alfa*grad
end

plot(Jotas);

%% Desnormalizamos los pesos
th(2:end) = th(2:end)./sig';
th(1) = th(1)-(mu * th(2:end));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%DIBUJOS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Dibujo de un Ajuste Monovariable
figure;
plot(x1, y, 'bx');
title('Precio de los Pisos')
ylabel('Euros'); xlabel('Superficie (m^2)');
grid on; hold on;


Xextr = [1 min(x1)  % Predicción para los valores extremos
         1 max(x1)];
yextr = Xextr * th;  
plot(Xextr(:,2), yextr, 'r-'); % Dibujo la recta de predicción
legend('Datos Entrenamiento', 'Prediccion')

'Prediccion 100 m2'
x100 = sum (th .* [1 100]')