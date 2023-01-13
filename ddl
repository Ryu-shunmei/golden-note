-- Project Name : kao_health
-- Date/Time    : 2023/01/13 18:58:26
-- Author       : 劉　春明
-- RDBMS Type   : PostgreSQL
-- Application  : A5:SQL Mk-2

-- アンケートC回答
drop table if exists questionary_c_answers cascade;

create table questionary_c_answers (
  id bigserial not null
  , user_id bigint not null
  , answer text not null
  , created timestamp not null
  , updated timestamp not null
  , constraint questionary_c_answers_PKC primary key (id)
) ;

comment on table questionary_c_answers is 'アンケートC回答';
comment on column questionary_c_answers.id is 'ID';
comment on column questionary_c_answers.user_id is 'ユーザーID';
comment on column questionary_c_answers.answer is '回答';
comment on column questionary_c_answers.created is '作成日付';
comment on column questionary_c_answers.updated is '更新日付';
