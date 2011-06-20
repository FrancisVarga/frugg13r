package de.crowdpark.froggler.mvcs.views.board
{
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
			super.init(view);
			_boardView = (this.view as BoardView);
		}

		override protected function registerEvents() : void
		{
			view.addEventListener(BoardViewEvent.START_GAME, onStartGame);
		}

		private function onStartGame(event : BoardViewEvent) : void
		{
			trace("onStart");
			WaterEnemysController.Instance.targetList = _boardView.waterArray;
			StreetEnemyController.Instance.tartgetList = _boardView.streetArray;
			FroggerController.Instance.boardMC = _boardView;
		}
		
	}
}
