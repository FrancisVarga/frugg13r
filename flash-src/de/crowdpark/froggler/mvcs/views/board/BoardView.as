package de.crowdpark.froggler.mvcs.views.board
{
	import com.greensock.TweenMax;

	/**
	 * @author Francis Varga
	 */
	public class BoardView extends game_play_container
	{
		private static var _Instance : BoardView;
		private var _streetArray : Array;
		private var _maxStreet : uint = 4;
		private var _waterArray : Array;
		private var _maxWater : uint = 5;

		public static function get Instance() : BoardView
		{
			if (!_Instance) _Instance = new  BoardView();

			return _Instance;
		}

		public function BoardView()
		{
			_streetArray = new Array();
			_waterArray = new Array();

			getStreetMCs();
			getWaterMCs();

			this.alpha = 0;
			this.x = 2000;
			gameRoot.addChild(this);
			TweenMax.to(this, 0.4, {autoAlpha:1, x:0, onComplete:onShowTweenComplete});
		}

		private function onShowTweenComplete() : void
		{
			dispatchEvent(new BoardViewEvent(BoardViewEvent.START_GAME));
		}

		override protected function initMediator() : void
		{
			this.mediator = new BoardViewMediator();
		}

		public function get waterArray() : Array
		{
			return _waterArray;
		}

		public function get streetArray() : Array
		{
			return _streetArray;
		}

		private function getWaterMCs() : void
		{
			for (var i : int = 1; i < _maxWater; i++)
			{
				_waterArray.push(this.getChildByName("water" + i));
			}
		}

		private function getStreetMCs() : void
		{
			for (var i : int = 1; i < _maxStreet; i++)
			{
				_streetArray.push(this.getChildByName("street" + i));
			}
		}
	}
}
