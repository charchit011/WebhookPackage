    public class createClassApex {
        public static void createWebHook(list<string> FieldstoInclude,string objectApiName,string webhookname){
            string body='@RestResource(urlMapping=\'/api/SalesforceVision/'+webhookName +'\')'
                +'global class '+webhookname +'{@HttpPost'+
                'global static string handledata(){';
               body+='RestRequest request=RestContext.request;';
            body+='list<object> jsonbody =(list<object>)Json.deserializeUntyped(string.valueof(request.requestBody.toString()))';
              body+='list<'+objectApiName+'> ObjectList=new list<'+objectApiName+'>();';
            
            for(object t:jsonbody){
                map<string,object> ObjectData=(map<string,object>)t;
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                body+= 'Schema.DescribeFieldResult F'+'='+objectName+'.'+t+'.getDescribe()';
                body+=
            }
            
        }
    }
}