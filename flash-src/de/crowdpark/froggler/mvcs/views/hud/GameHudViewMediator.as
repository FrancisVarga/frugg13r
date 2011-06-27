package de.crowdpark.froggler.mvcs.views.hud
{
	import de.crowdpark.froggler.mvcs.controller.FroggerControllerEvent;
	import de.crowdpark.froggler.mvcs.controller.FroggerController;

	import flash.display.MovieClip;

	import de.crowdpark.froggler.mvcs.core.AbstractMediator;

	import flash.events.IEventDispatcher;

	/**
	 * @author Francis Varga
	 */
	public class GameHudViewMediator extends AbstractMediator
	{
		private var _hudView : GameHudView;

		public function GameHudViewMediator(target : IEventDispatcher = null)
		{
			super(target);
		}

		override public function init(view : MovieClip) : void
		{
			_hudView = (view as GameHudView);
			super.init(view);
		}

		override protected function registerEvents() : void
		{
			FroggerController.Instance.addEventListener(FroggerControllerEvent.DIE, onDie);
			FroggerController.Instance.addEventListener(FroggerControllerEvent.WIN, onWin);
		}

		private function onWin(event : FroggerControllerEvent) : void
		{
		}

		private function onDie(event : FroggerControllerEvent) : void
		{
		}
	}
}
