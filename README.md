# Klotski_solver
Challenge from: https://www.youtube.com/watch?v=G_UYXzGuqvM

Meine Lösungen sind in der Größenordnung von 400 (beste 350) einzelnen Zügen, wobei ich weiß, dass weniger als 300 möglich sind. 
Wie im Video gesagt wurde, ist Rekursion und Backtracking kein menschlicher Ansatz, weshalb in den Lösungen merkwürdige Zugmuster vorkommen.
Ein menschlicher Ansatz wäre wahrscheinlich ein Entscheidungsbaum, aber die Aufgabe in dem Video wahr nunmal eine andere. 
Des weiteren war ein großer Unterschied zum Beispiel im Video, dass Sudoku eine natürliche maximale Suchtiefe hat (Anzahl der leeren Felder), 
wogegen bei Klotski unendlich viele Züge möglich sind, jedenfalls so viele, bis der Stack voll ist. 
Deshalb musste ich eine künstliche maximale Suchtiefe einstellen.
