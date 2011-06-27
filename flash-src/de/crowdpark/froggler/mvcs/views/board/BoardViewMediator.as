package de.crowdpark.froggler.mvcs.views.board
{
	import de.crowdpark.froggler.mvcs.controller.CollisionDetectionBitMap;
	import de.crowdpark.froggler.mvcs.controller.FroggerController;
	import de.crowdpark.froggler.mvcs.controller.StreetEnemyController;
	import de.crowdpark.froggler.mvcs.controller.WaterEnemysController;
	import de.crowdpark.froggler.mvcs.core.AbstractMediator;

	import flash.display.MovieClip;

	/**
	 * @author Francis Varga
	 */
	public class BoardViewMediator extends AbstractMediator
	{
		private var _boardView : BoardView;

		override public function init(view : MovieClip) : void
		{
			_boardView = (view as BoardView);
			setTargetLists();

			super.init(view);
		}

		override public function dispose() : void
		{
		}

		override protected function registerEvents() : void
		{
			view.addEventListener(BoardViewEvent.START_GAME, onStartGame);
		}

		private function setTargetLists() : void
		{
			WaterEnemysController.Instance.targetList = _boardView.waterArray;
			StreetEnemyController.Instance.targetList = _boardView.streetArray;
			FroggerController.Instance.boardMC = _boardView;
		}

		private function onStartGame(event : BoardViewEvent) : void
		{
			WaterEnemysController.Instance.init();
			StreetEnemyController.Instance.init();
			CollisionDetectionBitMap.Instance.init();
		}
	}
}
