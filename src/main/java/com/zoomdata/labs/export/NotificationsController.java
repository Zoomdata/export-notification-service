package com.zoomdata.labs.export;

import com.zoomdata.labs.export.model.ExportResult;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import static org.springframework.http.MediaType.APPLICATION_JSON_VALUE;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

@RestController
@Slf4j
public class NotificationsController {

    @RequestMapping(
            value = "/export/status",
            method = POST,
            consumes = {APPLICATION_JSON_VALUE})
    public void success(@RequestBody ExportResult result) {
        log.info("Status received: {}", result);
    }
}
