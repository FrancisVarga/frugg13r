package de.crowdpark.froggler.mvcs.views.main {
	import de.crowdpark.froggler.mvcs.core.AbstractMediator;

	import flash.events.IEventDispatcher;

	/**
	 * @author Francis Varga
	 */
	public class MainViewMediator extends AbstractMediator
	{
		public function MainViewMediator(target : IEventDispatcher = null)
		{
			super(target);
		}
	}
}
