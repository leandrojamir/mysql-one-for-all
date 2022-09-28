-- Desafio 4
-- Crie uma QUERY que deve mostrar as pessoas usuárias que estavam ativas a partir do ano de 2021, se baseando na data mais recente no histórico de reprodução.
-- A primeira coluna deve possuir o alias "usuario" e exibir o nome da pessoa usuária.
-- A segunda coluna deve ter o alias "status_usuario" e exibir se a pessoa usuária está ativa ou inativa.
-- O resultado deve estar ordenado em ordem alfabética.
-- Dica: Consulte o conteúdo do dia de Funções mais usadas no SQL.

-- https://www.w3schools.com/sql/func_mysql_if.asp
-- SELECT OrderID, Quantity, IF(Quantity>10, "MORE", "LESS")
-- FROM OrderDetails;
SELECT 
SpotifyClone.usuario.nome AS usuario,
    -- - Expected
    -- + Received

    --   Array [
    --     Object {
    -- -     "status_usuario": "Usuário inativo",
    -- +     "status_usuario": "inativa",
    --       "usuario": "Ada Lovelace",
    --     },
IF(MAX(SpotifyClone.historico.reproducao) > '2020-12-31', 'Usuário ativo', 'Usuário inativo') AS status_usuario
FROM SpotifyClone.usuario
INNER JOIN SpotifyClone.historico ON SpotifyClone.usuario.usuario_id = SpotifyClone.historico.usuario_id
GROUP BY usuario ORDER BY usuario;