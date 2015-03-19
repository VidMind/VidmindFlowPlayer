package org.flowplayer.controls.controllers{

	import flash.events.EventDispatcher;
	import flash.events.Event;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	public class PlayTimeSimulator extends EventDispatcher {
		public static const TIME_UPDATE:String = "time:update";

		private var _timer:Timer;

		private var _beginTime:Number;
		private var _endTime:Number;

		public function PlayTimeSimulator(begin:Number, end:Number){
			super();

			// validate time range
			if (end <= begin){
				//log.error( "PlayTimeSimulator: End value is less than begin" );
				return;
			}

			_beginTime = begin;
			_endTime   = end;

			// init timer
			_timer = new Timer(1000);

			_timer.addEventListener(TimerEvent.TIMER, onTimerUpdate);
		}

		/**
		 * Get play passed time in seconds
		 */
		public function get current():Number{
			var currentTime:Number = ( new Date() ).time;

			return duration - ( ( _endTime - currentTime ) / 1000 );
		}

		/**
		 * Get play duration in seconds
		 */
		public function get duration():Number{
			return Math.round( ( _endTime - _beginTime ) / 1000 );
		}

		private function onTimerUpdate(event: TimerEvent):void {
			dispatchEvent( new Event( TIME_UPDATE ) );

			if ( isComplete() ){
				_timer.stop();
			}
		}

		public function isComplete():Boolean {
			return current >= duration;
		}
	}
}