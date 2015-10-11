Select eventrequest.eventno, dateheld, count(*) AS numPlans
  FROM eventrequest, eventplan
  WHERE eventrequest.eventno = eventplan.eventno
  AND eventplan.workdate BETWEEN ('1/DEC/13') AND ('31/DEC/13')
  GROUP BY eventrequest.eventno,dateheld
  HAVING count(*)>1;



SELECT eventplan.planno, eventrequest.eventno, eventplan.workdate, eventplan.activity
  FROM eventplan, eventrequest,facility
  WHERE eventplan.eventno = eventrequest.eventno
  AND eventrequest.facno = facility.facno
  AND eventplan.workdate BETWEEN ('1/DEC/13') AND ('31/DEC/13')
  AND facname = 'Basketball arena';
  
  
  
SELECT eventrequest.eventno, eventrequest.dateheld, eventrequest.status,estcost
  FROM eventplan, eventrequest,employee,facility
  WHERE eventplan.eventno = eventrequest.eventno
  AND eventrequest.facno = facility.facno
  AND employee.empno = eventplan.empno
  AND eventplan.workdate BETWEEN ('1/DEC/13') AND ('31/DEC/13')
  AND facname = 'Basketball arena'
  AND employee.empname = 'Mary Manager';
  



SELECT eventplanline.planno, eventplanline.lineno, resourcetbl.resname, 
        eventplanline.numberfld, location.locname, eventplanline.timestart, eventplanline.timeend 
  FROM eventplanline, resourcetbl, location, eventplan, facility
  WHERE eventplanline.planno = eventplan.planno
  AND eventplanline.resno = resourcetbl.resno
  AND location.locno = eventplanline.locno
  AND location.facno=facility.facno
  AND facname = 'Basketball arena'
  AND eventplan.workdate BETWEEN ('1/DEC/13') AND ('31/DEC/13')
  AND eventplan.activity = 'Operation';
  
  
INSERT INTO facility ( Facno, FacName )
VALUES ('F104','Swimming Pool');

INSERT INTO location ( locno, facno, locname )
VALUES ('L107','F104','Door');

INSERT INTO location ( locno, facno, locname )
VALUES ('L108','F104','Locker room');

Update location
set locname = 'Gate'
where locno = 'L107';

delete from location
where locno = 'L108';

select * from location;
