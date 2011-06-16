package de.crowdpark.froggler.mvcs.views.start
{
	import de.crowdpark.froggler.mvcs.commands.StartGameCommand;
	import de.crowdpark.froggler.mvcs.core.AbstractMediator;
	import de.crowdpark.froggler.mvcs.views.scores.ScoresView;
	import de.crowdpark.froggler.utils.dump;

	import flash.display.MovieClip;
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

		override public function init(view : MovieClip) : void
		{
			view.addEventListener(StartViewEvent.START_GAME, onStartGame);
			view.addEventListener(StartViewEvent.SHOW_SCORE, onShowScore);

			super.init(view);
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
			new StartGameCommand();
		}
	}
}
