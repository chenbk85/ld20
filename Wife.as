﻿package  {		import World;	import flash.display.MovieClip;	import flash.text.*;	import flash.events.Event;		public class Wife extends MovieClip {				var world:World;		public var t:TextField;		var near:Boolean;		var quiet:Boolean;				public function Wife(w:World) {			world = w;			this.x = 120;			this.y = 160;			this.gotoAndStop(1);					var tf:TextFormat = new TextFormat("Verdana",12,0x000000,true);			t = new TextField();			t.defaultTextFormat = tf;			t.backgroundColor = 0xffffff;			t.background = true;			t.y = -50;			t.autoSize = TextFieldAutoSize.CENTER;			t.x = -t.width/2;			this.addChild(t);						this.addEventListener(Event.ENTER_FRAME, update);						reset();		}				public function reset():void {			near = false;			quiet = false;			t.text = "It's dangerous to go alone.";		}				function update(e:Event):void {			if(quiet) return;			var dx = world.hero.x - this.x;			var dy = world.hero.y - this.y;			var minDist = 50;			if(dx*dx + dy*dy < minDist*minDist) {				if(!near) {					near = true;					t.text = "Take this.";					world.bottomText.text = "Press SPACE to take";				}			} else {				if(near) {					near = false;					t.text = "It's dangerous to go alone.";					world.bottomText.text = "";				}			}			if(world.pet.hero) {				t.text = "Be careful.";				quiet = true;			}		}	}	}