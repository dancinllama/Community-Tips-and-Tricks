public class FeaturedThingsCtrl {
	
    @AuraEnabled
    public static LightningResponse getProducts(){
        LightningResponse response = new LightningResponse();
        try{
            List<PricebookEntry> pbes = 
                [Select
                	Product2.Name
                	,Product2.ProductCode
                	,Product2.Image_URL__c
                 	,Product2.Description
                 	,UnitPrice
                 From
                	PricebookEntry
                 Where
                	Pricebook2.IsStandard = true];
        	response.jsonResponse = JSON.serialize(pbes);
        }catch(Exception e){
            response = new LightningResponse(e);
        }
        return response;
    }
    
    @AuraEnabled
    public static LightningResponse getSales(){
        LightningResponse response = new LightningResponse();
        try{
            List<Pricebook2> sales = 
                [Select
                	Name
                	,Description
                	,Image_URL__c
                 From
                	Pricebook2
                 Where
                	IsActive = true
                	And RecordType.DeveloperName = 'Sales'];
        	response.jsonResponse = JSON.serialize(sales);
        }catch(Exception e){
            response = new LightningResponse(e);
        }
        return response;
    }
}