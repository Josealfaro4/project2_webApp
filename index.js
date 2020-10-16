
// let carts = document.querySelectorAll('.add-cart');

// let products = [
//     {
        
        
//     }
// ]

// for(let i=0; i< carts.length; i++){
//     carts[i].addEventListener('click', () => {
//         cartNumbers(products[i]);
//         totalCost(products[i]);
//     })
// }

// function onLoadCartNumbers(){
//     let productNumbers = localStorage.getItem('cartNumbers');
    
//     if(productNumbers){
//          document.querySelector('.cart span').textContent = productNumbers;
//     }
// }

// function cartNumbers(product){
//     let productNumbers = localStorage.getItem('cartNumbers');
    
//     productNumbers = parseInt(productNumbers);
    
//     if(productNumbers) {
//         localStorage.setItem('cartNumbers', productNumbers + 1);
//         document.querySelector('.cart span').textContent = productNumbers + 1;
//     }else{
//         localStorage.setItem('cartNumbers',1);
//         document.querySelector('.cart span').textContent =1;
//     }
    
//     setItems(product);
// }

// function setItems(products){
//     let cartItems = localStorage.getItem('productsInCart');
//     cartItems = JSON.parse(cartItems);
    
//     if(cartItems != null){
        
//         if(cartItems[products.tag] == undefined){
//             cartItems = {
//                 ...cartItems,
//                 [product.tag]:product
//             }
//         }
//         cartItems[products.tag].inCart +=1;
//     } else{
//         product.inCart = 1;
//         cartItems = {
//             [product.tag]: product
//         }
//     }

//     localStorage.setItem("productsInCart", JSON.stringify(cartItems));
// }

// function totalCost(product){
//     let cartCost = localStorage.getItem('totalCost');
    
//     if(cartCost != null){
//         cartCost = parseInt(cartCost);
//         localStorage.setItem("totalCost",cartCost + product.price);
//     }else{
//         localStorage.setItem("totalCost", product.price);
//     }
    
// }

// onLoadCartNumbers();

var express = require("express");
var bodyParser = require("body-parser");
var bcrypt = require("bcrypt");
var mysql = require("mysql");
var fs = require("fs");
var multer = require("multer");
var app = express();



app.use(express.static("css"));
app.use(bodyParser.urlencoded({ extended: true }));
app.set("view engine", "ejs");

var connection = mysql.createConnection({
    host: "localhost",
    user: "Julio",
    password: "Julio",
    database: "project2_db"
});

connection.connect(function(err) {
    if (err) {
        console.log('error when connecting to db:', err);
    }
});

app.get("/", function(req, res) {
    res.render("home");
});

app.get("/register", function(req, res) {
    res.render("register");
});


function checkUsernamePassword(username,password) {
    let stmt = "SELECT * from USERS where username=? and password=?";
    let data = [username, password];
    return new Promise(function(resolve, reject) {
        connection.query(stmt, data, function(error, results) {
            if (error) throw error;
            resolve(results);
        });
    });
}


app.get("/signIn", function(req, res) {
    res.render("signIn");
});

app.get("/editUser", function(req, res) {
    res.render("editUser");
});

app.post("/signIn", async function(req, res) {
    let username = req.body.username;
    let password = req.body.password;
    let users = await checkUsernamePassword(username, password);
    console.log(users);
    if (users.length) {
        res.redirect("/");
    }
    else {
        res.render("signIn", { error: true });
    }
});

app.post("/register", function(req, res) {
    let username = req.body.username;
    let password = req.body.psw;
    console.log(username);
    console.log(password);
    var stmt = 'INSERT into USERS (username, password) VALUES (?, ?)';
    var data = [username, password];
    connection.query(stmt, data, function(error, result) {
        if (error) throw error;
        res.redirect("/signin");
    });
});


app.get("*", function(req, res) {
    res.render("error");
});

app.listen(process.env.PORT, process.env.IP, function() {
    console.log("Server is up and running");
});
