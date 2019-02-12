/*
Lists are containers of variable length. Example List:
[1, 2, 3].

Tuples are containers of fixed length. Example touple:
(1, 2, 3).
*/

% prolog tries to make left and right sides match
% it checks if both sides have the same number of elements and if they unify
(1, 2, 3) = (1, 2, 3). % yes
(1, 2, 3) = (1, 2, 3, 4). % no. length is important
(1, 2, 3) = (3, 2, 1). % no. order is important

(A, B, C) = (1, 2, 3). % yes, A = 1, B = 2, C = 3
(A, 2, C) = (1, B, 3). % yes, A = 1, B = 2, C = 3

[1, 2, 3] = [1, 2, 3]. % yes
[1, 2, 3] = [X, Y, Z]. % yes, 1, 2, 3
[2, 2, 3] = [X, X, Z]. % yes, X = 2, Z = 3
[1, 2, 3] = [X, X, Z]. % no. two X-es on the left have to be equal and on the right side they are 1, 2.
[] = []. % yes

[a, b, c] = [Head|Tail].
% yes
% Head = a
% Tail = [b, c]

[] = [Head, Tail]. % no. empty list cannot have a Head.
[a] = [Head, Tail]. % yes, Head = a, Tail = []. Tail can be empty

% `_` symbol is a wildcard that matches with anything.
[a, b, c, d, e] = [_, _|[Head|_]]. % yes. Head = c