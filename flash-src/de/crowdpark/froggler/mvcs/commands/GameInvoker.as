package de.crowdpark.froggler.mvcs.commands
{
	import de.crowdpark.froggler.mvcs.core.AbstractCommand;

	import com.greensock.TweenLite;
	import com.greensock.easing.Circ;

	/**
	 * @author Francis Varga
	 */
	public class GameInvoker extends AbstractCommand
	{
		override public function executeCommand(data : Object = null) : void
		{			
			this.context.root.addChild(background);
			this.context.root.addChild(startView);	
		}

		private function get background() : game_background_container
		{
			var background : game_background_container = new game_background_container();
			background.alpha = 0;
			
			TweenLite.to(background, 0.7, {alpha:1});
			
			return background;
		}

		private function get startView() : game_start_screen
		{
			var view : game_start_screen = new game_start_screen();
			view.x = 1500;
			view.y = 85;	
			
			TweenLite.to(view, 0.6, {x:-41, delay:0.5, ease: Circ.easeIn});
			
			return view;
		}
	}
}
