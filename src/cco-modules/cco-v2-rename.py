import os

for file in os.listdir(): 
	if file.endswith(".ttl"):
		print(f'Mapping IRIs for {file}')
		os.system(f'robot rename -i old/{file} --mappings cco-mapping-v2.csv --add-prefix "cco2: https://www.commoncoreontologies.org/" --allow-missing-entities true -o {file}')
