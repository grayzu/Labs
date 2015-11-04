@{
    AllNodes = @(
        @{  
            NodeName = "LocalHost"; 
            Role = "Web"; 
            WebRoleName = "Web-Server"; 
            AspRoleName = "Web-Asp-Net45";
            SourceRoot = "c:\source\BakeryWebsite\"; 
            Version = "1.0"; 
            WebSiteName = “FourthCoffeeBakery”;
            WebSitePort = "80" },
        @{  
            NodeName = "Server2"; 
            Role = "Web"; 
            WebRoleName = "Web-Server"; 
            AspRoleName = "Web-Asp-Net45";
            SourceRoot = "c:\source\BakeryWebsite\"; 
            Version = "1.0"; 
            WebSiteName = “FourthCoffeeBakery”;
            WebSitePort = "80" }
    )
}
