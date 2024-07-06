const mongoose=require('mongoose');
const playerSchema = require('./player_model');

const gameSChema=new mongoose.Schema({
    words:[
        {
            type:String,
        }
    ],
    players:[playerSchema],
    isJoin:{
        type:Boolean,
        default: true,

    },
    isOver:{
        type:Boolean,
        default:false,

    },
    startTime:{
        type:Number,

    }
});
const gameModel=mongoose.model("Game",gameSChema);
module.exports=gameModel;
