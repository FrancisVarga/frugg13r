package de.crowdpark.froggler.mvcs.commands
{
	import de.crowdpark.froggler.mvcs.views.board.BoardView;
	import de.crowdpark.froggler.mvcs.core.AbstractCommand;

	/**
	 * @author Francis Varga
	 */
	public class StartGameCommand extends AbstractCommand
	{
		override public function executeCommand(data : Object = null) : void
		{
			BoardView.Instance;
			this.context.root.gotoAndPlay("gameIn");
		}
	}
}