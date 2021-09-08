%HECHOS GENERALES
%Frutas Frescas
fruta(albaricoque).
fruta(arándano).
fruta(breva).
fruta(cereza).
fruta(ciruela).
fruta(endrina).
fruta(frambuesa).
fruta(fresa).
fruta(granada).
fruta(grosella).
fruta(higo).
fruta(lima).
fruta(limón).
fruta(mandarina).
fruta(manzana).
fruta(melocotón).
fruta(melón).
fruta(membrillo).
fruta(mora).
fruta(naranja).
fruta(níspero).
fruta(pera).
fruta(piña).
fruta(plátano).
fruta(pomelo).
fruta(sandía).
fruta(uva).

%Frutas Tropicales
fruta(aguacate).
fruta(alquejenje).
fruta(caqui).
fruta(carambola).
fruta(chirimoya).
fruta(coco).
fruta(cuayaba).
fruta(kiwano).
fruta(kiwi).
fruta(kumquat).
fruta(litchi).
fruta(mango).
fruta(mangostan).
fruta(maracuyá).
fruta(papaya).
fruta(pitahaya).
fruta(rambután).
fruta(tamarillo).

%Frutos Secos
fruta(ciruela_pasa).
fruta(dátil).
fruta(higo_seco).
fruta(orejones_albaricoque).
fruta(orejones_melocotón).
fruta(uva_pasa).

%Definir tipo de fruta
tipo_fruta(fresca, albaricoque).
tipo_fruta(fresca, arándano).
tipo_fruta(fresca, breva).
tipo_fruta(fresca, cereza).
tipo_fruta(fresca, ciruela).
tipo_fruta(fresca, endrina).
tipo_fruta(fresca, frambuesa).
tipo_fruta(fresca, fresa).
tipo_fruta(fresca, granada).
tipo_fruta(fresca, grosella).
tipo_fruta(fresca, higo).
tipo_fruta(fresca, lima).
tipo_fruta(fresca, limón).
tipo_fruta(fresca, mandarina).
tipo_fruta(fresca, manzana).
tipo_fruta(fresca, melocotón).
tipo_fruta(fresca, melón).
tipo_fruta(fresca, membrillo).
tipo_fruta(fresca, mora).
tipo_fruta(fresca, naranja).
tipo_fruta(fresca, níspero).
tipo_fruta(fresca, pera).
tipo_fruta(fresca, piña).
tipo_fruta(fresca, plátano).
tipo_fruta(fresca, pomelo).
tipo_fruta(fresca, sandía).
tipo_fruta(fresca, uva).

tipo_fruta(tropical, aguacate).
tipo_fruta(tropical, alquejenje).
tipo_fruta(tropical, caqui).
tipo_fruta(tropical, carambola).
tipo_fruta(tropical, chirimoya).
tipo_fruta(tropical, coco).
tipo_fruta(tropical, guayaba).
tipo_fruta(tropical, kiwano).
tipo_fruta(tropical, kiwi).
tipo_fruta(tropical, kumquat).
tipo_fruta(tropical, litchi).
tipo_fruta(tropical, mango).
tipo_fruta(tropical, mangostan).
tipo_fruta(tropical, maracuyá).
tipo_fruta(tropical, papaya).
tipo_fruta(tropical, pitahaya).
tipo_fruta(tropical, rambután).
tipo_fruta(tropical, tamarillo).

tipo_fruta(seco, ciruela_pasa).
tipo_fruta(seco, dátil).
tipo_fruta(seco, higo_seco).
tipo_fruta(seco, orejones_albaricoque).
tipo_fruta(seco, orejones_melocotón).
tipo_fruta(seco, uva_pasa).

:-use_module(library(random)).

preguntar_de(N, P):-
    N = 1 -> P = "¿Se considera una fruta dulce?";
    N = 2 -> P = "¿Se considera de tipo: fruto seco?";
    N = 3 -> P = "¿Se considera de tipo: exótica?";
    N = 4 -> P = "¿Se considera de tipo: cítrico?";
    N = 5 -> P = "¿Se considera a la fruta como un tipo de baya?";
    N = 6 -> P = "¿La fruta es rica en Potasio?";
    N = 7 -> P = "¿Es color externo de la fruta es rojo?";
    N = 8 -> P = "¿Es color externo de la fruta es verde?";
    N = 9 -> P = "¿Es color externo de la fruta es amarillo?";
    N = 10 -> P = "¿Es color externo de la fruta es café?";
    N = 11 -> P = "¿Es color externo de la fruta es naranja?";
    N = 12 -> P = "¿Es color externo de la fruta es morado?";
    N = 13 -> P = "¿Es color externo de la fruta es negro?";
    N = 14 -> P = "¿Las semillas se encuentran en la parte externa de la fruta?";
    N = 15 -> P = "¿La fruta no contiene semillas?";
    N = 16 -> P = "¿La fruta contiene solo una semilla en su interior?";
    N = 17 -> P = "¿La fruta contiene varias semillas en su interior?"
    .

lista_preg([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17]).

% Comparar valores de la lista de respuestas con "si", intenta encontrar
% coincidencias con las respuestas en común de cada fruta
c_fruta(LISTA, F):- L1 = [1,6,11,16], append(LISTA, [], Z), length(Z, TAM),
    length(L1, TAM2), (TAM = TAM2, TAM2 > 0 ->
    c_iguales(Z, L1, TAM, X), (X = true -> F = albaricoque), !).

