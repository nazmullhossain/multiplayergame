
const { Console } = require("console");
const express=require("express");
const http=require("http");
const mongoose=require("mongoose");
const { Socket } = require("socket.io");
const Game=require("./model/game_model");
const getSentence=require("./api/get_sentence_api");

//create a server
const app=express();
const port=process.env.PORT || 3000;


var server=http.createServer(app);
const io=require("socket.io")(server)
//middle ware......how to get data>>.as a json
app.use(express.json());

//llisten to server 

const DB="mongodb+srv://mdnazmullcse:64oWcxSNF4rDuHED@cluster0.aobyx7w.mongodb.net/";

//listing to socket io events from client (flutter code)
io.on("connection", (socket)=>{

    socket.on("test",(data)=>{
        console.log(data);
    })
    socket.on('create-room',async ({nickname})=>{
        console.log("data"+nickname)
        try{
            let game=new Game();
            const sentence=await getSentence();
            game.words=sentence;
            let player={
                socketId:socket.id,
                nickname,
                isPatyLeader:true
            }
            game.players.push(player);
            game=await game.save();
            const gameId=game._id.toString();
            socket.join(gameId);
            io.to(gameId).emit('updateGame',game);
        }catch(e){
           console.log(e) 
        }
    });

    socket.on("join-room",async({nickname,gameId})=>{
        try{
            if(!gameId.match(/^[0-9a-fA-F]{24}$/)) {
                socket.emit("notCorrectGame","Please a valid game ID");
            return;
            }   
            let game=await Game.findById(gameId);
            if(game.isJoin){
                const id=game._id.toString();
                let player={
                    nickname,
                    socketId:socket.id
                }
                socket.join(id);
                game.players.push(player);
                game=await game.save();
                io.to(gameId).emit("updateGame",game);
            }else{
                socket.emit("notCorrectGame","the game is in progress, Please try again later"
                )
            }

        }catch(e){
            console.log(e);
        }
    });
    socket.on('timer', async({playerId,gameID})=>{
        console.log("timer started");
    })
    
})


mongoose.connect(DB).then(()=>{
    console.log(`connection db succesfully`);
}).catch((e)=>{
    console.log(e);
})
server.listen(port,"0.0.0.0",()=>{
    console.log(`server is running is`+port);
})

