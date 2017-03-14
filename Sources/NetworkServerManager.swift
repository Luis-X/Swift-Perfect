import PerfectLib
import PerfectHTTP
import PerfectHTTPServer

open class NetworkServerManager {
    
    fileprivate var server: HTTPServer
    internal init(root: String, port: UInt16) {
        
        server = HTTPServer.init()                          //创建HTTPServer服务器
        var routes = Routes.init(baseUri: "/api")           //创建路由器
        configure(routes: &routes)                          //注册路由
        server.addRoutes(routes)                            //路由添加进服务
        server.serverPort = port                            //端口
        server.documentRoot = root                          //根目录
        server.setResponseFilters([(Filter404(), .high)])   //404过滤
        
    }
    
    //MARK: 开启服务
    open func startServer() {
        
        do {
            print("启动HTTP服务器")
            try server.start()
        } catch PerfectError.networkError(let err, let msg) {
            print("网络出现错误：\(err) \(msg)")
        } catch {
            print("网络未知错误")
        }
        
    }
    
    //MARK: 注册路由
    fileprivate func configure(routes: inout Routes) {
        /*
        // 添加接口,请求方式,路径
         routes.add(method: .get, uri: "/") { (request, response) in
         response.setHeader( .contentType, value: "text/html")          //响应头
         let jsonDic = ["hello": "world"]
         let jsonString = self.baseResponseBodyJSONData(status: 200, message: "成功", data: jsonDic)
         response.setBody(string: jsonString)                           //响应体
         response.completed()                                           //响应
         }
        */
        
        routes.add(method: .get, uri: "/home") { (request, response) in
            
            let result = DataBaseManager().mysqlGetHomeDataResult()
            let jsonString = self.baseResponseBodyJSONData(status: 200, message: "成功", data: result)
            response.setBody(string: jsonString)
            response.completed()
            
        }
        
        
    }

    
    //MARK: 通用响应格式
     func baseResponseBodyJSONData(status: Int, message: String, data: Any!) -> String {
        
        var result = Dictionary<String, Any>()
        result.updateValue(status, forKey: "status")
        result.updateValue(message, forKey: "message")
        if (data != nil) {
            result.updateValue(data, forKey: "data")
        }else{
            result.updateValue("", forKey: "data")
        }
        guard let jsonString = try? result.jsonEncodedString() else {
            return ""
        }
        return jsonString
        
    }
    
    //MARK: 404过滤
    struct Filter404: HTTPResponseFilter {
        
        func filterBody(response: HTTPResponse, callback: (HTTPResponseFilterResult) -> ()) {
            callback(.continue)
        }
        
        func filterHeaders(response: HTTPResponse, callback: (HTTPResponseFilterResult) -> ()) {
            if case .notFound = response.status {
                response.setBody(string: "404 文件\(response.request.path)不存在。")
                response.setHeader(.contentLength, value: "\(response.bodyBytes.count)")
                callback(.done)
                
            } else {
                callback(.continue)
            }
        }
        
    }


}
