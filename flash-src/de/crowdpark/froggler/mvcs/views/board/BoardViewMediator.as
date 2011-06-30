package de.crowdpark.froggler.mvcs.views.board
{
	import de.crowdpark.froggler.mvcs.controller.CollisionDetectionBitMap;
	import de.crowdpark.froggler.mvcs.controller.FroggerController;
	import de.crowdpark.froggler.mvcs.controller.FroggerControllerEvent;
	import de.crowdpark.froggler.mvcs.controller.StreetEnemyController;
	import de.crowdpark.froggler.mvcs.controller.WaterEnemysController;
	import de.crowdpark.froggler.mvcs.core.AbstractMediator;
	import de.crowdpark.froggler.mvcs.views.hud.GameHudView;

	import com.greensock.TweenMax;
	import com.greensock.easing.Linear;

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.events.MouseEvent;
	import flash.text.TextField;

	/**
	 * @author Francis Varga
	 */
	public class BoardViewMediator extends AbstractMediator
	{
		private var _boardView : BoardView;
		private var _dieContainer : MovieClip;
		private var _dieTween : TweenMax;
		private var _startCounterScreen : MovieClip;
		private var _startCounterTextField : TextField;
		private var _startCounterArray : Array;
		private var _waitDuration : uint = 10;

		override public function init(view : MovieClip) : void
		{
			_boardView = (view as BoardView);
			setTargetLists();

			super.init(view);
		}

		override protected function registerEvents() : void
		{
			view.addEventListener(BoardViewEvent.START_GAME, onShowStartSplash);
			view.addEventListener(BoardViewEvent.SHOW_START_SCREEN, onShowStartSplash);
			FroggerController.Instance.addEventListener(FroggerControllerEvent.SHOW_DIE_SPLASH, onShowDieContainer);
		}

		private function onShowStartSplash(event : Event) : void
		{
			onStartGame();

			view.addChild(GameHudView.Instance);

			_startCounterScreen = new game_start_splash_screen();
			_startCounterScreen.alpha = 0;
			_startCounterScreen.addEventListener(Event.ADDED_TO_STAGE, onStartCounterScreenOnStage);
			view.addChild(_startCounterScreen);
		}

		private function onStartCounterScreenOnStage(event : Event) : void
		{
			IEventDispatcher(event.currentTarget).removeEventListener(event.type, arguments['callee']);
			_startCounterTextField = (_startCounterScreen.getChildByName("counterTxt") as TextField);
			_startCounterTextField.selectable = false;

			TweenMax.to(_startCounterScreen, 0.4, {alpha:1, ease:Linear.easeNone, onComplete:onStartCounterScreenShowTweenComplete});
		}

		private function onStartCounterScreenShowTweenComplete() : void
		{
			_startCounterArray = [1];
			TweenMax.to(_startCounterArray, _waitDuration, {endArray:[_waitDuration], onUpdate:onUpdateArray, ease:Linear.easeNone, onComplete:onTweenCounterComplete});
		}

		private function onUpdateArray() : void
		{
			_startCounterTextField.text = uint(_startCounterArray).toFixed();
		}

		private function onTweenCounterComplete() : void
		{
			view.removeChild(_startCounterScreen);
			GameHudView.Instance.startTimeBar();
			FroggerController.Instance.addKeyboardListener();
		}

		private function onShowDieContainer(event : FroggerControllerEvent) : void
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

			_dieTween = TweenMax.to(event.target, 0.4, {alpha:1, ease:Linear.easeNone, onReverseComplete:dieTweenReverseComplete});
		}

		private function dieTweenReverseComplete() : void
		{
			view.removeChild(_dieContainer);
			view.dispatchEvent(new BoardViewEvent(BoardViewEvent.SHOW_START_SCREEN));
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
