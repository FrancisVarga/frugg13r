package de.crowdpark.froggler.mvcs.services {
	import de.crowdpark.froggler.mvcs.core.AbstractService;
	import de.crowdpark.froggler.mvcs.models.vo.HighScoreVO;

	import flash.net.SharedObject;

	/**
	 * @author Francis Varga
	 */
	public class SharedObjectService extends AbstractService
	{
		private static var _Instance : SharedObjectService;
		private var _sharedObject : SharedObject;
		
		public static function get Instance():SharedObjectService
		{
			if(!_Instance) _Instance = new SharedObjectService();
			
			return _Instance; 
		}
		
		public function init():void
		{
			_sharedObject = SharedObject.getLocal('froggerGame', "/", false);	
		}
		
		public function getHighScore():void
		{
			
		}
		
		public function saveItem(vo : HighScoreVO):void
		{
			
		}
		
		protected function saveItemToSharedObject():void
		{
			
		}
	}
}