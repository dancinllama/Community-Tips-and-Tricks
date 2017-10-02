public class LightningResponse {

	@AuraEnabled public String jsonResponse {get; set;}
    @AuraEnabled public String error {get; set;}
    @AuraEnabled public String state {get; set;}

    public LightningResponse() {
        this.state = 'SUCCESS';
    }

    public LightningResponse(Exception e){
    	this();
    	if(e != null){
    		this.state = 'ERROR';
            this.error = e.getMessage();
        }
    }
}