package com.view.land
{
	import flash.display.Shape;
	
	public class Land extends Shape
	{
		public var landWidth:int;
		public var landHeight:int;
		
		public function Land()
		{
			super();
			
			cacheAsBitmap=true;
			landHeight=30;
			landWidth=60;
			initLand(6,6);
		}
		
		public function initLand(row:int,col:int):void
		{
			//计算组成land的四个坐标
			var arr:Array=[[-1*row*landWidth,row*landHeight],[0,0],[col*landWidth,col*landHeight],[(col-row)*landWidth,(col+row)*landHeight]];
			trace(arr);
			var len:int=arr.length;
			graphics.lineStyle(1);
			graphics.beginFill(0x000);
			graphics.moveTo(arr[0][0],arr[0][1]);
			for(var i:int=1;i<len;i++)
			{
				graphics.lineTo(arr[i][0],arr[i][1]);
			}
			graphics.lineTo(arr[0][0],arr[0][1]);
			graphics.endFill();
		}
	}
}