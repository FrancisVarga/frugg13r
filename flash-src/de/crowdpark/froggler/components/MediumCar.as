package de.crowdpark.froggler.components
{
	import com.greensock.TweenMax;

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.IEventDispatcher;

	/**
	 * @author Francis Varga
	 */
	public class MediumCar extends game_carMedium
	{
		private var _targetMovementMC : MovieClip;
		private var _xEndpoint : int;
		private var _xStartPoint : int;

		public function MediumCar()
		{
			super();
		}

		public function init() : void
		{
			if (!_targetMovementMC) throw new Error();

			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			this.x = this._xStartPoint;

			_targetMovementMC.addChild(this);
		}

		private function onAddedToStage(event : Event) : void
		{
			IEventDispatcher(event.currentTarget).removeEventListener(event.type, arguments['callee']);
			move();
		}

		override protected function move() : void
		{
			TweenMax.to(this, 1, {x:xEndpoint, onComplete:onMoveComplete});
		}

		override protected function onMoveComplete() : void
		{
			
		}

		public function get xEndpoint() : int
		{
			return _xEndpoint;
		}

		public function set targetMovementMC(targetMovementMC : MovieClip) : void
		{
			_targetMovementMC = targetMovementMC;
		}

		public function set xEndpoint(xEndpoint : int) : void
		{
			_xEndpoint = xEndpoint;
		}

		public function set xStartPoint(xStartPoint : int) : void
		{
			_xStartPoint = xStartPoint;
		}
	}
}