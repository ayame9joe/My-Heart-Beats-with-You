package events 
{
	import starling.events.Event
	
	/**
	 * ...
	 * @author Qiao Xiaomeng
	 */
	public class DrawEvent extends Event 
	{
		
		public static const DRAW_HEART:String = "drawHeart";
		
		public function DrawEvent() 
		{
			super(DRAW_HEART);
		}
		
	}

}