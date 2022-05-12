import os
from flask import Flask
from buzz import generator

app = Flask(__name__)

def exec_cmd(cmd, base_url, post):
  url = base_url.replace('<rce>', cmd)
  if post:
    (ignore, ignore, ignore, params, ignore) = urlparse.urlsplit(url)
    site = url[:url.find(params)-1]
    result = urllib.urlopen(site, urllib.urlencode(params)).read()
  else:
    result = urllib.urlopen(url).read()

  return result

@app.route("/")
def generate_buzz():
    page = '<html><body><h1>'
    page += generator.generate_buzz()
    page += '</h1></body></html>'
    return page

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=int(os.getenv('PORT', 5000)))
