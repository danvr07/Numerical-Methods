function [X_train, y_train, X_test, y_test] = split_dataset(X, y, percent)
  % obține numărul de exemple
  num_example = size(X, 1);
  
  % amestecă aleatoriu indicii exemplelor
  indici_amestecati = randperm(num_example);
  
  % determină numărul de exemple de utilizat pentru antrenare
  num_train_examples = round(percent * num_example);
  
  % împarte indicii amestecati în seturi de antrenare si testare
  train_idx = indici_amestecati(1:num_train_examples);
  test_idx = indici_amestecati(num_train_examples+1:end);
  
  % folosește indicii pentru a împarti datele în seturi de antrenare si testare
  X_train = X(train_idx, :);
  y_train = y(train_idx);
  X_test = X(test_idx, :);
  y_test = y(test_idx);
  
endfunction
