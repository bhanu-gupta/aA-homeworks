// setTimeout(() => {
//     alert('HAMMERTIME');
// }, 5000);

// function hammerTime(time) {
//     setTimeout(() => {
//         alert(`${time} is hammertime!`)
//     }, time);
// }


const readline = require('readline');

const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

function teaAndBiscuits() {
    reader.question("Would you like to have tea?", (tea_response)=>{
        console.log(tea_response);
        reader.question("Would you like to have biscuits?", (biscuit_response) => {
            console.log(`So you ${tea_response} want tea and you ${biscuit_response} want coffee.`);
            reader.close();
        });
    });
    
}

teaAndBiscuits();