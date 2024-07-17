#!/usr/bin/env python3
'''
A module with tools for request caching and tracking.
'''
import redis
import requests
from functools import wraps
from typing import Callable


redis_client = redis.Redis()
'''
The module-level Redis client instance used for caching and request tracking.
'''


def cache_requests(method: Callable) -> Callable:
    '''
    Decorator function that caches the output of fetched data.
    '''
    @wraps(method)
    def wrapper(url: str) -> str:
        '''
        The wrapper function that handles caching the request output.
        '''
        redis_client.incr(f'request_count:{url}')
        cached_result = redis_client.get(f'cached_result:{url}')
        if cached_result:
            return cached_result.decode('utf-8')
        result = method(url)
        redis_client.set(f'request_count:{url}', 0)
        redis_client.setex(f'cached_result:{url}', 10, result)
        return result
    return wrapper


@cache_requests
def fetch_page(url: str) -> str:
    '''
    Fetches the content of a URL, caching the request's response,
    and tracking the request.
    '''
    return requests.get(url).text
