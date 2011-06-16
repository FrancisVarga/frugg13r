package de.crowdpark.froggler.mvcs.commands
{
	import de.crowdpark.froggler.mvcs.core.AbstractCommand;
	/**
	 * @author Francis Varga
	 */
	public class StartGameCommand extends AbstractCommand
	{
		override public function executeCommand(data : Object = null) : void
		{
			this.context.root.gotoAndPlay("titleOut");	
		}

	}
}