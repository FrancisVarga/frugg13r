package de.crowdpark.mvcs
{
	import flash.display.Sprite;

	/**
	 * @author bart
	 */
	public class ApplicationContext
	{
		private var _root : Sprite;

		public function ApplicationContext()
		{
		}

		public function get root() : Sprite
		{
			return _root;
		}

		public function set root(root : Sprite) : void
		{
			_root = root;
		}

		public function init() : void
		{
		}
	}
}
