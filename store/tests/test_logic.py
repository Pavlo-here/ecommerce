from django.test import TestCase

import store.logic


class LogicTestCase(TestCase):
    def test_plus(self):
        result = store.logic.operations(6, 13, "+")
        self.assertEqual(19, result)

    def test_minus(self):
        result = store.logic.operations(6, 13, "-")
        self.assertEqual(-7, result)

    def test_multiply(self):
        result = store.logic.operations(6, 13, "*")
        self.assertEqual(78, result)
