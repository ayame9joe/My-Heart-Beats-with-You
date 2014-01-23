package gameElements 
{
	import flash.events.TimerEvent;
	import flash.media.Sound;
	import flash.utils.clearInterval;
	import flash.utils.setInterval;
	import flash.utils.Timer;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	/**
	 * ...
	 * @author Qiao Xiaomeng
	 */
	public class Conditioner extends Sprite 
	{
		private var _state:int;
		private var conditionerImage1:Image;
		private var conditionerImage2:Image;
		private var myTimer:Timer;
		private var fps:int = 2000;

		
		public function Conditioner() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			myTimer = new Timer(fps);
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			conditionerImage1 = new Image(new Assets().getTexture("Conditioner1Texture"));
			addChild(conditionerImage1);
			conditionerImage1.visible = true;
			this.state = GameConstants.CONDITIONER_STATE_TRANSPARENT;
			conditionerImage2 = new Image(new Assets().getTexture("Conditioner2Texture"));
			addChild(conditionerImage2);
			conditionerImage2.visible = false;
			
			
		}
		
		private function onEnterFrame(e:Event):void 
		{
			//fps -= 100;
			
			myTimer.addEventListener(TimerEvent.TIMER, changeConditioner);
			myTimer.start();
		}
		
		private function changeConditioner(e:TimerEvent):void 
		{
			trace("定时")
			//var sound:Sound = new Sound(Assets.getSound("HeartBeats"));
					//sound.play(0, 1);
			if (conditionerImage1.visible)
			{
				//conditionerImage2.visible = true;
				conditionerImage1.visible = false;
				
			}
			else 
			{
				conditionerImage1.visible = true;
				//conditionerImage2.visible = false;
				this.state = GameConstants.CONDITIONER_STATE_TRANSPARENT;
			}
			if (conditionerImage2.visible)
			{
				//conditionerImage2.visible = true;
				conditionerImage2.visible = false;
			}
			else 
			{
				conditionerImage2.visible = true;
				//conditionerImage2.visible = false;
				this.state = GameConstants.CONDITIONER_STATE_INTRANSPARENT;
			}
			if (myTimer.delay >= 200)
			{
				myTimer.delay = myTimer.delay - 20;
			}
		}
		
	//	private function reset(e:TimerEvent):void 
		//{
		//	conditionerImage1.visible = false;
	//		conditionerImage2.visible = true;
		//}
		
		public function get state():int 
		{
			return _state;
		}
		
		public function set state(value:int):void 
		{
			_state = value;
		}
		
	}

}