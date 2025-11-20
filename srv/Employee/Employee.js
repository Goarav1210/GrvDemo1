const { setValue } = require('../utils/Comman');
const cds = require('@sap/cds');
// const metadata = require('../utils/metadata');
// const { createError } = require('../handlers/createErrorLogHandler');
 
module.exports = cds.service.impl(function () {
 
    this.on("RybXHYhRMAVoQfdA", async (req) => {
        let tx;
        try {

           
            let result,case_id;
            let payload = req.data;
            console.log('Incoming Payload:', payload);
            let oInput;
            oInput = JSON.parse(payload.FXPUWMCJEKALGSTV);
            let oCase = oInput.Case;
            console.log('Extracted Union Object:', oCase);
   
            tx = cds.tx(req);
          
 
                result = await tx.run(`CALL prCreateUpdateCase(?,?,?,?,?,?,?,?)`, [
                    setValue(oCase.CSEID),
                    setValue(oCase.CSENO),
                    setValue(oCase.CMPID),
                    setValue(oCase.CMPNM),
                    setValue(oCase.CMPPN),
                    setValue(oCase.ISDRAFT),
                    setValue(oCase.ISDEL)
                ]);
                case_id = result.OCSEID;
               for (let i = 0; i < oCase.Respondent.length; i++) {
                result = await tx.run(`CALL prCreateRespondent(?,?,?,?,?)`, [
                    setValue(case_id),
                    setValue(oCase.Respondent[i].RSNID),
                    setValue(oCase.Respondent[i].RESED),
                    setValue(oCase.Respondent[i].RESNM),
                    setValue(oCase.Respondent[i].ISDEL)
                ]);
                 }

             for (let i = 0; i < oCase.Witness.length; i++) {
                result = await tx.run(`CALL prCreateWitness(?,?,?,?,?)`, [
                    setValue(case_id),
                    setValue(oCase.Witness[i].PKWID),
                    setValue(oCase.Witness[i].WITID),
                    setValue(oCase.Witness[i].WITNM),
                    setValue(oCase.Witness[i].ISDEL)
                ]);
                 }

                console.log('Stored Procedure Result:', result);
 
                await tx.commit();
           
            returnObj = {
                Success: "Success"
            }
 
            return JSON.stringify(returnObj);
 
        } catch (error) {
 
            if (tx) {
                await tx.rollback();
            }
            return req.error({
                code: 500,
                message: error.toString()
            });
        }
    });
 
})
 