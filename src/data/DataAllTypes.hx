package data;
import data.Data;

/**
 * ...
 * @author Urs Stutz
 */
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

	public function new( id:Int, isYesOrNo:Bool, number:Float, amount:Int, someText:String, choice:Choices, selection:Selection, onlyOneSelection:Selection ) {
		
		super( id );
		
		this.isYesOrNo = isYesOrNo;
		this.number = number;
		this.amount = amount;
		this.someText = someText;
		this.choice = choice;
		this.selection = selection;
		this.onlyOneSelection = onlyOneSelection;
	}
	
	override public function copy():DataAllTypes {
		return new DataAllTypes( id, isYesOrNo, number, amount, someText, choice, selection,onlyOneSelection );
	}
}