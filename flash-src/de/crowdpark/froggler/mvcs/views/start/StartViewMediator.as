package de.crowdpark.froggler.mvcs.views.start {
	import de.crowdpark.froggler.mvcs.commands.StartGameCommand;
	import de.crowdpark.froggler.mvcs.core.AbstractMediator;
	import de.crowdpark.froggler.mvcs.core.AbstractViewEvent;
	import de.crowdpark.froggler.mvcs.views.scores.ScoresView;

	import com.greensock.TweenMax;

	import flash.events.IEventDispatcher;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;

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
			view.addEventListener(AbstractViewEvent.SHOW_COMPLETE, onShowComplete);
			view.addEventListener(AbstractViewEvent.HIDE_COMPLETE, onHideComplete);
		}

		private function onHideComplete(event : AbstractViewEvent) : void
		{
			view.stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		}

		private function onShowComplete(event : AbstractViewEvent) : void
		{
			view.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		}

		private function onKeyDown(event : KeyboardEvent) : void
		{
			switch(event.keyCode)
			{
				case Keyboard.ENTER:
					onStartGame(new StartViewEvent(StartViewEvent.START_GAME));
					break;
				default :
					break;
			}
		}

		override public function dispose() : void
		{
			view.removeEventListener(StartViewEvent.START_GAME, onStartGame);
			view.removeEventListener(StartViewEvent.SHOW_SCORE, onShowScore);
			view.removeEventListener(AbstractViewEvent.SHOW_COMPLETE, onShowComplete);
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
