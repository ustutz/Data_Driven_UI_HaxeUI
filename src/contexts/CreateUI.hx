package contexts;
import data.FieldData;
import haxe.ui.components.Button;
import haxe.ui.components.Label;
import haxe.ui.containers.Grid;

class CreateUI {

	public static function create( container:Grid, fieldDatasets:Array<FieldData> ):Void {
		
		var labelName = new Label();
		labelName.text = "Name";
		container.addComponent( labelName );
		
		var labelValue = new Label();
		labelValue.text = "Value";
		container.addComponent( labelValue );
		
		for ( fieldData in fieldDatasets ) {
			container.addComponent( fieldData.labelElement );
			container.addComponent( fieldData.inputElement );
		}
		
	}
	
}