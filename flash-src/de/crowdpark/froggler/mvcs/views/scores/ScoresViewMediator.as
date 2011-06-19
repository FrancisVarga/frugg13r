package de.crowdpark.froggler.mvcs.views.scores
{
	import de.crowdpark.froggler.mvcs.core.AbstractMediator;

	import com.greensock.TweenMax;

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

		
		override protected function registerEvents() : void
		{
			view.addEventListener(ScoresViewEvent.BACK, onBackClicked);
		}

		private function onBackClicked(event : ScoresViewEvent) : void
		{
			TweenMax.to(view, 0.5, {y:-1500});
		}
	}
}
