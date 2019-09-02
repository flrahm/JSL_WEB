
select mon.month,NVL(lend.cnt,0) as count from
    (select lendmonth as month , count(*) as cnt from (
        select extract(month from lenddate) as lendmonth from booklend 
        where lenddate between to_date('2017-01-01','YYYY-MM-DD') 
        and to_date ('2017-12-31','YYYY-MM-DD')
        and lendid = 'shss2216' 
    ) group by lendmonth) lend, 
    (SELECT level as month FROM DUAL CONNECT BY LEVEL <= 12) mon
where lend.month(+) = mon.month
order by mon.month;



select bt.bookgenre,NVL(cnt,0) as count from
    (select booktype,count(booktype) as cnt from    
        (select booktype from booklend
        where lendid = 'shss2216')
    group by booktype) bl, booktype bt
where bl.booktype(+) = bt.booktype
order by bl.booktype;


 


select booktype,count(booktype) from    
    (select booktype from booklend where lendid = 'shss2216') bl
group by booktype order by booktype
;

select * from booktype;

