#!/usr/bin/env python3
"""  Python script that provides some stats about Nginx logs stored in MongoDB"""


def print_nginx_request_logs(nginx_collection):
    '''Displays stats about Nginx request logs stored in MongoDB.
    '''
    print('{} logs'.format(nginx_collection.count_documents({})))
    print('Methods:')
    methods = ['GET', 'POST', 'PUT', 'PATCH', 'DELETE']
    for method in methods:
        num_req = len(list(nginx_collection.find({'method': method})))
        print('\tmethod {}: {}'.format(method, num_req))
    checks = len(list(
        nginx_collection.find({'method': 'GET', 'path': '/status'})
    ))
    print('{} status check'.format(checks))
