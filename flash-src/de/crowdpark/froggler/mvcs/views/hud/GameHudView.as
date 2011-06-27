package de.crowdpark.froggler.mvcs.views.hud
{
	/**
	 * @author Francis Varga
	 */
	public class GameHudView extends game_hud
	{
		private static var _Instance : GameHudView;
		private var _lifeArray : Array;

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
			this.mediator.init(this);

			super.initMediator();
		}

		override protected function initView() : void
		{
			_lifeArray.push(this.getChildByName("life1"));
			_lifeArray.push(this.getChildByName("life2"));
			_lifeArray.push(this.getChildByName("life3"));

			super.initView();
		}

		public function get lifeArray() : Array
		{
			return _lifeArray;
		}
	}
}
