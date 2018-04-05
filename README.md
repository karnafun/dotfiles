Getting to know bash scripting and unix enviroment.
i've deleted / overwritten my own files so many times, that its better saving them on git.  



### Install 
all configurations into the ~/.karnafun folder:
`bash <(curl https://raw.githubusercontent.com/karnafun/dotfiles/master/conf.sh) \  
source ~/.bashrc`

### rc function for Ilya:

#### Get rc function 

to get rc function for this terminal session:

` source <(curl https://raw.githubusercontent.com/karnafun/dotfiles/master/functions/research-clouds.sh) `  


#### rc function usage 

to clone research clouds and configure Web.config  
`rc init`

if you want to just configure Web.config  
`rc config`   
when configuring, make sure you are in the /research-clouds/ folder (and not a subdirectory of it like /research-clouds/assets.html)


