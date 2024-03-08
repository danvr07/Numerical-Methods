function [X, y] = load_dataset(path)
    % Încarcă datele din fișierul .mat

    data = load(path);
    X = data.X;
    y = data.y;
endfunction
