package de.crowdpark.froggler.components
{
	import de.crowdpark.froggler.mvcs.core.AbstractWay;

	import flash.events.Event;

	/**
	 * @author Francis Varga
	 */
	public class Water extends AbstractWay
	{
		public function init() : void
		{
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}

		private function onEnterFrame(event : Event) : void
		{
		}
	}
}
