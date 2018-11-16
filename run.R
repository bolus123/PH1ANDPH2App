check.packages <- function(pkg){
    new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
    if (length(new.pkg)) 
        install.packages(new.pkg, dependencies = TRUE)
    sapply(pkg, require, character.only = TRUE)
}


###########################################################################################

packages<-c("shiny", "shinythemes")
check.packages(packages)

###########################################################################################

runGitHub('bolus123/PH1ANDPH2App', subdir = 'shinyApp')