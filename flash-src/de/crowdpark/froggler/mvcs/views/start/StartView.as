package de.crowdpark.froggler.mvcs.views.start
{
	import utils.display.bringToFront;

	import com.greensock.*;
	import com.greensock.data.*;

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;

	/**
	 * @author Francis Varga
	 */
	public class StartView extends game_start_screen
	{
		private var _startButton : MovieClip;
		private var _scoreButton : MovieClip;
		private static var _Instance : StartView;

		public static function get Instance() : StartView
		{
			if (!_Instance) _Instance = new StartView();

			return _Instance;
		}

		public function StartView()
		{
			super();
		}

		override protected function initView() : void
		{
			this.gameRoot.addChild(this);

			this.x = 1500;
			this.y = 85;
		}

		override protected function initMediator() : void
		{
			this.mediator = new StartViewMediator();
		}

		override public function dispose() : void
		{
			this.hide();
		}

		override public function hide() : void
		{
			TweenLite.to(this, 0.5, {x:1500});
			super.hide();
		}

		override protected function onAddedToStage(event : Event) : void
		{
			_startButton = (this.getChildByName("startBtn") as MovieClip);
			_startButton.addEventListener(MouseEvent.CLICK, onStartClicked);
			_startButton.alpha = 0;

			_scoreButton = (this.getChildByName("scoreBtn") as MovieClip);
			_scoreButton.addEventListener(MouseEvent.CLICK, onScoreClicked);
			_scoreButton.alpha = 0;

			super.onAddedToStage(event);
		}

		private function onScoreClicked(event : MouseEvent) : void
		{
			dispatchEvent(new StartViewEvent(StartViewEvent.SHOW_SCORE));
		}

		private function onStartClicked(event : MouseEvent) : void
		{
			dispatchEvent(new StartViewEvent(StartViewEvent.START_GAME));
		}

		override public function show() : void
		{
			bringToFront(this);

			TweenMax.to(this, 0.5, {x:-41, y:85, alpha:1});

			TweenMax.to(_startButton, 0.5, new TweenMaxVars().autoAlpha(1));
			TweenMax.to(_scoreButton, 0.5, new TweenMaxVars().autoAlpha(1));

			super.show();
		}
	}
}
