package de.crowdpark.froggler.mvcs.commands
{
	import de.crowdpark.froggler.mvcs.core.AbstractCommand;

	/**
	 * @author Francis Varga
	 */
	public class FinishGameCommand extends AbstractCommand
	{
		override public function executeCommand(data : Object = null) : void
		{
			context.root.gotoAndPlay("gameOut");
		}
	}
}