/*
drop table CARGO        cascade constraints purge;
drop table DEPARTAMENTO cascade constraints purge;
drop table FUNCIONARIO  cascade constraints purge;
*/

create table CARGO (
   COD_CARGO          varchar2(2),
   TITULO_CARGO       varchar2(30) constraint NN_CARGO_01 not null,
   SALARIO_CARGO      number(7,2)  constraint NN_CARGO_02 not null
                                   constraint CK_CARGO_01 check (SALARIO_CARGO > 0),
   constraint PK_CARGO primary key (COD_CARGO)
);

create table DEPARTAMENTO (
   COD_DEPTO          varchar2(1),
   NOME_DEPTO         varchar2(30) constraint NN_DEPTO_01 not null,
   COD_GERENTE_DEPTO  number(4),
   constraint PK_DEPTO primary key (COD_DEPTO)
);


create table FUNCIONARIO (
   COD_FUNC           number(4),
   NOME_FUNC          varchar2(30) constraint NN_FUNC_01 not null,
   DATA_ADMISSAO_FUNC date         constraint NN_FUNC_02 not null,
   COD_CARGO          varchar2(2)  constraint NN_FUNC_03 not null
                                   constraint FK_FUNC_CARGO_01 references CARGO (COD_CARGO),
   COD_DEPTO          varchar2(1)  constraint NN_FUNC_04 not null
                                   constraint FK_FUNC_DEPTO_01 references DEPARTAMENTO (COD_DEPTO),
   constraint PK_FUNC primary key (COD_FUNC)
);


alter table DEPARTAMENTO add constraint FK_DEPTO_FUNC_01
   foreign key (COD_GERENTE_DEPTO)
   references FUNCIONARIO (COD_FUNC);

insert into CARGO values ('A1', 'GERENTE ADMINISTRATIVO', 5500);
insert into CARGO values ('A2', 'ASSISTENTE ADMINISTRATIVO', 3800);
insert into CARGO values ('A3', 'AUXILIAR ADMINISTRATIVO', 2600);
insert into CARGO values ('T1', 'ANALISTA SISTEMAS SR', 5500);
insert into CARGO values ('T2', 'ANALISTA SISTEMAS PL', 4600);
insert into CARGO values ('T3', 'ANALISTA SISTEMAS JR', 3200);
insert into CARGO values ('G1', 'ESTAGIARIO', 800);

insert into DEPARTAMENTO values ('A', 'Administração', null);
insert into DEPARTAMENTO values ('D', 'Desenvolvimento', null);
insert into DEPARTAMENTO values ('S', 'Suporte', null);
insert into DEPARTAMENTO values ('P', 'Pesquisa', null);
insert into DEPARTAMENTO values ('T', 'Treinamento', null);

insert into FUNCIONARIO values (1, 'ROBERTO SILVA', to_date('01/02/1995','dd/mm/yyyy'), 'A1', 'A');
insert into FUNCIONARIO values (2, 'MARCOS ANDRADE', to_date('15/07/1995','dd/mm/yyyy'), 'T1', 'D');
insert into FUNCIONARIO values (3, 'DENIS ALVAREZ', to_date('22/08/1995','dd/mm/yyyy'), 'T1', 'P');
insert into FUNCIONARIO values (4, 'VICTOR TORRES', to_date('08/05/1996','dd/mm/yyyy'), 'A2', 'A');
insert into FUNCIONARIO values (5, 'PAULA MARTINS', to_date('11/07/1996','dd/mm/yyyy'), 'T1', 'S');
insert into FUNCIONARIO values (6, 'PAULO NASCIMENTO', to_date('30/04/1997','dd/mm/yyyy'), 'T2', 'S');
insert into FUNCIONARIO values (7, 'EDUARDO OLIVEIRA', to_date('06/10/1997','dd/mm/yyyy'), 'T2', 'D');
insert into FUNCIONARIO values (8, 'MARINA SANTOS', to_date('17/09/1997','dd/mm/yyyy'), 'T2', 'D');
insert into FUNCIONARIO values (9, 'LUCIANA RODRIGUES', to_date('30/03/1999','dd/mm/yyyy'), 'T1', 'T');
insert into FUNCIONARIO values (10, 'RENATA SOUZA', to_date('04/08/1999','dd/mm/yyyy'), 'A3', 'A');
insert into FUNCIONARIO values (11, 'REGINA FERREIRA', to_date('25/11/2000','dd/mm/yyyy'), 'T2', 'D');
insert into FUNCIONARIO values (12, 'ANA NOGUEIRA', to_date('09/07/2000','dd/mm/yyyy'), 'T2', 'D');
insert into FUNCIONARIO values (13, 'JULIANA ASSIS', to_date('13/01/2000','dd/mm/yyyy'), 'T2', 'P');
insert into FUNCIONARIO values (14, 'JULIO SILVA', to_date('20/03/2001','dd/mm/yyyy'), 'T3', 'S');
insert into FUNCIONARIO values (15, 'EDUARDO TORRES', to_date('19/06/2001','dd/mm/yyyy'), 'T2', 'T');
insert into FUNCIONARIO values (16, 'RENATO COSTA', to_date('23/06/2001','dd/mm/yyyy'), 'T3', 'S');
insert into FUNCIONARIO values (17, 'NILSON FREITAS', to_date('27/06/2001','dd/mm/yyyy'), 'T3', 'S');
insert into FUNCIONARIO values (18, 'SILVIO SOUZA', to_date('31/05/2002','dd/mm/yyyy'), 'T3', 'D');
insert into FUNCIONARIO values (19, 'VALERIA CARDOSO', to_date('28/06/2002','dd/mm/yyyy'), 'T3', 'P');
insert into FUNCIONARIO values (20, 'TATIANA OLIVEIRA', to_date('03/07/2002','dd/mm/yyyy'), 'T3', 'T');
insert into FUNCIONARIO values (21, 'HELENA SILVA', to_date('16/08/2002','dd/mm/yyyy'), 'T3', 'T');

update DEPARTAMENTO set COD_GERENTE_DEPTO = 1 where COD_DEPTO = 'A';
update DEPARTAMENTO set COD_GERENTE_DEPTO = 2 where COD_DEPTO = 'D';
update DEPARTAMENTO set COD_GERENTE_DEPTO = 5 where COD_DEPTO = 'S';
update DEPARTAMENTO set COD_GERENTE_DEPTO = 3 where COD_DEPTO = 'P';
update DEPARTAMENTO set COD_GERENTE_DEPTO = 3 where COD_DEPTO = 'T';

commit;

-- Fim do script