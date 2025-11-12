function setValue(value){
    if(value !== undefined && value !== null && value !== ''){
        return value;
    }
    else{
        return null;
    }
}


module.exports ={setValue};