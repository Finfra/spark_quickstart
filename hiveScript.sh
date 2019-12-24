rm -f /tmp/emp.csv
cat <<EOF>> /tmp/emp.csv
empno,ename,job,mgr,hiredate,sal,comm,deptno,
7839,KING,PRESIDENT,NULL,1981-11-17,5000,NULL,10,
7698,BLAKE,MANAGER,7839,1981-05-01,2850,NULL,30,
7782,CLARK,MANAGER,7839,1981-05-09,2450,NULL,10,
7566,JONES,MANAGER,7839,1981-04-01,2975,NULL,20,
7654,MARTIN,SALESMAN,7698,1981-09-10,1250,1400,30,
7499,ALLEN,SALESMAN,7698,1981-02-11,1600,300,30,
7844,TURNER,SALESMAN,7698,1981-08-21,1500,0,30,
7900,JAMES,CLERK,7698,1981-12-11,950,NULL,30,
7521,WARD,SALESMAN,7698,1981-02-23,1250,500,30,
7902,FORD,ANALYST,7566,1981-12-11,3000,NULL,20,
7369,SMITH,CLERK,7902,1980-12-09,800,NULL,20,
7788,SCOTT,ANALYST,7566,1982-12-22,3000,NULL,20,
7876,ADAMS,CLERK,7788,1983-01-15,1100,NULL,20,
7934,MILLER,CLERK,7782,1982-01-11,1300,NULL,10,
EOF

rm -f /tmp/dept.csv
cat <<EOF>>/tmp/dept.csv
deptno,dname,loc
10,ACCOUNTING,NEW YORK
20,RESEARCH,DALLAS
30,SALES,CHICAGO
40,OPERATIONS,BOSTON
EOF

#### hiveQL
hive -e "
drop table dept;
create table dept(
    deptno int,
    dname string,
    loc string
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
tblproperties ('skip.header.line.count'='1');

load data local inpath '/tmp/dept.csv' overwrite into table dept;

drop table emp;
create table emp(
    empno int,
    ename string,
    job string,
    mgr int,
    hiredate string,
    sal int,
    comm int,
    deptno int
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
tblproperties ('skip.header.line.count'='1');
load data local inpath '/tmp/emp.csv' overwrite into table emp;
select * from emp;

select deptno,sum(sal) from emp group by deptno;
select deptno,avg(sal) avgsal from emp where sal>1000 group by deptno
       having(avgsal>2000) order by avgsal ;
show tables;
"       
