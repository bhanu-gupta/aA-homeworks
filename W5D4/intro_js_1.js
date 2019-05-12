function madLib(verb, adjective, noun) {
    return "We shall " + verb.toUpperCase() + " the " + adjective.toUpperCase() + " " + noun.toUpperCase();
}
// console.log(madLib('make', 'best', 'guac'));

function isSubstring(searchString, subString) {
    return searchString.indexOf(subString) !== -1;
}

// console.log(isSubstring("time to program", "dsds"));

function fizzBuzz(arr) {
    let new_arr = [];
    arr.forEach(function(ele) {
        if ((ele % 3 === 0 || ele % 5 === 0) && !(ele % 3 === 0 && ele % 5 === 0)) {
            new_arr.push(ele);
        }
    });
    return new_arr;
}

// console.log(fizzBuzz([3,4,5,15,20, 45]));

function isPrime(number) {
    let current_num = 2;
    if (number < 2) {
        return false;
    }
    for(;current_num < number; current_num++) {
        if (number%current_num === 0) {
            return false;
        }
    }
    return true;
}

function sumOfNPrimes(n) {
    let sum = 0;
    let current_prime = 2;
    let count = 0;
    for(;count < n; current_prime++) {
        if (isPrime(current_prime)) {
            console.log(current_prime);
            sum += current_prime;
            count++;
        }
    }
    return sum;
}

console.log(sumOfNPrimes(3));