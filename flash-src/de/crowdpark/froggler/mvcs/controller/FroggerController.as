package de.crowdpark.froggler.mvcs.controller {
	import utils.display.wait;

	import de.crowdpark.froggler.mvcs.commands.FinishGameCommandEvent;

	import com.greensock.TweenMax;

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;

	/**
	 * @author Francis Varga
	 */
	public class FroggerController extends FroggerContainer
	{
		private static var _Instance : FroggerController;
		private var _froggerMC : MovieClip;
		private var _boardMC : MovieClip;
		private var _moveHorizontalFactor : uint = 32;
		private var _moveVerticalFactor : uint = 32;
		private var _defaultX : int;
		private var _defaultY : int;
		private var _moveAnimationKeyName : String = "jump";
		private var _deadAnimationKeyName : String = "dead";
		private var _idleAnimationKeyName : String = "idle";
		private var _dissappearAnimationKeyName : String = "dissappear";
		private var _movementRotationDuration : int = 0.2;
		private var _movementDuration : int = 0.4;
		private var _died : Boolean = false;
		private var _waitDurationAfterShowSplashDieScreen : uint = 30;
		private var _topLeftPoint : Point;
		private var _xCord : int;
		private var _yCord : int;
		private var _centerPoint : Point;
		public var isFloaTing : Boolean;

		public function FroggerController()
		{
			_centerPoint = new Point(this.x, this.y);
			_topLeftPoint = new Point(this.width / 2, this.height / 2);
			_xCord = _topLeftPoint.x;
			_yCord = _topLeftPoint.y;
		}

		public function get xCord() : int
		{
			return _xCord;
		}

		public function get yCord() : int
		{
			return _yCord;
		}

		public function get topLeftPoint() : Point
		{
			return _topLeftPoint;
		}

		public function  get centerPoint() : Point
		{
			return _centerPoint;
		}

		public static function get Instance() : FroggerController
		{
			if (!_Instance) _Instance = new  FroggerController();

			return _Instance;
		}

		override protected function onAddedToStage(event : Event) : void
		{
			IEventDispatcher(event.currentTarget).removeEventListener(event.type, arguments['callee']);
			_died = false;
		}

		public function die() : void
		{
			_froggerMC.gotoAndPlay(_deadAnimationKeyName);
			_died = true;
			dispatchEvent(new FroggerControllerEvent(FroggerControllerEvent.DIE));
			wait(_waitDurationAfterShowSplashDieScreen, onGameOutComplete);
		}

		private function onGameOutComplete(event : FinishGameCommandEvent = null) : void
		{
			if (event) IEventDispatcher(event.currentTarget).removeEventListener(event.type, arguments['callee']);
			dispatchEvent(new FroggerControllerEvent(FroggerControllerEvent.SHOW_DIE_SPLASH));
			init();
		}

		public function win() : void
		{
			_froggerMC.gotoAndPlay(_dissappearAnimationKeyName);
		}

		override protected function clickState(event : MouseEvent) : void
		{
			return;
		}

		override protected function overState(event : MouseEvent) : void
		{
			return;
		}

		override protected function idleState(event : MouseEvent) : void
		{
			return;
		}

		override public function init() : void
		{
			if (stage.hasEventListener(KeyboardEvent.KEY_DOWN)) stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDownHandler);

			this.x = 0;
			this.y = 0;
			_froggerMC = null;
			_moveVerticalFactor = 64;
			_moveHorizontalFactor = 64;
			_died = false;
			_defaultX = 0;
			_defaultY = 0;

			_defaultX = this.x += this.width / 2;

			this.y = _boardMC.height - (80 + this.height / 2);
			_defaultY += this.height / 2;

			_froggerMC = (this.getChildByName("frog") as MovieClip);
			_froggerMC.gotoAndPlay(_idleAnimationKeyName);
		}

		private function onKeyDownHandler(event : KeyboardEvent) : void
		{
			var keyCode : uint = event.keyCode;

			if (_died) return;

			IEventDispatcher(event.currentTarget).removeEventListener(event.type, arguments['callee']);

			switch(keyCode)
			{
				case 38:
					moveForward();
					break;
				case 87:
					moveForward();
					break;
				case 83:
					moveBack();
					break;
				case 40:
					moveBack();
					break;
				case 65:
					moveLeft();
					break;
				case 37:
					moveLeft();
					break;
				case 39:
					moveRight();
					break;
				case 68:
					moveRight();
					break;
				default :
					break;
			}
		}

		override protected function moveBack() : void
		{
			TweenMax.to(this, _movementRotationDuration, {shortRotation:{rotation:180}});
			_froggerMC.gotoAndPlay(_moveAnimationKeyName);
			this.moveVertical(_moveVerticalFactor.toString());
		}

		override protected function moveForward() : void
		{
			TweenMax.to(this, _movementRotationDuration, {shortRotation:{rotation:0}});
			_froggerMC.gotoAndPlay(_moveAnimationKeyName);
			this.moveVertical("-" + _moveVerticalFactor.toString());
		}

		override protected function moveRight() : void
		{
			TweenMax.to(this, _movementRotationDuration, {shortRotation:{rotation:90}});
			_froggerMC.gotoAndPlay(_moveAnimationKeyName);
			this.moveHorizontal(_moveHorizontalFactor.toString());
		}

		override protected function moveLeft() : void
		{
			TweenMax.to(this, _movementRotationDuration, {shortRotation:{rotation:270}});
			_froggerMC.gotoAndPlay(_moveAnimationKeyName);
			this.moveHorizontal("-" + _moveHorizontalFactor.toString());
		}

		private function moveHorizontal(factor : String) : void
		{
			var newX : int = this.x + _froggerMC.width + parseInt(factor);

			if (newX >= 810)
			{
				addKeyboardListener();
				return;
			}

			if (newX <= 90)
			{
				addKeyboardListener();
				return;
			}

			TweenMax.to(this, _movementDuration, {x:factor, onComplete:addKeyboardListener});
		}

		private function moveVertical(factor : String) : void
		{
			var newY : int = this.y + _froggerMC.height + parseInt(factor);

			if (newY >= 800)
			{
				addKeyboardListener();
				return;
			}

			if (newY <= 30)
			{
				addKeyboardListener();
				return;
			}

			TweenMax.to(this, _movementDuration, {y:factor, onComplete:addKeyboardListener});
		}

		public function addKeyboardListener() : void
		{
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDownHandler);
		}

		public function removeKeyboardListener() : void
		{
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDownHandler);
		}

		override public function dispose() : void
		{
			super.dispose();
		}

		public function set boardMC(boardMC : MovieClip) : void
		{
			_boardMC = boardMC;
			_boardMC.addChild(this);
			init();
		}
	}
}
