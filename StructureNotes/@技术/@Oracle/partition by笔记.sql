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
--row_number() ��ÿ��С�鶼����1,2,3...��˳������,�������ظ�����(�ظ�����ָ����order by֮�������)
--rank()�������� ��ÿ��С�鶼����1,2,3..˳������,�����ظ�����ʹ��ͬһ����,�����ظ�����֮������ݽ�����row_number()�����е����м���,����1,2,2,4...
--dense_rank()��������,�ظ�����ʹ��ͬһ����,֮������ݲ�����
--sum()���������ظ����ݵĴ���:֮ǰ��������֮��,ÿһ���ظ���������ͬ��

select L_DAY,L_SALE,SIGN,sum(L_SALE) over(order by L_SALE) num from test;
