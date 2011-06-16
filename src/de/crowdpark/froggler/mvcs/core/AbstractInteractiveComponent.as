package de.crowdpark.froggler.mvcs.core
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	/**
	 * @author Francis Varga
	 */
	public class AbstractInteractiveComponent extends MovieClip
	{
		public function AbstractInteractiveComponent()
		{
			this.stop();

			addEventListener(MouseEvent.CLICK, onClick);
			addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
		}

		protected function onMouseOut(event : MouseEvent) : void
		{
			this.gotoAndStop("idle");
		}

		protected function onMouseOver(event : MouseEvent) : void
		{
			this.gotoAndStop("on");
		}

		protected function onClick(event : MouseEvent) : void
		{
			this.gotoAndStop("click");
		}
	}
}
