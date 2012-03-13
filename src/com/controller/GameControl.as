package com.controller
{
	import com.view.gameview.GameView;
	import com.view.gameview.land.Land;

	public class GameControl
	{
		public function GameControl()
		{
		}
		
		public function runOperate(func:String,arr:Array=null):void
		{
			(this[func] as Function).apply(this,arr);
		}
		
		private function showGameView():void
		{
			var gameview:GameView=new GameView();
			HappyFarm.instance.gameLayer.addChild(gameview);
		}
	}
}