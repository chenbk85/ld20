﻿package  {		import World;	import flash.display.MovieClip;	import flash.events.Event;		public class Monster extends MovieClip {				var world:World;				public function Monster(w:World) {			world = w;			this.addEventListener(Event.ENTER_FRAME, update);			reset();		}				public function reset():void {			this.x = 240;			this.y = 160;			this.gotoAndStop(1);		}				function update(e:Event):void {			if(!world.gameInProgress) return;			var dx = world.hero.x - this.x;			var dy = world.hero.y - this.y;			if(dx*dx+dy*dy < 400) {				world.gameOver();			}		}	}	}