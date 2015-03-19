package org.flowplayer.controls.config {

    public class PlayTimeSimulatorConfig {
    	private var _enabled:Boolean = false;
    	private var _beginTime:Number = 0;
    	private var _endTime:Number = 0;

    	public function get enabled():Boolean {
    		return _enabled;
    	}

    	public function set enabled(value: Boolean):void {
    		_enabled = value;
    	}

    	public function get beginTime():Number {
    		return _beginTime;
    	}

    	/**
    	 * Setter for "_beginTime" property, expecting timestamp
    	 */
    	public function set beginTime(value: Number):void {
    		_beginTime = value;
    	}

    	public function get endTime():Number {
    		return _endTime;
    	}

    	/**
    	 * Setter for "_endTime" property, expecting timestamp
    	 */
    	public function set endTime(value: Number):void {
    		_endTime = value;
    	}
    }
}