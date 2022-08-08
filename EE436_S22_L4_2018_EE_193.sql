
-- ------------------------------------------------------------
-- QUERY
-- ------------------------------------------------------------
			-- 1: Find the names and ages of all sailors.
select Sname, Age  
from sailor;
			-- 2. Find all sailors with a rating above 7.
select Sid ,Sname , Age
from sailor 
where rating >7 ;

			-- 3.Find the names of sailors who have reserved boat number 103.
select Sname 
from sailor s , reserve r 
where Bid=103 and s.Sid =r.Sid ;
        
			-- 4.Find the sids of sailors who have reserved a red boat.
select Sid
from Reserve r ,boat b
where b.color= 'red'  and b.Bid=r.Bid  ;

			-- 5.Find the names of sailors who have reserved a red boat
select   Sname  
from Sailor 
where Sid in (select Sid
		     from Reserve r ,boat b
		     where color= 'red'  and b.Bid=r.Bid  );


			-- 6.Find the colors of boats reserved by Lubber.
select  color  
from boat
where Bid in (select Bid  
	from reserve r  , sailor s 
	where r.Sid =s.Sid and Sname='lubber')  ;
	 
			-- 7.Find the names of sailors who have reserved at least one boat.
            
select Sname 
from Sailor
where Sid in (select Sid 
			  from reserve   
              group by Sid 
			  having  count(Bid)>=1 );
			
            	 
			-- 8.Find the ages of sailors whose name begins and ends with B and has at least three  characters.
            
select   Age
from    sailor
where  Sname like '%B_%b';
 
			-- 9.Find the names of sailors who have reserved a red or a green boat.
	select distinct Sname  
	from Sailor 
	where Sid in (select Sid
		     from Reserve r ,boat b
		     where (b.color= 'red'or b. color ='green')  and b.Bid=r.Bid  );
             
			-- 10.Find all sids of sailors who have a rating of 10 or reserved boat 104.
 
(select Sid
from  Sailor
where rating = 10) 
union  (select Sid
	from  Reserve
	where  bid = 104);
    
    
    -- Thank You Sir 
    
    
