function [Y, InitialMatrix] = parse_data_set_file(file_path)
    % deschide fisierul pentru citire
    fid = fopen(file_path, 'r');

    % citeste dimensiunile matricii
    dimensions = sscanf(fgetl(fid), '%d', 2);
    m = dimensions(1);
    n = dimensions(2);

    % prealocare matrice initiala ca o celula cu dimensiunea adecvata
    InitialMatrix = cell(m, n + 1);

    % citeste fiecare rand din fisier si adauga la matrice
    for i = 1:m
        row = fgetl(fid);
        values = strsplit(row, ' ');
        for j = 1:n+1
            InitialMatrix{i,j} = values{j};
        end
    end

    % inchide fisierul
    fclose(fid);

    % extrage vectorul Y din matricea initiala si converteste la tip numeric
    Y = cellfun(@str2num, InitialMatrix(:, 1));

    % elimina prima coloana cu valorile Y din matricea initiala
    InitialMatrix = InitialMatrix(:, 2:end);
end
