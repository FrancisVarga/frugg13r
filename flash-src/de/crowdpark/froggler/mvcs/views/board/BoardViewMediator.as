package de.crowdpark.froggler.mvcs.views.board
{
	import de.crowdpark.froggler.mvcs.controller.CollisionDetectionBitMap;
	import de.crowdpark.froggler.mvcs.controller.FroggerController;
	import de.crowdpark.froggler.mvcs.controller.FroggerControllerEvent;
	import de.crowdpark.froggler.mvcs.controller.StreetEnemyController;
	import de.crowdpark.froggler.mvcs.controller.WaterEnemysController;
	import de.crowdpark.froggler.mvcs.core.AbstractMediator;
	import de.crowdpark.froggler.mvcs.views.hud.GameHudView;
	import de.crowdpark.froggler.mvcs.views.hud.GameHudViewEvent;

	import com.greensock.TweenMax;

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;

	/**
	 * @author Francis Varga
	 */
	public class BoardViewMediator extends AbstractMediator
	{
		private var _boardView : BoardView;
		private var _dieContainer : MovieClip;
		private var _dieTween : TweenMax;

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
			FroggerController.Instance.addEventListener(FroggerControllerEvent.DIE, onFrogDie);
		}

		private function onNoLife(event : GameHudViewEvent) : void
		{
		}

		private function onFrogDie(event : FroggerControllerEvent) : void
		{
			_dieContainer = new game_over_container();
			_dieContainer.alpha = 0;
			_dieContainer.addEventListener(Event.ADDED_TO_STAGE, dieContainerAddedToStage);
			view.addChild(_dieContainer);
		}

		private function dieContainerAddedToStage(event : Event) : void
		{
			var startBtn : MovieClip = (_dieContainer.getChildByName("startBtn") as MovieClip);
			startBtn.addEventListener(MouseEvent.CLICK, onStartClicked);

			_dieTween = TweenMax.to(event.target, 0.4, {alpha:1, onReverseComplete:dieTweenReverseComplete});
		}

		private function dieTweenReverseComplete() : void
		{
			view.removeChild(_dieContainer);
			dispatchEvent(new BoardViewEvent(BoardViewEvent.START_GAME));
		}

		private function onStartClicked(event : MouseEvent) : void
		{
			_dieTween.reverse();
		}

		private function setTargetLists() : void
		{
			WaterEnemysController.Instance.targetList = _boardView.waterArray;
			StreetEnemyController.Instance.targetList = _boardView.streetArray;
			FroggerController.Instance.boardMC = _boardView;
		}

		private function onStartGame(event : BoardViewEvent = null) : void
		{
			WaterEnemysController.Instance.init();
			StreetEnemyController.Instance.init();
			CollisionDetectionBitMap.Instance.init();
		}
	}
}
