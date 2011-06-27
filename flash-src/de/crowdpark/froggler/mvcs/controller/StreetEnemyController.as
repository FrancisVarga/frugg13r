package de.crowdpark.froggler.mvcs.controller
{
	import de.crowdpark.froggler.components.LongCar;
	import de.crowdpark.froggler.components.MediumCar;
	import de.crowdpark.froggler.components.SmallCarBlue;
	import de.crowdpark.froggler.components.SmallCarYellow;
	import de.crowdpark.froggler.mvcs.core.AbstractEnemyController;

	/**
	 * @author Francis Varga
	 */
	public class StreetEnemyController extends AbstractEnemyController
	{
		private static var _Instance : StreetEnemyController;

		public static function get Instance() : StreetEnemyController
		{
			if (!_Instance) _Instance = new  StreetEnemyController();

			return _Instance;
		}

		override protected function setOfItems() : void
		{
			_listOfItems = new Array();
			_listOfItems.push(MediumCar);
			_listOfItems.push(LongCar);
			_listOfItems.push(SmallCarBlue);
			_listOfItems.push(SmallCarYellow);
		}
	}
}
