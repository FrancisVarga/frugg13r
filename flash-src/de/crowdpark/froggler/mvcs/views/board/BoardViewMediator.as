package de.crowdpark.froggler.mvcs.views.board
{
	import utils.array.getRandomElement;

	import de.crowdpark.froggler.components.LongCar;
	import de.crowdpark.froggler.components.MediumCar;
	import de.crowdpark.froggler.components.MediumTree;
	import de.crowdpark.froggler.components.SmallCarBlue;
	import de.crowdpark.froggler.components.SmallTree;
	import de.crowdpark.froggler.components.Street;
	import de.crowdpark.froggler.components.Turtle;
	import de.crowdpark.froggler.components.Water;
	import de.crowdpark.froggler.mvcs.controller.CollisionDetectionBitMap;
	import de.crowdpark.froggler.mvcs.controller.FroggerController;
	import de.crowdpark.froggler.mvcs.controller.FroggerControllerEvent;
	import de.crowdpark.froggler.mvcs.core.AbstractMediator;
	import de.crowdpark.froggler.mvcs.core.AbstractWay;
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
		private var _waitDuration : uint = 4;
		private var _streetArray : Array;
		private var _maxStreet : uint = 4;
		private var _waterArray : Array;
		private var _maxWater : uint = 5;

		override public function init(view : MovieClip) : void
		{
			_waterArray = new Array();
			_streetArray = new Array();

			super.init(view);
			_boardView = (view as BoardView);
			setTargetLists();
		}

		override protected function registerEvents() : void
		{
			view.addEventListener(BoardViewEvent.START_GAME, onShowStartSplash);
			view.addEventListener(BoardViewEvent.SHOW_START_SCREEN, onShowStartSplash);
			FroggerController.Instance.addEventListener(FroggerControllerEvent.SHOW_DIE_SPLASH, onShowDieContainer);
		}

		private function onShowStartSplash(event : Event) : void
		{
			CollisionDetectionBitMap.Instance.init();

			getWaterMCs();
			getStreetMCs();

			onStartGame();

			view.addChild(GameHudView.Instance);

			_startCounterScreen = new game_start_splash_screen();
			_startCounterScreen.alpha = 0;
			_startCounterScreen.addEventListener(Event.ADDED_TO_STAGE, onStartCounterScreenOnStage);
			view.stage.addChild(_startCounterScreen);
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
			view.stage.removeChild(_startCounterScreen);
			GameHudView.Instance.startTimeBar();
			FroggerController.Instance.addKeyboardListener();
			CollisionDetectionBitMap.Instance.init();
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
			// WaterEnemysController.Instance.targetList = this._waterArray;
			// StreetEnemyController.Instance.targetList = this._streetArray;
			FroggerController.Instance.boardMC = _boardView;
		}

		private function onStartGame(event : BoardViewEvent = null) : void
		{
			// WaterEnemysController.Instance.init();
			// StreetEnemyController.Instance.init();
			// CollisionDetectionBitMap.Instance.init();
		}

		private function getWaterMCs() : void
		{
			var waterItems : Array = [Turtle, MediumTree, SmallTree, SmallTree];

			for (var i : int = 1; i < _maxWater; i++)
			{
				var water : Water = (view.getChildByName("water" + i) as Water);
				water.direction = i % 2;
				water.itemClass = getRandomElement(waterItems);
				_waterArray.push(configureWay(water));
			}

			CollisionDetectionBitMap.Instance.waterRawItems = _waterArray;
		}

		private function getStreetMCs() : void
		{
			var streetItems : Array = [LongCar, MediumCar, SmallCarBlue, SmallCarBlue, SmallCarBlue, SmallCarBlue];

			for (var i : int = 1; i < _maxStreet; i++)
			{
				var street : Street = (view.getChildByName("street" + i) as Street);
				street.direction = i % 2;
				street.itemClass = getRandomElement(streetItems);
				_streetArray.push(configureWay(street));
			}
		}

		private function configureWay(item : AbstractWay) : AbstractWay
		{
			var speedArray : Array = [18, 20, 18, 19, 20, 19, 22];
			item.speed = getRandomElement(speedArray);
			item.init();
			return item;
		}

		public function get waterList() : Array
		{
			return _waterArray;
		}

		public function get streetList() : Array
		{
			return _streetArray;
		}
	}
}
