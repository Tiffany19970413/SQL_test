/* 1. 安裝 node.js
// 2. 安裝 mysql的套件，注意！！這裡的mysql套件是指用來連線到mysql資料庫的connect套件
      npm install mysql --save

   3. mysql的密碼加密設定修改
      mysql_native_password ： node.js 套件 mysql目前僅支援此方式
      caching_sha2_password : mysql 8.0以上預設
      修改方式如下：
      a. 使用workbench連入mysql
      b. 執行下列指令
         ALTER USER '你的帳號'@'localhost' IDENTIFIED WITH mysql_native_password BY '你的密碼';
         FLUSH PRIVILEGES;
         其中：
         你的帳號：可以輸入 root 或 你自建的帳號名稱
         localhost 代表修改本機上的mysql
         你的密嗎：12345 或是你修改的密碼


*/

//JS ws reference : https://www.w3schools.com/jsref/jsref_obj_array.asp
//Node+MySQL reference : https://www.w3schools.com/nodejs/nodejs_mysql.asp




// 宣告連線資訊與建立連線------------------------
let mysql = require('mysql');  // 宣告使用 mysql connector 套件
// var mysql = require('mysql');

var host = 'localhost';   // 資料庫主機的IP or FQDN fully qualified domain name
var user = 'root';        // 資料庫主機的帳號
var password = 'h94djpcj84';  //資料庫主機帳號對應的密碼
var database = 'world';   // 你希望連線到的資料庫名稱

// 定義一個連線資料庫的函數
// 若連線成功，會回傳一個資料庫連線的實例，後續可以用這個實例來操作資料庫，例如下達SQL語法進行資料庫操作
var pool = mysql.createPool({
        host: host,
        user: user,
        password: password,
        database: database,
        port: '3306',
        
        // 無可用連線時是否等待pool連線釋放(預設為true)
        waitForConnections : true,
        // 連線池可建立的總連線數上限(預設最多為10個連線數)
        connectionLimit : 10
});
    
//-------------------------------------------

// 定義一個讀取表格資料的函數
function readdata(tname,connpool){
    
    connpool.getConnection(function(err,conn){
       
        if (err) throw err;
        var table = tname;  // 取得要讀取的表格名稱

    // 用字串方式組出一段SQL語法  例如： SELECT * FROM city 
    // conn : 一個資料庫連線實例
    // conn.query : mysql connector 套件下，用來執行SQL語句的函數
    // err : 此參數名稱可以自訂，用來存放執行SQL語法的錯誤訊息
    // results ： 此參數名稱可以自訂，用來存放執行SQL語法的回傳結果
    // fields ： 此參數名稱可以自訂，用來存放回傳資料的欄位資訊
    // console.log : 把他想像成 print 函數，可以在console上印出資料
         conn.query('SELECT * FROM `' + table + '`', function(err, results, fields) {   // 
       

         //回傳的查詢結果，會以陣列方式回傳，陣列內的每一個元素都是一個物件＝一筆表格資料
         console.log(results[1].Name) // 可以指定index, 取出特定的資料
         console.log("------------")
         console.log(fields);
         conn.release(); // 釋放資料庫連線實例
         });
        });
}
//-------------------------------------------

readdata('city',pool);