#!/usr/bin/env python3
import datetime
import random

import requests
from bs4 import BeautifulSoup

try:
	min_date = datetime.datetime(1995, 5, 20)
	max_date = datetime.datetime.now() - datetime.timedelta(days=2) # date two days ago

	random_date = min_date + datetime.timedelta(seconds=random.randint(0, int((max_date - min_date).total_seconds())))
	random_year = str(random_date.year)[-2:]
	random_month = str(random_date.month).zfill(2)
	random_day = str(random_date.day).zfill(2)
	url_path = 'https://apod.nasa.gov/apod/ap' + random_year + random_month + random_day + '.html'
	text = requests.get(url_path)
	if text.status_code != 200: raise Exception('not 200')
	soup = BeautifulSoup(text.text, 'lxml')
	i_p = soup.find('img').get('src')
	image_path = "https://apod.nasa.gov/apod/" + i_p

except Exception as e:
	print(e)
	image_path = "/home/gaher/Pictures/Wallpapers/belladona.jpg"

finally:
	print(image_path)
