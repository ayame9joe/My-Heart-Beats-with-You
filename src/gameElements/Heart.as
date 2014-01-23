package  gameElements
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author Qiao Xiaomeng
	 */
	public class Heart extends Sprite 
	{
		
		/** Food item visuals. */
		private var heartImage:Image;
		private var _alreadyHit:Boolean;
		
		private var hasDrawHeart:Boolean = false;
		
		public function Heart()
		{
			super();
			
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		
		}
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			// TODO:载入图像
			
			alreadyHit = false;
			if (!hasDrawHeart)
			{
				if (Math.random() > .5)
				{
					this.y = new RandomRange().randomRange(GameConstants.POSITION_GIRL_STAND - 100, GameConstants.POSITION_GIRL_STAND);
					heartImage = new Image(new Assets().getTextureAtlas("HeartBeatsWithYou").getTexture("Heart1"));
					heartImage.x = - heartImage.width / 2;
					heartImage.y = - heartImage.height / 2;
					addChild(heartImage);
				}
				else {
					this.y = new RandomRange().randomRange(GameConstants.POSITION_BOY_STAND - 100, GameConstants.POSITION_BOY_STAND)
					heartImage = new Image(new Assets().getTextureAtlas("HeartBeatsWithYou").getTexture("Heart2"));
					heartImage.x = - heartImage.width / 2;
					heartImage.y = - heartImage.height / 2;
					addChild(heartImage);
				}
				hasDrawHeart = true;
				
			}
			
			// TODO:修复快速点击bug
			
		}
		
		private function onEnterFrame(e:Event):void 
		{
			this.x -= 5;
		}


		public function get alreadyHit():Boolean 
		{
			return _alreadyHit;
		}
		
		public function set alreadyHit(value:Boolean):void 
		{
			_alreadyHit = value;
		}
		
		override public function dispose():void 
		{
			this.removeChildren();
			this.removeEventListeners();
			super.dispose();
		}
		
		
	}
	
	

}