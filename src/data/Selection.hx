package data;

/**
 * ...
 * @author Urs Stutz
 */
class Selection {
	
	public var options:Array<String>;
	public var index:Int;

	public function new( options:Array<String>, index:Int = 0 ) {
		this.options = options;
		this.index = index;
	}
	
}