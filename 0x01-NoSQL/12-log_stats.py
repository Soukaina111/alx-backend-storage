#!/usr/bin/env python3
""" Script that provides some stats stored in MongoDB"""


def print_nginx_request_logs(nginx_collection):
    """ This function prints statistics about the Nginx request logs."""
    print('{} logs'.format(nginx_collection.count_documents({})))
    print('Methods:')
    methods = ['GET', 'POST', 'PUT', 'PATCH', 'DELETE']
    for method in methods:
        count = len(list(nginx_collection.find({'method': method})))
        print('\tmethod {}: {}'.format(method, count))
    schecks_count = len(list(
        nginx_collection.find({'method': 'GET', 'path': '/status'})
    ))
    print('{} status check'.format(schecks_count))