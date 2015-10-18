t = -2:0.1:10;

media = sin(t);
varianza = 0.2 + 0.04*rand(size(media));

figure
boundedline(t, media, varianza);