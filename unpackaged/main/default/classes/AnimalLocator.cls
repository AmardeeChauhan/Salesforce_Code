public class AnimalLocator{
public static String name{get;set;}

    public static String getAnimalNameById(Integer Id) {
    String stringid = String.valueOf(ID);
     Http http = new Http();
     HttpRequest request = new HttpRequest();
     request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+Id);
     request.setMethod('GET');
     HttpResponse response = http.send(request);
     if (response.getStatusCode() == 200) {
    
        Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
        Object animalDetails = (Object) results.get('animal');
       //System.debug('>>>>>'+animalDetails);
        Map<String, Object> returnObject = (Map<String, Object>)animalDetails;
        name = String.valueOf(returnObject.get('name'));
        System.debug('name :'+name);
         }
          return  name;
    }
        
}