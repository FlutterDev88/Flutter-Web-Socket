const io = require("socket.io")({})
const countr = io.of('/counttest')

countr.on('connection', socket => {
    socket.emit('connected')
    console.log('Attempt to connect')
})

async function ticker(){
    for (let i = 0; ; i++) {
        await new Promise(resolve => setTimeout(resolve, 1000))
        countr.emit('count', i)
    }    
}

ticker()

console.log('Listening at localhost:3000')
io.listen(3000)
