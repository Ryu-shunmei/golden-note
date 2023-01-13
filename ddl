-- Project Name : kao_health
-- Date/Time    : 2023/01/13 18:21:51
-- Author       : 劉　春明
-- RDBMS Type   : PostgreSQL
-- Application  : A5:SQL Mk-2

-- ランクマスター
drop table if exists rank_master cascade;

create table rank_master (
  id bigint not null
  , from integer not null
  , to integer not null
  , count integer not null
  , created timestamp not null
  , updated timestamp not null
  , constraint rank_master_PKC primary key (id)
) ;

-- アンケートC回答
drop table if exists questionary_c_answers cascade;

create table questionary_c_answers (
  id bigint not null
  , user_id bigint not null
  , answer text not null
  , created timestamp not null
  , updated timestamp not null
  , constraint questionary_c_answers_PKC primary key (id)
) ;

comment on table rank_master is 'ランクマスター';
comment on column rank_master.id is 'ID';
comment on column rank_master.from is 'から';
comment on column rank_master.to is 'まで';
comment on column rank_master.count is 'カウント';
comment on column rank_master.created is '作成日付';
comment on column rank_master.updated is '更新日付';

comment on table questionary_c_answers is 'アンケートC回答';
comment on column questionary_c_answers.id is 'ID';
comment on column questionary_c_answers.user_id is 'ユーザーID';
comment on column questionary_c_answers.answer is '回答';
comment on column questionary_c_answers.created is '作成日付';
comment on column questionary_c_answers.updated is '更新日付';
