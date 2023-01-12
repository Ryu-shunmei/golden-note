-- Project Name : fastapi-auth-demo
-- Date/Time    : 2023/01/12 21:16:35
-- Author       : 劉　春明
-- RDBMS Type   : PostgreSQL
-- Application  : A5:SQL Mk-2

-- 性別マスター
drop table if exists gender_master cascade;

create table gender_master (
  gender char(1) not null
  , mark varchar(100) not null
  , constraint gender_master_PKC primary key (gender)
) ;

-- パスワード履歴
drop table if exists password_histories cascade;

create table password_histories (
  user_id bigint not null
  , number integer not null
  , password varchar(1024) not null
  , constraint password_histories_PKC primary key (user_id,number)
) ;

-- ユーザースターテスマスター
drop table if exists user_status_master cascade;

create table user_status_master (
  status char(1) not null
  , mark varchar(100) not null
  , constraint user_status_master_PKC primary key (status)
) ;

-- 検証コードタイプマスター
drop table if exists verification_code_type_master cascade;

create table verification_code_type_master (
  type char(1) not null
  , mark varchar(512) not null
  , timedelta integer not null
  , constraint verification_code_type_master_PKC primary key (type)
) ;

-- 検証コード
drop table if exists verification_codes cascade;

create table verification_codes (
  id bigserial not null
  , user_id bigint not null
  , type char(1) not null
  , code varchar(6) not null
  , constraint verification_codes_PKC primary key (id)
) ;

-- ユーザー情報
drop table if exists user_infos cascade;

create table user_infos (
  user_id bigint not null
  , gender char(1) not null
  , birth_date date not null
  , constraint user_infos_PKC primary key (user_id)
) ;

-- ユーザー
drop table if exists users cascade;

create table users (
  id bigserial not null
  , email varchar(512) not null
  , status char(1) not null
  , constraint users_PKC primary key (id)
) ;

create unique index user_infos_IX1
  on user_infos(gender);

create unique index users_IX1
  on users(status);

create unique index verification_codes_IX1
  on verification_codes(type);

comment on table gender_master is '性別マスター';
comment on column gender_master.gender is '性別';
comment on column gender_master.mark is 'マーク';

comment on table password_histories is 'パスワード履歴';
comment on column password_histories.user_id is 'ユーザーID';
comment on column password_histories.number is '番号';
comment on column password_histories.password is 'パスワード';

comment on table user_status_master is 'ユーザースターテスマスター';
comment on column user_status_master.status is 'スターテス';
comment on column user_status_master.mark is 'マーク';

comment on table verification_code_type_master is '検証コードタイプマスター';
comment on column verification_code_type_master.type is 'タイプ';
comment on column verification_code_type_master.mark is 'マーク';
comment on column verification_code_type_master.timedelta is 'タイムデルタ';

comment on table verification_codes is '検証コード';
comment on column verification_codes.id is 'ID';
comment on column verification_codes.user_id is 'ユーザーID';
comment on column verification_codes.type is 'タイプ';
comment on column verification_codes.code is 'コード';

comment on table user_infos is 'ユーザー情報';
comment on column user_infos.user_id is 'ユーザーID';
comment on column user_infos.gender is '性別';
comment on column user_infos.birth_date is '生年月日';

comment on table users is 'ユーザー';
comment on column users.id is 'ID';
comment on column users.email is 'メール';
comment on column users.status is 'スターテス';

