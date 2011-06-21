package de.crowdpark.froggler.mvcs.core
{
	import flash.display.MovieClip;
	/**
	 * @author Francis Varga
	 */
	public class AbstractWay extends MovieClip
	{
		private var _direction : Boolean;
		
		public function get direction() : Boolean
		{
			return _direction;
		}

		public function set direction(direction : Boolean) : void
		{
			_direction = direction;
		}
	}
}
