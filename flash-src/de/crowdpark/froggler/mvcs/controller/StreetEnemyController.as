package de.crowdpark.froggler.mvcs.controller
{
	import flash.utils.Timer;

	import utils.number.randomIntegerWithinRange;

	import flash.display.MovieClip;

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
		private var _addingItemTimer : Timer;

		public static function get Instance() : StreetEnemyController
		{
			if (!_Instance) _Instance = new  StreetEnemyController();

			return _Instance;
		}

		public function StreetEnemyController()
		{
			_addingItemTimer = new Timer(1000);
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

			beginMovingItems();
		}

		private function beginMovingItems() : void
		{
			var street : MovieClip = this.getRandomStreet();
			var item : Class = _listOfItems[randomIntegerWithinRange(0, _listOfItems.length)];
			street.addChild(new item());
		}

		private function getRandomStreet() : MovieClip
		{
			return _targetList[randomIntegerWithinRange(0, _targetList.length)];
		}

		public function set tartgetList(listOfTargets : Array) : void
		{
			_targetList = listOfTargets;
		}
	}
}
