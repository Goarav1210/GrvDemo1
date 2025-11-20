using CPM as CPM from '../../db/schema';


service Casedetails{
     
    action RybXHYhRMAVoQfdA(FXPUWMCJEKALGSTV : LargeString) returns String;

    entity e5eqzbkaw2qhq9o7 as select from CPM.EMP.CASEDETAILS1;

    entity F5eqzbkaw2qhq9o7 as select from CPM.EMP.EMPLOYEEDETAILS;

    entity G5eqzbkaw2qhq9o7 as select from CPM.EMP.CASEDETAILSLANDINGPAGE;

    entity H5eqzbkaw2qhq9o7 as select from CPM.EMP.RESPONDENTDETAIL;

    entity I5eqzbkaw2qhq9o7 as select from CPM.EMP.WITNESSDETAIL;
    
   view ASDRToWpy6NGKkoe(IPCSEID : Integer) as select from CPM.EMP.REVIEWER ( IPCSEID : :IPCSEID ) { * };
 
}