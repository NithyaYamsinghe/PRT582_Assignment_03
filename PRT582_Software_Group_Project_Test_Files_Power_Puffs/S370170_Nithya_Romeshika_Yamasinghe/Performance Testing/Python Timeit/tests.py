"""
Module: movie_tests.py

This module contains test cases for measuring the performance
of the search method
and retrieving all movie details in the Movie model of a Django application.
The test class, MovieModelTestCase, repeats these operations 1000 times
and records
the time taken for analysis.

Author: Nithya Romeshika Yamasinghe S370170
Date: 2023/07/05
"""

import timeit
from django.test import TestCase
from .models import Movie


class MovieModelTestCase(TestCase):
    """
    A test case for measuring the performance of the search method in the
    Movie model.

    This test class measures the time it takes to run the search method
    for a specific query, repeating the search 1000 times.

    Attributes:
        query (str): The search query to test.
        search_time (float): The time taken by the search method in seconds.
    """

    def test_search_performance(self):
        """
        Test the performance of the search method in the Movie model.
        This test measures the time it takes to run the search method
        for a specific query, repeating the search 1000 times.
        """
        query = "marvel"

        # Measure the time it takes to run the search method
        search_time = timeit.timeit(lambda: Movie.objects.search(query),
                                    number=1000)
        # Print the search time (in seconds) to the console
        message = (
            f"Search for '{query}' took {search_time:.4f} seconds "
            f"for 1000 iterations."
        )
        print(message)

    def test_get_all_movie_details_performance(self):
        """
        Test the performance of retrieving all movie details and
        ordering by language.

        This test measures the time it takes to execute the query to
        retrieve all movies
        and order them by language. The query is executed 1000 times
        to measure performance.

        Performance results are printed to the console.

        """
        # Measure the time it takes to execute the
        # Movie.objects.all().order_by('language') query 1000 times
        query_time = timeit.timeit(lambda:
                                   Movie.objects.all()
                                   .order_by('language'), number=1000)

        # Print the search time (in seconds) to the console
        message = (
            f"Get all movie details query took {query_time:.4f} seconds "
            f"for 1000 iterations."
        )
        print(message)
