package  
{
	import events.NavigationEvent;
	import flash.events.TimerEvent;
	import flash.media.Sound;
	import flash.utils.clearInterval;
	import flash.utils.setInterval;
	import flash.utils.Timer;
	import screens.GameOver;
	import screens.InGame;
	import screens.StartGame;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	/**
	 * ...
	 * @author Qiao Xiaomeng
	 */
	public class Game extends Sprite
	{
		private var screenInGame:InGame;
		private var screenStartGame:StartGame;
		private var screenGameOver:GameOver;
		
		private var badending:Image;
		private var happyending:Image;
		
		private var myTimer:Timer = new Timer(300);
		
		public function Game() 
		{
//			trace(stage.x)
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			initScreens();
			
			
			
	
		}
		
		private function initScreens():void 
		{
			
			
			screenInGame = new InGame();
			screenInGame.addEventListener(NavigationEvent.CHANGE_SCREEN, onInGameNavigation);
			addChild(screenInGame);
			
			screenStartGame = new StartGame();
			addChild(screenStartGame);
			screenStartGame.addEventListener(NavigationEvent.CHANGE_SCREEN, onChangeScreen);
			
			screenGameOver = new GameOver();
			addChild(screenGameOver);
			badending = new Image(new Assets().getTexture("BadEndingTexture"));
					addChild(badending);
					badending.visible = false;
					happyending = new Image(new Assets().getTexture("HappyEndingTexture"));
					addChild(happyending);
					happyending.visible = false;
			screenStartGame.initialize();
		}
		
		private function onInGameNavigation(e:NavigationEvent):void 
		{
			switch (e.params.id)
			{
				case "happay ending":
					myTimer.addEventListener(TimerEvent.TIMER, onHappyEnding)
					myTimer.start();
					
					
				case "bad ending":
					myTimer.addEventListener(TimerEvent.TIMER, onTimer)
					myTimer.start();
					
					
			}
		}
		
		private function onHappyEnding(e:TimerEvent):void 
		{
			screenInGame.alpha -= 0.1;
			if (screenInGame.alpha == 0 ) happyending.visible = true;
			//var sound:Sound = new Sound(Assets.getSound("HappyEnd"));
			//		sound.play(0, 1);
		}
		
		private function onTimer(e:TimerEvent):void 
		{
			screenInGame.alpha -= 0.1;
			if (screenInGame.alpha == 0 ) badending.visible = true;
		//	var sound:Sound = new Sound(Assets.getSound("BadEnd"));
			//		sound.play(0, 1);
			
		}
		
		private function onChangeScreen(event:NavigationEvent):void
		{
			switch (event.params.id)
			{
				case "play":
					
					screenStartGame.visible = false;
					screenInGame.visible = true;
					screenInGame.initialize();
					break;
			}
		}
	}

}