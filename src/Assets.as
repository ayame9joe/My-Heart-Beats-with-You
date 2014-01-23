package  
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.media.Sound;
	import flash.text.Font;
	import flash.utils.Dictionary;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	/**
	 * 资源管理类。
	 * @author Qiao Xiaomeng
	 */
	public class Assets 
	{
		// 字体
		
		// 声音
		
		// 背景
		[Embed(source = "/../assets/BgLayer1.png")]
		public var BgLayer1Texture:Class;
		[Embed(source = "/../assets/BgLayer2.png")]
		public var BgLayer2Texture:Class;
		[Embed(source = "/../assets/BgLayer3.png")]
		public var BgLayer3Texture:Class;
		[Embed(source = "/../assets/BgLayer4.png")]
		public var BgLayer4Texture:Class;
		[Embed(source = "/../assets/Happy Ending.jpg")]
		public var HappyEndingTexture:Class;
		[Embed(source = "/../assets/Bad Ending.jpg")]
		public var BadEndingTexture:Class;
		[Embed(source = "/../assets/片头2.png")]
		public var Background:Class;
		
		// 调节器
		[Embed(source = "/../assets/Conditioner1.png")]
		public var Conditioner1Texture:Class;
		[Embed(source = "/../assets/Conditioner2.png")]
		public var Conditioner2Texture:Class;
		

	
		
		[Embed(source = "/../assets/HeartBeatsWithYou.png")]
		public var HeartBeatsWithYouTexture:Class;
		[Embed(source = "/../assets/HeartBeatsWithYou.xml", mimeType="application/octet-stream")]
		public var HeartBeatsWithYouData:Class;
		
		[Embed(source = "/../assets/beginning.png")]
		public var BeginningTexture:Class;
		[Embed(source = "/../assets/beginning.xml", mimeType="application/octet-stream")]
		public var BeginningData:Class;
		
		
		[Embed(source = "/../assets/title.png")]
		public var TitleTexture:Class;
		[Embed(source = "/../assets/title.xml", mimeType="application/octet-stream")]
		public var TitleData:Class;
		
		
	
		
		// 游戏按钮

		// 材质缓存
		private static var sTextures:Dictionary = new Dictionary();
		private static var sSound:Dictionary = new Dictionary();
		private static var sTextureAtlas:TextureAtlas;
		 private static var sSounds:Dictionary = new Dictionary();
		
		
		// 字体
		[Embed(source = '/../assets/fonts/Jellyka_Estrya_Handwriting.ttf', embedAsCFF = 'false', fontName = 'Jellyka_Estrya_Handwriting')]
		public static var Jellyka_Estrya_Handwriting:Class;

		
		[Embed(source = '/../assets/fonts/迷你简启体.ttf', embedAsCFF = 'false', fontName = '迷你简启体')]
		public static var LittleFont:Class;
		
		
		public static function getFont():Font
		{
			var font:Font = new LittleFont();
			return font;
		}
		
		public function Assets() 
		{
			
		}
		
		
		
		public function getEmbedResource(className:String):*
		{
			var result:*;
			if (this.hasOwnProperty(className))
			{
				var cls:Class = this[className] as Class;
				result = new cls();
			}
			else throw new Error("未找到指定名称的嵌入素材");
			return result;
		}
		
		public function getTexture(name:String):Texture
		{
			var bitmap:Bitmap = getEmbedResource(name) as Bitmap;
			if (bitmap)
			{
				return Texture.fromBitmap(bitmap);
			}
			return null;
			
		}
		
		public function getBitmapData(name:String):BitmapData
		{
			var bitmap:Bitmap = getEmbedResource(name) as Bitmap;
			if (bitmap)
			{
				return bitmap.bitmapData;
				
			}
			return null;
			
		}
		
		public function getTextureAtlas(name:String):TextureAtlas
		{
			var result:TextureAtlas;
			var tBMP:Bitmap = getEmbedResource( name + "Texture" ) as Bitmap;
			var tXML:XML = XML(getEmbedResource( name + "Data" ));
			if( tBMP && tXML )
			{
				result = new TextureAtlas(Texture.fromBitmap(tBMP), tXML);
			}
			return result;
		}
		
		public function getMCTextures(textureAtlasName:String, texturesPrefix:String):Vector.<Texture>
		{
			var result:Vector.<Texture>;
			var atlas:TextureAtlas = getTextureAtlas(textureAtlasName);
			if( atlas )
			{
				result = atlas.getTextures(texturesPrefix);
			}
			return result;
		}
		
		      public static function getSound(name:String):Sound
                {
                        var sound:Sound = sSounds[name] as Sound;

                        if (sound) return sound;
                        else throw new ArgumentError("Sound not found:" + name);
                }

           
				
				
		

	}

}
