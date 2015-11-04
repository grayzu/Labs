Configuration IISWebsite 
{
	Node LocalHost
    {
	    WindowsFeature IIS
	    {
		    Ensure = “Present”
		    Name = “Web-Server”
        }

        WindowsFeature ASP
	    {
		    Ensure = “Present”
		    Name = “Web-Asp-Net45”
        }
    }
} 

IISWebsite