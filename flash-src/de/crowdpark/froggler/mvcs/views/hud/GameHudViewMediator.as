package de.crowdpark.froggler.mvcs.views.hud {
	import de.crowdpark.froggler.mvcs.controller.FroggerController;
	import de.crowdpark.froggler.mvcs.controller.FroggerControllerEvent;
	import de.crowdpark.froggler.mvcs.core.AbstractMediator;

	import flash.display.MovieClip;
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
			if (view is GameHudView) _hudView = (view as GameHudView);
			else new Error();

			super.init(view);
		}

		override protected function registerEvents() : void
		{
			FroggerController.Instance.addEventListener(FroggerControllerEvent.DIE, onDie);
			FroggerController.Instance.addEventListener(FroggerControllerEvent.WIN, onWin);

			view.addEventListener(GameHudViewEvent.NO_LIFE, onNoLife);
			view.addEventListener(GameHudViewEvent.TIME_COMPLETE, onTimeComplete);
		}

		private function onTimeComplete(event : GameHudViewEvent) : void
		{
			FroggerController.Instance.die();
			dispatchEvent(event);
		}

		private function onNoLife(event : GameHudViewEvent) : void
		{
			dispatchEvent(event);
		}

		private function onWin(event : FroggerControllerEvent) : void
		{
		}

		private function onDie(event : FroggerControllerEvent) : void
		{
			_hudView.removeLife();
		}
	}
}
