create table test(L_day Number, l_sale Number);
alter table test add (sign number);
insert into test values(1,15);
insert into test values(2,25);
insert into test values(3,35);
insert into test values(4,45);
insert into test values(5,60);
select * from test for update;
select * from (select L_DAY, L_SALE, SIGN,dense_rank() over(partition by L_DAY order by L_SALE,SIGN) num  from test) where num=2;
select L_DAY,L_SALE,SIGN,sum(L_SALE) over(partition by L_DAY order by L_SALE,SIGN) num from test;
select L_DAY,L_SALE,SIGN,sum(L_SALE) over(partition by 1 order by L_SALE) num from test;
--row_number() 对每个小组都按照1,2,3...的顺序排序,不处理重复数据(重复数据指的是order by之后的数据)
--rank()跳级排序 对每个小组都按照1,2,3..顺序排序,对于重复数据使用同一序列,但是重复数据之后的数据将按照row_number()规则中的序列继续,比如1,2,2,4...
--dense_rank()连续排序,重复数据使用同一序列,之后的数据不跳级
--sum()函数对于重复数据的处理:之前所有数据之和,每一条重复数据是相同的

select L_DAY,L_SALE,SIGN,sum(L_SALE) over(order by L_SALE) num from test;
