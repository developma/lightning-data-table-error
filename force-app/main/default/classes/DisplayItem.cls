public class DisplayItem{
    public String fieldName {set;get;}
    public Integer order {set;get;}
    public Boolean isDisabled {set;get;}
    public Boolean isChecked {set;get;}

    public DisplayItem(final Display_Setting__mdt mdt
    ) {
        this.fieldName = mdt.FieldName__c;
        this.order = Integer.valueOf(mdt.Order__c);
        this.isDisabled = false;
        this.isChecked = mdt.InitCheckValue__c;
    }
}