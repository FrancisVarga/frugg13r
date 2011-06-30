package de.crowdpark.froggler.mvcs.core
{
	import flash.display.MovieClip;

	/**
	 * @author Francis Varga
	 */
	public class AbstractWay extends MovieClip
	{
		protected var _direction : uint;
		protected var _isWinnerStage : Boolean;
		protected var _speed : uint;
		protected var _itemClass : Class;

		public function get direction() : uint
		{
			return _direction;
		}

		public function set direction(direction : uint) : void
		{
			_direction = direction;
		}

		public function get isWinnerStage() : Boolean
		{
			return _isWinnerStage;
		}

		public function set isWinnerStage(isWinnerStage : Boolean) : void
		{
			_isWinnerStage = isWinnerStage;
		}

		public function get speed() : uint
		{
			return _speed;
		}

		public function set speed(speed : uint) : void
		{
			_speed = speed;
		}

		public function get itemClass() : Class
		{
			return _itemClass;
		}

		public function set itemClass(itemClass : Class) : void
		{
			_itemClass = itemClass;
		}
	}
}
