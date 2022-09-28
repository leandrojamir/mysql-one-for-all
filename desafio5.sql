-- Desafio 5
-- Estamos fazendo um estudo das músicas mais tocadas e precisamos saber quais são as duas músicas mais tocadas no momento. Crie uma QUERY que possua duas colunas:
-- A primeira coluna deve possuir o alias "cancao" e exibir o nome da canção.
-- A segunda coluna deve possuir o alias "reproducoes" e exibir a quantidade de pessoas que já escutaram a canção em questão.
-- Seu resultado deve estar ordenado em ordem decrescente, baseando-se no número de reproduções. Em caso de empate, ordene os resultados pelo nome da canção em ordem alfabética. Queremos apenas o top 2 de músicas mais tocadas.

-- https://www.devmedia.com.br/sql-limit/41216
SELECT 
cancoes.musica AS cancao,
COUNT(historico.usuario_id) AS reproducoes
FROM SpotifyClone.historico
INNER JOIN SpotifyClone.cancoes ON SpotifyClone.historico.cancoes_id = SpotifyClone.cancoes.cancoes_id 
-- SELECT * FROM alunos ORDER BY nome ASC LIMIT 0, 3
GROUP BY cancao ORDER BY reproducoes DESC, cancao LIMIT 0, 2;