package org.codewithishan.democicd_app.Controllers;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DemoController {



    @GetMapping("/getversion")
    public String getVersion()
    {

        return " Version Of App : V1 ";



    }

}
