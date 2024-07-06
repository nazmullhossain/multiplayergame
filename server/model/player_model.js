const mongoose=require('mongoose');
const playerSchema=mongoose.Schema({
    nickname:{
        type:String
    },
    currentWordIndex:{
        type:Number,
        default:0
    },
    wpm:{
        type:Number,
        default:-1,

    },
    socketId:{
        type:String
    },
    isPatyLeader:{
        type:Boolean,
        default:false
    }
})
module.exports=playerSchema;