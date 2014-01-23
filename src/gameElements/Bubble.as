package  gameElements
{
	import starling.display.MovieClip;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	/**
	 * ...
	 * @author Qiao Xiaomeng
	 */
	public class Bubble extends Sprite 
	{
		private var _alreadyHitbyCharacter:Boolean;
		private var _alreadyHitbyConditioner:Boolean;
		
		private var bubbleImage:Image;
		private var bubbleAnimation:MovieClip;
		
		private var newX:Number = 0;
		private var newY:Number = 0;
		 
		private var speed:Number;
		 
		private var speedX:Number;
		private var speedY:Number;
		 
		private var totalDistance:Number;
		private var previousDistance:Number = 0;
		private var currentDistance:Number = 0;
		
		
		private var _isStillAlive:Boolean = true;
		public function Bubble() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// TODO:载入图像
			bubbleAnimation = new MovieClip(new Assets().getTextureAtlas("HeartBeatsWithYou").getTextures("光球"), 6);
			//addChild(bubbleImage);
			Starling.juggler.add(bubbleAnimation);
			addChild(bubbleAnimation);
			alreadyHitbyCharacter = false;
			alreadyHitbyConditioner = false;
			

		 
		this.alpha = .1 + Math.random() * .5;
		//this.scaleX = this.scaleY = .1 + Math.random() * 5;
		 
		speed = Math.round(.5 + Math.random() * 5);
		 
		this.addEventListener(Event.ENTER_FRAME, MoveCircle);
			
		}
		
		private function SetNewPosition()
		{

		this.newX = this.GetRandomXPosition();
		this.newY = this.GetRandomYPosition();
		 
		this.totalDistance = GetDistance();
		 
		var time:Number = this.totalDistance / this.speed;
		 
		speedX = (this.newX - this.x)/time;
		speedY = (this.newY - this.y)/time;

		}
		 

		 
		private function GetRandomXPosition():Number
		{

		//
		//basic formula: Math.floor(Math.random()*(1+High-Low))+Low;
		//
		return Math.floor(Math.random() * (1+ (stage.stageWidth + this.width) + this.width) - this.width);

		}
		 
		private function GetRandomYPosition():Number
		{

		//
		//basic formula: Math.floor(Math.random()*(1+High-Low))+Low;
		//
		return Math.floor(Math.random() * (1+ (stage.stageHeight + this.height) + this.height) - this.height);

		}
		 
		private function GetDistance():Number
		{

		return Math.sqrt(Math.pow(this.x - this.newX,2) + Math.pow(this.y - this.newY,2));

		}
		 
		private function MoveCircle(e:Event)
		{

		this.previousDistance = this.currentDistance;
		this.currentDistance = this.GetDistance();
		 
		if (this.currentDistance < this.previousDistance)
		{

			this.x += this.speedX;
			this.y += this.speedY;

		}
		else
		{

			this.SetNewPosition();

		}
			// TODO:超出屏幕，消去

		}
		
		public function get alreadyHitbyCharacter():Boolean 
		{
			return _alreadyHitbyCharacter;
		}
		
		public function set alreadyHitbyCharacter(value:Boolean):void 
		{
			_alreadyHitbyCharacter = value;
		}
		
		public function get alreadyHitbyConditioner():Boolean 
		{
			return _alreadyHitbyConditioner;
		}
		
		public function set alreadyHitbyConditioner(value:Boolean):void 
		{
			_alreadyHitbyConditioner = value;
		}
		
		public function get isStillAlive():Boolean 
		{
			return _isStillAlive;
		}
		
		public function set isStillAlive(value:Boolean):void 
		{
			_isStillAlive = value;
		}
		
		override public function dispose():void
		{
			isStillAlive = false;
			this.removeChildren();
			this.removeEventListeners();
			super.dispose();
		}
	}

}