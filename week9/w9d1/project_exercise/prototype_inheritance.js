Function.prototype.inherits = function(Parent) {
    function Surrogate() {};
    Surrogate.prototype = Parent.prototype;
    this.prototype = new Surrogate(); //this = child
    this.prototype.constructor = this;
};
Function.prototype.inherits = function(Parent) {
    this.prototype = Object.create(Parent.prototype);
    this.prototype.constructor = this;
};

function MovingObject() { 
    
}

MovingObject.prototype.moves = function (){
    console.log("i am moving");
}

function Ship() { }
Ship.inherits(MovingObject);

Ship.prototype.steer = function (){
    console.log("steering");
}

function Asteroid() { }
Asteroid.inherits(MovingObject);

const ship1 = new Ship();
ship1.moves();
ship1.steer();

const movingObject1 = new MovingObject();
movingObject1.moves();
movingObject1.steer();