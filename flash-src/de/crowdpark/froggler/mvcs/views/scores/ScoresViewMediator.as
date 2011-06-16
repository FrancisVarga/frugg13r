package de.crowdpark.froggler.mvcs.views.scores
{
	import com.greensock.TweenMax;
	import flash.display.MovieClip;

	import de.crowdpark.froggler.mvcs.core.AbstractMediator;

	import flash.events.IEventDispatcher;

	/**
	 * @author Francis Varga
	 */
	public class ScoresViewMediator extends AbstractMediator
	{
		public function ScoresViewMediator(target : IEventDispatcher = null)
		{
			super(target);
		}

		override public function init(view : MovieClip) : void
		{
			super.init(view);

			view.addEventListener(ScoresViewEvent.BACK, onBackClicked);
		}

		private function onBackClicked(event : ScoresViewEvent) : void
		{
			TweenMax.to(view, 0.5, {y:-1500});
		}
	}
}
