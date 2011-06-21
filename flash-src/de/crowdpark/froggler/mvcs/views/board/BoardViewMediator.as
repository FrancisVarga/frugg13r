package de.crowdpark.froggler.mvcs.views.board
{
	import com.adobe.serialization.json.JSON;

	import de.crowdpark.froggler.mvcs.controller.CollisionController;
	import de.crowdpark.froggler.mvcs.controller.FroggerController;
	import de.crowdpark.froggler.mvcs.controller.StreetEnemyController;
	import de.crowdpark.froggler.mvcs.controller.WaterEnemysController;
	import de.crowdpark.froggler.mvcs.core.AbstractMediator;

	import flash.display.MovieClip;
	import flash.events.Event;

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

		override public function dispose() : void
		{
			_boardView.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
		}

		override protected function registerEvents() : void
		{
			view.addEventListener(BoardViewEvent.START_GAME, onStartGame);
		}

		private function onStartGame(event : BoardViewEvent) : void
		{
			CollisionController.Instance.targetView = _boardView;
			CollisionController.Instance.init();

			WaterEnemysController.Instance.targetList = _boardView.waterArray;
			WaterEnemysController.Instance.init();

			StreetEnemyController.Instance.tartgetList = _boardView.streetArray;
			StreetEnemyController.Instance.init();

			FroggerController.Instance.boardMC = _boardView;

			_boardView.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}

		private function onEnterFrame(event : Event) : void
		{
			var collisions : Array = CollisionController.Instance.getCollisions();

			if (collisions.length)
			{
				trace(JSON.encode(collisions));
			}
		}
	}
}
