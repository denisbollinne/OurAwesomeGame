/**
 * @author Maarten De Wilde
 */

function Dot(gs) {
    var x = gs.width * 0.5;
    var y = gs.height * 0.5;
    var r = gs.width * 0.1;

    this.update = function() {
        x += gs.width * 0.01 * (Math.random() - 0.5);
        y += gs.height * 0.01 * (Math.random() - 0.5);
    }

    this.draw = function(c) {
        c.fillRect(x - r / 2, y - r / 2, r, r);
    }
}

function startGame() {
    var gs = new JSGameSoup("surface", 30);
    gs.addEntity(new Dot(gs));
    gs.launch();
}