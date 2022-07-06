const ronin = require("ronin-server")
const mocks = require("ronin-mocks")
const database = require("ronin-database")

database.connect(process.env.CONNECTIONSTRING)
const server = ronin.server()
server.use("/", mocks.server(server.Router(), false, true))
// Starting the server
server.start()