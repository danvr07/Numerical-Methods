function [matrix] = initialize_weights(L_prev, L_next)
    % Calculează valoarea epsilon
    epsilon = sqrt(6) ./ sqrt(L_prev + L_next);
    L_prev = L_prev + 1;

    % Inițializează matricea de ponderi
    % cu valori aleatoare în intervalul (-epsilon, epsilon]
    matrix = rand(L_next, L_prev) * 2 * epsilon - epsilon;
    
endfunction
