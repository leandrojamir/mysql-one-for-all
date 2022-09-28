-- Desafio 10
-- Crie uma QUERY que exiba o nome e a quantidade de vezes que cada canção foi tocada por pessoas usuárias do plano gratuito ou pessoal de acordo com os detalhes a seguir:
-- A primeira coluna deve exibir o nome da canção, com o alias "nome";
-- A segunda coluna deve exibir a quantidade de pessoas que já escutaram aquela canção, com o alias "reproducoes";
-- Seus resultados devem estar agrupados pelo nome da canção e ordenados em ordem alfabética.

--   - Expected
--     + Received

--     @@ -2,11 +2,11 @@
--         Object {
--           "nome": "ALIEN SUPERSTAR",
--           "reproducoes": 1,
--         },
--         Object {
--     -     "nome": "Don’t Stop Me Now",
--     +     "nome": "Don't Stop Me Now",
--           "reproducoes": 1,
-- nota de atenção: foi mesmo necessário usar acento agudo (´) nas musicas ignorando o aviso que caractere U+2019 poderia ser confudido com U+0060
SELECT 
SpotifyClone.cancoes.musica AS nome,
COUNT(SpotifyClone.historico.cancoes_id) AS reproducoes
FROM SpotifyClone.historico
INNER JOIN SpotifyClone.cancoes ON SpotifyClone.historico.cancoes_id = SpotifyClone.cancoes.cancoes_id
INNER JOIN SpotifyClone.usuario ON SpotifyClone.historico.usuario_id = SpotifyClone.usuario.usuario_id
-- usuárias do plano gratuito ou pessoal
WHERE SpotifyClone.usuario.plano_id = 1 OR SpotifyClone.usuario.plano_id = 4
-- SequelizeDatabaseError: Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'SpotifyClone.cancoes.musica' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by
GROUP BY SpotifyClone.cancoes.musica ORDER BY SpotifyClone.cancoes.musica;