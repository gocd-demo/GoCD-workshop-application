import unittest

def fun(x):
    return x + 1

class MyTest(unittest.TestCase):
    def test(self):
        self.assertEqual(fun(2), 4)

if __name__ == '__main__':
    unittest.main()
