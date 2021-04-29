factoriel(0, 1).
factoriel(X, W) :- Y is X - 1,
                   factoriel(Y, Z),
                   W is X*Z.