c_fruta(LISTA, F):- L1 = [5,13,17], append(LISTA, [], Z), length(Z, TAM),
    length(L1, TAM2), (TAM = TAM2, TAM2 > 0 ->
    c_iguales(Z, L1, TAM, X), (X = true -> F = arándano),  !).

c_fruta(LISTA, F):- L1 = [1,6,7,16], append(LISTA, [], Z), length(Z, TAM),
    length(L1, TAM2), (TAM = TAM2, TAM2 > 0 ->
    c_iguales(Z, L1, TAM, X), (X = true -> F = cereza),  !).

c_fruta(LISTA, F):- L1 = [1,16,7,8,9,12], append(LISTA, [], Z), length(Z, TAM),
    length(L1, TAM2), (TAM = TAM2, TAM2 > 0 ->
    c_iguales(Z, L1, TAM, X), (X = true -> F = ciruela),  !).

c_fruta(_, X):- X = no_encontrado.

% comparar ambos tamaños antes... para evitar errores
% comprueba si las respuestas del usuario las contenga una fruta en común
c_iguales(L_C, LISTA, TAM, X) :-
    (TAM = 0 -> X = true, true); % detiene la funcion cuando comprueba todos
    (TAM > 0 -> nth1(1, L_C, M), % obtiene el primer elemento
               member(M, LISTA), % comprueba que el elemento exista en la lista
               %T is TAM -1, % decrementa el tamaño
               delete(L_C, M, N_L), length(N_L, T),% eliminina la cabeza
               c_iguales(N_L, LISTA, T, X); X = false).

% agregar elemento al inicio de una lista
% (elemento, lista de elementos, [ele_inicial|lista_ele_anteriores)
agregar_correcta(E,L1,[E|L1]).

esperar_respuesta(ID, LISTA_C, NLISTA):- write('Responda: SI(s) ó _NO(n): '),
    read(RESPUESTA), % (RESPUESTA == s),
    (RESPUESTA = s) -> agregar_correcta(ID, LISTA_C, NLISTA);
    (RESPUESTA = n) -> append(LISTA_C, [], NLISTA).

aleatorio(X, TAM):- TAM > 1 -> random(1, TAM, X); TAM is 1.

pregunta_aleatoria(LISTA_PREG, N_LISTA, LISTA_CTAS, N_LISTA_CTAS):-
    length(LISTA_PREG, TAM), aleatorio(N, TAM), nth1(N, LISTA_PREG, NUM),
    preguntar_de(NUM, PREGUNTA), write("\nPregunta: "),
    write(PREGUNTA), nl, delete(LISTA_PREG, NUM, N_LISTA),
    esperar_respuesta(NUM, LISTA_CTAS, N_LISTA_CTAS).

obtener_preguntas(LISTA_P, LISTA_CO):-
    pregunta_aleatoria(LISTA_P, N_LISTA, LISTA_CO, N_LISTA_CO),
    %append(N_LISTA_CO, [], NLCO), num_elementos(NLCO, TAM_CO),
    length(N_LISTA_CO, TAM_CO),
    (TAM_CO >= 3 -> c_fruta(N_LISTA_CO, FRUTA)),
    length(N_LISTA, TAM),
    (FRUTA = no_encontrado -> write(FRUTA), nl,
          (TAM > 0 -> obtener_preguntas(N_LISTA, N_LISTA_CO))
    ;
    (FRUTA \= no_encontrado -> write(FRUTA), nl)).

iniciar():- lista_preg(LISTA_P), obtener_preguntas(LISTA_P, _).

% contiene y permite comprobar si una fruta existe en la lista
frutas([]).
frutas([X|Xs]):- fruta(X), frutas(Xs).

% devuelve true si un valor no pertenece a la lista
no_pertenece(X,[]).
no_pertenece(X,[Y|Ys]):- X\=Y, no_pertenece(X, Ys).

% devuelve el número de elementos de una lista
num_elementos([],0).
num_elementos([_|Xs], N):- num_elementos(Xs, Aux), N is Aux + 1.

respuestas_c(A,B,[]):- conectar(A,B,_).
respuestas_c(A,B,[X|Y]):- conectar(A,X,_), respuestas_c(X,B,Y).

iniciar_juego():- comenzar_preguntas.

% *******************  PALABRAS RESERVADAS  *********************** %
% Z es la concatenación de las listas X e Y.                        %
% append(X,Y,Z).                                                    %
%                                                                   %
% Borra el elemento Y de la lista X y da como resultado la lista Z. %
% delete(X,Y,Z).                                                    %
%                                                                   %
% X es uno de los elementos de la lista Y                           %
% member(X,Y).                                                      %
%                                                                   %
% El N-esimo elemento de la lista Y es Z (empieza en 1)             %
% nth1(N,Y,Z).                                                      %
%                                                                   %
% Y es la longitud de l lista X                                     %
% length(X, Y).                                                     %
%                                                                   %
% Devuelve un entero aleatorio i(0 =< i < X).                       %
% random(X).                                                        %
% ***************************************************************** %
