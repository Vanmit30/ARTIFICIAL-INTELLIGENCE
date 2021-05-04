% 2018CSC1022 Vanmit kaur
% prime_factors(N, A) :- A will be containing all the prime factors of
% positive integer N

prime_factors(N,A) :- N > 0,  prime_factors(N,A,2).

% prime_factors(N,A,K) :-A is the list of prime factors of N.
% N does not have any prime factors less than K.

prime_factors(1,[],_) :- !.
prime_factors(N,[G|A],G) :-                           % N is multiple of G
   B is N // G, N =:= B * G, !, prime_factors(B,A,G).
prime_factors(N,A,G) :-
   next_factor(N,G,NG), prime_factors(N,A,NG).        % N is not multiple of G


% next_factor(N,G,NG) :- when calculating the prime factors of N
%    and if G does not divide N then NG is the next larger candidate to
%    be a factor of N.

next_factor(_,2,3) :- !.
next_factor(N,G,NG) :- G * G < N, !, NG is G + 2.
next_factor(N,_,N).
