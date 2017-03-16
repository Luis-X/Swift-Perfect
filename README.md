# PerfectDemoProject
![Perfect](http://upload-images.jianshu.io/upload_images/1519620-86a50aa6b927d713.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


[官方网站](http://perfect.org/indexb.html?utm_expid=111916136-0.cxSPnx0YS5elL-DfbPTXrg.1&utm_referrer=http%3A%2F%2Fperfect.org%2Fdocs%2Findex_zh_CN.html)
文档详情: [官方中文文档](http://perfect.org/docs/index_zh_CN.html)
# 实践Demo
[Perfect实践Demo](https://github.com/Luis-X/PerfectDemoProject)

# 简介

> Perfect是一组完整、强大的工具箱、软件框架体系和Web应用服务器，可以在Linux、iOS和macOS (OS X)上使用。该软件体系为Swift工程师量身定制了一整套用于开发轻量、易维护、规模可扩展的Web应用及其它REST服务的解决方案，这样Swift工程师就可以实现同时在服务器和客户端上采用同一种语言开发软件项目。

# Perfect性能对比

> 性能表现

[Perfect官网](http://perfect.org/indexb.html)

[Vapor官网](https://vapor.codes/)

[Kitura官网](http://www.kitura.io/)

[Zewo官网](http://www.zewo.io/)

[Node.js官网](https://nodejs.org/en/)



![性能表现](http://upload-images.jianshu.io/upload_images/1519620-9cc5fcc239e8309e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


参考连接:[不服跑个分](https://juejin.im/entry/57e296af0bd1d000570ee3b4)

# 系统要求

##### Swift 3.0

> 如果低于3.0版本则Perfect是无法成功编译的。

##### OS X系统

> 需要的所有内容均已预装。

##### Ubuntu Linux系统

> Perfect软件框架可以在Ubuntu Linux 14.04 and 15.10环境下运行。

# 一、Mac搭建Perfect


![Mac搭建Perfect](http://upload-images.jianshu.io/upload_images/1519620-15b594f77ac58b01.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


1.创建Swift软件包

> 打开终端，新建一个PerfectDemoProject文件夹用于保存项目文件。

```shell
mkdir PerfectDemoProject
cd PerfectDemoProject
```

![1.1.1](http://upload-images.jianshu.io/upload_images/1519620-531515ffb84c805d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

2.初始化git

> 为了加快项目进度，最简单的方法就是把这个项目目录转化为git repo（代码资源文件夹）。

```shell
git init
touch README.html
git add README.html
git commit -m "Initial commit"
```

![1.2.1](http://upload-images.jianshu.io/upload_images/1519620-05930c9c594de7f5.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

3.创建Package.swift文件

> 在git repo根目录下面创建一个Package.swift文件。这个文件是SPM（Swift软件包管理器）编译项目时必须要用到的文件。

```shell
touch Package.swift
```
![1.3.1](http://upload-images.jianshu.io/upload_images/1519620-24e53aa2eb6c61d1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

> 使用Xcode打开Package.swift文件并添加如下代码，添加所需要使用的软件包。

```swift
//软件包管理
import PackageDescription

let versions = Version(0,0,0)..<Version(10,0,0)
let urls = [
    "https://github.com/PerfectlySoft/Perfect-HTTPServer.git",      //HTTP服务
    "https://github.com/PerfectlySoft/Perfect-MySQL.git",           //MySQL服务
    "https://github.com/PerfectlySoft/Perfect-Mustache.git"         //Mustache
]

let package = Package(
    name: "PerfectDemoProject",
    targets: [],
    dependencies: urls.map { .Package(url: $0, versions: versions) }
)
```

![1.3.2](http://upload-images.jianshu.io/upload_images/1519620-700dbe4a2511f13a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


4.创建Sources文件夹

> 创建一个名为Sources的文件夹用于保存源程序，然后在这个源程序文件夹下面创建一个main.swift文件。

```Shell
mkdir Sources
echo 'print("您好！")' >> Sources/main.swift
```

![1.4.1](http://upload-images.jianshu.io/upload_images/1519620-7fc34ea782a2d32b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

5.编译运行项目

> 等待编译成功之后运行项目控制台输出 "您好!"。

```shell
swift build
.build/debug/PerfectDemoProject
```

![1.5.1](http://upload-images.jianshu.io/upload_images/1519620-9627061700ef3914.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

## 使用Xcode

1.创建成Xcode可以运行项目

> Swift软件包管理器（SPM）能够创建一个Xcode项目，并且能够运行PerfectTemplate模板服务器，还能为您的项目提供完全的源代码编辑和调试。

```shell
swift package generate-xcodeproj
```

![创建为Xcode工程](http://upload-images.jianshu.io/upload_images/1519620-196d5518cf185f90.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![工程目录](http://upload-images.jianshu.io/upload_images/1519620-0f83d762b508596d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


2.打开PerfectDemoProject.xcodeproj

> 在Build Settings中Library Search Paths检索项目软件库中增加（不单单是编译目标）


![配置工程](http://upload-images.jianshu.io/upload_images/1519620-7644ec14c865adf0.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


**注意: 若在编辑过程中无其他问题且无法运行,请删除PerfectDemoProject.xcodeproj文件,重新使用`swift package generate-xcodeproj`命令创建**

# 二、搭建HTTP服务器


![HTTP服务器](http://upload-images.jianshu.io/upload_images/1519620-5dba851d53a27ed0.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)



官方:[HTTP服务器配置](https://www.perfect.org/docs/HTTPServer_zh_CN.html)

1.编辑main.swift

```swift
import PerfectLib
import PerfectHTTP
import PerfectHTTPServer

//HTTP服务
let networkServer = NetworkServerManager(root: "webroot", port: 8888)
networkServer.startServer()
```

2.创建并编辑NetworkServerManager.swift

```swift
import PerfectLib
import PerfectHTTP
import PerfectHTTPServer

open class NetworkServerManager {
    
    fileprivate var server: HTTPServer
    internal init(root: String, port: UInt16) {
        
        server = HTTPServer.init()                          //创建HTTPServer服务器
        var routes = Routes.init(baseUri: "/api")           //创建路由器
        configure(routes: &routes)                          //注册路由
        server.addRoutes(routes)                            //路由添加进服务
        server.serverPort = port                            //端口
        server.documentRoot = root                          //根目录
        server.setResponseFilters([(Filter404(), .high)])   //404过滤
        
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
        
        // 添加接口,请求方式,路径
         routes.add(method: .get, uri: "/") { (request, response) in
         response.setHeader( .contentType, value: "text/html")          //响应头
         let jsonDic = ["hello": "world"]
         let jsonString = self.baseResponseBodyJSONData(status: 200, message: "成功", data: jsonDic)
         response.setBody(string: jsonString)                           //响应体
         response.completed()                                           //响应
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
```

3.运行结果


![2.3.1](http://upload-images.jianshu.io/upload_images/1519620-c36be7cf3a84f4aa.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


4.访问接口效果


![2.4.1](http://upload-images.jianshu.io/upload_images/1519620-7aa5e34f9993852e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


# 三、搭建MySQL数据库


![MySQL数据库](http://upload-images.jianshu.io/upload_images/1519620-9efc6df59d406f2a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


官方:[MySQL配置](https://www.perfect.org/docs/MySQL_zh_CN.html)

### 工具

[数据库管理工具: Navicat Premium](http://xclient.info/s/navicat-premium.html)



### （1）安装MySQL

**手动安装MySQL**：https://dev.mysql.com/downloads/mysql/



1.安装Homebrew

```shell
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```


![3.1.1](http://upload-images.jianshu.io/upload_images/1519620-0027afaf860ca951.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


**PASS**：若要卸载Homebrew

```shell
cd `brew --prefix`
rm -rf Cellar$ brew prune
rm -rf Library .git .gitignore bin/brew README.md share/man/man1/brew
rm -rf ~/Library/Caches/Homebrew
```



2.使用Homebrew安装MySQL

```shell
brew install mysql
```


![3.1.2](http://upload-images.jianshu.io/upload_images/1519620-29f1e5e4fb74d6b8.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


**PASS**：若要卸载MySQL（仅供参考）

```shell
brew remove mysql  
brew cleanup  
launchctl unload -w ~/Library/LaunchAgents/com.mysql.mysqld.plist  
rm ~/Library/LaunchAgents/com.mysql.mysqld.plist  
sudo rm /usr/local/mysql
sudo rm -rf /usr/local/mysql*
sudo rm -rf /Library/StartupItems/MySQLCOM
sudo rm -rf /Library/PreferencePanes/My*
(编辑 /etc/hostconfig) sudo vi /etc/hostconfig (删除行 MYSQLCOM=-YES)
sudo rm -rf /Library/Receipts/mysql*
sudo rm -rf /Library/Receipts/MySQL*
sudo rm -rf /var/db/receipts/com.mysql.* 
```

[卸载MySQL参考链接](https://coderwall.com/p/os6woq/uninstall-all-those-broken-versions-of-mysql-and-re-install-it-with-brew-on-mac-mavericks)



### （2）配置MySQL

> **示例配置**
> **账号：root** 
> **密码：Fengxu::1226**

```shell
#开启MySQL服务
mysql.server start
#初始化MySQL配置向导
mysql_secure_installation
```


![3.2.1](http://upload-images.jianshu.io/upload_images/1519620-1de78a616259199f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)




3.编辑mysqlclient.pc文件

> 将mysqlclient.pc文件设置为可读写后删除`-fno-omit-frame-pointer`内容。

```objective-c
//文件路径:
/usr/local/lib/pkgconfig/mysqlclient.pc
```


![3.2.2](http://upload-images.jianshu.io/upload_images/1519620-4cfff6e511a14e3b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)




### （3）创建数据库和表

1.使用Navicat Premium工具，连接本地数据库

> 打开Navicat Premium点击链接，选择MySQL后，输入连接名、密码，确定保存。
>
> **示例链接名：TianTianDB**


![3.3.1](http://upload-images.jianshu.io/upload_images/1519620-f2a6244ecf9b90a4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)




2.创建TianProject数据库

> 右键点击TIanTIanDB数据库连接，选择新建数据库，输入数据库名，确认保存。
>
> **示例数据库名：TianProject**


![3.3.2](http://upload-images.jianshu.io/upload_images/1519620-9bc36ead6fda5fe9.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)




3.创建account_level表

> 展开TIanTIanDB数据库，右键点击表，选择新建表，如下图，保存名为account_level表。
>
> **示例表名：account_level**


![3.3.3](http://upload-images.jianshu.io/upload_images/1519620-15e4978bbb8f018e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)




4.向account_level表中添加数据

> **示例表数据：如下图**

![3.3.4](http://upload-images.jianshu.io/upload_images/1519620-3d3c0b9b1a9d6caa.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)




### （4）编辑Perfect服务端

1.创建并编辑DataBaseManager.swift

```swift
import MySQL

//MARK: 数据库信息
let mysql_host = "127.0.0.1"
let mysql_user = "root"
let mysql_password = "Fengxu::1226"
let mysql_database = "TianProject"

//MARK: 表信息
let table_account = "account_level"                    //等级

open class DataBaseManager {

fileprivate var mysql: MySQL
internal init() {
mysql = MySQL.init()                           //创建MySQL对象
guard connectedDataBase() else {               //开启MySQL连接
return
}
}

//MARK: 开启连接
private func connectedDataBase() -> Bool {

let connected = mysql.connect(host: mysql_host, user: mysql_user, password: mysql_password, db: mysql_database)
guard connected else {
print("MySQL连接失败" + mysql.errorMessage())
return false
}
print("MySQL连接成功")
return true

}

//MARK: 执行SQL语句
/// 执行SQL语句
///
/// - Parameter sql: sql语句
/// - Returns: 返回元组(success:是否成功 result:结果)
@discardableResult
func mysqlStatement(_ sql: String) -> (success: Bool, mysqlResult: MySQL.Results?, errorMsg: String) {

guard mysql.selectDatabase(named: mysql_database) else {            //指定database
let msg = "未找到\(mysql_database)数据库"
print(msg)
return (false, nil, msg)
}

let successQuery = mysql.query(statement: sql)                      //sql语句
guard successQuery else {
let msg = "SQL失败: \(sql)"
print(msg)
return (false, nil, msg)
}
let msg = "SQL成功: \(sql)"
print(msg)
return (true, mysql.storeResults(), msg)                            //sql执行成功

}

/// 增
///
/// - Parameters:
///   - tableName: 表
///   - key: 键  （键，键，键）
///   - value: 值  ('值', '值', '值')
func insertDatabaseSQL(tableName: String, key: String, value: String) -> (success: Bool, mysqlResult: MySQL.Results?, errorMsg: String){

let SQL = "INSERT INTO \(tableName) (\(key)) VALUES (\(value))"
return mysqlStatement(SQL)

}

/// 删
///
/// - Parameters:
///   - tableName: 表
///   - key: 键
///   - value: 值
func deleteDatabaseSQL(tableName: String, key: String, value: String) -> (success: Bool, mysqlResult: MySQL.Results?, errorMsg: String) {

let SQL = "DELETE FROM \(tableName) WHERE \(key) = '\(value)'"
return mysqlStatement(SQL)

}

/// 改
///
/// - Parameters:
///   - tableName: 表
///   - keyValue: 键值对( 键='值', 键='值', 键='值' )
///   - whereKey: 查找key
///   - whereValue: 查找value
func updateDatabaseSQL(tableName: String, keyValue: String, whereKey: String, whereValue: String) -> (success: Bool, mysqlResult: MySQL.Results?, errorMsg: String) {

let SQL = "UPDATE \(tableName) SET \(keyValue) WHERE \(whereKey) = '\(whereValue)'"
return mysqlStatement(SQL)

}

/// 查所有
///
/// - Parameters:
///   - tableName: 表
///   - key: 键
func selectAllDatabaseSQL(tableName: String) -> (success: Bool, mysqlResult: MySQL.Results?, errorMsg: String) {

let SQL = "SELECT * FROM \(tableName)"
return mysqlStatement(SQL)

}

/// 查
///
/// - Parameters:
///   - tableName: 表
///   - keyValue: 键值对
func selectAllDataBaseSQLwhere(tableName: String, keyValue: String) -> (success: Bool, mysqlResult: MySQL.Results?, errorMsg: String) {

let SQL = "SELECT * FROM \(tableName) WHERE \(keyValue)"
return mysqlStatement(SQL)

}

//获取account_level表中所有数据
func mysqlGetHomeDataResult() -> [Dictionary<String, String>]? {

let result = selectAllDatabaseSQL(tableName: table_level)
var resultArray = [Dictionary<String, String>]()
var dic = [String:String]()
result.mysqlResult?.forEachRow(callback: { (row) in
dic["accountLevelId"] = row[0]
dic["name"] = row[1]
resultArray.append(dic)
})
return resultArray

}
}
```


2.NetworkServerManager.swift中添加访问接口

> 添加http://127.0.0.1:8888/api/home 接口，返回account_level表中所有数据

```objective-c
//MARK: 注册路由
fileprivate func configure(routes: inout Routes) {

routes.add(method: .get, uri: "/home") { (request, response) in

let result = DataBaseManager().mysqlGetHomeDataResult()
let jsonString = self.baseResponseBodyJSONData(status: 200, message: "成功", data: result)
response.setBody(string: jsonString)
response.completed()

}

}
```



### （5）验证效果

1.运行结果


![3.5.1](http://upload-images.jianshu.io/upload_images/1519620-9c13b30e8964030e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


2.访问接口效果

> 浏览器访问http://127.0.0.1:8888/api/home 接口


![3.5.2](http://upload-images.jianshu.io/upload_images/1519620-843797e4372c5d31.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

