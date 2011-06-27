package de.crowdpark.froggler.mvcs.commands
{
	import de.crowdpark.froggler.mvcs.core.AbstractCommand;
	import de.crowdpark.froggler.mvcs.views.board.BoardView;

	/**
	 * @author Francis Varga
	 */
	public class StartGameCommand extends AbstractCommand
	{
		override public function executeCommand(data : Object = null) : void
		{
			BoardView.Instance.startGame();
			this.context.root.gotoAndPlay("gameIn");
		}
	}
}