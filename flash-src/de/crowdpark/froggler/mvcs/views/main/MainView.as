package de.crowdpark.froggler.mvcs.views.main
{
	import flash.display.MovieClip;
	import de.crowdpark.froggler.mvcs.commands.StartGameCommand;
	import de.crowdpark.froggler.mvcs.core.AbstractView;

	import flash.events.MouseEvent;

	/**
	 * @author Francis Varga
	 */
	public class MainView extends AbstractView
	{
		private var _startButton : MovieClip;
		private var _scoreButton : MovieClip;
		
		public function MainView()
		{
			super();
		}
			
		override protected function initMediator() : void
		{
			this.mediator = new MainViewMediator();
		}

		override protected function initView() : void
		{
			this._scoreButton = new button_scores();
			this._startButton = new button_start();
			
			this._startButton.addEventListener(MouseEvent.CLICK, onStartClicked);
			this._scoreButton.addEventListener(MouseEvent.CLICK, onScoreClicked);
		}
		
		private function onScoreClicked(event : MouseEvent) : void
		{
			
		}

		private function onStartClicked(event : MouseEvent) : void
		{
			new StartGameCommand();
		}

	}
}
