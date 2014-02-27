-- A script to notify when the dryer is finished. 

commandArray = {}
threshold = 500

if (tonumber(otherdevices_svalues['Torktumlare']) < threshold and otherdevices['Torktumlare Aktiv'] == 'Off') then
	print('Torktumlaren av')
elseif (tonumber(otherdevices_svalues['Torktumlare']) > threshold and otherdevices['Torktumlare Aktiv'] == 'On') then
	print('Torktumlaren på')
elseif (tonumber(otherdevices_svalues['Torktumlare']) < threshold and otherdevices['Torktumlare Aktiv'] == 'On') then
	print('Torktumlaren färdig')
	commandArray['Torktumlare Aktiv'] = 'Off'
	commandArray['SendNotification']='Torktumlaren klar!#Torktumlaren är färdig.'
elseif (tonumber(otherdevices_svalues['Torktumlare']) > threshold and otherdevices['Torktumlare Aktiv'] == 'Off') then
	print('Torktumlaren startad')
	commandArray['Torktumlare Aktiv'] = 'On'
end

return commandArray
