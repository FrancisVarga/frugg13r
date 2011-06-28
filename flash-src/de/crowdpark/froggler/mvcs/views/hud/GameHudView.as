package de.crowdpark.froggler.mvcs.views.hud
{
	import flash.events.Event;

	import com.greensock.TweenMax;

	import flash.display.MovieClip;

	/**
	 * @author Francis Varga
	 */
	public class GameHudView extends game_hud
	{
		private static var _Instance : GameHudView;
		private var _lifeArray : Array;
		private var _timeBar : MovieClip;
		private var _timeBarWidth : uint;
		private var _timeLimit : uint = 30;
		private var _timeBarTween : TweenMax;

		public static function get Instance() : GameHudView
		{
			if (!_Instance) _Instance = new  GameHudView();

			return _Instance;
		}

		public function GameHudView()
		{
			this.x = 570;
			this.y = 700;

			_lifeArray = new Array();
		}

		override protected function initMediator() : void
		{
			this.mediator = new GameHudViewMediator();
			super.initMediator();
		}

		override protected function onAddedToStage(event : Event) : void
		{
			_lifeArray.push(this.getChildByName("life1"));
			_lifeArray.push(this.getChildByName("life2"));
			_lifeArray.push(this.getChildByName("life3"));

			_timeBar = (getChildByName("timeBar") as MovieClip);
			_timeBarWidth = _timeBar.width;
			startTimeBar();

			super.onAddedToStage(event);
		}

		private function onTimeBarTweenComplete() : void
		{
			dispatchEvent(new GameHudViewEvent(GameHudViewEvent.TIME_COMPLETE));
			_timeBar.width = _timeBarWidth;
		}

		public function removeLife() : void
		{
			_timeBarTween.kill();
			_timeBar.width = _timeBarWidth;

			if (_lifeArray.length == 0)
			{
				dispatchEvent(new GameHudViewEvent(GameHudViewEvent.NO_LIFE));
				return;
			}
			else
			{
				var item : MovieClip = _lifeArray.pop();
				TweenMax.to(item, 0.4, {alpha:0});
			}
		}

		public function startTimeBar() : void
		{
			_timeBarTween = TweenMax.to(_timeBar, _timeLimit, {width:0, onComplete:onTimeBarTweenComplete});
		}
	}
}
