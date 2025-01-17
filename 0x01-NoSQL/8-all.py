#!/usr/bin/env python3
"""  Python function that lists all documents in a collection """

def list_all(mongo_collection):
    '''Lists all documents in a collection mongo.
    '''
    return [docum for docum in mongo_collection.find()]
