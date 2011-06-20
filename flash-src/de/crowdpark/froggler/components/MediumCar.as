package de.crowdpark.froggler.components
{
	import com.greensock.TweenMax;

	/**
	 * @author Francis Varga
	 */
	public class MediumCar extends game_carMedium
	{
		public function MediumCar()
		{
			super();
		}

		override protected function move() : void
		{
			// TweenMax.to(this, 1, {x:_, onComplete:onMoveComplete});
		}
	}
}