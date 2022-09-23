import pytest
import os, sys

from src.utils import Formatter


class TestCase:
    def __init__(self, date, expected_value):
        self.date = date
        self.expected_value = expected_value


base_test_cases = [
    TestCase(date="09/21/2015", expected_value="2015-21-09"),
]


class TestFormatDate:
    @pytest.mark.parametrize("test_case", base_test_cases)
    def test_base_cases(self, test_case):

        date = Formatter.format_date(test_case.date)

        assert test_case.expected_value == date
