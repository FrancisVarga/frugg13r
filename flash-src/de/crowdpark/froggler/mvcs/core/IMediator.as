package de.crowdpark.froggler.mvcs.core {
	import flash.display.MovieClip;
	import flash.events.IEventDispatcher;

	/**
	 * @author Francis Varga
	 */
	public interface IMediator extends IEventDispatcher
	{
		function init(view : MovieClip):void
		function dispose():void
	}
}
