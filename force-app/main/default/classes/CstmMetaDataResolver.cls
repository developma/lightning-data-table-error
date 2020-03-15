public with sharing class CstmMetaDataResolver {
    public CstmMetaDataResolver() {

    }

    private List<Display_Setting__mdt> load() {
        return [
            SELECT 
                DeveloperName, 
                FieldName__c,
                Order__c,
                InitCheckValue__c
            FROM
                Display_Setting__mdt
            ];
    }

    public List<ComparableDisplayItem> getDisplayItems() {
        List<ComparableDisplayItem> dispItemList = new List<ComparableDisplayItem>();
        for (Display_Setting__mdt mdt : this.load()) {
            dispItemList.add(new ComparableDisplayItem(new DisplayItem(mdt)));
        }
        System.debug('before');
        System.debug(dispItemList);
        System.debug('after');
        dispItemList.sort();
        System.debug(dispItemList);
        return dispItemList;
    }
}
