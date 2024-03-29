'''
bing.py

Created on Dec 28, 2011

@author: Tariq Patel
'''
try:
    import json
except ImportError:
    import simplejson as json
from urllib import urlencode

from httplib2 import Http

class BingSearch:
    def __init__(self, app_id):
        self.app_id = app_id

    def search(self, query, source_type=None, api_version=None, max_results=None, **kwargs):
        kwargs.update({
            'AppId': self.app_id,
            'Version': api_version or '2.2',
            'Query': query,
            'Sources': source_type or 'Web',
            'Web.Count': max_results or '15'
        })

        _response_, contents = Http().request('http://api.bing.net/json.aspx?' + urlencode(kwargs))
        try:
            return _BingResponse(json.loads(contents)['SearchResponse']['Web'])
        except ValueError:
            raise ServerError('Could not connect to Bing')

class _BingResponse(dict):
    def __init__(self, resp):
        dict.__init__(self, resp)

    def get_results(self):
        return self['Results'] # Returns only max_results number of results

    def __len__(self):
        return self['Total']

class ServerError(Exception):
    def __init__(self, *args, **kwargs):
        Exception.__init__(self, *args, **kwargs)

