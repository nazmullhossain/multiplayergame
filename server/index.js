
const { Console } = require("console");
const express=require("express");
const http=require("http");
const mongoose=require("mongoose");
const { Socket } = require("socket.io");


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
    console.log(socket.id);
    socket.on("test",(data)=>{
        console.log(data);
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

