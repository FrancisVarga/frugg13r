package de.crowdpark.froggler.mvcs.services {
	import de.crowdpark.froggler.mvcs.core.AbstractService;

	import flash.events.IEventDispatcher;

	/**
	 * @author Francis Varga
	 */
	public class RESTfulHighScoreService extends AbstractService
	{
		public function RESTfulHighScoreService(target : IEventDispatcher = null)
		{
			super(target);
		}
	}
}
