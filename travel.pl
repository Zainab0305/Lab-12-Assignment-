
% Facts: edge(From, To)
edge('Makkah',  'Madinah').
edge('Makkah',  'Riyadh').

edge('Madinah', 'Makkah').
edge('Madinah', 'Taif').
edge('Madinah', 'Tabuk').

edge('Taif',    'Dammam').
edge('Taif',    'Tabuk').

edge('Tabuk',   'Taif').

edge('Dammam',  'Qatif').
edge('Dammam',  'Riyadh').

edge('Riyadh',  'Dammam').

edge('Qatif',   'Dammam').
edge('Qatif',   'Madinah').

% travel(Start, Finish, Path_List)
travel(From, To, Path) :-
    path(From, To, [From], P),
    reverse(P, Path).

% path(From, To, Visited_List, Path_List)
path(X, X, P, P).
path(From, To, Visited, Path) :-
    edge(From, X),
    not(member(X, Visited)),    % do not visit a city twice
    path(X, To, [X|Visited], Path).
