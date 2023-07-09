New-AzResourceGroupDeployment `
  -Name Deployment `
  -ResourceGroupName POC-DEV `
  -TemplateFile https://github.com/nihar30/TechChallenge/blob/main/Challenge1/template.json `
  -TemplateParameterFile https://github.com/nihar30/TechChallenge/blob/main/Challenge1/parameters.json
  
