let Piece = require("./piece");

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () { 
  let grid = Array(8).fill().map(() => Array(8));

  //  Output: [ [ <5 empty items> ], [ <5 empty items> ], [ <5 empty items> ], , [ <5 empty items> ] ]


  // grid = [
  //   [1, 2, 3, 4, 5, 6, 7, 8],
  //   [1, 2, 3, 4, 5, 6, 7, 8],
  //   [1, 2, W, W, 5, 6, 7, 8],
  //   [1, 2, 3, 4, 5, 6, 7, 8],
  //   [1, 2, B, B, 5, 6, 7, 8],
  //   [1, 2, 3, 4, 5, 6, 7, 8],
  //   [1, 2, 3, 4, 5, 6, 7, 8],
  //   [1, 2, 3, 4, 5, 6, 7, 8],
  // ]

  grid[3][4] = new Piece("black");
  grid[4][3] = new Piece("black");
  grid[3][3] = new Piece("white");
  grid[4][4] = new Piece("white");

  return grid;
}

/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid();
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  // 1) should return false when x or y is less than 0
  // 2) should return false when x or y is greater than 7
  // 3) should return true otherwise
  let x = pos[0];
  let y = pos[1];

  return (x >= 0 && x < 8) && (y >= 0 && y < 8);
  // {
  //   return true; 
  // }
  // return false;
};

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  // 1) should return a piece for an occupied position
  // ✓ should return undefined for an empty position
  // 2) should throw an error for an invalid position

  let valid = this.isValidPos(pos);
  
  //get the item at pos... 
    //if it's a piece return piece

    //if empty return undefined
  let x = pos[0];
  let y = pos[1];

  if (valid === false) {
    throw new Error('Not valid pos!');
  }

  // if (this.grid[x][y] === undefined) {
  //   return undefined;
  // }
  else {
    return this.grid[x][y];
  }
  
};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  // 1) should return true when the retrieved piece matches the color
  // 2) should return false when retrieved piece does not match
  // ✓ should return falsey when retrieved piece is undefined
debugger //i'm asking my circle TA about this rn SAme! lol 
  if (this.getPiece(pos) === undefined){
    return false;
  }

  if (this.getPiece(pos).color === color){
    return true;
  }
  else {
    return false;
  }

};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  // 1) should return true if there is a piece on a position
  // 2) should return false if there isn't a piece on a position

  if (this.getPiece(pos) === undefined){
    return false;
  }
  else { return true; }
};

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns an empty array if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns empty array if it hits an empty position.
 *
 * Returns empty array if no pieces of the opposite color are found.
 */

// 1) returns empty array when pos is not on the board
// 2) returns empty array when there is a blank space one position away from the current position
// 3) returns empty array if no pieces of the opposite color are found
// 4) returns positions for longer horizontal and vertical cases
// 5) returns positions for longer diagonal cases
Board.prototype._positionsToFlip = function(pos, color, dir, piecesToFlip){
  let newPos = [pos[0] + dir[0], pos[1] + dir[1]]; 
  //base case 1 = hit a piece of the same color
  // debugger
  if (this.isMine(newPos, color)){
    return [];
  }
  
  //base case 2 = hit the edge of the board

  try {
    this.isValidPos(newPos);
  }
  catch(err){
    return [];
  }

  // if (!this.isValidPos(newPos)){
  //   // debugger
  //   return [];
  // }
  
  //spec 2
  if (!this.isOccupied(newPos)){
    // debugger
    return [];
  }

  if (!this.isMine(newPos, color)){ //if opponent's color
  // piecesToFlip.push(this.getPiece(newPos));
  // debugger
    let arr = piecesToFlip.concat(this._positionsToFlip(newPos, color, dir, piecesToFlip));
    return arr;
  }

};

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {
};

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {
};

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
};



/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
};




/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
};



module.exports = Board;
