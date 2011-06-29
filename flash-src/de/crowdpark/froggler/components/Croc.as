package de.crowdpark.froggler.components
{

	/**
	 * @author Francis Varga
	 */
	public class Croc extends game_croc
	{
		public function Croc()
		{
			super();
		}
		
		override public function get isAccessible() : Boolean
		{
			return true;
		}
	}
}
