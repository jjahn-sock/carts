import requests
import json
import sys

print('====================================================')
print('Parameters')
print('====================================================')
print('Number of arguments:', len(sys.argv), 'arguments.')
print('Argument List:', str(sys.argv))

print('')
print('====================================================')
print('Request output')
print('====================================================')
url='http://13.80.4.169/carts/1/items'
json_data = requests.get(url)
python_obj = json.loads(json_data.text)
print('url:', url)
print('id value:', python_obj[0]['id'])
print('itemId value:', python_obj[0]['itemId'])
print('quantity value:', python_obj[0]['quantity'])
print('unitPrice value:', python_obj[0]['unitPrice'])
print('json data:', json_data.text)

print('')
print('====================================================')
print('Gate Test')
print('====================================================')
try:
    if sys.argv[1] == 'pass':
        print('I passed')
    else:
        exit(1)
except:
    print('I failed c')
    exit(1)