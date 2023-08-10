
##to build both a paged html version and a gitbook follow the steps below

#######################################################################################
##change your VErsion #
#######################################################################################


pagedown::chrome_print('safety_plan.Rmd')

##move the html to the docs folder so it can be viewed online
dir.create('docs')
file.rename('safety_plan.html', 'docs/index.html')
file.rename('safety_plan.pdf', paste0('docs/safety_plan_', name_project_name, '.pdf'))


