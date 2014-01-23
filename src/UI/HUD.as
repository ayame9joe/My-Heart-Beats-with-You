package UI 
{
	import events.NavigationEvent;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author Qiao Xiaomeng
	 */
	public class HUD extends Sprite 
	{
		private var hudDistanceImage:Image;
		private var hudBoyImage:Image;
		private var hudGirlImage:Image;
		private var _scoreDistance:Number;
		
		
		public function HUD() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			
		}
		
		private function onEnterFrame(e:Event):void 
		{
			if (hudBoyImage.bounds.intersects(hudGirlImage.bounds))
			{
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, {id: "happy ending"}, true));
			}
			
			if (hudBoyImage.x >= hudDistanceImage.x + 50)
			{
				hudBoyImage.x --;
			}
			if (hudGirlImage.x <= hudDistanceImage.x + hudDistanceImage.width - 40 - 50)
			{
				hudGirlImage.x ++;
			}
			if (hudBoyImage.x <= hudDistanceImage.x)
			{
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, {id: "bad ending"}, true));
			}
		}
		

		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			hudDistanceImage = new Image(new Assets().getTextureAtlas("HeartBeatsWithYou").getTexture("槽3 副本"));
			addChild(hudDistanceImage);
			hudBoyImage = new Image(new Assets().getTextureAtlas("HeartBeatsWithYou").getTexture("槽1 副本"));
			addChild(hudBoyImage);
			hudGirlImage = new Image(new Assets().getTextureAtlas("HeartBeatsWithYou").getTexture("槽2 副本"));
			addChild(hudGirlImage);
			
			hudBoyImage.x = - hudBoyImage.width / 2;
			hudBoyImage.y = - hudBoyImage.height / 2;
			hudGirlImage.x = - hudGirlImage.width / 2;
			hudGirlImage.y = - hudGirlImage.height / 2;
			
			hudDistanceImage.x = 50;
			hudDistanceImage.y = 50;
			
			hudBoyImage.x = hudDistanceImage.x + hudDistanceImage.width / 2;
			hudBoyImage.y = hudDistanceImage.y - hudBoyImage.height / 2 - 15;
			
			hudGirlImage.x = hudDistanceImage.x + hudDistanceImage.width / 2;
			hudGirlImage.y = hudDistanceImage.y - hudGirlImage.height / 2 - 15;
			
			scoreDistance = 0;
		}
		
		public function getScore():void
		{
			hudBoyImage.x = hudBoyImage.x + 5;
			hudGirlImage.x = hudGirlImage.x - 5;
		}
		
		public function loseScore():void
		{
			hudBoyImage.x = hudBoyImage.x - 5;
			hudGirlImage.x = hudGirlImage.x + 5;
		}
		
		public function get scoreDistance():Number 
		{
			return _scoreDistance;
		}
		
		public function set scoreDistance(value:Number):void 
		{
			_scoreDistance = value;
		}
		
	}

}