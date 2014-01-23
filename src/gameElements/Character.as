package  gameElements
{
	import flash.ui.Keyboard;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.KeyboardEvent;
	/**
	 * ...
	 * @author Qiao Xiaomeng
	 */
	public class Character extends Sprite 
	{
		private var characterImage:Image;
		private var characterAnimation:MovieClip;
		private var _state:int;
		private var _isJumping:Boolean = false;
		private var velocity:Number = -25;
		private var gravity:Number = 3;
		private var _isShooting:Boolean;
		private var _isHit:Boolean;
		
		private var _name:String;
		
		private var isStop:Boolean = false;
		
		public function Character(name:String) 
		{
			super();
			this.name = name;
			addEventListener(Event.ADDED_TO_STAGE, init);
			
		}
		
		private function onEnterFrame(e:Event):void 
		{
			if (this.y > GameConstants.POSITION_BOY_STAND)
			{
				this.y = GameConstants.POSITION_BOY_STAND;
				//removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			}
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			this.state = GameConstants.HERO_STATE_IDLE;
			createCharacter();
			
			
			this._isJumping = false;
			this._isShooting = false;
			this.isHit = false;
			
			
		}
				
		public function createCharacter():void 
		{
			//monkeyMC = new MovieClip(new Assets().getMCTextures("Monkey", "monkey-run-"));
			//Starling.juggler.add(monkeyMC);
			//this.addChild(monkeyMC);
			
			characterAnimation = new MovieClip(new Assets().getTextureAtlas("HeartBeatsWithYou").getTextures(name + "_running"), 6);
			Starling.juggler.add(characterAnimation);
			this.addChild(characterAnimation);
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		public function jump():void
		{			
			if (!_isJumping)
			{
				trace("jump");
				this.state = GameConstants.HERO_STATE_JUMP;
				addEventListener(Event.ENTER_FRAME, onJump);
				isStop = false;
				_isJumping = true;
			}
			
		}
		
		private function onJump(e:Event):void 
		{
			//if (!isStop)
			{
			trace("onJump")
			this.y +=  velocity;
			velocity += gravity;
			
			//characterAnimation = new MovieClip(new Assets().getTextureAtlas("HeartBeatsWithYou").getTextures(name + "_jump"), 6)
			
			if (this.y > GameConstants.POSITION_BOY_STAND)
			{
				
				isStop = true;
				this.y = GameConstants.POSITION_BOY_STAND;
				removeEventListener(Event.ENTER_FRAME, onJump);
				
			}	
			_isJumping = false;
			this.state = GameConstants.HERO_STATE_RUNNING;
			}
		}
		
		public function shoot():void
		{
			if (!_isShooting)
			{
				addEventListener(Event.ENTER_FRAME, onShoot);
				this.state = GameConstants.HERO_STATE_SHOOT;
				_isShooting = true;
			}
		}
		
		private function onShoot(e:Event):void 
		{
			this.x -=  velocity;
			velocity += gravity;
			
			if (this.x <= 0)
			{
				this.x = 0;
				removeEventListener(Event.ENTER_FRAME, onShoot);
			}
			_isShooting = false;
			

			
			
/*			if (this.x <= stage.stageWidth - 100)
			{	
				this.x += 10;
			}
			else {
				if (this.x >= 100)
				{
					this.x -= 30;
				}
				else {
					this.x = 100;
					this._isShooting = false;
					this.state = GameConstants.HERO_STATE_RUNNING;
				}
			}*/
		}
		
		public function hit():void
		{
			this.addEventListener(Event.ENTER_FRAME, onHit);
			this.isHit = false;
			this.state = GameConstants.HERO_STATE_RUNNING;
		}
		
		private function onHit(e:Event):void 
		{
			if (this._isHit)
			{
				this.x = Math.random() * 200;
				this.y = Math.random() * 100;
			}
			removeEventListener(Event.ENTER_FRAME, onHit);
		}
		
		public function get state():int { return _state; }
		public function set state(value:int):void { _state = value; }
		
		public function setCharacterAnimationSpeed(speed:int):void {
			//if (speed == 0) heroArt.fps = 20;
			//else heroArt.fps = 60;
		}

		override public function get width():Number
		{
			//if (heroArt) return heroArt.texture.width;
			//else 
			return NaN;
		}

		override public function get height():Number
		{
			//if (heroArt) return heroArt.texture.height;
			//else 
			return NaN;
		}
		

		
		
		
	}

}