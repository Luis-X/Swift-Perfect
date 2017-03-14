import PerfectLib
import PerfectHTTP
import PerfectHTTPServer


//HTTP服务
let networkServer = NetworkServerManager(root: "webroot", port: 8888)
networkServer.startServer()
