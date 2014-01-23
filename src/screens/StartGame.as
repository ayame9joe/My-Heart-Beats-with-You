package  screens
{
	import events.NavigationEvent;
	import starling.core.Starling;
	import starling.display.MovieClip;
	import starling.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	
	/**
	 * ...
	 * @author Qiao Xiaomeng
	 */
	public class StartGame extends Sprite 
	{
		// 背景图片
		private var bg:Image;
		
		private var heartAnimation:MovieClip;
		private var fontAnimation:MovieClip;
		private var earthAnimation:MovieClip;
		private var coupleAnimation:MovieClip;
		
		private var flyAnimation:MovieClip;
		// 欢迎字句
		private var startTextField:TextField;
		
		public function StartGame() 
		{
			super();
			this.visible = false;
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(e:Event):void 
		{
			
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onSpaceUp);
			bg  = new Image(new Assets().getTexture("Background"));
			this.addChild(bg);
			//drawScreen();
		}
		
		/*private function drawScreen():void 
		{
			heartAnimation = new MovieClip(new Assets().getTextureAtlas("Beginning").getTextures("heart"), 6);
			Starling.juggler.add(heartAnimation);
			heartAnimation.x = stage.stageWidth / 2 - heartAnimation.width / 2;
			heartAnimation.y = stage.stageHeight / 2 - heartAnimation.height / 2;
			heartAnimation.loop = false;
			heartAnimation.addEventListener(Event.COMPLETE, onHeartCompelte);
			this.addChild(heartAnimation);
			
		
		}
		
		private function onHeartCompelte(e:Event):void 
		{
			this.removeChild(heartAnimation);
			earthAnimation = new MovieClip(new Assets().getTextureAtlas("Beginning").getTextures("地球仪000"), 10);
			Starling.juggler.add(earthAnimation);
			earthAnimation.x = 40;
			earthAnimation.y = 20;
			this.addChild(earthAnimation);
			coupleAnimation = new MovieClip(new Assets().getTextureAtlas("Beginning").getTextures("人000"), 3);
			Starling.juggler.add(coupleAnimation);
			
			coupleAnimation.x = 42;
			coupleAnimation.y = 18;
			this.addChild(coupleAnimation);
			coupleAnimation.addEventListener(Event.COMPLETE, onCoupleComlete);
			/*fontAnimation = new MovieClip(new Assets().getTextureAtlas("Title").getTextures("字000"), 6);
			Starling.juggler.add(fontAnimation);
			fontAnimation.x = 600;
			fontAnimation.y = 400;
			
			fontAnimation.loop = false;
	/*		this.addChild(fontAnimation);*/
		/*}
		
		private function onCoupleComlete(e:Event):void 
		{
			removeChild(coupleAnimation);
			flyAnimation = new MovieClip(new Assets().getTextureAtlas("Beginning").getTextures("飞机000"), 3);
			flyAnimation.x = 40;
			flyAnimation.y = 19;
			flyAnimation.loop = false;
			
			Starling.juggler.add(flyAnimation);this.addChild(flyAnimation);
			flyAnimation.addEventListener(Event.COMPLETE, onFlyComlete);
			
			
		/*}*/
		
		//private function onFlyComlete(e:Event):void 
	//	{
		//	this.removeChild(flyAnimation)
		//}*/
		//*/
		public function initialize():void
		{
			trace("初始化")
			this.visible = true;
			
		}
		
		private function onSpaceUp(e:KeyboardEvent):void 
		{
			trace("按下空格");
			if (e.keyCode == Keyboard.SPACE)
			{
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, {id: "play"}, true));
			}
		}
		
		public function disposeTemporarily():void
		{
			this.visible = false;
		}
	}

}