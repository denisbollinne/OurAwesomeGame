/**
 * @author Maarten De Wilde
 */

function Dot(gs) {
	var x = gs.width * 0.5;
	var y = gs.height * 0.5;
	var r = gs.width * 0.1;
	var i = 0;
	var iY = 0;
	this.update = function() {
		x += gs.width * 0.02 * (Math.cos(i));
		y += gs.height * 0.04 * (Math.sin(iY));
		i += 0.1;
		iY += 0.2;
		if(i > 100000000) i = 0;
		if(iY > 100000000) iY = 0;
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