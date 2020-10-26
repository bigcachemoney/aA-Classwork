// function sum(){
//   let sum = 0;
//   for (let i = 0; i < arguments.length; i++) {
//     sum += arguments[i];  
//   }
//   return sum;
// }

// function sum(...nums){
//   let sum = 0;
//   for (let i = 0; i < nums.length; i++) {
//     sum += nums[i];  
//   }
//   return sum;
// }

// console.log(sum(1, 2, 3, 4)); //10
// console.log(sum(1, 2, 3, 4, 5)); //15

// // simple myBind with no args
// Function.prototype.myBind = function (ctx) { 
//   const that = this; //preserve ctx in "that"
//   return function () { 
//     return that.apply(ctx);
//   }
// };

// myBind with arguments
Function.prototype.myBind = function (ctx, ...bindArgs) {
  const that = this;
  return function (...callArgs) {
    return that.apply(ctx, bindArgs.concat(callArgs));
  };
};

// Function.prototype.myBind = function () {
//   const that = this;
//   const ctx = arguments[0]
//   const bindArgs = Array.from(arguments).slice(1) //takes away first element of arguments because arguments[0] is the ctx
//   return function () {
//     //...callArgs
//     const callArgs = Array.from(arguments) //different from line 39
//     return that.apply(ctx, bindArgs.concat(callArgs));
//   };
// };

// class Cat {
//   constructor(name) {
//     this.name = name;
//   }

//   says(sound, person) {
//     console.log(`${this.name} says ${sound} to ${person}!`);
//     return true;
//   }
// }

// class Dog {
//   constructor(name) {
//     this.name = name;
//   }
// }

// const markov = new Cat("Markov");
// const pavlov = new Dog("Pavlov");

// // markov.says("meow", "Ned");
// // Markov says meow to Ned!
// // true

// // // bind time args are "meow" and "Kush", no call time args
// markov.says.myBind(pavlov, "meow", "Kush")();
// // // Pavlov says meow to Kush!
// // // true

// // // no bind time args (other than context), call time args are "meow" and "a tree"
// markov.says.myBind(pavlov)("meow", "a tree");
// // // Pavlov says meow to a tree!
// // // true

// // // bind time arg is "meow", call time arg is "Markov"
// markov.says.myBind(pavlov, "meow")("Markov");
// // // Pavlov says meow to Markov!
// // // true

// // // no bind time args (other than context), call time args are "meow" and "me"
// const notMarkovSays = markov.says.myBind(pavlov);
// notMarkovSays("meow", "me");
// // // Pavlov says meow to me!
// // // true


// function curriedSum(numArgs) {
//   let numbers = [];
//     function _curriedSum(num) {
//         numbers.push(num);
//         if (numbers.length === numArgs) {
//           let sum = 0;

//           for (i=0; i<numbers.length; i++){
//             sum += numbers[i];
//           }

//           return sum;
//         }
//         else {
//           return _curriedSum;
//         }
//     }
//     return _curriedSum;
// }

const sum = curriedSum(4);
console.log(sum(5)(30)(20)(1)); // => 56


        // numbers.reduce(function (acc, el) { 
        //     return acc + el
        // } );
        // return _curriedSum;


Function.prototype.curry = function (numArgs) {
  // Collect up arguments until there are numArgs of them,
  // If there are too few arguments still, it should return itself.
  // When there are numArgs arguments, it should call the original function.
  // Write a version that uses Function.prototype.apply and another one that uses ... (the spread operator).
  let numbers = [];
  function _curriedSum(num) {
    numbers.push(num);
    if (numbers.length === numArgs) {
      return numbers;
    }
    else {
      return _curriedSum;
    }
  }
  return _curriedSum;
};

