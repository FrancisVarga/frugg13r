package de.crowdpark.froggler.mvcs.core
{
	import utils.number.randomIntegerWithinRange;

	import de.crowdpark.froggler.mvcs.controller.FroggerController;
	import de.crowdpark.froggler.mvcs.controller.FroggerControllerEvent;
	import de.crowdpark.froggler.mvcs.views.board.BoardView;

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
		private var _xEndPointAddOn : uint = 300;
		private var _xStartPointAddOn : uint = 30;
		private var _moveDuration : uint = 16;

		protected function getRandomTargetItem() : MovieClip
		{
			return _targetList[randomIntegerWithinRange(0, _targetList.length - 1)];
		}

		protected function beginMovingItems(event : TimerEvent = null) : void
		{
			var street : MovieClip = this.getRandomTargetItem();

			var item : AbstractBoardToken = new _listOfItems[randomIntegerWithinRange(0, _listOfItems.length - 1)];

			item.targetMovementMC = BoardView.Instance;
			item.xStartPoint = item.width + street.width + _xStartPointAddOn;
			item.xEndpoint = -(item.width + _xEndPointAddOn);
			item.y = street.y;
			item.moveDuration = _moveDuration;

			item.init();
		}

		public function init() : void
		{
			setOfItems();
			initAddItemTimer();
			beginMovingItems();

			FroggerController.Instance.addEventListener(FroggerControllerEvent.DIE, onFrogGetGoal);
			FroggerController.Instance.addEventListener(FroggerControllerEvent.WIN, onFrogGetGoal);
		}

		private function onFrogGetGoal(event : FroggerControllerEvent) : void
		{
			_addingItemTimer.removeEventListener(TimerEvent.TIMER, beginMovingItems);
			_addingItemTimer.reset();
			_addingItemTimer.stop();

			_listOfItems.splice(0, _listOfItems.length - 1);
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
