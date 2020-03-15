public  class TestUtil {

    public static void createMetaData(String fullName, String label, Map<String, Object> keyValue) {
        MetaData.CustomMetadata custom = new Metadata.CustomMetadata();
        custom.fullName = fullName;
        custom.label = label;

        for (String key: keyValue.keySet()) {
            Metadata.CustomMetadataValue customValue = new Metadata.CustomMetadataValue();
            customValue.field = key;
            customValue.value = keyValue.get(key);
            custom.values.add(customValue);
        }

        MetaData.DeployContainer container = new Metadata.DeployContainer();
        container.addMetadata(custom);
        PostInstallCallback callback = new PostInstallCallback();
        Id jobId;
        if (!Test.isRunningTest()) {
            jobId = Metadata.Operations.enqueueDeployment(container, callback);
        }
    }

    class PostInstallCallback implements Metadata.DeployCallback {
        public void handleResult(Metadata.DeployResult result, Metadata.DeployCallbackContext context) {
            if (result.status == Metadata.DeployStatus.SUCCEEDED) {
                System.debug('Deployment Succeeded!');
            } else {
                System.debug('Deployment Failed!');
            }
        }
    }

}
