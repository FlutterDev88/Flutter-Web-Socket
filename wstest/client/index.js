const io = require('socket.io-client')

const socket = io('ws://localhost:3000/counttest', {
    transports: ['websocket']
})

socket.on("connected", () => {
    console.log("yay, connected");
});

socket.on("count", (count) => { 
    console.log("Received count: " + count);
})
