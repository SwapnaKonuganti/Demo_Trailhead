public class ParkLocator {
    Public Static String[] country(String country){
        	ParkService.ParksImplPort PS = new ParkService.ParksImplPort();
        return PS.byCountry(country);
    }
}