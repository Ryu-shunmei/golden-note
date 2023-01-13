-- Project Name : kao_health
-- Date/Time    : 2023/01/13 14:55:06
-- Author       : 劉　春明
-- RDBMS Type   : PostgreSQL
-- Application  : A5:SQL Mk-2

-- アンケートC
drop table if exists questionary_c cascade;

create table questionary_c (
  id bigint not null
  , question varchar(512) not null
  , mark varchar(512) not null
  , answer_list text not null
  , type varchar(100) not null
  , created timestamp not null
  , updated timestamp not null
  , constraint questionary_c_PKC primary key (id)
) ;

-- 検証コードタイプマスター
drop table if exists verification_code_type_master cascade;

create table verification_code_type_master (
  code char(1) not null
  , mark varchar(512) not null
  , created timestamp not null
  , updated timestamp not null
  , constraint verification_code_type_master_PKC primary key (code)
) ;

-- ユーザー健康情報
drop table if exists user_health_infos cascade;

create table user_health_infos (
  id bigserial not null
  , user_id bigint not null
  , sbp numeric(3,1) not null
  , dbp numeric(3,1) not null
  , fbp numeric(3,1) not null
  , us varchar(100) not null
  , cc numeric(3,1) not null
  , triglyceride numeric(3,1)
  , hdl numeric(3,1)
  , idl numeric(3,1)
  , got numeric(3,1)
  , gpt numeric(3,1)
  , ggp numeric(3,1)
  , rbc numeric(3,1)
  , tc numeric(3,1)
  , up numeric(3,1)
  , hemoglobin numeric(3,1)
  , created timestamp not null
  , updated timestamp not null
  , constraint user_health_infos_PKC primary key (id)
) ;

-- ユーザースターテスマスター
drop table if exists user_status_master cascade;

create table user_status_master (
  code char(1) not null
  , mark varchar(512) not null
  , created timestamp not null
  , updated timestamp not null
  , constraint user_status_master_PKC primary key (code)
) ;

-- 健康資産スターテスマスター
drop table if exists health_asset_status_master cascade;

create table health_asset_status_master (
  code char(1) not null
  , mark varchar(512) not null
  , created timestamp not null
  , updated timestamp not null
  , constraint health_asset_status_master_PKC primary key (code)
) ;

-- 性別マスター
drop table if exists gender_master cascade;

create table gender_master (
  code char(1) not null
  , mark varchar(512) not null
  , created timestamp not null
  , updated timestamp not null
  , constraint gender_master_PKC primary key (code)
) ;

-- 健康資産
drop table if exists health_assets cascade;

create table health_assets (
  id bigserial not null
  , user_id bigint not null
  , rank bigint
  , asset_sum numeric(10,2)
  , std_med_cost numeric(10,2)
  , bmi numeric(3,1)
  , std_bmi numeric(3,1)
  , body_fat_percent varchar(100)
  , calories_burned integer
  , std_contraction_blood_pressure numeric(3,1)
  , std_diastolic_blood_pressure numeric(3,1)
  , status char(1) not null
  , created timestamp not null
  , updated timestamp not null
  , constraint health_assets_PKC primary key (id)
) ;

-- 検証コード
drop table if exists verification_code cascade;

create table verification_code (
  id bigserial not null
  , user_id bigint not null
  , code varchar(36) not null
  , type char(1) not null
  , created timestamp not null
  , updated timestamp not null
  , constraint verification_code_PKC primary key (id)
) ;

-- 会社
drop table if exists companies cascade;

create table companies (
  id bigserial not null
  , user_id bigint not null
  , name varchar(512) not null
  , address varchar(512)
  , created timestamp not null
  , updated timestamp not null
  , constraint companies_PKC primary key (id)
) ;

-- ユーザーベース情報
drop table if exists user_base_infos cascade;

create table user_base_infos (
  id bigserial not null
  , user_id bigint not null
  , weight numeric(10,2) not null
  , height numeric(10,2) not null
  , gender char(1) not null
  , birth_date date not null
  , created timestamp not null
  , updated timestamp not null
  , constraint user_base_infos_PKC primary key (id)
) ;

-- ユーザー
drop table if exists users cascade;

create table users (
  id bigserial not null
  , user_name varchar(100)
  , email varchar(512)
  , password varchar(512)
  , status char(1) not null
  , created timestamp not null
  , updated timestamp not null
  , constraint users_PKC primary key (id)
) ;

create unique index verification_code_IX1
  on verification_code(type);

alter table verification_code_type_master
  add constraint verification_code_type_master_FK1 foreign key (code) references verification_code(type);

alter table user_health_infos
  add constraint user_health_infos_FK1 foreign key (user_id) references users(id);

create index users_IX1
  on users(status);

create index health_assets_IX1
  on health_assets(status);

create index user_base_infos_IX1
  on user_base_infos(gender);

alter table health_assets
  add constraint health_assets_FK1 foreign key (user_id) references users(id);

alter table verification_code
  add constraint verification_code_FK1 foreign key (user_id) references users(id);

alter table companies
  add constraint companies_FK1 foreign key (user_id) references users(id);

