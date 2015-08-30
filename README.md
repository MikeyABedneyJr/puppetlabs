# Puppetlabs Tech Challenge
First crack at a Puppetlabs challenge.

Automating installation of nginx and custom config file.  
Serving requests over specific port & delivering content of repo to agents.

# Assumptions:
Puppet downloaded/installed on necessary machines (v4.0 or higher).

Internet access (for fetching github repo)

# Steps required to apply this solution 
Puppet master pulls this repo

From terminal run "puppet apply <directory of downloaded file>/main.pp"
