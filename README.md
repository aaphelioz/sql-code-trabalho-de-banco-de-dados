# sql-code-trabalho-de-banco-de-dados

           codigo
------------------------------------

create table tecnico (
  id int primary key auto_increment,
  data_de_nasc_tec varchar(255) not null,
  nacionalidade_tec varchar(255) not null
);

create table pais (
  id int primary key auto_increment,
  nome_pais varchar(255) not null,
  sigla varchar(3) not null,
  --inutil colocar continente na minha opniao
  rank_fifa varchar(255) not null
);

create table selecao (
  id int primary key auto_increment,
  nome_selecao varchar(255) not null
  -- seria melhor nome selecao pois ja tem nome em outras tabelas
  foreign key (fk_tecnico) references tecnico (id),
  fk_tecnico int not null,
  foreign key (fk_pais) references pais (id),
  fk_pais int not null,
  rank_fifa_selecao int not null
);

create table fase (
  id int primary key auto_increment,
  nome_fase varchar(255)
  -- a seleçao nao deveria ter uma fase?
);

create table estadio (
  id int primary key auto_increment,
  nome_estadio varchar(255),
  localização varchar(255),
  -- localização completa do estadio
  capacidade varchar(255)
  --numero de pessoas maximas dentro
);

create table arbitro (
  id int primary key auto_increment,
  nome_arbitro varchar(255) not null,
  nacionalidade_arb varchar(255) not null,
  funcao varchar(255)
);

create table jogador (
  id int primary key auto_increment,
  nome varchar(255) not null,
  nome_camisa varchar(255) not null,
  numero_camisa int not null,
  posicao varchar(255) not null,
  data_de_nasc varchar(255) not null,
  altura varchar(255) not null,
  nacionalidade_jog varchar(255) not null,
  foreign key (fk_selecao) references selecao (id),
  fk_selecao int not null
);

create table partida (
  id int primary key auto_increment,
  data_partida varchar(255) not null,
  horario_partida varchar(4) not null,
  vencedor varchar(255),
  perdedor varchar(255),
  saida_jog varchar(255),
  entrada_jog varchar(255),
  foreign key (fk_estadio) references estadio (id),
  fk_estadio int not null,
  foreign key (fk_fase) references fase (id),
  fk_fase int not null
);

create table partida_selecao (
  foreign key (fk_partida) references partida (id),
  fk_partida int not null,
  foreign key (fk_selecao) references selecao (id),
  fk_selecao int not null,
  primary key (fk_partida, fk_selecao)
);

create table partida_arbitro (
  foreign key (fk_partida) references partida (id),
  fk_partida int not null,
  foreign key (fk_arbitro) references arbitro (id),
  fk_arbitro int not null,
  foreign key (fk_funcao) references arbitro (id),
  fk_funcao int not null
);

create table resultado (
  id int primary key auto_increment,
  foreign key (fk_partida) references partida (id),
  fk_partida int not null,
  foreign key (fk_vencedor) references selecao (id),
  fk_vencedor int not null,
  foreign key (fk_perdedor) references selecao (id),
  fk_perdedor int not null
);

create table substituicao (
  id int primary key auto_increment,
  horario_sub varchar(255),
  foreign key (fk_entrada_jog) references jogador (id),
  fk_entrada_jog int not null,
  foreign key (fk_saida_jog) references jogador (id),
  fk_saida_jog int not null
);

create table evento_partida (
  id int primary key auto_increment,
  tipo varchar(255),
  horario_evento varchar(255),
  foreign key (fk_partida) references partida (id),
  fk_partida int not null,
  foreign key (fk_jogador) references jogador (id),
  fk_jogador int not null,
  foreign key (fk_selecao) references selecao (id),
  fk_selecao int not null
);

create table gol_partida (
  id int primary key auto_increment,
  horario_gol varchar(255) not null,
  foreign key (fk_partida) references partida (id),
  fk_partida int not null,
  foreign key (fk_vencedor_selecao) references selecao (id),
  fk_vencedor_selecao int not null,
  foreign key (fk_perdedor_selecao) references selecao (id),
  fk_perdedor_selecao int not null
);
