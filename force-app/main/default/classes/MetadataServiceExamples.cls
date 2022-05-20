public with sharing class MetadataServiceExamples
{
    public static void createObject()
    {
        MetadataService.MetadataPort service = createService();
        MetadataService.CustomObject customObject = new MetadataService.CustomObject();
        customObject.fullName = 'sampu__c';
        customObject.label = 'sampu';
        customObject.pluralLabel = 'sampus';
        customObject.nameField = new MetadataService.CustomField();
        customObject.nameField.type_x = 'Text';
        customObject.nameField.label = 'Test Record';
        customObject.deploymentStatus = 'Deployed';
        customObject.sharingModel = 'ReadWrite';
        List<MetadataService.SaveResult> results =
            service.createMetadata(
                new MetadataService.Metadata[] { customObject });
        system.debug(results);
    }
    
public static MetadataService.MetadataPort createService()
    {
        MetadataService.MetadataPort service = new MetadataService.MetadataPort();
        service.SessionHeader = new MetadataService.SessionHeader_element();
        service.SessionHeader.sessionId = UserInfo.getSessionId();
        return service;
    }
    public static void createApexClass()
    {
        MetadataService.MetadataPort service = createService();
        MetadataService.ApexClass apexClass=new MetadataService.ApexClass();
        apexClass.content=EncodingUtil.base64Encode(Blob.valueOf('public class test{public static void main(){}}'));
        apexClass.fullName='testing';
        apexClass.status='active';
            
        List<MetadataService.SaveResult> results =
            service.createMetadata(
                new MetadataService.Metadata[] { apexClass });
        system.debug(results);
    }
        
}