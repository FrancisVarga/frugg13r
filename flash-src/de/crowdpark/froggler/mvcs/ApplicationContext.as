package de.crowdpark.froggler.mvcs
{
	import de.crowdpark.froggler.mvcs.commands.GameInvokerCommand;

	/**
	 * @author Francis Varga
	 */
	public class ApplicationContext
	{
		private var _root : Main;
		private static var _Instance : ApplicationContext;

		public static function get Instance() : ApplicationContext
		{
			if (!_Instance)
			{
				_Instance = new ApplicationContext();
			}

			return _Instance;
		}

		public function get root() : Main
		{
			return _root;
		}

		public function set root(root : Main) : void
		{
			_root = root;
		}

		public function init() : void
		{
			if (!root)
			{
				throw new Error("root is null");
			}

			this.invokeBootStrap();
		}

		private function invokeBootStrap() : void
		{
			new GameInvokerCommand();
		}
	}
}
