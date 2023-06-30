public class SUM23Day3 {
    Static String API_KEY = '8vHqnkQk7xdnDDa3FyNmIA==FxyxBRL1mI66sacE';
    private static List<Response> basicAuthCallout(String animalName){
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://api.api-ninjas.com/v1/animals?name=' + animalName);
        req.setMethod('GET');
        
        req.setHeader('X-Api-Key', API_KEY);
        
        Http http = new Http();
        HTTPResponse res = http.send(req);
        
        System.debug('res' + res.getBody());
        JSONResponse animalList = (JSONResponse) JSON.deserialize('{"response":'+res.getBody()+'}', JSONResponse.class);
        System.debug(animalList);
        return animalList.response;
    }
    
    
    @auraenabled
    public static List<Response> getAnimalList(String animalName){
        return basicAuthCallout(animalName);
    }
    
    public class JSONResponse{
        @auraenabled public List<Response> response {get;set;}
    }
    public class Response {
        @auraenabled public String name {get;set;}	//Cheetah
        @auraenabled public cls_taxonomy taxonomy {get;set;}
        @auraenabled public List<String> locations {get;set;}
        @auraenabled public cls_characteristics characteristics {get;set;}	
    }
    public class cls_taxonomy {
        @auraenabled public String kingdom{get;set;}	//Animalia
        @auraenabled public String phylum{get;set;}	//Chordata
        @auraenabled public String class_s{get;set;}	//Mammalia
        @auraenabled public String order{get;set;}	//Carnivora
        @auraenabled public String family{get;set;}	//Felidae
        @auraenabled public String genus{get;set;}	//Acinonyx
        @auraenabled public String scientific_name{get;set;}	//Acinonyx jubatus
    }
    
    class cls_characteristics {
        @auraenabled public String prey{get;set;}	//Gazelle, Wildebeest, Hare
        @auraenabled public String name_of_young{get;set;}	//Cub
        @auraenabled public String group_behavior{get;set;}	//Solitary/Pairs
        @auraenabled public String estimated_population_size{get;set;}	//8,500
        @auraenabled public String biggest_threat{get;set;}	//Habitat loss
        @auraenabled public String most_distinctive_feature{get;set;}	//Yellowish fur covered in small black spots
        @auraenabled public String gestation_period{get;set;}	//90 days
        @auraenabled public String habitat{get;set;}	//Open grassland
        @auraenabled public String diet{get;set;}	//Carnivore
        @auraenabled public String average_litter_size{get;set;}	//3
        @auraenabled public String lifestyle{get;set;}	//Diurnal
        @auraenabled public String common_name{get;set;}	//Cheetah
        @auraenabled public String number_of_species{get;set;}	//5
        @auraenabled public String location{get;set;}	//Asia and Africa
        @auraenabled public String slogan{get;set;}	//The fastest land mammal in the world!
        @auraenabled public String group_animal{get;set;}	//Mammal
        @auraenabled public String color{get;set;}	//BrownYellowBlackTan
        @auraenabled public String skin_type{get;set;}	//Fur
        @auraenabled public String top_speed{get;set;}	//70 mph
        @auraenabled public String lifespan{get;set;}	//10 - 12 years
        @auraenabled public String weight{get;set;}	//40kg - 65kg (88lbs - 140lbs)
        @auraenabled public String height{get;set;}	//115cm - 136cm (45in - 53in)
        @auraenabled public String age_of_sexual_maturity{get;set;}	//20 - 24 months
        @auraenabled public String age_of_weaning{get;set;}	//3 months
    }
    
    
}