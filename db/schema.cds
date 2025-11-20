namespace CPM;

context EMP{

       @cds.persistence.exists
    @cds.persistence.calcview
    entity CASEDETAILS1 {
key     CSEID: Integer  @title: 'CSEID: CSEID' ; 
        CSENO: String(30)  @title: 'CSENO: CSENO' ; 
        ISDEL: String(1)  @title: 'ISDEL: ISDEL' ; 
        POLID: Integer  @title: 'POLID: POLID' ; 
        CSBID: Integer  @title: 'CSBID: CSBID' ; 
}

@cds.persistence.exists 
@cds.persistence.calcview 
entity EMPLOYEEDETAILS {
key     EMPID: String(20)  @title: 'EMPID: EMPID' ; 
        EMPNM: String(200)  @title: 'EMPNM: EMPNM' ; 
        EMPPN: String(20)  @title: 'EMPPN: EMPPN' ; 
        ISDEL: String(1)  @title: 'ISDEL: ISDEL' ; 
        CSENO: String(30)  @title: 'CSENO: CSENO' ; 
        CSEID: Integer  @title: 'CSEID: CSEID' ; 
        CMPID: String(20)  @title: 'CMPID: CMPID' ; 
        CMPPN: String(20)  @title: 'CMPPN: CMPPN' ; 
}

@cds.persistence.exists 
@cds.persistence.calcview 
Entity CASEDETAILSLANDINGPAGE {
key     CSENO: String(30)  @title: 'CSENO: Case Number' ; 
        CSEID: Integer  @title: 'CSEID: CSEID' ; 
        ISDEL: String(1)  @title: 'ISDEL: Is Deleted' ; 
        CMPNM: String(200)  @title: 'CMPNM: Complainant Name' ; 
        CMPID: String(20)  @title: 'CMPID: Complainant Employee Id (Foreign Key CPM_M_EMPLY Table)' ; 

          H5eqzbkaw2qhq9o7 : Association to many RESPONDENTDETAIL
                                   on H5eqzbkaw2qhq9o7.CSEID = CSEID;

         I5eqzbkaw2qhq9o7 : Association to many WITNESSDETAIL
                                   on I5eqzbkaw2qhq9o7.CSEID = CSEID;
}

@cds.persistence.exists 
@cds.persistence.calcview 
Entity RESPONDENTDETAIL {
key     CSEID: Integer  @title: 'CSEID: CSEID' ; 
        RESED: String(20)  @title: 'RESED: RESED' ; 
        RESNM: String(200)  @title: 'RESNM: RESNM' ; 
        ISDEL: String(1)  @title: 'ISDEL: ISDEL' ; 
}

@cds.persistence.exists 
@cds.persistence.calcview 
Entity WITNESSDETAIL {
key     CSEID: Integer  @title: 'CSEID: CSEID' ; 
        WITID: String(20)  @title: 'WITID: WITID' ; 
        WITNM: String(200)  @title: 'WITNM: WITNM' ; 
        ISDEL: String(1)  @title: 'ISDEL: ISDEL' ; 
}

@cds.persistence.exists 
@cds.persistence.calcview 
Entity REVIEWER (IPCSEID : Integer){
key     CSENO: String(30)  @title: 'CSENO: Case Number' ; 
        CSEID: Integer  @title: 'CSEID: CSEID' ; 
        CMPID: String(20)  @title: 'CMPID: Complainant Employee Id (Foreign Key CPM_M_EMPLY Table)' ; 
        CMPNM: String(200)  @title: 'CMPNM: Complainant Name' ; 
        CMPPN: String(20)  @title: 'CMPPN: Complainant Personnel Number' ; 
}

}