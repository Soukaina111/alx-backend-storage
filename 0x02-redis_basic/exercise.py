#!/usr/bin/env python3
''' This module provides utilities for caching the results of web requests and
tracking the number of requests made for each URL.
'''

import requests
import redis
from functools import wraps
from typing import Callable


redis_store = redis.Redis()
'''Create a module-level Redis instance
to store cached data and request tracking
'''


def cacher_dt(method: Callable) -> Callable:
    '''Decorator function that
    caches the output of fetched data..
    '''
    @wraps(method)
    def invoker(url) -> str:
        '''The wrapper function that handles caching the request output..
        '''
        redis_store.incr(f'count:{url}')
        result = redis_store.get(f'result:{url}')
        if result:
            return result.decode('utf-8')
        result = method(url)
        redis_store.set(f'count:{url}', 0)
        redis_store.setex(f'result:{url}', 10, result)
        return result
    return invoker


@cacher_dt
def get_page(url: str) -> str:
    '''Fetches the content of a URL, caching the request's response,
    and tracking the request.
    '''
    return requests.get(url).text
