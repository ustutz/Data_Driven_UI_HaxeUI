package ddui.data;

class Selection {
	
	public var options:Array<String>;
	public var index:Int;

	public function new( options:Array<String>, index:Int = 0 ) {
		this.options = options;
		this.index = index;
	}
	
	public function toString():String {
		return index < options.length ? options[index] : "-1";
	}
}