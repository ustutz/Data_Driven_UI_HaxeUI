package ddui.factory;
import haxe.ui.components.CheckBox;
import haxe.ui.components.DropDown;
import haxe.ui.components.Label;
import haxe.ui.components.TextField;
import haxe.ui.data.ArrayDataSource;


class ElementFactory {

	public static function createCheckBox():CheckBox {
		
		var checkbox = new CheckBox();
		return checkbox;
	}
	
	public static function createDropdown():DropDown {
		var dropdown = new DropDown();
		dropdown.dataSource = new ArrayDataSource();
		return dropdown;
	}
	
	public static function createText( text:String ):Label {
		var label = new Label();
		label.text = text;
		return label;
	}
	
	public static function createTextinput():TextField {
		var input = new TextField();
		return input;
	}
	
	public static function createLabel( text:String ):Label {
		var labelText = upperFirst( splitAtUppercaseLetters( filterIs( text )));
		return createText( labelText );
	}
	
	static function filterIs( s:String ):String {
		
		if ( ~/^is/.match( s )) {
			return s.substr( 2 );
		}
		return s;
	}
	
	static function splitAtUppercaseLetters( s:String ):String {
		
		var ereg:EReg = ~/([A-Z][a-z0-9]+)/;
		var v = "";
		if( ereg.match( s )) {
			v = ereg.matchedLeft();
		}
		while ( ereg.match( s )) {
			v += " " + ereg.matched( 1 );
			s = ereg.matchedRight();
		}

		if( v == "" ) {
			return s;
		} else {
			return StringTools.trim( v );
		}
	}
	
	static function upperFirst( s:String ):String {
		return s.charAt( 0 ).toUpperCase() + s.substr( 1 );
	}
	
}