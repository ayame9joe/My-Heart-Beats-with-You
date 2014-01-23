package  
{
	/**
	 * ...
	 * @author Qiao Xiaomeng
	 */
	public class GameConstants 
	{
		public static const GAME_STATE_IDLE:int = 0;
		public static const GAME_STATE_PLAYING:int = 1;
		public static const GAME_STATE_OVER:int = 2;
		
		public static const HERO_MIN_SPEED:Number = 650;
		
		public static const HERO_STATE_IDLE:int = 0;
		public static const HERO_STATE_RUNNING:int = 1;
		public static const HERO_STATE_JUMP:int = 2;
		public static const HERO_STATE_SHOOT:int = 3;
		public static const HERO_STATE_HIT:int = 4;
		
		public static const CONDITIONER_STATE_TRANSPARENT:int = 0;
		public static const CONDITIONER_STATE_INTRANSPARENT:int = 1;
		
		public static const SCREEN_MOVE_SPEED:int = 5;
		
		public static const POSITION_BOY_STAND:int = 600;
		public static const POSITION_GIRL_STAND:int = 250;
		
		public function GameConstants() 
		{
			
		}
		
	}

}