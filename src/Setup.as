package	
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import starling.core.Starling;
	
	/**
	 * Heart Beats with YOU
	 * 跳跃:躲避障碍(被动)，获得心(主动) 心是传递之后生成的
	 * 冲刺:击破敌人(主动),协助下屏(被动)
	 * 帮助下屏清理敌人(特殊道具)-特殊道具有点少
	 * 传递能量(连击)
	 * 帮助下屏格挡伤害(冲刺)
	 * TODO: 人物 冲刺 下蹲 跳跃，道具，敌人（设计不同类型-高、中、低、速度）,加入道具敌人，碰撞检测，改变背景，传递能量（递增） 逐渐加速 心跳模拟
	 * 男孩女孩 梳理gameLoop
	 * @author Qiao Xiaomeng
	 */
	[SWF(width = "1024", height = "1000", frameRate = "60", backgroundColor = "#ffffff")]
	public class Setup extends Sprite 
	{
		private var _starling:Starling;
		
		public function Setup():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			
		
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			_starling = new Starling(Game, stage);
			_starling.start();
		}
		
	}
	
}