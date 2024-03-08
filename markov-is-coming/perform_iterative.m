function [x, err, steps] = perform_iterative (G, c, x0, tol, max_steps)

    x = x0;
  	err = realmax; % eroarea finala
    steps = 0; %nr de pasi
    
   % Se itereaza pana la numarul maxim de pasi dati ca argument
    for steps = 1:max_steps
    x = G * x + c;
  
    % Se calc diferenta
    err = norm(x - x0);

    % se da update la solutia initala
    x0 = x;

    % Se verifica convergenta
    % daca toleranta este mai mare decat eroare se iese din for
    if err <= tol 
        break;
    endif

  endfor

endfunction
