function [path] = heuristic_greedy(start_position, probabilities, Adj)
    % Inițializează variabilele
    visited = zeros(1, length(probabilities));
    path = start_position;
    current_position = start_position;
    WIN = 1;
    
    % Execută bucla for pentru un număr maxim de pași
    for i = 1:length(probabilities)
        % Găsește stările vecine nevizitate
        visited(current_position) = 1;
        neighbors = find(Adj(current_position, :));
        % Se verifica diferenta dintre vectorul de vecini "neighbors"
        % și indicii elementelor care au fost vizitate, obținuți cu funcția "find"
       unvisited_neighbors = setdiff(neighbors, find(visited));


        % Calculează valoarea euristică pentru fiecare stare vecină nevizitată
        heuristic_values = probabilities(unvisited_neighbors);
        
        % Verifică dacă am ajuns la stare WIN
        if probabilities(current_position) == WIN
            break;
        end
        
        % Alege starea cu valoarea euristică maximă ca următoarea stare
        [max_val, max_idx] = max(heuristic_values);
        next_position = unvisited_neighbors(max_idx);
        
        % Actualizează poziția curentă și calea
        current_position = next_position;
        % adaugă poziția curentă (current_position) la sfârșit
        path = [path current_position];
    endfor
    
endfunction
