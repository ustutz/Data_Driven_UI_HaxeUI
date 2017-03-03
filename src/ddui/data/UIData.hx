package ddui.data;
import ddui.data.fieldTypes.BoolField;
import ddui.data.fieldTypes.EnumField;
import ddui.data.fieldTypes.FloatField;
import ddui.data.fieldTypes.IDataField;
import ddui.data.fieldTypes.IntField;
import ddui.data.fieldTypes.SelectField;
import ddui.data.fieldTypes.StringField;
import haxe.ui.core.Component;
import ddui.factory.ElementFactory;

typedef ListViewItem = {
	var value:String;
}

class UIData {

	var mainData:Dynamic;
	public var components:Array<Component> = [];
	var dataFields:Array<IDataField> = [];
	
	public function new( mainData:Dynamic ) {
		this.mainData = mainData;
	}
	
	public function init():Void {
		
		initData( mainData );
	}
	
	function initData( data:Dynamic ) {
	
		var c = Type.getClass( data );
		var fields = Type.getInstanceFields( c );
		
		for ( field in fields ) {
			
			var value:Dynamic = Reflect.getProperty( data, field );
			var labelElement = ElementFactory.createLabel( field );
			
			switch( Type.typeof( value )) {
			
				case TClass( c ):
					if ( c == String ) {
						var textInput = ElementFactory.createTextinput();
						dataFields.push( new StringField( data, field, textInput ));
						components.push( labelElement );
						components.push( textInput );
					
					} else if ( c == Selection ) {
						var dropdownElement = ElementFactory.createDropdown();
						dataFields.push( new SelectField( data, field, dropdownElement ));
						components.push( labelElement );
						components.push( dropdownElement );
						
					} else if ( c == NestedData ) {
						initData( value );
					}
				
				case TEnum(_):
					var dropdownElement = ElementFactory.createDropdown();
					dataFields.push( new EnumField( data, field, dropdownElement ));
						components.push( labelElement );
						components.push( dropdownElement );
				
				case TFloat:
					var textInput = ElementFactory.createTextinput();
					dataFields.push( new FloatField( data, field, textInput ));
						components.push( labelElement );
						components.push( textInput );
				
				case TInt:
					var textInput = ElementFactory.createTextinput();
					dataFields.push( new IntField( data, field, textInput ));
						components.push( labelElement );
						components.push( textInput );
				
				case TBool:
					var checkBox = ElementFactory.createCheckBox();
					dataFields.push( new BoolField( data, field, checkBox ));
					components.push( labelElement );
					components.push( checkBox );
				
				case _:
			}
		}
		data2UI();
	}
	
	public function data2UI():Void {
		for ( dataField in dataFields ) {
			dataField.data2UI();
		}
	}
	
	public function ui2Data():Void {
		for ( dataField in dataFields ) {
			dataField.ui2Data();
		}
	}
	
}