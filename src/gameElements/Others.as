package gameElements 
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author Qiao Xiaomeng
	 */
	public class Others extends Sprite 
	{
		private var otherBoyImage:Image;
		private var otherGirlImage:Image;
		private var _isBoy:Boolean;
		public function Others() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(e:Event):void 
		{
			this.x -= 10;
		}
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			otherBoyImage = new Image(new Assets().getTextureAtlas("HeartBeatsWithYou").getTexture("男二"));
			otherBoyImage.y = GameConstants.POSITION_BOY_STAND;
			this.addChild(otherBoyImage);
			otherBoyImage.visible = false;
			otherGirlImage = new Image(new Assets().getTextureAtlas("HeartBeatsWithYou").getTexture("女二"));
			otherGirlImage.y = GameConstants.POSITION_GIRL_STAND;
			this.addChild(otherGirlImage);
			otherGirlImage.visible = false;
			this.x = stage.stageWidth;
			
	
			
		}
		
		public function reborn():void
		{
			if (Math.random() > .5)
			{
				otherBoyImage.visible = true;
				otherGirlImage.visible = false;
				isBoy = true;
			}
			else
			{
				otherBoyImage.visible = false;
				otherGirlImage.visible = true;
				isBoy = false;
				}
		}
		
		public function get isBoy():Boolean 
		{
			return _isBoy;
		}
		
		public function set isBoy(value:Boolean):void 
		{
			_isBoy = value;
		}
		
	}

}