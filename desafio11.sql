-- BÔNUS
-- Desafio 11
-- Crie uma QUERY que altere o nome de algumas músicas e as ordene em ordem alfabética decrescente com as colunas abaixo se baseando nos seguintes critérios:
-- O nome da música em seu estado normal com o alias nome_musica
-- O nome da música atualizado com o alias novo_nome
-- Selecione apenas as músicas que tiverem seus nomes trocados
-- Critérios
-- Trocar a palavra "Bard" do nome da música por "QA"
-- Trocar a palavra "Amar" do nome da música por "Code Review"
-- Trocar a palavra "Pais" no final do nome da música por "Pull Requests"
-- Trocar a palavra "SOUL" no final do nome da música por "CODE"
-- Trocar a palavra "SUPERSTAR" no final do nome da música por "SUPERDEV"

-- https://www.w3schools.com/sql/sql_case.asp
-- SELECT OrderID, Quantity,
-- CASE
--     WHEN Quantity > 30 THEN 'The quantity is greater than 30'
--     WHEN Quantity = 30 THEN 'The quantity is 30'
--     ELSE 'The quantity is under 30'
-- END AS QuantityText
-- FROM OrderDetails;
SELECT SpotifyClone.cancoes.musica AS nome_musica,
CASE WHEN SpotifyClone.cancoes.musica LIKE '%Bard%' THEN REPLACE(SpotifyClone.cancoes.musica, 'Bard', 'QA')
WHEN SpotifyClone.cancoes.musica LIKE '%Amar%' THEN REPLACE(SpotifyClone.cancoes.musica, 'Amar', 'Code Review')
WHEN SpotifyClone.cancoes.musica LIKE '%Pais%' THEN REPLACE(SpotifyClone.cancoes.musica, 'Pais', 'Pull Requests')
WHEN SpotifyClone.cancoes.musica LIKE '%SOUL%' THEN REPLACE(SpotifyClone.cancoes.musica, 'SOUL', 'CODE')
WHEN SpotifyClone.cancoes.musica LIKE '%SUPERSTAR%' THEN REPLACE(SpotifyClone.cancoes.musica, 'SUPERSTAR', 'SUPERDEV') END AS novo_nome
FROM SpotifyClone.cancoes
HAVING novo_nome IS NOT NULL
ORDER BY nome_musica DESC;