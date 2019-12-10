# Initiate a COM object and connect
$TaskService = New-Object -ComObject('Schedule.Service')
$TaskService.Connect()

# Query for currently running tasks 
# 0 - the user is permitted to see. 
# 1 - 0 + Hidden
$runningTasks = $TaskService.GetRunningTasks(1)

# Get the task associated to a certain PID
$runningTasks | Select-Object Name, EnginePID