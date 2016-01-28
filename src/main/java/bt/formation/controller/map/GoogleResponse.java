package bt.formation.controller.map;

import javax.xml.transform.Result;

/**
 * Created by Student on 28-01-16.
 */
public class GoogleResponse {


    private Result[] results ;
    private String status ;
    public Result[] getResults() {
        return results;
    }
    public void setResults(Result[] results) {
        this.results = results;
    }
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }



}