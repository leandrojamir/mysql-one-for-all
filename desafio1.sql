DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.plano(
      plano_id INT PRIMARY KEY AUTO_INCREMENT,
      tipo VARCHAR(45) NOT NULL,
      valor INT NOT NULL
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.usuario(
      usuario_id INT PRIMARY KEY AUTO_INCREMENT,
      nome VARCHAR(45) NOT NULL,
      idade INT,
      plano_id INT,
      assinatura DATE,
      FOREIGN KEY (plano_id) REFERENCES plano(plano_id)
  ) engine = InnoDB;

    CREATE TABLE SpotifyClone.artista(
      artista_id INT PRIMARY KEY AUTO_INCREMENT,
      banda VARCHAR(45) NOT NULL
  ) engine = InnoDB;

    CREATE TABLE SpotifyClone.album(
      album_id INT PRIMARY KEY AUTO_INCREMENT,
      disco VARCHAR(45) NOT NULL,
      artista_id INT NOT NULL,
      ano YEAR,
      FOREIGN KEY (artista_id) REFERENCES artista(artista_id)
  ) engine = InnoDB;

    CREATE TABLE SpotifyClone.cancoes(
      cancoes_id INT PRIMARY KEY AUTO_INCREMENT,
      musica VARCHAR(45) NOT NULL,
      artista_id INT NOT NULL,
      album_id INT NOT NULL,
      duracao INT,
      FOREIGN KEY (artista_id) REFERENCES artista(artista_id),
      FOREIGN KEY (album_id) REFERENCES album(album_id)
  ) engine = InnoDB;

    CREATE TABLE SpotifyClone.historico(
      cancoes_id INT NOT NULL,
      usuario_id INT NOT NULL,
      reproducao DATETIME,
      PRIMARY KEY (cancoes_id, usuario_id),
      FOREIGN KEY (cancoes_id) REFERENCES cancoes(cancoes_id),
      FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id)
  ) engine = InnoDB;

    CREATE TABLE SpotifyClone.seguindo(
      artista_id INT NOT NULL,
      usuario_id INT NOT NULL,
      PRIMARY KEY (artista_id, usuario_id),
      FOREIGN KEY (artista_id) REFERENCES artista(artista_id),
      FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id)
  ) engine = InnoDB;

-- plano_id (id)	plano (tipo)	valor_plano (valor)
-- 1	gratuito	0,00
-- 2	familiar	7,99
-- 3	universitário	5,99
-- 4	pessoal	6,99

  INSERT INTO SpotifyClone.plano (tipo, valor)
  VALUES
    ('gratuito', 0),
    ('familiar', 7.99),
    ('universitário', 5.99),
    ('pessoal', 6.99);

-- usuario_id (id)	usuario (nome)	idade	data_assinatura (assinatura)	plano_id
-- 1	Barbara Liskov	82	2019-10-20	1
-- 2	Robert Cecil Martin	58	2017-01-06	1
-- 3	Ada Lovelace	37	2017-12-30	2
-- 4	Martin Fowler	46	2017-01-17	2
-- 5	Sandi Metz	58	2018-04-29	2
-- 6	Paulo Freire	19	2018-02-14	3
-- 7	Bell Hooks	26	2018-01-05	3
-- 8	Christopher Alexander	85	2019-06-05	4
-- 9	Judith Butler	45	2020-05-13	4
-- 10	Jorge Amado	58	2017-02-17	4

  INSERT INTO SpotifyClone.usuario (nome, idade, assinatura, plano_id)
  VALUES
    ('Barbara Liskov', 82, '2019-10-20', 1),
    ('Robert Cecil Martin', 58, '2017-01-06', 1),
    ('Ada Lovelace', 37, '2017-12-30', 2),
    ('Martin Fowler', 46, '2017-01-17', 2),
    ('Sandi Metz', 58, '2018-04-29', 2),
    ('Paulo Freire', 19, '2018-02-14', 3),
    ('Bell Hooks', 26, '2018-01-05', 3),
    ('Christopher Alexander', 19, '2019-06-05', 4),
    ('Judith Butler', 45, '2020-05-13', 4),
    ('Jorge Amado', 58, '2017-02-17', 4);

-- artista_id (id)	artista (banda)
-- 1	Beyoncé
-- 2	Queen
-- 3	Elis Regina
-- 4	Baco Exu do Blues
-- 5	Blind Guardian
-- 6	Nina Simone

  INSERT INTO SpotifyClone.artista (banda)
  VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');

