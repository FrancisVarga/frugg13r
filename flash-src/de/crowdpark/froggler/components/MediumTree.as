package de.crowdpark.froggler.components
{

	/**
	 * @author Francis Varga
	 */
	public class MediumTree extends game_treeMedium
	{
		public function MediumTree()
		{
			super();
		}

		override public function get following() : Boolean
		{
			return true;
		}
		
		
		override public function get isAccessible() : Boolean
		{
			return true;
		}

	}
}
