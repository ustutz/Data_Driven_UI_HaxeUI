package ddui.contexts;
import ddui.contexts.UI2Data;
import ddui.data.Data;
import ddui.data.FieldData;
import ddui.data.Selection;
import ddui.enums.TValueType;
import haxe.ui.components.CheckBox;
import haxe.ui.components.DropDown;
import haxe.ui.components.Label;
import haxe.ui.components.TextField;
import haxe.ui.data.ArrayDataSource;

class Data2UIData {

	public static function createFieldDatasets<T>( data:T ):Array<FieldData> {
		
		var fieldDatasets:Array<FieldData> = [];
		
		var c = Type.getClass( data );
		var fields = Type.getInstanceFields( c );
		
		for ( field in fields ) {
			
			var value:Dynamic = Reflect.getProperty( data, field );
			var labelElement = createLabel( field ); if( Type.typeof( value ) != TFunction ) trace( 'field: $field' );
			
			switch( Type.typeof( value )) {
			
				case TClass( c ):
					if ( c == String ) {
						
						var inputElement = createTextInput( value );
						fieldDatasets.push( new FieldData( field, TValueType.TString, value, labelElement, inputElement, UI2Data.retrieveString ));
					
					} else if ( c == Selection ) {
						
						if ( value.options.length > 1 ) {
							var selectElement = createDropdown( value.options, value.index );
							fieldDatasets.push( new FieldData( field, TValueType.TSelection, value, labelElement, selectElement, UI2Data.retrieveSelect ));
						} else {
							var selectElement = createText( value.options[0] );
							fieldDatasets.push( new FieldData( field, TValueType.TSelection, value, labelElement, selectElement, UI2Data.retrieveZero ));
						}
					}
				
				case TEnum(_):
					var selectElement = createDropdown( Type.getEnumConstructs( Type.getEnum( value )), Type.enumIndex( value ) );
					fieldDatasets.push( new FieldData( field, TValueType.TEnum, value, labelElement, selectElement, UI2Data.retrieveSelect ));
				
				case TFloat:
					var inputElement = createTextInput( Std.string( value ));
					fieldDatasets.push( new FieldData( field, TValueType.TFloat, value, labelElement, inputElement, UI2Data.retrieveFloat ));
				
				case TInt:
					var inputElement = createTextInput( Std.string( value ));
					fieldDatasets.push( new FieldData( field, TValueType.TInt, value, labelElement, inputElement, UI2Data.retrieveInt ));
				
				case TBool:
					var inputElement = createCheckBox( value );
					fieldDatasets.push( new FieldData( field, TValueType.TBool, value, labelElement, inputElement, UI2Data.retrieveBool ));
				
				case _:
			}
		}
		
		return fieldDatasets;
		
	}
	
	static function createCheckBox( value:Bool ):CheckBox {
		
		var checkbox = new CheckBox();
		checkbox.selected = value;
		
		return checkbox;
	}
	
	public static function createDropdown( options:Array<String>, defaultIndex:Int = 0 ):DropDown {
		
		var dropdown = new DropDown();
		dropdown.dataSource = new ArrayDataSource();
		
		for ( i in 0...options.length ) {
			var optionValue = options[i];
			var optionItem:ListViewItem = { value: optionValue, id: i };
			if ( i == defaultIndex ) {
				dropdown.text = optionValue;
			}
			dropdown.dataSource.add( optionItem );
		}
		
		dropdown.selectedIndex = defaultIndex;
		
		return dropdown;
	}
	
	static function createText( text:String ):Label {
		var label = new Label();
		label.text = text;
		return label;
	}
	
	public static function createTextInput( value:String = "" ):TextField {
		
		var input = new TextField();
		input.text = value;
		return input;
	}
	
	static function createLabel( text:String ):Label {
		
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

