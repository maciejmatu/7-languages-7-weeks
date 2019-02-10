/* the following are facts */
food_type(velveeta, cheese).
food_type(ritz, cracker).
food_type(spam, meat).
food_type(sausage, meat).
food_type(jolt, soda).
food_type(twinkie, dessert).

flavor(sweet, dessert).
flavor(savory, meat).
flavor(savory, cheese).
flavor(sweet, soda).

/* the following is a rule */
food_flavor(X, Y) :- food_type(X, Z), flavor(Y, Z).

/*
We can use `What` as a placeholder e.g. to list all the flavors that are svory we can do:
flavor(savory, What).
we can also use it for our rule
food_flavor(What, savory).
*/