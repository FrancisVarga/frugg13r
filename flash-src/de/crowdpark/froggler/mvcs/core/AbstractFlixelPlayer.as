package de.crowdpark.froggler.mvcs.core
{
	import org.flixel.FlxSprite;

	/**
	 * @author Francis Varga
	 */
	public class AbstractFlixelPlayer extends FlxSprite
	{
		public function AbstractFlixelPlayer(X : Number = 0, Y : Number = 0, SimpleGraphic : Class = null)
		{
			super(X, Y, SimpleGraphic);
		}
	}
}
