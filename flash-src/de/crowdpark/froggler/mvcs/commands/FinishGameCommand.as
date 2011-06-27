package de.crowdpark.froggler.mvcs.commands
{
	import utils.display.wait;

	import de.crowdpark.froggler.mvcs.core.AbstractCommand;
	import de.crowdpark.froggler.mvcs.views.start.StartView;

	/**
	 * @author Francis Varga
	 */
	public class FinishGameCommand extends AbstractCommand
	{
		private static var _Instance : FinishGameCommand;

		public static function get Instance() : FinishGameCommand
		{
			if (!_Instance) _Instance = new  FinishGameCommand();

			return _Instance;
		}

		override public function executeCommand(data : Object = null) : void
		{
			context.root.gotoAndPlay("gameOut");
			wait(40, onWaitComplete);
		}

		private function onWaitComplete() : void
		{
			context.root.gotoAndPlay("titleIn");
			StartView.Instance.show();
			this.dispatchEvent(new FinishGameCommandEvent(FinishGameCommandEvent.GAME_OUT_COMPLETE));
		}
	}
}