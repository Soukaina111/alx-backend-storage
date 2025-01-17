#!/usr/bin/env python3
""" Python function that changes all topics of a school document based on the name:"""

def update_topics(mongo_collection, name, topics):
    '''Modify all topics of a collection's document based on the name provided.
    '''
    mongo_collection.update_many(
        {'name': name},
        {'$set': {'topics': topics}}
    )
