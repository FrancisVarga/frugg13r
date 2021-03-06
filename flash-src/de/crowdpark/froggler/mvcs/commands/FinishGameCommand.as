package de.crowdpark.froggler.mvcs.commands {
	import utils.display.wait;

	import de.crowdpark.froggler.mvcs.core.AbstractCommand;
	import de.crowdpark.froggler.mvcs.views.start.StartView;

	/**
	 * @author Francis Varga
	 */
	public class FinishGameCommand extends AbstractCommand
	{
		override public function executeCommand() : void
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