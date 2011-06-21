package de.crowdpark.froggler.mvcs.core
{
	import de.crowdpark.froggler.mvcs.controller.FroggerControllerEvent;
	import de.crowdpark.froggler.mvcs.controller.FroggerController;

	import com.greensock.TweenMax;

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.IEventDispatcher;

	/**
	 * @author Francis Varga
	 */
	public class AbstractBoardToken extends AbstractInteractiveComponent
	{
		protected var _automove : Boolean = true;
		protected var _targetMovementMC : MovieClip;
		protected var _xEndpoint : int;
		protected var _xStartPoint : int;
		protected var _moveDuration : int;
		private var _moveTween : TweenMax;
		private var _alphaTween : TweenMax;
		private var _frog : FroggerController;

		public function AbstractBoardToken()
		{
			super();
		}

		public function set targetMovementMC(targetMovementMC : MovieClip) : void
		{
			_targetMovementMC = targetMovementMC;
		}

		public function init() : void
		{
			if (!_targetMovementMC) throw new Error("Target MC is NULL!!!");

			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			this.x = this._xStartPoint;
			this.alpha = 0;

			_targetMovementMC.addChild(this);
			
			_frog = FroggerController.Instance;
			_frog.addEventListener(FroggerControllerEvent.DIE, onFrogDie);
		}

		private function onFrogDie(event : FroggerControllerEvent) : void
		{
			IEventDispatcher(event.currentTarget).removeEventListener(event.type, arguments['callee']);
			_alphaTween.reverse(true);
		}

		public function set automove(automove : Boolean) : void
		{
			_automove = automove;
		}

		public function set xStartPoint(xStartPoint : int) : void
		{
			_xStartPoint = xStartPoint;
		}

		public function set xEndpoint(xEndpoint : int) : void
		{
			_xEndpoint = xEndpoint;
		}

		public function set moveDuration(moveDuration : int) : void
		{
			_moveDuration = moveDuration;
		}

		override public function dispose() : void
		{
			_moveTween.kill();
			_targetMovementMC.removeChild(this);
		}

		protected function onAddedToStage(event : Event) : void
		{
			IEventDispatcher(event.currentTarget).removeEventListener(event.type, arguments['callee']);
			_alphaTween = TweenMax.to(this, 0.3, {autoAlpha:1, onComplete:move});
		}

		protected function move() : void
		{
			_moveTween = TweenMax.to(this, _moveDuration, {x:_xEndpoint, onComplete:dispose});
		}

		protected function moveForward() : void
		{
		}

		protected function moveLeft() : void
		{
		}

		protected function moveRight() : void
		{
		}

		protected function moveBack() : void
		{
		}

		protected function moveInALine() : void
		{
		}

		public function get isAccessible() : Boolean
		{
			return false;
		}

		public function get following() : Boolean
		{
			return false;
		}
	}
}
