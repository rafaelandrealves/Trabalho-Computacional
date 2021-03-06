%   variaveis constantes, n�meros mecanogr�ficos dos alunos
Rodrigo = 190185;
Rafael = 190171;
Joao = 190119;
Vasco = 190205;

%   numero do grupo
G = 4;

%   soma dos numeros mecanograficos dos alunos
s = Rodrigo + Rafael + Joao + Vasco;

%   Fun��o que transfroma um numero numa string
d = num2str(s);

%   matriz linha com o numero 'd'
s = [str2double(d(1)), str2double(d(2)), str2double(d(3)), str2double(d(4)), str2double(d(5)), str2double(d(6))];
d = s;

%   matrizes auxiliares para calculos defenidos no enunciado
auxL = [1; 0; 0; 0; 10^-1; 10^-2];
auxR = [10; 0; 0; 1; 10^-1; 0];
auxC = [10^-4; 10^-5; 10^-6; 0; 0; 0];

%   valores correspondes aos componentes passivos do circuito,
%   para o respetivo grupo
L = d * auxL;
R = d * auxR;
C = d * auxC;

 %L=0.320e1;
 %R=0.352e2;
 %C=3.6e-4;
 %G = 50;

%   Divide o intervalo [0,1] em 100 pontos
t = linspace(0, 1, 101);

%   Funcao da Carga em funcao do tempo 
Q = q_eq3(R, L, C, G, t);

%---------------------------Exercicio 1----------------------------------

%  alínea 1.a
    %gerar_grafico(1, t, Q, 0, .6, 0.5, 0.4, "Tempo [s]", "Carga [C]","a");

%  alínea 1.b
    [a, b, c, d] = ex1b(L, C);
    %gerar_grafico(2, a, b, 0.5, 0.6, 0.5, 0.4, "aprox_r", "erro", "b");
    %gerar_2_graficos(3, a, d, b, 0.25, 0.25, .5, 0.5, "r", "(%)erro","f(r)", "b");
    
    
%---------------------------Exercicio 2----------------------------------

%  alínea 2.a
    %Tabela_2a = ex2a(R, L, C);

%  alínea 2.b
    %ex2b(R);


%---------------------------Exercicio 3----------------------------------

%  alínea 3.a
   [K, J, I, Tab] = ex3a(t, L, R, C, G);
   
%gerar_tabela(Tab, 4, 0, 0.4, 1, .18);

%gerar_2_graficos(5, t , I , J, 0.0, 0.25, .5, 0.5, "Tempo [s]",  "i(t) [A]", "J(t) [A]", "a");
%gerar_2_graficos(6, t, J-I, J, 0.5, 0.25, .5, 0.5, "Tempo [s]",  "J(t) - i(t) [A]", "J(t) [A]", "a");
   
%  alínea 3.b
   [Qs, Qt] = ex3b(G, R, L, C, K, t);
   
 %gerar_grafico (7, t, Qt, 0.2, 0.55, 0.25, 0.25, "Tempo [s]", "Qt(tk)", "b");
 %gerar_grafico (8, t, Qs, 0.55, 0.55, 0.25, 0.25, "Tempo [s]", "Qs(tk)", "b");
 %gerar_2_graficos(64, t, Qt, I, 0.5, 0.25, .5, 0.5, "Tempo [s]",  "It(t) [A]", "I(t) [A]", "a");
 %gerar_2_graficos(65, t, Qs, I, 0.5, 0.25, .5, 0.5, "Tempo [s]",  "J(t) - i(t) [A]", "J(t) [A]", "a");
 %gerar_grafico (9, t, Qt - I, 0.2, 0.25, 0.25, 0.25, "Tempo [s]", "[Qs - Qt](tk)", "b");
 %gerar_grafico (10, t, (abs(Qt - Qs) ./ Qs ) .* 100, 0.1, 0.1, 0.8, 0.8, "Tempo [s]", "[|Qt - Qs|](tk)", "b");
 
 %---------------------------Exercicio 4----------------------------------
   
 %  TODO, por na msm função

 % n pode tomar valores entre 1, 2 ou 3 
 
 n = 3;
 
    [ye, t4] = ex4a(R, G, L, C, n);
    t_aux = linspace(0, 1, 10*(10^n) +1);
    intensidade = derivada_dq(t_aux, L, R, C, G);
    %gerar_2_graficos(11 + n - 1, t4, ye, intensidade, 0.2, 0.2, 0.6, 0.6, "Tempo [s]", "Intensidade Calculada [A]", "Intensidade dado no enucidao [A]", "4.a) Cálculo da Intensidade pelo método de Euler com h = 10^-^4");
    %gerar_grafico(16 + n, t4, ye - intensidade, 0.2, 0.2, 0.6, 0.6, "Tempo [s]", "Intensidade [A]", "4.a) Diferença entre a Intensidade Calculada e a dada no Enunciado com  h = 10^-^4 ");
    
%gerar_2_graficos(11 + n - 1, t3, y3, y1, (n-1)*0.2, 0.2, 0.6, 0.6, "legenda_x", "legenda_y","legenda_y", "a");
%gerar_grafico(15, t, I, 0.2, 0.2, 0.6, 0.6, "legenda_x", "legenda_y", "b");
[yrk] = ex4b(R, G, L, C, I, ye);
     %gerar_grafico(45, t4, yrk, 0, 0.2, 0.6, 0.6, "legenda_x", "legenda_y", "b");
     %gerar_2_graficos(15, t4, yrk, intensidade, 0.2, 0.2, 0.6, 0.6, "Tempo [s]", "Intensidade Calculada [A]","Intensidade dado no enucidao [A]", "4.b) Cálculo da Intensidade pelo método de Runge-Kutta com h = 10^-^4");
     gerar_grafico(67, t4, yrk - intensidade, 0.1, 0.1, 0.8, 0.8, "Tempo [s]", "Intensidade [A]", "4.b) Diferença entre a Intensidade Calculada e a dada no Enunciado com  h = 10^-^4 ");
     
     