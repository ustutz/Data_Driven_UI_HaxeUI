package ddui.data;
import ddui.data.Data;

enum Choices {
	First;
	Second;
	Third;
}
 
class DataAllTypes  extends Data {
	
	public var isYesOrNo:Bool;
	public var number:Float;
	public var amount:Int;
	public var someText:String;
	public var choice:Choices;
	public var selection:Selection;
	public var onlyOneSelection:Selection;
	public var nestedData:NestedData;

	public function new( id:Int, isYesOrNo:Bool, number:Float, amount:Int, someText:String, choice:Choices, selection:Selection, onlyOneSelection:Selection, nestedData:NestedData ) {
		
		super( id );
		
		this.isYesOrNo = isYesOrNo;
		this.number = number;
		this.amount = amount;
		this.someText = someText;
		this.choice = choice;
		this.selection = selection;
		this.onlyOneSelection = onlyOneSelection;
		this.nestedData = nestedData;
	}
	
	override public function copy():DataAllTypes {
		return new DataAllTypes( id, isYesOrNo, number, amount, someText, choice, selection, onlyOneSelection, nestedData );
	}
	
	override public function toString():String {
		
		return 	super.toString() 
				+ " isYesOrNo: " + Std.string( isYesOrNo )
				+ " number: " + Std.string( number )
				+ " amount: " + Std.string( amount )
				+ " someText: " + Std.string( someText )
				+ " choice: " + Std.string( choice )
				+ " selection: " + Std.string( selection )
				+ " onlyOneSelection: " + Std.string( onlyOneSelection )
				+ " nestedData: " + Std.string( nestedData );
	}
}