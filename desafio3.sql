-- Desafio 3
-- Crie uma QUERY que deverá ter apenas três colunas:
-- A primeira coluna deve possuir o alias "usuario" e exibir o nome da pessoa usuária.
-- A segunda coluna deve possuir o alias "qt_de_musicas_ouvidas" e exibir a quantidade de músicas ouvida pela pessoa com base no seu histórico de reprodução.
-- A terceira coluna deve possuir o alias "total_minutos" e exibir a soma dos minutos ouvidos pela pessoa usuária com base no seu histórico de reprodução.
-- Os resultados devem estar agrupados pelo nome da pessoa usuária e ordenados em ordem alfabética.
-- Dica: Consulte o conteúdo do dia de Funções mais usadas no SQL.

-- https://app.betrybe.com/learn/course/5e938f69-6e32-43b3-9685-c936530fd326/module/94d0e996-1827-4fbc-bc24-c99fb592925b/section/a10ee6b2-77b9-493f-ab76-a8f9822c5608/day/6ead052e-46e3-4d96-a207-873325293189/lesson/b16c8fb7-ade8-4ebc-8711-579a7b9da4fb
SELECT 
SpotifyClone.usuario.nome AS usuario, 
COUNT(SpotifyClone.historico.usuario_id) AS qt_de_musicas_ouvidas,
    -- - Expected
    -- + Received

    --   Array [
    --     Object {
    --       "qt_de_musicas_ouvidas": 2,
    -- -     "total_minutos": "7.82",
    -- +     "total_minutos": "7.8167",
    --       "usuario": "Ada Lovelace",
ROUND(SUM(SpotifyClone.cancoes.duracao) / 60, 2) AS total_minutos 
FROM SpotifyClone.usuario 
INNER JOIN SpotifyClone.historico ON SpotifyClone.usuario.usuario_id = SpotifyClone.historico.usuario_id
INNER JOIN SpotifyClone.cancoes ON SpotifyClone.cancoes.cancoes_id = SpotifyClone.historico.cancoes_id 
GROUP BY usuario ORDER BY usuario;