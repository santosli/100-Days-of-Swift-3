#!/usr/bin/python	
# -*- coding: utf-8 -*-

from flask import Flask, jsonify, request
import requests
import json
from bs4 import BeautifulSoup
from bs4 import UnicodeDammit
import sys
import collections

def getDotaHeroNames():
	# 从网站获取列表信息，格式为html
	r = requests.get("http://dotaflame.com/heroes")
	# print r.text

	#解析html
	soup = BeautifulSoup(r.text, "html.parser")
	heroes_name = [a.attrs.get('title') for a in soup.select('div#hero-list a')]
	# print heroes_name

	dic = {}
	hero_list = []

	for hero in heroes_name:
		# print hero 
		#处理字符串
		hero_firstChar = hero[0].encode('raw_unicode_escape')
		hero_name = hero.encode('raw_unicode_escape')

		if hero_firstChar not in dic.keys() :
			dic[hero_firstChar] = "\"" + hero_name + "\""
		else :
			dic[hero_firstChar] = dic[hero_firstChar] + ", " + "\"" + hero_name + "\""

	for key in sorted(dic):
		print "\"%s\": [%s]," % (key, dic[key])

if __name__ == '__main__':
	getDotaHeroNames()