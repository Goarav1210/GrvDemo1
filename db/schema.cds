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
}