alter table user_base_infos
  add constraint user_base_infos_FK1 foreign key (user_id) references users(id);

comment on table questionary_c is 'アンケートC';
comment on column questionary_c.id is 'ID';
comment on column questionary_c.question is '質問';
comment on column questionary_c.mark is 'マーク';
comment on column questionary_c.answer_list is '回答リスト';
comment on column questionary_c.type is 'タイプ';
comment on column questionary_c.created is '作成日付';
comment on column questionary_c.updated is '更新日付';

comment on table verification_code_type_master is '検証コードタイプマスター';
comment on column verification_code_type_master.code is 'コード';
comment on column verification_code_type_master.mark is 'マーク';
comment on column verification_code_type_master.created is '作成日付';
comment on column verification_code_type_master.updated is '更新日付';

comment on table user_health_infos is 'ユーザー健康情報';
comment on column user_health_infos.id is 'ID';
comment on column user_health_infos.user_id is 'ユーザーID';
comment on column user_health_infos.sbp is '収縮期血圧';
comment on column user_health_infos.dbp is '拡張期血圧';
comment on column user_health_infos.fbp is '空腹時血糖';
comment on column user_health_infos.us is '尿糖';
comment on column user_health_infos.cc is '腹囲';
comment on column user_health_infos.triglyceride is '中性脂肪（トリグリセリド）';
comment on column user_health_infos.hdl is 'hdlコレステロール';
comment on column user_health_infos.idl is 'idlコレステロール';
comment on column user_health_infos.got is 'got(ast)';
comment on column user_health_infos.gpt is 'gpt(alt)';
comment on column user_health_infos.ggp is 'γ-gt(γ-gtp)';
comment on column user_health_infos.rbc is '赤血球数';
comment on column user_health_infos.tc is '総コレステロール';
comment on column user_health_infos.up is '尿蛋白(定性)';
comment on column user_health_infos.hemoglobin is '血色素量(ヘモグロビン値)';
comment on column user_health_infos.created is '作成日付';
comment on column user_health_infos.updated is '更新日付';

comment on table user_status_master is 'ユーザースターテスマスター';
comment on column user_status_master.code is 'コード';
comment on column user_status_master.mark is 'マーク';
comment on column user_status_master.created is '作成日付';
comment on column user_status_master.updated is '更新日付';

comment on table health_asset_status_master is '健康資産スターテスマスター';
comment on column health_asset_status_master.code is 'コード';
comment on column health_asset_status_master.mark is 'マーク';
comment on column health_asset_status_master.created is '作成日付';
comment on column health_asset_status_master.updated is '更新日付';

comment on table gender_master is '性別マスター';
comment on column gender_master.code is 'コード';
comment on column gender_master.mark is 'マーク';
comment on column gender_master.created is '作成日付';
comment on column gender_master.updated is '更新日付';

comment on table health_assets is '健康資産';
comment on column health_assets.id is 'ID';
comment on column health_assets.user_id is 'ユーザーID';
comment on column health_assets.rank is 'ランク';
comment on column health_assets.asset_sum is '資産合計';
comment on column health_assets.std_med_cost is '標準予想医療費';
comment on column health_assets.bmi is 'BMI';
comment on column health_assets.std_bmi is '標準BMI';
comment on column health_assets.body_fat_percent is '体脂肪率';
comment on column health_assets.calories_burned is '消費カロリー';
comment on column health_assets.std_contraction_blood_pressure is '標準縮小期血圧';
comment on column health_assets.std_diastolic_blood_pressure is '標準拡張期血圧';
comment on column health_assets.status is 'スターテス';
comment on column health_assets.created is '作成日付';
comment on column health_assets.updated is '更新日付';

comment on table verification_code is '検証コード';
comment on column verification_code.id is 'ID';
comment on column verification_code.user_id is 'ユーザーID';
comment on column verification_code.code is 'コード';
comment on column verification_code.type is 'タイプ';
comment on column verification_code.created is '作成日付';
comment on column verification_code.updated is '更新日付';

comment on table companies is '会社';
comment on column companies.id is 'ID';
comment on column companies.user_id is 'ユーザーID';
comment on column companies.name is '名称';
comment on column companies.address is '所在地';
comment on column companies.created is '作成日付';
comment on column companies.updated is '更新日付';

comment on table user_base_infos is 'ユーザーベース情報';
comment on column user_base_infos.id is 'ID';
comment on column user_base_infos.user_id is 'ユーザーID';
comment on column user_base_infos.weight is '体重';
comment on column user_base_infos.height is '身長';
comment on column user_base_infos.gender is '性別';
comment on column user_base_infos.birth_date is '生年月日';
comment on column user_base_infos.created is '作成日付';
comment on column user_base_infos.updated is '更新日付';

comment on table users is 'ユーザー';
comment on column users.id is 'ID';
comment on column users.user_name is 'ユーザー名';
comment on column users.email is 'メール';
comment on column users.password is 'パスワード';
comment on column users.status is 'スターテス';
comment on column users.created is '作成日付';
comment on column users.updated is '更新日付';

