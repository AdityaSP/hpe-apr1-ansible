
use demo;

create table if not exists t1(
 name varchar(20)
);

truncate table t1;

insert into t1 values('Ansible Training');
