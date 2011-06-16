package de.crowdpark.froggler.mvcs.core
{
	import flash.events.EventDispatcher;

	/**
	 * @author Francis Varga
	 */
	public class AbstractModel extends EventDispatcher
	{
		private var _dataProvider : Array;

		public function AbstractModel()
		{
			this._dataProvider = new Array();
		}

		public function get dataProvider() : Array
		{
			return _dataProvider;
		}
	}
}
