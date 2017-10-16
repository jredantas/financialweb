
# Conteudo do arquivo `wsgi.py`
#
import sys

#dev environment
sys.path.insert(0, "/home/renato/git/financialweb")
#prod environment
#sys.path.insert(0, "/var/www/financialweb")

from financialweb import app as application
