different(red, green). different(red, blue).
different(green, red). different(green, blue).
different(blue, red). different(blue, green).

/* bordering states can not have same colors. */
coloring(Alabama, Missisippi, Georgia, Tennessee, Florida) :-
  different(Missisippi, Tennessee),
  different(Missisippi, Alabama),
  different(Alabama, Tennessee),
  different(Alabama, Missisippi),
  different(Alabama, Georgia),
  different(Alabama, Florida),
  different(Georgia, Florida),
  different(Georgia, Tennessee).
