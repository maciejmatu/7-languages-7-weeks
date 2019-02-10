/*
this file is the knowledgebase where we define rules
to load this file into gprolog, write `['index.pl'].`
*/
likes(wallace, cheese).
likes(grommit, cheese).
likes(wendolene, sheep).

friend(X, Y) :- \+(X = Y), likes(X, Z), likes(Y, Z).