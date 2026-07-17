# Break/fix challenge: make this script report whether a module is available.
# It must not terminate with an error when the fictional module is absent.

$moduleName = 'Contoso.TrainLab'

Import-Module -Name $moduleName -ErrorAction Stop
"Module $moduleName loaded successfully."
