/* light_circuit.pl */

% Question a

l1_is_broken:- not(l1),s1.

l2_is_broken:- not(l2),s2,l3.

l3_is_broken:- not(l3),s2,l2.


% Question b

s2.
s1:-false.
l2.
l3:-false.
l1:-false.