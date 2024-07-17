#!/usr/bin/env python3
"""
This module provides utilities for caching the results of web requests and
tracking the number of requests made for each URL.
"""

import redis
import requests
from functools import wraps
from typing import Callable

# Create a module-level Redis instance to store cached data and request tracking
redis_store = redis.Redis()


def data_cacher(method: Callable) -> Callable:
    """
    Decorator function that caches the output of fetched data.
    """
    @wraps(method)
    def invoker(url: str) -> str:
        """
        The wrapper function that handles caching the request output.
        """
        # Increment the request count for the given URL
        redis_store.incr(f'count:{url}')

        # Check if the result is already cached in Redis
        cached_result = redis_store.get(f'result:{url}')
        if cached_result:
            return cached_result.decode('utf-8')

        # Fetch the data and cache the result in Redis
        result = method(url)
        redis_store.set(f'count:{url}', 0)
        redis_store.setex(f'result:{url}', 10, result)
        return result

    return invoker


@data_cacher
def get_page(url: str) -> str:
    """
    Fetches the content of a URL, caching the request's response,
    and tracking the request.
    """
    return requests.get(url).text
