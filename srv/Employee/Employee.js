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
            for (let i = 0; i < oCase.length; i++) {
 
                result = await tx.run(`CALL prCreateUpdateCase(?,?,?,?,?,?,?,?)`, [
                    setValue(oCase[i].CSEID),
                    setValue(oCase[i].CSENO),
                    setValue(oCase[i].CMPID),
                    setValue(oCase[i].CMPNM),
                    setValue(oCase[i].CMPPN),
                    setValue(oCase[i].ISDRAFT),
                    setValue(oCase[i].ISDEL)
                ]);
                case_id = result.OCSEID;

 
                console.log('Stored Procedure Result:', result);
 
                await tx.commit();
            }
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
 