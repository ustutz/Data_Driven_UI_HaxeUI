package data;

class DataString extends Data {
	
	public var text1:String;
	public var text2:String;
	public var text3:String;

	public function new( id:Int, text1:String, text2:String, text3:String ) {
		
		super( id );
		
		this.text1 = text1;
		this.text2 = text2;
		this.text3 = text3;
		
	}
	
	override public function copy():DataString {
		return new DataString( id, text1, text2, text3 );
	}
}