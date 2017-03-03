package ddui.data;


class NestedData {
	
	public var selected:Bool;
	public var count:Int;

	public function new( selected:Bool, count:Int ) {
		this.selected = selected;
		this.count = count;
	}
	
	public function toString():String {
		return	" selected " + Std.string( selected )
				+ " count " + Std.string( count );
	}
}