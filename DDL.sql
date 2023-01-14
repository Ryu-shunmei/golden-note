-- Project Name : 健康資産API
-- Date/Time    : 2023/01/15 0:30:52
-- Author       : 劉　春明
-- RDBMS Type   : PostgreSQL
-- Application  : A5:SQL Mk-2

-- 計算スターテスマスター
drop table if exists calc_status_master cascade;

create table calc_status_master (
  status char(1) not null
  , mark varchar(100) not null
  , created timestamp not null
  , updated timestamp not null
  , constraint calc_status_master_PKC primary key (status)
) ;

-- 尿蛋白(定性)マスター
drop table if exists up_master cascade;

create table up_master (
  up integer not null
  , mark varchar(100) not null
  , created timestamp not null
  , updated timestamp not null
  , constraint up_master_PKC primary key (up)
) ;

-- 尿糖マスター
drop table if exists us_master cascade;

create table us_master (
  us integer not null
  , mark varchar(100) not null
  , created timestamp not null
  , updated timestamp not null
  , constraint us_master_PKC primary key (us)
) ;

-- ネームマップ
drop table if exists name_map cascade;

create table name_map (
  en varchar(100) not null
  , jp varchar(100) not null
  , created timestamp not null
  , updated timestamp not null
  , constraint name_map_PKC primary key (en)
) ;

-- ユーザー健康情報
drop table if exists user_health_infos cascade;

create table user_health_infos (
  user_id bigint not null
  , sbp numeric(4,1) not null
  , dbp numeric(4,1) not null
  , fbp numeric(4,1) not null
  , us integer not null
  , cc numeric(4,1) not null
  , triglyceride numeric(4,1)
  , hdl numeric(4,1)
  , ldl numeric(4,1)
  , got numeric(4,1)
  , gpt numeric(4,1)
  , ggp numeric(4,1)
  , rbc numeric(4,1)
  , tc numeric(4,1)
  , up integer
  , hemoglobin numeric(4,1)
  , created timestamp not null
  , updated timestamp not null
  , constraint user_health_infos_PKC primary key (user_id)
) ;

-- 計算履歴
drop table if exists calc_histories cascade;

create table calc_histories (
  user_id bigint not null
  , type bigint not null
  , input text not null
  , status char(1) not null
  , created timestamp not null
  , updated timestamp not null
  , constraint calc_histories_PKC primary key (user_id)
) ;

-- 健康資産
drop table if exists health_assets cascade;

create table health_assets (
  user_id bigint not null
  , rank bigint not null
  , health_asset_amount bigint not null
  , bmi numeric(4,1)
  , std_bmi numeric(4,1)
  , body_fat_percent varchar(100)
  , calories_burned integer
  , contraction_blood_pressure numeric(4,1)
  , diastolic_blood_pressure numeric(4,1)
  , std_contraction_blood_pressure numeric(4,1)
  , std_diastolic_blood_pressure numeric(4,1)
  , created timestamp not null
  , updated timestamp not null
  , constraint health_assets_PKC primary key (user_id)
) ;

-- ランクマスター
drop table if exists rank_master cascade;

create table rank_master (
  id integer not null
  , type integer not null
  , level integer not null
  , range varchar(100) not null
  , mark text not null
  , created timestamp not null
  , updated timestamp not null
  , constraint rank_master_PKC primary key (id)
) ;

-- アンケート回答
drop table if exists questionary_answers cascade;

create table questionary_answers (
  user_id bigint not null
  , type char(1) not null
  , answer text not null
  , created timestamp not null
  , updated timestamp not null
  , constraint questionary_answers_PKC primary key (user_id,type)
) ;

-- ランクヒストグラム
drop table if exists rank_histogram cascade;

create table rank_histogram (
  id integer not null
  , point_start integer not null
  , point_end integer not null
  , count integer not null
  , created timestamp not null
  , updated timestamp not null
  , constraint rank_histogram_PKC primary key (id)
) ;

