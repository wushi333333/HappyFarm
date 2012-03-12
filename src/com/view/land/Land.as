package com.view.land
{
	import flash.display.Loader;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	
	public class Land extends Sprite
	{
		public var landWidth:int;
		public var landHeight:int;
		
		private var bg:Loader;
		private var shape:Shape;
		
		public function Land()
		{
			super();
			
			cacheAsBitmap=true;
			landHeight=30;
			landWidth=60;
			bg=new Loader();
			bg.contentLoaderInfo.addEventListener(Event.COMPLETE,dealComplete);
			bg.load(new URLRequest("res/bg/bg.jpg"));
//			addChild(bg);
			
			shape=new Shape();
			addChild(shape);
			
			initLand(6,6);
		}
		
		public function initLand(row:int,col:int):void
		{
			//计算组成land的四个坐标
			var arr:Array=[[-1*row*landWidth,row*landHeight],[0,0],[col*landWidth,col*landHeight],[(col-row)*landWidth,(col+row)*landHeight]];
			var len:int=arr.length;
			shape.graphics.beginFill(0x34AF49);
			shape.graphics.moveTo(arr[0][0],arr[0][1]);
			for(var i:int=1;i<len;i++)
			{
				shape.graphics.lineTo(arr[i][0],arr[i][1]);
			}
			shape.graphics.lineTo(arr[0][0],arr[0][1]);
			shape.graphics.endFill();
			shape.x=400;
			shape.y=(600-shape.height)*0.5;
		}
		
		private function dealComplete(e:Event):void
		{
			bg.contentLoaderInfo.removeEventListener(Event.COMPLETE,dealComplete);
			bg.x=(800-bg.width)*0.5;
			bg.y=(600-bg.height)*0.5;
		}
		
		public function release():void
		{
			bg.contentLoaderInfo.removeEventListener(Event.COMPLETE,dealComplete);
			shape.graphics.clear();
			shape=null;
			while(numChildren>0)
			{
				removeChildAt(0);
			}
			bg.unload();
			bg=null;
			
		}
	}
}