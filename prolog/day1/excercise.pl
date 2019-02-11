/* 
Excercieses, and tutorials
- to exit gprolog write `halt.`
- to write smth to the console do `write('Hello World').`
- `nl` puts newline e.g. `write('Hello'), nl, write('World').`
 */

loves(romeo, juliet).
% juliet loves romeo IF romeo loves juliet
loves(juliet, romeo) :- loves(romeo, juliet).


/* Defining rules and facts */
happy(albert).
happy(alice).
happy(bob).
happy(bill).
together(albert, alice).

runs(albert) :-
  happy(albert).

% comma works as AND
dances(alice) :-
  happy(alice),
  together(albert, alice).

does_alice_dance :-
  dances(alice),
  write('Alice dances and is together with albert').

/* Variable rules and facts */
male(bob).
male(chris).
male(carl).

female(jenna).
female(leslie).
female(ana).
female(helga).

child(ana).
child(carl).
child(helga).

parent(bob, carl).
parent(jenna, carl).

parent(bob, ana).
parent(leslie, ana).

parent(leslie, helga).
parent(chris, helga).

baby(X, Y) :-
  male(X),
  female(Y).

get_parents :-
  parent(X, carl),
  parent(X, ana),
  % ~w is a variable, ~s is a string and ~n is newline
  format('~w ~s parent ~n', [X, "is the"]).

are_siblings(X, Y) :-
  parent(Z, X),
  parent(Z, Y),
  format('~w is the parent of ~w and ~w, so they are siblings', [Z, X, Y]).

% underscore is an anonymus variable that allows to check if predicate exists e.g. 
% male(_). -> true

/*
There are no if statements in prolog, but we can operate on something similar to 
'case' statements. For different cases we return different results
 */
what_grade(5) :-
  write('Go to kindergarden').

what_grade(7) :-
  write('Go to 1st grade').

what_grade(Other) :-
  % `is` assings value
  Grade is Other - 5,
  format('Go to grade ~w', [Grade]).