package de.crowdpark.froggler.mvcs.core
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	/**
	 * @author Francis Varga
	 */
	public class AbstractInteractiveComponent extends MovieClip implements IInteractiveComponent
	{
		public function AbstractInteractiveComponent()
		{
			this.stop();

			addEventListener(MouseEvent.CLICK, clickState);
			addEventListener(MouseEvent.MOUSE_UP, idleState);
			addEventListener(MouseEvent.MOUSE_OVER, overState);
			addEventListener(MouseEvent.MOUSE_OUT, idleState);
		}

		protected function idleState(event : MouseEvent) : void
		{
			this.gotoAndStop("idle");
		}

		protected function overState(event : MouseEvent) : void
		{
			this.gotoAndStop("on");
		}

		protected function clickState(event : MouseEvent) : void
		{
			this.gotoAndStop("click");
		}

		public function show() : void
		{
		}

		public function hide() : void
		{
		}

		public function dispose() : void
		{
		}
	}
}
