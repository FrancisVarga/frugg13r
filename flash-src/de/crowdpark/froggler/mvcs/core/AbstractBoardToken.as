package de.crowdpark.froggler.mvcs.core
{
	/**
	 * @author Francis Varga
	 */
	public class AbstractBoardToken extends AbstractInteractiveComponent
	{
		private var _automove : Boolean = true;

		public function AbstractBoardToken()
		{
			super();
		}

		protected function move() : void
		{
		}

		protected function onMoveComplete() : void
		{
		}

		protected function moveForward() : void
		{
		}

		protected function moveLeft() : void
		{
		}

		protected function moveRight() : void
		{
		}

		protected function moveBack() : void
		{
		}

		protected function moveInALine() : void
		{
		}

		public function set automove(automove : Boolean) : void
		{
			_automove = automove;
		}
	}
}
