package de.crowdpark.froggler.mvcs.core
{
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

			_targetMovementMC.addChild(this);
		}

		protected function onAddedToStage(event : Event) : void
		{
			IEventDispatcher(event.currentTarget).removeEventListener(event.type, arguments['callee']);
			move();
		}

		protected function move() : void
		{
		}

		protected function onMoveComplete() : void
		{
			dispose();
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
	}
}
