package de.crowdpark.froggler.mvcs.controller
{
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
		private var _moveHorizontalFactor : uint = 64;
		private var _moveVerticalFactor : uint = 64;
		private var _moveAnimationKeyName : String = "jump";
		private var _deadAnimationKeyName : String = "dead";
		private var _idleAnimationKeyName : String = "idle";
		private var _dissappearAnimationKeyName : String = "dissappear";

		public static function get Instance() : FroggerController
		{
			if (!_Instance) _Instance = new  FroggerController();

			return _Instance;
		}

		public function FroggerController()
		{
			this.x += this.x / 2;
			this.y += this.y / 2;
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}

		private function onAddedToStage(event : Event) : void
		{
			IEventDispatcher(event.currentTarget).removeEventListener(event.type, arguments['callee']);

			_froggerMC = (this.getChildByName("frog") as MovieClip);
			_froggerMC.gotoAndPlay(_idleAnimationKeyName);

			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDownHandler);
		}

		public function die() : void
		{
			_froggerMC.gotoAndPlay(_deadAnimationKeyName);
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

		public function init() : void
		{
			_boardMC.addChild(this);
		}

		private function onKeyDownHandler(event : KeyboardEvent) : void
		{
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
			TweenMax.to(this, 0.2, {shortRotation:{rotation:180}});
			_froggerMC.gotoAndPlay(_moveAnimationKeyName);
			// this.rotation = 180;
		}

		override protected function moveForward() : void
		{
			TweenMax.to(this, 0.2, {shortRotation:{rotation:0}});
//			this.rotation = 0;
			_froggerMC.gotoAndPlay(_moveAnimationKeyName);
		}

		override protected function moveRight() : void
		{
			TweenMax.to(this, 0.2, {shortRotation:{rotation:90}});
//			this.rotation = 90;
			_froggerMC.gotoAndPlay(_moveAnimationKeyName);
		}

		override protected function moveLeft() : void
		{
			TweenMax.to(this, 0.2, {shortRotation:{rotation:270}});
//			this.rotation = 270;
			_froggerMC.gotoAndPlay(_moveAnimationKeyName);
		}

		private function moveHorizontal(factor : int) : void
		{
		}

		private function moveVertical(factor : int) : void
		{
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
			init();
		}
	}
}
