package de.crowdpark.froggler.mvcs.core
{
	import de.crowdpark.froggler.mvcs.ApplicationContext;

	import flash.events.EventDispatcher;

	/**
	 * @author Francis Varga
	 */
	public class AbstractCommand extends EventDispatcher
	{
		private var _context : ApplicationContext;
		private var _data : Object;

		public function AbstractCommand(autoExecute : Boolean = true, data : Object = null)
		{
			this._context = ApplicationContext.Instance;
			this._data = data;
			
			if (autoExecute) executeCommand();
		}

		public function executeCommand() : void
		{
		}

		protected function get context() : ApplicationContext
		{
			return _context;
		}

		public function get data() : Object
		{
			return _data;
		}

		public function set data(data : Object) : void
		{
			_data = data;
		}
	}
}
