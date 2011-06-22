package de.crowdpark.froggler.mvcs.views.start
{
	import de.crowdpark.froggler.mvcs.commands.StartGameCommand;
	import de.crowdpark.froggler.mvcs.core.AbstractMediator;
	import de.crowdpark.froggler.mvcs.views.scores.ScoresView;

	import com.greensock.TweenMax;

	import flash.events.IEventDispatcher;

	/**
	 * @author Francis Varga
	 */
	public class StartViewMediator extends AbstractMediator
	{
		public function StartViewMediator(target : IEventDispatcher = null)
		{
			super(target);
		}

		override protected function registerEvents() : void
		{
			view.addEventListener(StartViewEvent.START_GAME, onStartGame);
			view.addEventListener(StartViewEvent.SHOW_SCORE, onShowScore);
		}

		override public function dispose() : void
		{
			view.removeEventListener(StartViewEvent.START_GAME, onStartGame);
			view.removeEventListener(StartViewEvent.SHOW_SCORE, onShowScore);
		}

		private function onShowScore(event : StartViewEvent) : void
		{
			ScoresView.Instance;
		}

		private function onStartGame(event : StartViewEvent) : void
		{
			TweenMax.to(view, 0.3, {alpha:0});
			new StartGameCommand();
		}
	}
}
