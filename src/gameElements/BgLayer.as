/**
 *
 * Hungry Hero Game
 * http://www.hungryherogame.com
 * 
 * Copyright (c) 2012 Hemanth Sharma (www.hsharma.com). All rights reserved.
 * 
 * This ActionScript source code is free.
 * You can redistribute and/or modify it in accordance with the
 * terms of the accompanying Simplified BSD License Agreement.
 *  
 */

package gameElements
{
	import starling.display.BlendMode;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * This class defines each of background layers used in the InGame screen.
	 *  
	 * @author hsharma
	 * 
	 */
	public class BgLayer extends Sprite
	{
		/** Layer identification. */
		private var _layer:int;
		
		/** Primary image. */
		private var image1:Image;
		
		/** Secondary image. */
		private var image2:Image;
		
		/** Parallax depth - used to decide speed of the animation. */
		private var _parallaxDepth:Number;
		
		public function BgLayer(_layer:int)
		{
			super();
			
			this._layer = _layer;
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		/**
		 * On added to stage. 
		 * @param event
		 * 
		 */
		private function onAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
						
			
			image1 = new Image(new Assets().getTexture("BgLayer" + _layer + "Texture"));
			//image1.blendMode = BlendMode.NONE;
			image2 = new Image(new Assets().getTexture("BgLayer" + _layer + "Texture"));
			//image2.blendMode = BlendMode.NONE;


			
			image1.x = 0;
			
			image2.x = image2.width;
			
			this.addChild(image1);
			this.addChild(image2);
		}
		
		/**
		 * Parallax depth. 
		 * 
		 */
		public function get parallaxDepth():Number { return _parallaxDepth; }
		public function set parallaxDepth(value:Number):void { _parallaxDepth = value; }
		
		}

}
