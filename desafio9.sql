-- Crie uma QUERY que exibe a quantidade de músicas que estão presentes atualmente no histórico de reprodução de uma pessoa usuária específica. Para este caso queremos saber quantas músicas estão no histórico da usuária "Barbara Liskov" e a consulta deve retornar a seguinte coluna:
-- O valor da quantidade, com o alias "quantidade_musicas_no_historico".

-- SELECT 
-- SpotifyClone.artista.banda AS artista, 
-- SpotifyClone.album.disco AS album
-- FROM SpotifyClone.artista
-- INNER JOIN SpotifyClone.album ON SpotifyClone.artista.artista_id = 3 AND SpotifyClone.album.artista_id = 3
-- GROUP BY album ORDER BY album;
SELECT 
COUNT(SpotifyClone.historico.cancoes_id) AS quantidade_musicas_no_historico
FROM SpotifyClone.historico
INNER JOIN SpotifyClone.usuario ON SpotifyClone.historico.usuario_id = 1 AND SpotifyClone.usuario.usuario_id = 1;