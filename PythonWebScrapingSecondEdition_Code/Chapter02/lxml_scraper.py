from lxml.html import fromstring
from chp1.advanced_link_crawler import download

url = 'http://example.webscraping.com/view/UnitedKingdom-239'
html = download(url)

tree = fromstring(html)
td = tree.cssselect('tr#places_area__row > td.w2p_fw')[0]
area = td.text_content()
print(area)
