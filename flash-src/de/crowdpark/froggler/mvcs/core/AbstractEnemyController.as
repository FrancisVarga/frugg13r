package de.crowdpark.froggler.mvcs.core
{
	import utils.number.randomIntegerWithinRange;

	import flash.display.MovieClip;
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	/**
	 * @author Francis Varga
	 */
	public class AbstractEnemyController extends EventDispatcher
	{
		protected var _targetList : Array;
		protected var _timerDurationToAddItem : uint = 1000;
		protected var _addingItemTimer : Timer;
		protected var _listOfItems : Array;

		protected function getRandomTargetItem() : MovieClip
		{
			return _targetList[randomIntegerWithinRange(0, _targetList.length - 1)];
		}

		protected function beginMovingItems(event : TimerEvent = null) : void
		{
			var street : MovieClip = this.getRandomTargetItem();
			var item : AbstractBoardToken = new _listOfItems[randomIntegerWithinRange(0, _listOfItems.length - 1)];

			item.targetMovementMC = street;
			item.xStartPoint = item.width + street.width + 30;
			item.xEndpoint = -(item.width + 300);
			item.moveDuration = 16;
			item.init();
		}

		public function init() : void
		{
			setOfItems();
			initAddItemTimer();
			beginMovingItems();
		}

		protected function initAddItemTimer() : void
		{
			_addingItemTimer = new Timer(_timerDurationToAddItem);
			_addingItemTimer.addEventListener(TimerEvent.TIMER, beginMovingItems);
			_addingItemTimer.start();
		}

		protected function setOfItems() : void
		{
		}

		public function set targetList(targetList : Array) : void
		{
			_targetList = targetList;
		}

		public function set timerDurationToAddItem(timerDurationToAddItem : uint) : void
		{
			_timerDurationToAddItem = timerDurationToAddItem;
		}

		public function get targetList() : Array
		{
			return _targetList;
		}
	}
}
