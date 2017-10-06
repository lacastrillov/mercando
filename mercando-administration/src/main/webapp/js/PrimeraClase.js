/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class SuperClase{
    
    constructor(height, width) {
        this.name = 'Polygon';
        this.height = height;
        this.width = width;
    }
    
    sayName() {
        console.log('Hi, I am a ', this.name + '.');
    }

    sayHistory() {
        console.log('"Polygon" is derived from the Greek polus (many) ');
    }
    
}

class PrimeraClase extends SuperClase {

    constructor(title, height, width) {
        super(height, width);
        this.name = title;
    }
    
    get area(){
        return this.height*this.width;
    }
    
    static distance(a, b) {
        return b - a;
    }
    
    sayHistory() {
        console.log('"PrimeraClase" is derived from the SuperClase ');
    }
    
}

// Classes are used just like ES5 constructor functions:
let p = new PrimeraClase('Mi PC', 300, 400);
p.sayName();
p.sayHistory();
console.log(p);
console.log('Area is ' + p.width + ' * '+ p.height + '=' + p.area);
console.log('Distance ' + PrimeraClase.distance(10, 100));
