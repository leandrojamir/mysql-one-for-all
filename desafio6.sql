-- Desafio 6
-- Tendo como base o valor dos planos e o plano que cada pessoa usuária cadastrada possui no banco, queremos algumas informações sobre o faturamento da empresa. Crie uma QUERY que deve exibir quatro dados:
-- A primeira coluna deve ter o alias "faturamento_minimo" e exibir o menor valor de plano existente para uma pessoa usuária.
-- A segunda coluna deve ter o alias "faturamento_maximo" e exibir o maior valor de plano existente para uma pessoa usuária.
-- A terceira coluna deve ter o alias "faturamento_medio" e exibir o valor médio dos planos possuídos por pessoas usuárias até o momento.
-- Por fim, a quarta coluna deve ter o alias "faturamento_total" e exibir o valor total obtido com os planos possuídos por pessoas usuárias.
-- Para cada um desses dados, por se tratarem de valores monetários, deve-se arredondar o faturamento usando apenas duas casas decimais.
-- Dica: O ROUND pode ser útil aqui, mas não vai criar casas decimais extras, se precisar disto busque uma função que vai fazer essa formatação.

    -- - Expected
    -- + Received

    --   Array [
    --     Object {
    -- -     "faturamento_maximo": "7.99",
    -- -     "faturamento_medio": "5.69",
    -- -     "faturamento_minimo": "0.00",
    -- -     "faturamento_total": "56.92",
    -- +     "faturamento_maximo": 8,
    -- +     "faturamento_medio": "5.70",
    -- +     "faturamento_minimo": 0,
    -- +     "faturamento_total": "57",
-- nota de atenção: erro devido desafio1 onde coloquei plano.valor como INT e não havia testado até agora, no workbech valor DOUBLE foi o suficiente.
-- refazendo todos testes do 1 ao 6 após alteração
SELECT 
FORMAT(ROUND(MIN(SpotifyClone.plano.valor), 2), 2) AS faturamento_minimo,
FORMAT(ROUND(MAX(SpotifyClone.plano.valor), 2), 2) AS faturamento_maximo,
FORMAT(ROUND(AVG(SpotifyClone.plano.valor), 2), 2) AS faturamento_medio, 
FORMAT(ROUND(SUM(SpotifyClone.plano.valor), 2), 2) AS faturamento_total
FROM SpotifyClone.plano
INNER JOIN SpotifyClone.usuario ON SpotifyClone.plano.plano_id = SpotifyClone.usuario.plano_id;
