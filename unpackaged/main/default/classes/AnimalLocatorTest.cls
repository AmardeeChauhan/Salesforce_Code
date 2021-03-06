@isTest
private class AnimalLocatorTest  {

   
    
    @isTest static void testPostCallout() {
    // Set mock callout class 
    Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
    // This causes a fake response to be sent
    // from the class that implements HttpCalloutMock. 
    String returnString = AnimalLocator.getAnimalNameById(2);
    // Verify that the response received contains fake values
   // String contentType = response.getHeader('Content-Type');
   // System.assert(contentType == 'application/json');
   //String actualValue = response.getBody();
   // System.debug(response.getBody());
   // String expectedValue = '{"animals": ["majestic badger", "fluffy bunny", "scary bear", "chicken", "mighty moose"]}';
   // System.assertEquals(actualValue, expectedValue);
   // System.assertEquals(200, response.getStatusCode());
}  

}