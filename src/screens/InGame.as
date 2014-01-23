package  screens
{
	import events.DrawEvent;
	import events.NavigationEvent;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.media.Sound;
	import flash.utils.setInterval;
	import gameElements.Others;
	import gameElements.Telephone;
	import starling.text.TextField;

	import flash.utils.clearInterval;
	import flash.utils.getTimer;
	import flash.utils.setTimeout;
	import flash.utils.Timer;
	import gameElements.Bubble;
	import gameElements.Character;
	import gameElements.Conditioner;
	import gameElements.Enemy;
	import gameElements.GameBackground;
	import gameElements.Heart;
	import gameElements.Monkey;
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import UI.HUD;
	
	/**
	 * ...
	 * @author Qiao Xiaomeng
	 */
	public class InGame extends Sprite 
	{
		
		// 背景
		private var bg:GameBackground;
		
		// 角色
		private var boy:Monkey;
		private var girl:Monkey;
		
		// 角色速度
		private var playerSpeed:Number;
		
		// 触控互动
		private var touch:Touch;
		private var touchPoint:Point;
		
		// 游戏状态
		private var gameState:int;
		
		// 游戏暂停
		private var gamePaused:Boolean;
		
		// 敌人
		private var enemies:Vector.<Enemy>;
		
		// 泡泡
		private var bubbles:Vector.<Bubble>;
		
		// 心
		private var hearts:Vector.<Heart>;
		
		// 电话
		private var telephones:Vector.<Telephone>;
		
		private var telephone:Telephone;
		private var others:Others;
		
		// HUD
		private var hud:HUD;
		
		// 计时器
		private var myTimer:Timer = new Timer(1000);
		private var myTimer1:Timer = new Timer(5000);
		private var _gameBegin:Boolean = false;
	
		
		// 控制器
		private var conditioner:Conditioner;
		
		// 泡泡生成位置
		private var bubblesBornPoint:Point;
		
		// 游戏区域
		private var boyGameArea:Rectangle;
		private var girlGameArea:Rectangle;
		
		
		
		/** Time calculation for animation. */
		private var timePrevious:Number;
		private var timeCurrent:Number;
		private var elapsed:Number;
		
		var hasDrawBubble:Boolean = false;
		
		private var hasDrawHeart:Boolean = false;
		
		
		
		private var tutorialTimer:Timer = new Timer(5000);
		
		public function InGame() 
		{
			super();
			this.visible = false;
			if (gameBegin)
			{
				addEventListener(Event.ADDED_TO_STAGE, init);
			}
		}
		

		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);

			initialize();
		}
		
		private function drawGame():void 
		{
			trace("绘制游戏")
			bg = new GameBackground();
			addChild(bg);
			
			conditioner = new Conditioner();
			addChild(conditioner);
			
			girl = new Monkey("girl");
			girl.y = GameConstants.POSITION_GIRL_STAND;
			addChild(girl);			
			boy = new Monkey("boy");
			boy.y = GameConstants.POSITION_BOY_STAND;
			addChild(boy);
			

			
			enemies = new Vector.<Enemy>;
			bubbles = new Vector.<Bubble>;
			hearts = new Vector.<Heart>;
			telephones = new Vector.<Telephone>;
			
			
			this.addEventListener(DrawEvent.DRAW_HEART, onDrawHeart);
			
			var tutorialText:TextField = new TextField(960, 200, "", Assets.getFont().fontName, 24, 0xffffff);
			tutorialText.x = 0;
			tutorialText.y = 600;
			addChild(tutorialText);
			
			
			drawTelephone();
			
			var timer:Number;
			clearInterval(timer);
			var times:int = 0;
			timer = setInterval(function()
				{
					times ++;
					trace(times)
					switch(times){
					case 1:
						tutorialText.text = "点击上下屏幕使用两个人物的能力"
						break;
					case 2:
						tutorialText.text = "使用跳跃躲避"
						break;
					case 3:
						tutorialText.text = "使用冲刺攻击"
						break;
					case 4:
						tutorialText.text = "成功攻击可传递心意"
						break;
					case 5:
						tutorialText.text = "心意通过心跳即可为另一屏幕带来一颗红心"
						break;
					case 6:
						tutorialText.text = "但只有心跳为亮色时才能成功传递"
						break;
					case 7:
						tutorialText.text = "使用电话击败另一屏幕的敌人"
						break;
					case 8:
						tutorialText.text = "运用多种方法，拉近心灵的距离"
						break;
					
						
					}
				}, 2000);
				
				
			drawEnemy();	
			telephone = new Telephone();
			addChild(telephone);
			telephone.visible = false;
			others = new Others();
			addChild(others);
			others.visible = false;
			
			
		}
		
		private function drawTelephone():void 
		{
			myTimer1.addEventListener(TimerEvent.TIMER, createPhone);
			myTimer1.start();
		}
		
		private function createPhone(e:TimerEvent):void 
		{
			myTimer1.delay = 5000;
			others.reborn();
			others.visible = true;
			telephone.visible = true;
			telephone.x = stage.stageWidth;
			others.x = stage.stageWidth;
			if (others.isBoy)
			{
				telephone.y = GameConstants.POSITION_GIRL_STAND - 50;
				
			}
			else {
				telephone.y = GameConstants.POSITION_BOY_STAND - 50;
				
				}telephone.visible = true;
		}
		
		private function onDrawHeart(e:DrawEvent):void 
		{
			

				return;
		}
		
		private function drawHUD():void 
		{
			hud = new HUD();
			addChild(hud);
		}
		
		private function gameLoop(e:Event):void 
		{
			
							
							animateEnemy();
							
							animateHeart();
						
							animateBubble();	
							
							animatePhone();
							
	
		}
		
		private function animatePhone():void 
		{
			if (others.visible && others.bounds.intersects(boy.bounds))
			{
				hud.loseScore();
				boy.hit();
			}
			if (telephone.visible && others.bounds.intersects(boy.bounds))
			{
				others.visible = false;
				hud.getScore();
				telephone.visible = false;
			}
						if (others.visible && others.bounds.intersects(girl.bounds))
			{
				hud.loseScore();
				boy.hit();
			}
			if (telephone.visible && others.bounds.intersects(girl.bounds))
			{
				others.visible = false;
				hud.getScore();
				telephone.visible = false;
			}
			
		}
		
		

		

		
		private function drawEnemy():void 
		{
			myTimer.addEventListener(TimerEvent.TIMER, createEnemy);
			myTimer.start();
		}
		
		private function createEnemy(e:TimerEvent):void 
		{
			myTimer.delay = new RandomRange().randomRange(500, 2000);
			var enemy:Enemy = new Enemy(new RandomRange().randomRange(1,3));
			addChild(enemy);
			enemies.push(enemy);		
		}
		
		private function animateEnemy():void 
		{
			
			var enemyToTrack:Enemy;
			for ( var i:uint = 0; i < enemies.length - 1; i++ )
			{
				enemyToTrack = enemies[i];
				
				if (boy.x == 100 && enemyToTrack.alreadyHit == false && enemyToTrack.bounds.intersects(boy.bounds))
				{
					
					enemyToTrack.alreadyHit = true;
					trace("碰到敌人");
				
					hud.loseScore();
					boy.hit();
				}
				else if (boy.x > 100 && enemyToTrack.alreadyHit == false && enemyToTrack.bounds.intersects(boy.bounds))
				{
					enemyToTrack.alreadyHit = true;
					trace("击中敌人");
				
					hud.getScore();
					bubblesBornPoint = new Point(enemyToTrack.x, enemyToTrack.y);
					enemyToTrack.dispose();
					enemies.splice(i, 1);
					drawBubble();
				}
				if (girl.x == 100 && enemyToTrack.alreadyHit == false && enemyToTrack.bounds.intersects(girl.bounds))
				{
					
					enemyToTrack.alreadyHit = true;
					trace("碰到敌人");
					trace("碰到敌人");
				
					girl.hit();
					hud.loseScore();
					
				}
				else if (girl.x > 100 && enemyToTrack.alreadyHit == false && enemyToTrack.bounds.intersects(girl.bounds))
				{
					enemyToTrack.alreadyHit = true;
					trace("击中敌人");
				
					hud.getScore();
					bubblesBornPoint = new Point(enemyToTrack.x, enemyToTrack.y);
					enemyToTrack.dispose();
					enemies.splice(i, 1);
					drawBubble();
				}
				
			}
		}
		
		private function drawBubble():void 
		{
			var bubble:Bubble = new Bubble();
			bubble.x = bubblesBornPoint.x;
			bubble.y = bubblesBornPoint.y;

			addChild(bubble);
			bubbles.push(bubble);
		}
		
		private function animateBubble():void 
		{
			var hSpeed:int = 10;
			var vSpeed:int = 20;
			var bubbleToTrack:Bubble;
			for ( var i:uint = 0; i < bubbles.length - 1; i++ )
			{
				bubbleToTrack = bubbles[i];
			
					if (bubbleToTrack.alreadyHitbyConditioner == false && bubbleToTrack.bounds.intersects(conditioner.bounds) && conditioner.state == GameConstants.CONDITIONER_STATE_TRANSPARENT)
					{
						bubbleToTrack.alreadyHitbyConditioner = true;
						drawHeart();
						bubbleToTrack.dispose();
						bubbles.splice(i, 1);
						//hasDrawHeart = false;
					}
					
					 if (bubbleToTrack.alreadyHitbyConditioner == false && conditioner.state == GameConstants.CONDITIONER_STATE_INTRANSPARENT && bubbleToTrack.bounds.intersects(conditioner.bounds))
					{
						bubbleToTrack.alreadyHitbyConditioner = true;
						trace("光球消去");
						// TODO:各种精灵的dispose()方法
						bubbleToTrack.dispose();
						bubbles.splice(i, 1);
					}

				
			}
		}
		
		private function drawHeart():void 
		{

			var heart:Heart = new Heart();
			heart.x = this.stage.stageWidth;
			this.addChild(heart);
			hearts.push(heart);
			
			
			
		}
		
		private function animateHeart():void 
		{
			var heartToTrack:Heart;
			for (var i:uint = 0; i < hearts.length - 1; i++)
			{
				heartToTrack = hearts[i];
				if (heartToTrack.alreadyHit == false && heartToTrack.bounds.intersects(boy.bounds))
				{
					heartToTrack.alreadyHit = true;
		
					hud.getScore();
					heartToTrack.dispose();
					hearts.splice(i, 1);
				}
				if (heartToTrack.alreadyHit == false && heartToTrack.bounds.intersects(girl.bounds))
				{
					heartToTrack.alreadyHit = true;
				
					hud.getScore();
					heartToTrack.dispose();
					hearts.splice(i, 1);
				}
			}
		}
		
		private function onTouch(e:TouchEvent):void 
		{
			
			touch = e.getTouch(e.target as DisplayObject);
			if (touch)
			{
				
				if (touch.phase == TouchPhase.ENDED)
				{
					touchPoint = touch.getLocation(e.target as DisplayObject);
					if (touchPoint.y < this.stage.stageHeight / 2)
					{
						trace("上");
						boy.jump();
						girl.shoot();
					}
					else
					{
						boy.shoot();
						girl.jump();
					}
					
				}
			}
			
			
		}
		
		public function initialize():void
		{
			// Dispose screen temporarily.
			//disposeTemporarily();
			
			drawGame();
			drawHUD();
			
			// Calculate elapsed time.
			this.addEventListener(Event.ENTER_FRAME, calculateElapsed);
			
			
			// 初始化
			gameState = GameConstants.GAME_STATE_IDLE;
			

			gamePaused = false;
			
		
			
			playerSpeed = 15;
			//TODO:确定游戏区域
			boyGameArea = new Rectangle();
			girlGameArea = new Rectangle();
			
			
			addEventListener(TouchEvent.TOUCH, onTouch);
			addEventListener(Event.ENTER_FRAME, gameLoop);
			
			bubblesBornPoint = new Point(stage.stageWidth / 2, stage.stageHeight / 2);
			

			
			
		}
		
		private function disposeTemporarily():void
		{
			this.visible = false;
			
			if (this.hasEventListener(Event.ENTER_FRAME)) this.removeEventListener(Event.ENTER_FRAME, calculateElapsed);
			
			if (this.hasEventListener(TouchEvent.TOUCH)) this.removeEventListener(TouchEvent.TOUCH, onTouch);
			
			if (this.hasEventListener(Event.ENTER_FRAME)) this.removeEventListener(Event.ENTER_FRAME, gameLoop);
		}
		
		private function calculateElapsed(event:Event):void
		{
			// Set the current time as the previous time.
			timePrevious = timeCurrent;
			
			// Get teh new current time.
			timeCurrent = getTimer(); 	
			
			// Calcualte the time it takes for a frame to pass, in milliseconds.
			elapsed = (timeCurrent - timePrevious) * 0.001; 
		}
		
		
		public function alphaDicrease():void
		{
			
		}
		public override function dispose():void
		{
			
			this.removeChildren();
			this.removeEventListeners();
			myTimer.removeEventListener(TimerEvent.TIMER, createEnemy);
			///super.dispose();
		}
		
		public function get gameBegin():Boolean 
		{
			return _gameBegin;
		}
		
		public function set gameBegin(value:Boolean):void 
		{
			_gameBegin = value;
		}
		
	}

}