-- 初回アンケート
drop table if exists initial_questionnaire cascade;

create table initial_questionnaire (
  id bigint not null
  , question varchar(512) not null
  , mark varchar(512) not null
  , answer_list text not null
  , type varchar(100) not null
  , created timestamp not null
  , updated timestamp not null
  , constraint initial_questionnaire_PKC primary key (id)
) ;

-- 会社マスター
drop table if exists company_master cascade;

create table company_master (
  id bigserial not null
  , name varchar(512) not null
  , address varchar(1024)
  , created timestamp not null
  , updated timestamp not null
  , constraint company_master_PKC primary key (id)
) ;

-- サプリメント
drop table if exists supplementaries cascade;

create table supplementaries (
  user_id bigint not null
  , company bigint not null
  , created timestamp not null
  , updated timestamp not null
  , constraint supplementaries_PKC primary key (user_id)
) ;

-- 性別マスター
drop table if exists gender_master cascade;

create table gender_master (
  gender char(1) not null
  , mark varchar(100) not null
  , created timestamp not null
  , updated timestamp not null
  , constraint gender_master_PKC primary key (gender)
) ;

-- パスワード履歴
drop table if exists password_histories cascade;

create table password_histories (
  user_id bigint not null
  , number integer not null
  , password varchar(1024) not null
  , created timestamp not null
  , updated timestamp not null
  , constraint password_histories_PKC primary key (user_id,number)
) ;

-- ユーザースターテスマスター
drop table if exists user_status_master cascade;

create table user_status_master (
  status char(1) not null
  , mark varchar(100) not null
  , created timestamp not null
  , updated timestamp not null
  , constraint user_status_master_PKC primary key (status)
) ;

-- 検証コードタイプマスター
drop table if exists verify_code_type_master cascade;

create table verify_code_type_master (
  type char(1) not null
  , mark varchar(512) not null
  , timedelta integer not null
  , created timestamp not null
  , updated timestamp not null
  , constraint verify_code_type_master_PKC primary key (type)
) ;

-- 検証コード
drop table if exists verify_codes cascade;

create table verify_codes (
  id bigserial not null
  , user_id bigint not null
  , type char(1) not null
  , code varchar(6) not null
  , created timestamp not null
  , updated timestamp not null
  , constraint verify_codes_PKC primary key (id)
) ;

-- ユーザー情報
drop table if exists user_infos cascade;

create table user_infos (
  user_id bigint not null
  , height numeric(4,1) not null
  , weight numeric(4,1) not null
  , gender char(1) not null
  , birth_date date not null
  , created timestamp not null
  , updated timestamp not null
  , constraint user_infos_PKC primary key (user_id)
) ;

-- ユーザー
drop table if exists users cascade;

create table users (
  id bigserial not null
  , user_name varchar(100)
  , email varchar(512)
  , status char(1) not null
  , created timestamp not null
  , updated timestamp not null
  , constraint users_PKC primary key (id)
) ;

create index user_health_infos_IX1
  on user_health_infos(up);

create index user_health_infos_IX2
  on user_health_infos(us);

create index calc_histories_IX1
  on calc_histories(status);

alter table user_health_infos
  add constraint user_health_infos_FK1 foreign key (user_id) references users(id);

alter table calc_histories
  add constraint calc_histories_FK1 foreign key (user_id) references users(id);

alter table health_assets
  add constraint health_assets_FK1 foreign key (user_id) references users(id);

alter table questionary_answers
  add constraint questionary_answers_FK1 foreign key (user_id) references users(id);

create index supplementaries_IX1
  on supplementaries(company);

alter table supplementaries
  add constraint supplementaries_FK1 foreign key (user_id) references users(id);

create index user_infos_IX1
  on user_infos(gender);

alter table password_histories
  add constraint password_histories_FK1 foreign key (user_id) references users(id);

create unique index users_IX1
  on users(status);

