parent(pam, bob).
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).

female(pam).
female(liz).
female(ann).
female(pat).

male(tom).
male(bob).
male(jim).
% Father and Mother
father(X, Y) :- parent(X, Y), male(X).
mother(X, Y) :- parent(X, Y), female(X).

% Son and Daughter
son(X, Y) :- parent(Y, X), male(X).
daughter(X, Y) :- parent(Y, X), female(X).

% Sibling relations (X and Y share a parent, and X is not Y)
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.

% Brother and Sister
brother(X, Y) :- sibling(X, Y), male(X).
sister(X, Y) :- sibling(X, Y), female(X).

% Grandfather (Father's or Mother's father)
grandfather(X, Z) :- father(X, Y), parent(Y, Z).

% Aunt and Uncle
% An aunt is a sister of one's parent, or married to an uncle (keeping to blood/sibling relation here: sister of a parent)
aunt(X, Y) :- sister(X, Z), parent(Z, Y).
uncle(X, Y) :- brother(X, Z), parent(Z, Y).

% Cousin (Children of siblings)
cousin(X, Y) :- parent(P1, X), parent(P2, Y), sibling(P1, P2).

% Ancestor (Recursive rule)
ancestor(X, Z) :- parent(X, Z).
ancestor(X, Z) :- parent(X, Y), ancestor(Y, Z).
