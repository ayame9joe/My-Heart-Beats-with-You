package  
{
	/**
	 * ...
	 * @author Qiao Xiaomeng
	 */
	public class RandomRange 
	{
		

		
		public function randomRange(min:Number, max:Number):Number
		{
			var ramdomNum:Number = Math.floor(Math.random() * ( max - min +1 )) + min;
			return ramdomNum;
		}
		
	}

}