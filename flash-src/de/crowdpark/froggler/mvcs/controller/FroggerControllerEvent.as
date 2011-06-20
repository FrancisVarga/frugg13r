package de.crowdpark.froggler.mvcs.controller
{
	import flash.events.Event;

	/**
	 * @author Francis Varga
	 */
	public class FroggerControllerEvent extends Event
	{
		public function FroggerControllerEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
	}
}
