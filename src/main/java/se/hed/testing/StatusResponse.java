package se.hed.testing;

public enum StatusResponse {
    SUCCESS ("Success"),
    ERROR ("Error");

    private String status;
    // constructors, getters

    StatusResponse (String desc) {
        status = desc;
    }

    public String getStatus(){
        return status;
    }
}
