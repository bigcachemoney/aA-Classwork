// It has to be a function (that calls another function) <-- in parameter

//this is the callback
function timesTwo (num){
    return num * 2;

}

Array.prototype.myEach = function(callback) {
    for (let i = 0; i < this.length; i++){
        callback(this[i]);
    }  
}
// arr4.myEach(function(num){
//     console.log(num * 3);
// });
let arr4 = [1, 3, 4];
arr4.myEach(function (x){ console.log(x * 3);});

//prototype
Array.prototype.myMapMap = function(callback){
    let arr = [];

    for (let i = 0; i < this.length; i++){
        arr.push(callback(this[i]));
    }
    return arr;

}

// console.log([1, 2, 3].myMapMap(timesTwo));

function fakeInjectThing (acc, el){
    return acc + el;
}

Array.prototype.myReduce = function(callback, initial_value) {
    if (initial_value === undefined) {
        initial_value = this.shift;
    }
    // let visible;
    this.myEach(function(){
        console.log(callback(ele));
    });

}

arr4.myReduce(timesTwo);
// (1*5) * (3) * (4)
// #1 essentially myEach is taking in Function timesTwo


// function form_senden(form_name, cnf, confirm_txt, trigger_field, , do_check, chknfcs, allow, errorMsg) {
//     // do something 
// }

// Question:
// Is it ok in this case to omit passing empty parameters like so:

// form_senden("abc");
// Or do I need to pass all parameters regardless if they are used like so:

// form_senden("abc", "", "", "", "", "", "", "", "");

// 22

// form_senden("abc"); is ok

// the other parameters will be initialized as undefined


// [1,2,3].myReduce(timesTwo, 25)


// // with initialValue
// [1, 2, 3].myReduce(function (acc, el) { return acc + el;}, 25);             // => 31
// [1, 2, 3].myReduce(timesTwo, 25);             // => 31

// callback = function (acc, el) {return acc + el;}
// initial value = 25

// def inject(acc, ele)
//     do something with acc ele
// end
