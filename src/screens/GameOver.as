package screens 
{
	import starling.display.Sprite;
	import starling.events.Event;
	/**
	 * ...
	 * @author Qiao Xiaomeng
	 */
	public class GameOver extends Sprite 
	{
		
		public function GameOver() 
		{
			super();
			this.visible = false;
			
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
		}
		
		public function initialize():void
		{
			this.visible = true;
		}
		
	}

}