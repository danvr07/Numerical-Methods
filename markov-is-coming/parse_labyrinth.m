function [Labyrinth] = parse_labyrinth(file_path)

  % Deschidem fisierul cu informatii despre labirint pentru citire
    fid = fopen(file_path, 'r');

  % Se citeste prima linie pentru nr de linii si coloane
    line = fgets(fid);
    [rows, cols] = strtok(line);

  % Se convertesc string-urile in numere intregi(str2num)
    rows = str2num(rows);
    cols = str2num(cols);

  % Se citeste matricea labirintului sarind
  % peste prima linie care este nr de linii si coloane

    Labyrinth = textread(file_path, '', 'headerlines', 1);
    fclose(fid);

endfunction