alter table user_status_master
  add constraint user_status_master_FK1 foreign key (status) references users(status);

create index verify_codes_IX1
  on verify_codes(type);

alter table verify_codes
  add constraint verify_codes_FK1 foreign key (user_id) references users(id);

alter table user_infos
  add constraint user_infos_FK1 foreign key (user_id) references users(id);

comment on table calc_status_master is '計算スターテスマスター';
comment on column calc_status_master.status is 'スターテス';
comment on column calc_status_master.mark is 'マーク';
comment on column calc_status_master.created is '作成日付';
comment on column calc_status_master.updated is '更新日付';

comment on table up_master is '尿蛋白(定性)マスター';
comment on column up_master.up is '尿蛋白(定性)';
comment on column up_master.mark is 'マーク';
comment on column up_master.created is '作成日付';
comment on column up_master.updated is '更新日付';

comment on table us_master is '尿糖マスター';
comment on column us_master.us is '尿糖';
comment on column us_master.mark is 'マーク';
comment on column us_master.created is '作成日付';
comment on column us_master.updated is '更新日付';

comment on table name_map is 'ネームマップ';
comment on column name_map.en is 'EN';
comment on column name_map.jp is 'JP';
comment on column name_map.created is '作成日付';
comment on column name_map.updated is '更新日付';

comment on table user_health_infos is 'ユーザー健康情報';
comment on column user_health_infos.user_id is 'ユーザーID';
comment on column user_health_infos.sbp is '収縮期血圧';
comment on column user_health_infos.dbp is '拡張期血圧';
comment on column user_health_infos.fbp is '空腹時血糖';
comment on column user_health_infos.us is '尿糖';
comment on column user_health_infos.cc is '腹囲';
comment on column user_health_infos.triglyceride is '中性脂肪（トリグリセリド）';
comment on column user_health_infos.hdl is 'hdlコレステロール';
comment on column user_health_infos.ldl is 'ldlコレステロール';
comment on column user_health_infos.got is 'got(ast)';
comment on column user_health_infos.gpt is 'gpt(alt)';
comment on column user_health_infos.ggp is 'γ-gt(γ-gtp)';
comment on column user_health_infos.rbc is '赤血球数';
comment on column user_health_infos.tc is '総コレステロール';
comment on column user_health_infos.up is '尿蛋白(定性)';
comment on column user_health_infos.hemoglobin is '血色素量(ヘモグロビン値)';
comment on column user_health_infos.created is '作成日付';
comment on column user_health_infos.updated is '更新日付';

comment on table calc_histories is '計算履歴';
comment on column calc_histories.user_id is 'ユーザーID';
comment on column calc_histories.type is 'タイプ';
comment on column calc_histories.input is '入力';
comment on column calc_histories.status is 'スターテス';
comment on column calc_histories.created is '作成日付';
comment on column calc_histories.updated is '更新日付';

comment on table health_assets is '健康資産';
comment on column health_assets.user_id is 'ユーザーID';
comment on column health_assets.rank is 'ランク';
comment on column health_assets.health_asset_amount is '健康資産額';
comment on column health_assets.bmi is 'BMI';
comment on column health_assets.std_bmi is '標準BMI';
comment on column health_assets.body_fat_percent is '体脂肪率';
comment on column health_assets.calories_burned is '消費カロリー';
comment on column health_assets.contraction_blood_pressure is '収縮期血圧';
comment on column health_assets.diastolic_blood_pressure is '拡張期血圧';
comment on column health_assets.std_contraction_blood_pressure is '標準収縮期血圧';
comment on column health_assets.std_diastolic_blood_pressure is '標準拡張期血圧';
comment on column health_assets.created is '作成日付';
comment on column health_assets.updated is '更新日付';

comment on table rank_master is 'ランクマスター';
comment on column rank_master.id is 'ID';
comment on column rank_master.type is 'タイプ';
comment on column rank_master.level is 'レベル';
comment on column rank_master.range is '範囲';
comment on column rank_master.mark is 'マーク';
comment on column rank_master.created is '作成日付';
comment on column rank_master.updated is '更新日付';

