package com.zoomdata.labs.export.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import java.util.Collection;
import java.util.Map;

@Data
@JsonIgnoreProperties(ignoreUnknown=true)
public class ExportResult {

    private String requestId;
    private ExportDestination destination;
    private Collection<WriteResult> writeResults;
    private ExportStatus status;
    private String message;
    private Map<String, String> sourceParams;

}
