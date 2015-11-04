Configuration IISWebsite 
{

    Import-DSCResource -Module xWebAdministration

	Node $AllNodes.Where{$_.Role -eq "Web"}.NodeName
    {
	    WindowsFeature IIS
	    {
		    Ensure = “Present”
		    Name = $Node.WebRoleName
        }

        WindowsFeature ASP
	    {
		    Ensure = “Present”
		    Name = $Node.AspRoleName
        }

        xWebsite DefaultSite
        {
	        Ensure = “Present”
	        Name = “Default Web Site”
	        PhysicalPath = “c:\inetpub\wwwroot”
	        State = “Stopped”
	        DependsOn = “[windowsFeature]IIS”
        } 

        File WebContent
        {
            Ensure = "Present"
            Type = "Directory"
            SourcePath = $Node.SourceRoot
            DestinationPath = "C:\inetpub\FourthCoffee"
            Recurse = $true
        }

        xWebsite FouthCoffeeBakeryWebsite
        {
	        Ensure = “Present”
	        Name = $Node.WebSiteName
	        PhysicalPath = "C:\inetpub\FourthCoffee"
	        State = “Started”
            BindingInfo = MSFT_xWebBindingInformation{Port=$Node.WebSitePort;Protocol="Http"}
            DependsOn = “[File]WebContent”
        } 
    }
} 

IISWebsite -ConfigurationData 'D:\DSC HOL\ConfigEnv.psd1'