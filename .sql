create table fase (
  id int primary key auto_increment,
  nome_fase varchar(255)
);

create table estadio (
  id int primary key auto_increment,
  nome_estadio varchar(255) not null,
  localizacao varchar(255) not null,
  capacidade int not null
);

create table arbitro (
  id int primary key auto_increment,
  nome_arbitro varchar(255) not null,
  nacionalidade_arb varchar(255) not null,
  data_nasc date not null,
  funcao varchar(255)
);

create table pais (
  id int primary key auto_increment,
  nome_pais varchar(255) not null,
  sigla varchar(3) not null,
  rank_fifa int not null
);

create table tecnico (
  id int primary key auto_increment,
  nome_tec varchar(255) not null,
  data_de_nasc_tec varchar(255) not null,
  nacionalidade_tec varchar(255) not null
);

create table selecao (
  id int primary key auto_increment,
  nome_selecao varchar(255) not null,
  sigla varchar(3) not null,
  rank_fifa_selecao int not null,
  fk_tecnico int not null,
  fk_pais int not null,
  foreign key (fk_tecnico) references tecnico(id),
  foreign key (fk_pais) references pais(id)
);

create table jogador (
  id int primary key auto_increment,
  nome varchar(255) not null,
  numero_camisa int not null,
  posicao varchar(255) not null,
  data_de_nasc varchar(255) not null,
  altura varchar(255) not null,
  fk_selecao int not null,
  foreign key (fk_selecao) references selecao (id)
);

create table partida (
  id int primary key auto_increment,
  data_partida varchar(255) not null,
  horario_partida varchar(5) not null,
  vencedor varchar(255),
  perdedor varchar(255),
  hora_saida_jog varchar(255),
  hora_entrada_jog varchar(255),
  fk_estadio int not null,
  fk_fase int not null,
  foreign key (fk_estadio) references estadio (id),
  foreign key (fk_fase) references fase (id)
);

create table partida_selecao (
  fk_partida int not null,
  fk_selecao int not null,
  primary key (fk_partida, fk_selecao),
  foreign key (fk_partida) references partida (id),
  foreign key (fk_selecao) references selecao (id)
);

create table partida_arbitro (
  fk_partida int not null,
  fk_arbitro int not null,
  funcao_arbitro varchar(255) not null, 
  primary key (fk_partida, fk_arbitro),
  foreign key (fk_partida) references partida (id),
  foreign key (fk_arbitro) references arbitro (id)
);

create table substituicao (
  id int primary key auto_increment,
  horario_sub varchar(255),
  fk_entrada_jog int not null,
  fk_saida_jog int not null,
  foreign key (fk_entrada_jog) references jogador (id),
  foreign key (fk_saida_jog) references jogador (id)
);

create table evento_partida (
  id int primary key auto_increment,
  tipo varchar(255),
  horario_evento varchar(255),
  fk_partida int not null,
  fk_jogador int not null,
  fk_selecao int not null,
  foreign key (fk_partida) references partida (id),
  foreign key (fk_jogador) references jogador (id),
  foreign key (fk_selecao) references selecao (id)
);

create table gol_partida (
  id int primary key auto_increment,
  horario_gol varchar(255) not null,
  fk_partida int not null,
  fk_vencedor_selecao int not null,
  fk_perdedor_selecao int not null,
  foreign key (fk_partida) references partida (id),
  foreign key (fk_vencedor_selecao) references selecao (id),
  foreign key (fk_perdedor_selecao) references selecao (id)
);

INSERT INTO tecnico (nome_tec, data_de_nasc_tec, nacionalidade_tec) VALUES
('Carlo Ancelotti', '1959-06-10', 'Italiana'),
('Lionel Scaloni', '1978-05-16', 'Argentina'),
('Thomas Tuchel', '1973-08-29', 'Alemã'),
('Didier Deschamps', '1968-10-15', 'Francesa'),
('Luis de la Fuente', '1961-06-21', 'Espanhola'),
('Julian Nagelsmann', '1987-07-23', 'Alemã'),
('Roberto Martinez', '1973-07-13', 'Espanhola'),
('Ronald Koeman', '1963-03-21', 'Holandesa'),
('Zlatko Dalic', '1966-10-26', 'Croata'),
('Mauricio Pochettino', '1972-03-02', 'Argentina'),
('Javier Aguirre', '1958-12-01', 'Mexicana'),
('Jesse Marsch', '1973-11-08', 'Estadunidense'),
('Marcelo Bielsa', '1955-07-21', 'Argentina'),
('Nestor Lorenzo', '1966-02-28', 'Argentina'),
('Sebastian Beccacece', '1980-12-17', 'Argentina'),
('Gustavo Alfaro', '1962-08-14', 'Argentina'),
('Ralf Rangnick', '1958-06-29', 'Alemã'),
('Rudi Garcia', '1964-02-20', 'Francesa'),
('Murat Yakin', '1974-09-15', 'Suíça'),
('Hajime Moriyasu', '1968-08-23', 'Japonesa'),
('Hong Myung-bo', '1969-02-12', 'Sul-Coreana'),
('Graham Potter', '1975-05-20', 'Inglesa'),
('Stale Solbakken', '1968-02-27', 'Norueguesa'),
('Vincenzo Montella', '1974-06-18', 'Italiana'),
('Steve Clarke', '1963-08-29', 'Escocesa'),
('Fabio Cannavaro', '1973-09-13', 'Italiana'),
('Darren Bazeley', '1972-10-05', 'Inglesa');

select*from tecnico
