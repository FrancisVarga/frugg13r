package de.crowdpark.froggler.mvcs.core
{
	import flash.events.IEventDispatcher;

	/**
	 * @author Francis Varga
	 */
	public interface IInteractiveComponent extends IEventDispatcher
	{
		function show():void
		function hide():void
		function dispose():void
	}
}
