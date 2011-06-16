package de.crowdpark.froggler.mvcs.commands
{
	import de.crowdpark.froggler.mvcs.core.AbstractCommand;

	/**
	 * @author Francis Varga
	 */
	public class GameInvoker extends AbstractCommand
	{
		override public function executeCommand(data : Object = null) : void
		{
			var background : game_background_container = new game_background_container();
			this.context.root.addChild(background);	
		}
	}
}
