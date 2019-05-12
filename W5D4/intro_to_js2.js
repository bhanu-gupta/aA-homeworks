function titleize(names, cb) {
    cb(names.map(name => `Mx. ${name} Jingleheimer Schmidt`));
}

function printText(names) {
    names.forEach(name => console.log(name));
}

// titleize(['Roger', 'Nadal'], printText);

class Elephant {
    constructor(name, height, tricks) {
        this.name = name;
        this.height = height;
        this.tricks = tricks;
    }

    trumpet() {
        return `${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!`
    }

    grow() {
        this.height += 12;
    }

    addTrick(trick) {
        this.tricks.push(trick);
    }

    play() {
        return this.tricks[Math.floor(Math.random() * this.tricks.length)];
    }

    static paradeHelper(elephant) {
        console.log(`${elephant.name} is trotting by!`);
    }
}

const my_ele = new Elephant('Jojo', 8, ["playing with trunk", "dancing in a circle", "painting a picture"]);
// console.log(my_ele.trumpet());
// console.log(my_ele.play());
// console.log(my_ele.grow());
// console.log(my_ele.height);
// console.log(my_ele.addTrick("bubbling water"));
// console.log(my_ele.play());


let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

herd.forEach(ele => Elephant.paradeHelper(ele));

function dinerBreakfast() {
    order = ["cheesy scrambled eggs"];
    console.log(`I'd like ${order.join(" and ")} please.`);
    return ele => {
        order.push(ele);
        console.log(`I'd like ${order.join(" and ")} please.`);
    }
}

let bfastOrder = dinerBreakfast();
bfastOrder("chocolate chip pancakes");
bfastOrder("grits");