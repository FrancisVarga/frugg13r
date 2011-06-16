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

		public function AbstractCommand(autoExecute : Boolean = true, data : Object = null)
		{
			this._context = ApplicationContext.Instance;
			
			if(autoExecute) executeCommand(data);
			
		}

		public function executeCommand(data : Object = null) : void
		{
		}

		protected function get context() : ApplicationContext
		{
			return _context;
		}
	}
}
