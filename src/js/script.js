"use strict";

console.log("js connected");
const logForms = document.querySelectorAll(".form-login");
console.log(logForms);

let display = true;

function viewLogin(){
    console.log(display);
    if(display){
        logForms[0].classList.remove("disable");
        logForms[1].classList.add("disable");
    }
    if(!display){
        logForms[0].classList.add("disable");
        logForms[1].classList.remove("disable");
    }
    
    display = !display;
}