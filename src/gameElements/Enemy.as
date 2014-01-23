package gameElements 
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.utils.rad2deg;
	/**
	 * ...
	 * @author Qiao Xiaomeng
	 */
	public class Enemy extends Sprite 
	{
		private var _alreadyHit:Boolean;
		private var _enemyType:int;
		
		private var enemyImage:Image;
		
		
		public function Enemy(_enemyType:int) 
		{
			super();
			this._enemyType = _enemyType;
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(e:Event):void 
		{
			this.x -= GameConstants.SCREEN_MOVE_SPEED;
			this.rotation += rad2deg(.001);
			if (this.x <= 0)
			this.dispose();
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			// TODO:y值分为两股
			this.x = stage.stageWidth;
			
			
			if (Math.random() > .5)
			{
				this.y = new RandomRange().randomRange(GameConstants.POSITION_GIRL_STAND - 50, GameConstants.POSITION_GIRL_STAND + 50);
				enemyImage = new Image(new Assets().getTextureAtlas("HeartBeatsWithYou").getTexture("EnemyUp" + _enemyType));
				enemyImage.x = - enemyImage.width / 2;
				enemyImage.y = - enemyImage.height / 2;
				addChild(enemyImage);
			}
			else {
				this.y = new RandomRange().randomRange(GameConstants.POSITION_BOY_STAND - 50, GameConstants.POSITION_BOY_STAND + 50)
				enemyImage = new Image(new Assets().getTextureAtlas("HeartBeatsWithYou").getTexture("EnemyDown" + _enemyType));
				enemyImage.x = - enemyImage.width / 2;
				enemyImage.y = - enemyImage.height / 2;
				addChild(enemyImage);
			}
			
			
			alreadyHit = false;
		}
		
		public function get alreadyHit():Boolean 
		{
			return _alreadyHit;
		}
		
		public function set alreadyHit(value:Boolean):void 
		{
			_alreadyHit = value;
		}
		
		public function get enemyType():int 
		{
			return _enemyType;
		}
		
		public function set enemyType(value:int):void 
		{
			_enemyType = value;
		}
		
		override public function dispose():void 
		{
			this.removeChildren();
			this.removeEventListeners();
			super.dispose();
		}
	}

}