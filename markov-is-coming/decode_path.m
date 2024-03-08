function [decoded_path] = decode_path(path, lines, cols)

    decoded_path = zeros(length(path), 2); % inițializarea matricei de perechi
    for i = 1:length(path)
    % Calcularea coordonatelor (lin și col) pentru fiecare element din cale
        row = ceil(path(i) / cols);
        col = mod(path(i) - 1, cols) + 1;
        decoded_path(i, :) = [row, col]; % adăugarea perechii la matrice
    endfor
    decoded_path(end, :) = []; % ștergerea ultimei linii din matrice

endfunction
