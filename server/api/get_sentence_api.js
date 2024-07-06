const axios=require('axios');


const getSentence=async()=>{
    const jokeData=await axios.get("https://api.quotable.io/random");
    dataa=jokeData.data.content.split(' ');
    console.log(dataa);
    return dataa;
}
module.exports=getSentence;