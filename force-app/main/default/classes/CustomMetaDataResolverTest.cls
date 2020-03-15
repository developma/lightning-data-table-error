@isTest(SeeAllData = false)
private class CustomMetaDataResolverTest {
    public CustomMetaDataResolverTest() {

    }

/*     @TestSetup
    static void setUp(){
        String fullName = 'Display_Setting__mdt.AAA1_t';
        String label = 'AAA';
        Map<String, Object> keyValue = new Map<String,Object>();
        keyValue.put('FieldName__c', 'AAA');
        keyValue.put('Order__c', '1');
        keyValue.put('InitCheckValue__c', true);
        TestUtil.createMetaData(fullName, label, keyValue);
    } */

    @isTest
    static void tesGetDisplayItem() {
        CstmMetaDataResolver resolver = new CstmMetaDataResolver();
        Test.startTest();
        List<ComparableDisplayItem> result = resolver.getDisplayItems();
        System.assertEquals(5, result.size());
        for (Integer i = 0; i < result.size(); i++) {
            System.assertEquals(i + 1, result.get(i).item.order);
        }
        System.debug(result);
        Test.stopTest();
    }
}
