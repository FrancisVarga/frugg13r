package de.crowdpark.froggler.mvcs.commands
{
	import de.crowdpark.froggler.mvcs.core.AbstractCommand;
	import de.crowdpark.froggler.mvcs.views.start.StartView;

	import com.greensock.TweenLite;

	/**
	 * @author Francis Varga
	 */
	public class GameInvokerCommand extends AbstractCommand
	{
		override public function executeCommand(data : Object = null) : void
		{			
			
			var background : game_background_container = prepareBackground();
			this.context.root.addChild(background);
			TweenLite.to(background, 0.7, {alpha:1});
			
			StartView.Instance;		
			
		}

		private function prepareBackground() : game_background_container
		{
			var background : game_background_container = new game_background_container();
			background.alpha = 0;
			
			return background;
		}
	}
}
