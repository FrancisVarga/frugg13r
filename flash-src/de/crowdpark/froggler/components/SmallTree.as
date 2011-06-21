package de.crowdpark.froggler.components
{
	/**
	 * @author Francis Varga
	 */
	public class SmallTree extends game_treeSmall
	{
		public function SmallTree()
		{
			super();
		}

		override public function get following() : Boolean
		{
			return true;
		}

		override public function get isAccessible() : Boolean
		{
			return false;
		}
	}
}
