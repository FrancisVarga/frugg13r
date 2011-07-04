package de.crowdpark.froggler.mvcs.controller {
	import de.crowdpark.froggler.components.Croc;
	import de.crowdpark.froggler.components.MediumTree;
	import de.crowdpark.froggler.components.SmallTree;
	import de.crowdpark.froggler.components.Turtle;
	import de.crowdpark.froggler.mvcs.core.AbstractEnemyController;

	/**
	 * @author Francis Varga
	 */
	public class WaterEnemysController extends AbstractEnemyController
	{
		private static var _Instance : WaterEnemysController;

		public static function get Instance() : WaterEnemysController
		{
			if (!_Instance) _Instance = new  WaterEnemysController();

			return _Instance;
		}

		override protected function setOfItems() : void
		{
			_listOfItems = new Array();
			_listOfItems.push(Croc);
			_listOfItems.push(MediumTree);
			_listOfItems.push(SmallTree);
			_listOfItems.push(Turtle);
		}
		
	}
}