-- album_id (id)	album (disco)	ano_lancamento (ano)	artista_id
-- 1	Renaissance	2022	1
-- 2	Jazz	1978	2
-- 3	Hot Space	1982	2
-- 4	Falso Brilhante	1998	3
-- 5	Vento de Maio	2001	3
-- 6	QVVJFA?	2003	4
-- 7	Somewhere Far Beyond	2007	5
-- 8	I Put A Spell On You	2012	6

  INSERT INTO SpotifyClone.album (disco, ano, artista_id)
  VALUES
    ('Renaissance', 2022, 1),
    ('Jazz', 1978, 2),
    ('Hot Space', 1982, 2),
    ('Falso Brilhante', 1998, 3),
    ('Vento de Maio', 2001, 3),
    ('QVVJFA?', 2003, 4),
    ('Somewhere Far Beyond', 2007, 5),
    ('I Put A Spell On You', 2012, 6);

-- cancoes_id (id)	cancoes (musica)	duracao_segundos (duracao)	album_id	artista_id
-- 1	BREAK MY SOUL	279	1	1
-- 2	VIRGO’S GROOVE	369	1	1
-- 3	ALIEN SUPERSTAR	116	1	1
-- 4	Don’t Stop Me Now	203	2	2
-- 5	Under Pressure	152	3	2
-- 6	Como Nossos Pais	105	4	3
-- 7	O Medo de Amar é o Medo de Ser Livre	207	5	3
-- 8	Samba em Paris	267	6	4
-- 9	The Bard’s Song	244	7	5
-- 10	Feeling Good	100	8	6

  INSERT INTO SpotifyClone.cancoes (musica, duracao, album_id, artista_id)
  VALUES
    ('BREAK MY SOUL', 279, 1, 1),
    ('VIRGO''S GROOVE', 369, 1, 1),
    ('ALIEN SUPERSTAR', 116, 1, 1),
    ('Don''t Stop Me Now', 203, 2, 2),
    ('Under Pressure', 152, 3, 2),
    ('Como Nossos Pais', 105, 4, 3),
    ('O Medo de Amar é o Medo de Ser Livre', 207, 5, 3),
    ('Samba em Paris', 267, 6, 4),
    ('The Bard''s Song', 244, 7, 5),
    ('Feeling Good', 100, 8, 6);

-- historico_de_reproducoes (cancoes_id)	data_reproducao (reproducao)	usuario_id
-- 8	2022-02-28 10:45:55	1
-- 2	2020-05-02 05:30:35	1
-- 10	2020-03-06 11:22:33	1
-- 10	2022-08-05 08:05:17	2
-- 7	2020-01-02 07:40:33	2
-- 10	2020-11-13 16:55:13	3
-- 2	2020-12-05 18:38:30	3
-- 8	2021-08-15 17:10:10	4
-- 8	2022-01-09 01:44:33	5
-- 5	2020-08-06 15:23:43	5
-- 7	2017-01-24 00:31:17	6
-- 1	2017-10-12 12:35:20	6
-- 4	2011-12-15 22:30:49	7
-- 4	2012-03-17 14:56:41	8
-- 9	2022-02-24 21:14:22	9
-- 3	2015-12-13 08:30:22	10

  INSERT INTO SpotifyClone.historico (cancoes_id, reproducao, usuario_id)
  VALUES
    (8, '2022-02-28 10:45:55', 1),
    (2, '2020-05-02 05:30:35', 1),
    (10, '2020-03-06 11:22:33', 1),
    (10, '2022-08-05 08:05:17', 2),
    (7, '2020-01-02 07:40:33', 2),
    (10, '2020-11-13 16:55:13', 3),
    (2, '2020-12-05 18:38:30', 3),
    (8, '2021-08-15 17:10:10', 4),
    (8, '2022-01-09 01:44:33', 5),
    (5, '2020-08-06 15:23:43', 5),
    (7, '2017-01-24 00:31:17', 6),
    (1, '2017-10-12 12:35:20', 6),
    (4, '2011-12-15 22:30:49', 7),
    (4, '2012-03-17 14:56:41', 8),
    (9, '2022-02-24 21:14:22', 9),
    (3, '2015-12-13 08:30:22', 10);

-- seguindo_id (id)	usuario_id	artista_id
-- 	1	1
-- 	1	2
-- 	1	3
-- 	2	1
-- 	2	3
-- 	3	2
-- 	4	4
-- 	5	5
-- 	5	6
-- 	6	6
-- 	6	1
-- 	7	6
-- 	9	3
-- 	10	2

  INSERT INTO SpotifyClone.seguindo (usuario_id, artista_id)
  VALUES 
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 6),
    (6, 1),
    (7, 6),
    (9, 3),
    (10, 2);

  -- INSERT INTO SpotifyClone.tabela2 (coluna1, coluna2)
  -- VALUES
  --   ('exemplo de dados 1', 'exemplo de dados X'),
  --   ('exemplo de dados 2', 'exemplo de dados Y');