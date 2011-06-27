package de.crowdpark.froggler.mvcs.controller
{
	import de.crowdpark.froggler.mvcs.commands.FinishGameCommandEvent;

	import utils.display.wait;

	import de.crowdpark.froggler.mvcs.commands.FinishGameCommand;

	import com.greensock.TweenMax;

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;

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
		private var _movementDuration : uint = 0.3;
		private var _died : Boolean;

		public static function get Instance() : FroggerController
		{
			if (!_Instance) _Instance = new  FroggerController();

			return _Instance;
		}

		public function FroggerController()
		{
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}

		override protected function onAddedToStage(event : Event) : void
		{
			_died = false;
			IEventDispatcher(event.currentTarget).removeEventListener(event.type, arguments['callee']);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDownHandler);
		}

		public function die() : void
		{
			_froggerMC.gotoAndPlay(_deadAnimationKeyName);
			_died = true;
			dispatchEvent(new FroggerControllerEvent(FroggerControllerEvent.DIE));
			wait(40, onWaitComplete);
		}

		private function onWaitComplete() : void
		{
			new FinishGameCommand().addEventListener(FinishGameCommandEvent.GAME_OUT_COMPLETE, onGameOutComplete);
		}

		private function onGameOutComplete(event : FinishGameCommandEvent) : void
		{
			IEventDispatcher(event.currentTarget).removeEventListener(event.type, arguments['callee']);
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
			this.x = 0;
			this.y = 0;
			_froggerMC = null;
			_moveVerticalFactor = 32;
			_moveHorizontalFactor = 32;
			_died = false;

			_defaultX = this.x += this.width / 2;
			_moveHorizontalFactor += _defaultX;

			_defaultY = this.y += this.height / 2;
			_moveVerticalFactor += _defaultY;

			_froggerMC = (this.getChildByName("frog") as MovieClip);
			_froggerMC.gotoAndPlay(_idleAnimationKeyName);
		}

		private function onKeyDownHandler(event : KeyboardEvent) : void
		{	
			
			if(_died) return;
			
			var keyCode : uint = event.keyCode;

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
			TweenMax.to(this, _movementDuration, {shortRotation:{rotation:180}});
			_froggerMC.gotoAndPlay(_moveAnimationKeyName);
			this.moveVertical(_moveVerticalFactor.toString());
		}

		override protected function moveForward() : void
		{
			TweenMax.to(this, _movementDuration, {shortRotation:{rotation:0}});
			_froggerMC.gotoAndPlay(_moveAnimationKeyName);
			this.moveVertical("-" + _moveVerticalFactor.toString());
		}

		override protected function moveRight() : void
		{
			TweenMax.to(this, _movementDuration, {shortRotation:{rotation:90}});
			_froggerMC.gotoAndPlay(_moveAnimationKeyName);
			this.moveHorizontal(_moveHorizontalFactor.toString());
		}

		override protected function moveLeft() : void
		{
			TweenMax.to(this, _movementDuration, {shortRotation:{rotation:270}});
			_froggerMC.gotoAndPlay(_moveAnimationKeyName);
			this.moveHorizontal("-" + _moveHorizontalFactor.toString());
		}

		private function moveHorizontal(factor : String) : void
		{
			var newX : int = this.x + _froggerMC.width + parseInt(factor);

			if (newX > 810) return;
			if (newX < 90) return;

			TweenMax.to(this, 0.4, {x:factor});
		}

		private function moveVertical(factor : String) : void
		{
			var newY : int = this.y + _froggerMC.height + parseInt(factor);

			if (newY > 800) return;
			if (newY < 35) return;

			TweenMax.to(this, 0.4, {y:factor});
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
