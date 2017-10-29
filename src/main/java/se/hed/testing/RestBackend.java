package se.hed.testing;

import com.google.gson.Gson;
import org.apache.log4j.BasicConfigurator;

import java.util.List;

import static spark.Spark.*;

public class RestBackend {


    public static void main(String[] args) {
        BasicConfigurator.configure();
        Gson gs = new Gson();

        get("/hello", (req, res) -> "Hello, world");

        get("/hello/:name", (req, res) -> {
            return "Hello, " + req.params(":name");
        });

        get("/words/:name", (req, res) -> {
            StandardResponse sr = null;
            try {
                List<Word> ws = SlangopediaService.getWords(req.params(":name"));

                if (ws != null) {
                    sr = new StandardResponse(StatusResponse.SUCCESS, gs.toJsonTree(ws));
                }
                else {
                    sr = new StandardResponse(StatusResponse.ERROR, "no matching identifier");
                }
            }
            catch (RuntimeException e) {
                sr = new StandardResponse(StatusResponse.ERROR, e.getMessage());
            }

            return gs.toJson(sr);

        });

        get("/word/:name", (req, res) -> {
            StandardResponse sr = null;
            try {
                Word w = SlangopediaService.getWord(Integer.parseInt(req.params(":name")));

                if (w != null) {
                    sr = new StandardResponse(StatusResponse.SUCCESS, gs.toJsonTree(w));
                }
                else {
                    sr = new StandardResponse(StatusResponse.ERROR, "no matching identifier");
                }

            }
            catch (RuntimeException e) {
                sr = new StandardResponse(StatusResponse.ERROR, e.getMessage());
            }
            return gs.toJson(sr);
        });
    }
}
