--confirming data imports
select * from titles
select * from departments
select * from employees
select * from dept_manager
select * from dept_emp
select * from salaries

--employee number, last name, first name, sex, and salary
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees as e
join salaries as s
on e.emp_no = s.emp_no;

--first name, last name, hire date ==1986
select first_name, last_name, hire_date
from employees
where hire_date like '%1986'
order by hire_date asc;

--manager per dept w/:dept#, dept name, emp#, last name, first name
--added salaries - WOW! underpaid asf! how old is this data lol
select d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, s.salary
from departments as d
join dept_manager as dm
on d.dept_no = dm.dept_no
join employees as e
on dm.emp_no = e.emp_no
join salaries as s
on e.emp_no = s.emp_no;

--dept per emp w/:emp#, last, first, dept name
select de.emp_no, e.last_name, e.first_name, d.dept_name
from dept_emp as de
join employees as e
on de.emp_no = e.emp_no
join departments as d
on de.dept_no = d.dept_no;

--first, last, sex where first == Hercules and last starts w/ B
select e.first_name, e.last_name, e.sex
from employees as e
where first_name = 'Hercules'
and last_name like 'B%'

--all emp from sales w/:emp#, last, first, dept name
select d.dept_name, e.last_name, e.first_name
from dept_emp as de
join employees as e
on de.emp_no = e.emp_no
join departments as d
on de.dept_no = d.dept_no
where d.dept_name = 'Sales';

--all emp from sales & development w/:emp#, last, first, dept name
select de.emp_no, e.last_name, e.first_name, d.dept_name
from dept_emp as de
join employees as e
on de.emp_no = e.emp_no
join departments as d
on de.dept_no = d.dept_no
where d.dept_name = 'Sales' or d.dept_name = 'Development';

--count/group last name dups in desc order by frequency
select last_name, count(last_name) as "frequency"
from employees
group by last_name
order by count(last_name) desc;