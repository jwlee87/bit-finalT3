
create table tb_user (
	user_no integer(6) auto_increment primary key,
    user_email varchar(40) not null unique,
    user_nick_name varchar(50) not null unique,
    user_psw varchar(800) not null,
    user_join_no integer(6) not null,
    user_reg_date datetime not null default now(),
    user_status char(1) not null default '0',
    user_conf char(1) not null default 'N'
);

create table tb_user_img (
	user_img_no integer auto_increment primary key,
    user_img_path varchar(4000)
)