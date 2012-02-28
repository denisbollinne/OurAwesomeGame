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

function Orb(gs){
	
	var WALK_VX = 15;
	var vx = 0;
	var posx = 250;
	var p = new Sprite(["center", "bottom"], {
	"roll_forward": [["orbs/orb1.jpg", 4],["orbs/orb2.jpg", 4],["orbs/orb3.jpg", 4],["orbs/orb4.jpg", 4],],
	"roll_backward": [["orbs/orb4.jpg", 4],["orbs/orb3.jpg", 4],["orbs/orb2.jpg", 4],["orbs/orb1.jpg", 4],],
	"normal": [["orbs/orb1.jpg", 1],]
	}, function(){
		p.action("normal")
	});
	
	this.update = function(){
		this.updateanimation();
		p.update();
		posx += vx;			
	}
	
	this.updateanimation = function(){
		if(vx>=WALK_VX){			
			p.action("roll_forward");
		}
		if(vx<=-WALK_VX){			
			p.action("roll_backward");
		}
		if(vx === 0){
			p.action("normal");
		}
	}
	
	/*** input events stuff ***/
		this.keyDown_37 = function () {
			
			vx -= WALK_VX;
			this.updateanimation();
		}
		
		this.keyUp_37 = this.keyUp_39 = function() {
			
			vx = 0;
			this.updateanimation();
		}
		
		this.keyDown_39 = function () {
			
			vx += WALK_VX;
			this.updateanimation();
		}
	
	this.draw = function(c) {
		p.draw(c, [posx,250]);
	}
}

function startGame() {
	
	Sprite.preload([
			"orbs/orb1.jpg",
			"orbs/orb2.jpg",
			"orbs/orb3.jpg",
			"orbs/orb4.jpg",
			
		],
		// when the sprites are loaded, create the world
		function() {			
			gs.addEntity(new Orb(gs));
		}
	);
	var gs = new JSGameSoup("surface", 30);
	gs.addEntity(new Dot(gs));
	gs.launch();	
}