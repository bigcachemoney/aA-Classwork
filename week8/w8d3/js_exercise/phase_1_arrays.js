// console.log('Hi Ray');

Array.prototype.uniq = function() {
    let arr = [];
    let max = this.length;
    
    for (let i = 0; i < max; i++){
        if (arr.includes(this[i])) {
            continue;
        }
        else {
            arr.push(this[i]);
        }
    }
    return arr;
}



// let arr1 = [1, 2, 2, 3, 3, 3];

// console.log(arr1.uniq());
 
Array.prototype.twoSum = function (){
    let arr = [];
    let max = this.length;
    
    for (let i = 0; i < max; i++){
        for (let j = 0; j < max; j++){
            if (this[i] + this[j] === 0) {
                arr.push([i,j]);
            }
        }
    }
    return arr;
};


// let arr2 = [1, 2, 2, 3, -1, -2];
// console.log(arr2.twoSum());

// Transpose below
let giantArr = [[1,2,3],
                [4,5,6],
                [7,8,9]];
// [
// [1, 4, 7]
// [2, 5, 8]
// [3, 6, 9]
// ]
//results -> [[1,4,7], [2,5,8], [3,6,9]]

Array.prototype.transpose = function() {
    let row = this[1].length;
    let col = this.length;

    let matrix = new Array(row) // [ , ,]
                                // [[ , ,],[, ,] , ,]
    
    for (let k = 0; k < matrix.length; k++){
            matrix[k] = new Array(col);
    //    for (let l = 0; l < col.length; l++){
    // debugger;
    //     matrix[k].push();
    //     }
    }
    // console.log(matrix[0].length);

    for (let i = 0; i < row; i++){
        for (let j = 0; j < col; j++){
            matrix[j][i] = this[i][j];
            //console.log(matrix[j][i]);
        }
    }

    return matrix;
};

// console.log(giantArr.transpose());

