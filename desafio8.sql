-- Mostre uma relação dos álbuns produzidos por um artista específico, neste caso "Elis Regina". Para isto crie uma QUERY que o retorno deve exibir as seguintes colunas:
-- O nome da pessoa artista, com o alias "artista".
-- O nome do álbum, com o alias "album".
-- Os resultados devem ser ordenados pelo nome do álbum em ordem alfabética.

SELECT 
SpotifyClone.artista.banda AS artista, 
SpotifyClone.album.disco AS album
FROM SpotifyClone.artista
INNER JOIN SpotifyClone.album ON SpotifyClone.artista.artista_id = 3 AND SpotifyClone.album.artista_id = 3
GROUP BY album ORDER BY album;