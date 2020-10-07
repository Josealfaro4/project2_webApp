let carts = document.querySelectorAll('.add-cart');

let products = [
    {
        
    }
]

for(let i=0; i< carts.length; i++){
    carts[i].addEventListener('click', () => {
        cartNumbers(products[i]);
    })
}

function onLoadCartNumbers(){
    let productNumbers = localStorage.getItem('cartNumbers');
    
    if(productNumbers){
         document.querySelector('.cart span').textContent = productNumbers;
    }
}

function cartNumbers(product){
    let productNumbers = localStorage.getItem('cartNumbers');
    
    productNumbers = parseInt(productNumbers);
    
    if(productNumbers) {
        localStorage.setItem('cartNumbers', productNumbers + 1);
        document.querySelector('.cart span').textContent = productNumbers + 1;
    }else{
        localStorage.setItem('cartNumbers',1);
        document.querySelector('.cart span').textContent =1;
    }
    
    
}
onLoadCartNumbers();