document.addEventListener("DOMContentLoaded", function(){
    const canvas = document.getElementById('mycanvas');
    canvas.height = 500;
    canvas.width = 500;
    const ctx = canvas.getContext('2d');
    ctx.fillStyle = 'grey';
    ctx.fillRect(0,0,250, 250);

    ctx.beginPath();
    ctx.arc(150, 150, 40, 0, 2*Math.PI);
    ctx.strokeStyle ='blue';
    ctx.lineWidth = 50;
    ctx.stroke();

    ctx.fillStyle = 'yellow';
    ctx.fill();

    ctx.beginPath();
    ctx.moveTo(75, 40);
    ctx.bezierCurveTo(75, 37, 70, 25, 50, 25);
    ctx.bezierCurveTo(20, 25, 20, 62.5, 20, 62.5);
    ctx.bezierCurveTo(20, 80, 40, 102, 75, 120);
    ctx.bezierCurveTo(110, 102, 130, 80, 130, 62.5);
    ctx.bezierCurveTo(130, 62.5, 130, 25, 100, 25);
    ctx.bezierCurveTo(85, 25, 75, 37, 75, 40);
    ctx.fillStyle = 'red';
    ctx.fill();

});
