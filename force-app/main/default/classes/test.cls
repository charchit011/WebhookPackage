public class test{
public static String createTrigger(String name, String sourceCode) {

    Map<String, String> body = new Map<String, String>{
        'Name' => name,
        'Status' => 'Active',
        'Body' => sourceCode
    };

    String url = ''
        + Url.getSalesforceBaseUrl().toExternalForm()
        + '/services/data/'	
        + 'v48.0'
        + '/sobjects/'
        + 'ApexClass';

    HttpRequest req = new HttpRequest();
    req.setHeader('Authorization', 'OAuth ' + UserInfo.getSessionId());
    req.setHeader('Content-Type', 'application/json');
    req.setMethod('POST');
    req.setBody(JSON.serialize(body));
    req.setEndpoint(url);

    HttpResponse res = new Http().send(req);

    return String.format(
        'Result of {0} POST is statusCode={1} body={2}',
        new Object[] {url, res.getStatusCode(), res.getBody().abbreviate(1000)}
    );
}
}