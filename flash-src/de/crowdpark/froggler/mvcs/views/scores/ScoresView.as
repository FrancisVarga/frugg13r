package de.crowdpark.froggler.mvcs.views.scores {
	import com.greensock.TweenMax;

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;

	/**
	 * @author Francis Varga
	 */
	public class ScoresView extends popup_scoresContent
	{
		private static var _Instance : ScoresView;
		private var _backButton : MovieClip;

		public static function get Instance() : ScoresView
		{
			if (!_Instance) _Instance = new ScoresView();

			return _Instance;
		}

		public function ScoresView()
		{
			super();
		}

		override protected function initMediator() : void
		{
			this.mediator = new ScoresViewMediator();
		}

		override protected function onAddedToStage(event : Event) : void
		{
			_backButton = (this.getChildByName("scoreBackBtn") as MovieClip);
			_backButton.addEventListener(MouseEvent.CLICK, onBackClicked);

			super.onAddedToStage(event);
		}

		override public function show() : void
		{
			TweenMax.to(this, 0.5, {x:85, y:12});
		}

		private function onBackClicked(event : MouseEvent) : void
		{
			dispatchEvent(new ScoresViewEvent(ScoresViewEvent.BACK));
		}

		override protected function initView() : void
		{
			this.gameRoot.addChild(this);
			this.x = 85;
			this.y = -1000;
			
			super.initView();
		}
	}
}
