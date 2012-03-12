package com.controller
{
	import com.view.land.Land;

	public class GameControl
	{
		public function GameControl()
		{
		}
		
		public function runOperate(func:String,arr:Array=null):void
		{
			(this[func] as Function).apply(this,arr);
		}
		
		private function showLand():void
		{
			var land:Land=new Land();
			Global.root.addChild(land);
		}
	}
}