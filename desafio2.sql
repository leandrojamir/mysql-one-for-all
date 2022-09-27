-- Desafio 2
-- Crie uma QUERY que exiba três colunas:
-- A primeira coluna deve exibir a quantidade total de canções. Dê a essa coluna o alias "cancoes".
-- A segunda coluna deve exibir a quantidade total de artistas e deverá ter o alias "artistas".
-- A terceira coluna deve exibir a quantidade de álbuns e deverá ter o alias "albuns".
-- Dica: Considerando que a tabela está normalizada, você pode usar as chaves estrangeiras para juntar as tabelas, ou usar sub-queries de forma que seja possível extrair o resultado

-- http://www.bosontreinamentos.com.br/mysql/mysql-funcoes-de-agregacao-max-min-avg-count-sum-18/
-- SELECT MAX(Preco_Livro) FROM tbl_Livro;
SELECT MAX(cancoes_id) AS cancoes, MAX(artista_id) AS artistas, MAX(album_id) AS albuns FROM SpotifyClone.cancoes;