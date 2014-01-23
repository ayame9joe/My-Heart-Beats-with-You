package  gameElements
{
	import flash.display.BitmapData;
	import flash.events.AccelerometerEvent;
	import flash.geom.Rectangle;
	import flash.media.Sound;
	import flash.ui.Keyboard;
	import starling.animation.Transitions;
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.events.KeyboardEvent;
	import flash.sensors.Accelerometer;
	import starling.utils.deg2rad;

	import starling.display.DisplayObject;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	/**
	 * 玩家角色类，负责玩家动画播放、跳跃移动控制
	 * @author Qiao Xiaomeng
	 */
	public class Monkey extends Sprite
	{
		
		// 玩家角色MC对象
		private var characterAnimation:MovieClip;
		// Y轴速度(注意:为负值)
		private var velocityY:Number = -35;
		private var velocityX:Number = -50;
		// 重力
		private var gravity:Number = 3;
		// 速度
		private var velocity:Number;
		// 判断玩家角色是否进行跳跃
		private var isJumping:Boolean = false;
		// Y轴栏位
		public var posY:Number;
		public var posX:Number;
		// 重力感应
		private var accelerometer:Accelerometer;
		// 碰撞检测框架
		private var _boundsRect:Rectangle;
		
		private var upMove:Boolean;
		private var downMove:Boolean;
		
		private var image:Image;
		public var _name:String;
		
		private var _state:int;
		private var _isJumping:Boolean = false;

		private var _isShooting:Boolean = false;
		private var _isHit:Boolean;
		public function Monkey(name:String) 
		{
			super();
			// 初始化
			this.name = name;
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		

		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			this.state = GameConstants.HERO_STATE_RUNNING;
			createMonkey();
			this.x = 100;
			
		
		}
		

		
		private function createMonkey():void 
		{

			
			// 载入MC对象，以实现动画播放
			//monkeyMC = new MovieClip(new Assets().getMCTextures("Monkey", "monkey-run-"));
			//Starling.juggler.add(monkeyMC);
			//this.addChild(monkeyMC);
		
			
			
			characterAnimation = new MovieClip(new Assets().getTextureAtlas("HeartBeatsWithYou").getTextures(name + "_running"), 6);
			Starling.juggler.add(characterAnimation);
			this.addChild(characterAnimation);
			
			
			
		}

		public function jump():void
		{
			// 跳跃
					if ( isJumping == false )
					{	
						// 记录当前Y值
						posY = this.y;
						
						velocity = velocityY;
						
						addEventListener(Event.ENTER_FRAME, onJump);
						isJumping = true;
						//var sound:Sound = new Sound(Assets.getSound("-跳"));
						//sound.play(0, 1);
						
					}
		}
		
		private function onJump(e:Event):void 
		{
			// 跳跃
			this.y +=  velocity;
			velocity += gravity;
			
			if (this.y >= posY)
			{
				this.y = posY;
				removeEventListener(Event.ENTER_FRAME, onJump);
				isJumping = false;
			}
						
			
		
		}
		
		public function shoot():void
		{
			// 跳跃
					if ( _isShooting == false )
					{	
						// 记录当前Y值
						posX = this.x;
						
						velocity = velocityX;
						
						addEventListener(Event.ENTER_FRAME, onShoot);
						_isShooting = true;
					
					}
		}
		
		private function onShoot(e:Event):void 
		{
			// 跳跃
			this.x -=  velocity;
			velocity += gravity;
			
			if (this.x <= posX)
			{
				this.x = posX;
				removeEventListener(Event.ENTER_FRAME, onShoot);
				_isShooting = false;
			}
						
			
			
			
		}
		
		public function hit():void
		{
			if (!this._isHit)
			{
				posX = this.x;
				velocity = velocityY;
				this.addEventListener(Event.ENTER_FRAME, onHit);
				
				this._isHit = true;
			}
			
		}
		
		private function onHit(e:Event):void 
		{
			
			this.x += velocity;
			velocity += 6;
			
			if (this.x >= posX)
			{
				this.x = posX;
				removeEventListener(Event.ENTER_FRAME, onHit);
				_isHit = false;
				
			}
						
			
	
		}
		
		public function get state():int 
		{
			return _state;
		}
		
		public function set state(value:int):void 
		{
			_state = value;
		}

		
	}

}