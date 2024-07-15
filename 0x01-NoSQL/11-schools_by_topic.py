#!/usr/bin/env python3
""" Python function that returns the list of school having a specific topic:"""

def schools_by_topic(mongo_collection, topic):
    '''the function returns the list of school having a specific topic.
    '''
    top_fil = {
        'topics': {
            '$elemMatch': {
                '$eq': topic,
            },
        },
    }
    return [docum for docum in mongo_collection.find(topic_fil)]
