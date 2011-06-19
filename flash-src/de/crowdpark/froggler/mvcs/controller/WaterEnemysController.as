package de.crowdpark.froggler.mvcs.controller
{
	/**
	 * @author Francis Varga
	 */
	public class WaterEnemysController
	{
		private static var _Instance : WaterEnemysController;
		private var _targetList : Array;
		
		public static function get Instance() : WaterEnemysController
		{
			if (!_Instance) _Instance = new  WaterEnemysController();

			return _Instance;
		}

		public function set targetList(targetList : Array) : void
		{
			_targetList = targetList;
		}
		
		
	}
}
