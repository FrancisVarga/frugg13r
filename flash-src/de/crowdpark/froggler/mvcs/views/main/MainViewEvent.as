package de.crowdpark.froggler.mvcs.views.main
{
	import flash.events.Event;

	/**
	 * @author Francis Varga
	 */
	public class MainViewEvent extends Event
	{
		public function MainViewEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
	}
}
