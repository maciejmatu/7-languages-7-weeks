/* bank */
customer(tom, smith, 120.55).
customer(sally, smith, 120.55).

get_customer_balance(Name, Surname) :-
  customer(Name, Surname, Balance),
  write(Name), tab(1),
  % 2f is floating point num with 2 decimal places
  format('~w owes the bank $~2f ~n', [Surname, Balance]).

/* geometric definition of a vertical line */
% X on the cartesian plane must be the same for a line to be considered vertical
vertical(line(point(X, Y), point(X, Y2))).
horizontal(line(point(X, Y), point(X2, Y))).

% we can ask prolog to fill any part of the equation e.g. 
% vertical(line(point(X, 20), Y)).