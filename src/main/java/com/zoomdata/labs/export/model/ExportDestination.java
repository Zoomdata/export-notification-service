package com.zoomdata.labs.export.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

@Data
@JsonIgnoreProperties(ignoreUnknown=true)
public class ExportDestination {

    private String type;
    private String path;

}
