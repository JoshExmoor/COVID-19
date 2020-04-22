$NYTCounties = "https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv"
$NYTStates =  "https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-states.csv"

Invoke-WebRequest $NYTStates -UseBasicParsing -OutFile "us-states.csv"
Invoke-WebRequest $NYTCounties -UseBasicParsing -OutFile "us-counties.csv"

Import-CSV -Path ".\us-states.csv" | Sort-Object -Property  @("state","date") | Export-Csv -Path ".\us-states-sorted.csv" -NoTypeInformation
Import-CSV -Path ".\us-counties.csv" | Sort-Object -Property  @("state","county","date") | Export-Csv -Path ".\us-counties-sorted.csv" -NoTypeInformation

