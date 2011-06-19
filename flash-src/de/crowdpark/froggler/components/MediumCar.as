package de.crowdpark.froggler.components
{
	import com.greensock.TweenMax;

	import flash.display.MovieClip;

	/**
	 * @author Francis Varga
	 */
	public class MediumCar extends game_carMedium
	{
		private var _targetMovementMC : MovieClip;
		private var _xEndpoint : int;

		public function MediumCar()
		{
			super();
		}

		public function init() : void
		{
			if (!_targetMovementMC) throw new Error();

			_targetMovementMC.addChild(this);

			begintoMove();
		}

		private function begintoMove() : void
		{
			TweenMax.to(this, 1, {x:xEndpoint, onComplete:onMoveComplete});
		}

		private function onMoveComplete() : void
		{
			this.dispose();
			
			_targetMovementMC.removeChild(this);
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
	}
}