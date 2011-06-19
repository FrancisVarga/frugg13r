package de.crowdpark.froggler.mvcs.controller
{
	import de.crowdpark.froggler.components.SmallCarYellow;
	import de.crowdpark.froggler.components.SmallCarBlue;
	import de.crowdpark.froggler.components.LongCar;
	import de.crowdpark.froggler.components.MediumCar;

	/**
	 * @author Francis Varga
	 */
	public class StreetEnemyController
	{
		private static var _Instance : StreetEnemyController;
		private var _targetList : Array;
		private var _listOfItems : Array;

		public static function get Instance() : StreetEnemyController
		{
			if (!_Instance) _Instance = new  StreetEnemyController();

			return _Instance;
		}

		public function dispose() : void
		{
			
		}

		public function init() : void
		{
			_listOfItems = new Array();
			_listOfItems.push(MediumCar);
			_listOfItems.push(LongCar);
			_listOfItems.push(SmallCarBlue);
			_listOfItems.push(SmallCarYellow);
			
			
		}

		public function set tartgetList(listOfTargets : Array) : void
		{
			_targetList = listOfTargets;
		}
	}
}
