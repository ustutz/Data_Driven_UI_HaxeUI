package data;


class Data {
	
	public var id:Int;
	
	public function new( id:Int, ?fieldList ) {
		this.id = id;
	}
	
	public function copy():Data {
		return new Data( id );
	}
}