comment on table questionary_answers is 'アンケート回答';
comment on column questionary_answers.user_id is 'ユーザーID';
comment on column questionary_answers.type is 'タイプ';
comment on column questionary_answers.answer is '回答';
comment on column questionary_answers.created is '作成日付';
comment on column questionary_answers.updated is '更新日付';

comment on table rank_histogram is 'ランクヒストグラム';
comment on column rank_histogram.id is 'ID';
comment on column rank_histogram.point_start is 'ポイントスタート';
comment on column rank_histogram.point_end is 'ポイントエンド';
comment on column rank_histogram.count is 'カウント';
comment on column rank_histogram.created is '作成日付';
comment on column rank_histogram.updated is '更新日付';

comment on table initial_questionnaire is '初回アンケート';
comment on column initial_questionnaire.id is 'ID';
comment on column initial_questionnaire.question is '質問';
comment on column initial_questionnaire.mark is 'マーク';
comment on column initial_questionnaire.answer_list is '回答リスト';
comment on column initial_questionnaire.type is 'タイプ';
comment on column initial_questionnaire.created is '作成日付';
comment on column initial_questionnaire.updated is '更新日付';

comment on table company_master is '会社マスター';
comment on column company_master.id is 'ID';
comment on column company_master.name is '名称';
comment on column company_master.address is '所在地';
comment on column company_master.created is '作成日付';
comment on column company_master.updated is '更新日付';

comment on table supplementaries is 'サプリメント';
comment on column supplementaries.user_id is 'ユーザーID';
comment on column supplementaries.company is '会社';
comment on column supplementaries.created is '作成日付';
comment on column supplementaries.updated is '更新日付';

comment on table gender_master is '性別マスター';
comment on column gender_master.gender is '性別';
comment on column gender_master.mark is 'マーク';
comment on column gender_master.created is '作成日付';
comment on column gender_master.updated is '更新日付';

comment on table password_histories is 'パスワード履歴';
comment on column password_histories.user_id is 'ユーザーID';
comment on column password_histories.number is '番号';
comment on column password_histories.password is 'パスワード';
comment on column password_histories.created is '作成日付';
comment on column password_histories.updated is '更新日付';

comment on table user_status_master is 'ユーザースターテスマスター';
comment on column user_status_master.status is 'スターテス';
comment on column user_status_master.mark is 'マーク';
comment on column user_status_master.created is '作成日付';
comment on column user_status_master.updated is '更新日付';

comment on table verify_code_type_master is '検証コードタイプマスター';
comment on column verify_code_type_master.type is 'タイプ';
comment on column verify_code_type_master.mark is 'マーク';
comment on column verify_code_type_master.timedelta is 'タイムデルタ';
comment on column verify_code_type_master.created is '作成日付';
comment on column verify_code_type_master.updated is '更新日付';

comment on table verify_codes is '検証コード';
comment on column verify_codes.id is 'ID';
comment on column verify_codes.user_id is 'ユーザーID';
comment on column verify_codes.type is 'タイプ';
comment on column verify_codes.code is 'コード';
comment on column verify_codes.created is '作成日付';
comment on column verify_codes.updated is '更新日付';

comment on table user_infos is 'ユーザー情報';
comment on column user_infos.user_id is 'ユーザーID';
comment on column user_infos.height is '身長';
comment on column user_infos.weight is '体重';
comment on column user_infos.gender is '性別';
comment on column user_infos.birth_date is '生年月日';
comment on column user_infos.created is '作成日付';
comment on column user_infos.updated is '更新日付';

comment on table users is 'ユーザー';
comment on column users.id is 'ID';
comment on column users.user_name is 'ユーザー名';
comment on column users.email is 'メール';
comment on column users.status is 'スターテス';
comment on column users.created is '作成日付';
comment on column users.updated is '更新日付';

