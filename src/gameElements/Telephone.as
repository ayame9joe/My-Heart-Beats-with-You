package gameElements 
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author Qiao Xiaomeng
	 */
	public class Telephone extends Sprite 
	{
		private var telephoneImage:Image;
		
		public function Telephone() 
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
			telephoneImage = new Image(new Assets().getTextureAtlas("HeartBeatsWithYou").getTexture("电话"));
			this.addChild(telephoneImage);
			this.x = stage.stageWidth;
		}
		
	}

}