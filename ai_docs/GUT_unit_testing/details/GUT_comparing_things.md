- [Home](https://gut.readthedocs.io/en/latest/index.html)
- Comparing Things
- [View page source](https://gut.readthedocs.io/en/latest/_sources/Comparing-Things.md.txt)

* * *

# Comparing Things [](https://gut.readthedocs.io/en/latest/Comparing-Things.html\#comparing-things "Permalink to this heading")

Comparing things isn’t always as obvious as you would think. It can get a little tricky when comparing the contents of dictionaries and arrays. GUT has some utilities to help out.

In Godot 3.x dictionaries were compared by reference and arrays were compared by value. In 4.0 both are compared by value. Godot 4.0 introduces the `is_same` method which (amongst other things) will compare dictionaries and arrays by reference. GUT now has `assert_same` and `assert_not_same`.

For more information about the changes to Dictionaries and Arrays and how they affect GUT see [Godot 4 Changes](https://gut.readthedocs.io/en/latest/New-For-Godot-4.html).

The `assert_eq` and `assert_ne` methods use Godot’s default comparision logic, meaning arrays and dictionaries are compared by value. Godot uses a hashing function to compare the values. This is fast, but does not give you any insight into what is actually different when your tests fail. GUT has some “deep” comparison methods that will show the differences in the two values.

- `compare_deep`

- `assert_eq_deep`

- `assert_ne_deep`


A deep compare will recursively compare all values in the dictionary/array and all sub-dictionaries and sub-arrays. Floats and Integers are never equal. See `assert_eq_deep` in [GutTest](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest) for examples.

## CompareResult [](https://gut.readthedocs.io/en/latest/Comparing-Things.html\#compareresult "Permalink to this heading")

A `CompareResult` object is returned from `compare_deep`. You can use this object to further inspect the differences or adjust the output.

### Properties [](https://gut.readthedocs.io/en/latest/Comparing-Things.html\#properties "Permalink to this heading")

- **are\_equal**

`true`/ `false` if all keys/values in the two objects are equal.

- **summary**

returns a string of all the differences found. This will display `max_differences` differences per each entry and per each sub-array/sub-dictionary. This is returned if you use `str` on a `CompareResult`.

- **max\_differences**

The number of differences to display. This only affects output, all differences are accessible from the `differences` property. Set this to -1 to show the maximum number of differences (10,000)

- **differences**

This is a dictionary of all the keys/indexes that are different between the compared items. The key is the key/index that is different. Keys/indexes that are missing from one of the compared objects are included. The value of each index is a `CompareResult`.




`CompareResult` s for sub-arrays/sub-dictionaries `differences` will contain all their differences. You can use the `differences` property for that key to dig deeper into the differences. `differences` will be an empty dictionary for any element that is not an array or dictionary.


## Examples [](https://gut.readthedocs.io/en/latest/Comparing-Things.html\#examples "Permalink to this heading")

### Deep array compare: [](https://gut.readthedocs.io/en/latest/Comparing-Things.html\#deep-array-compare "Permalink to this heading")

```
var a1 = [\
    [1, 2, 3, 4],\
    [[4, 5, 6], ['same'], [7, 8, 9]]\
]
var a2 = [\
    ["1", 2.0, 13],\
    [[14, 15, 16], ['same'], [17, 18, 19]]\
]
var result = compare_deep(a1, a2)
print(result.summary)

print('Traversing differences:')
print(result.differences[1].differences[2].differences[0])

```

Output

```
[[1, 2, 3, 4], [[4, 5, 6], [same], [7, 8...7, 8, 9]]] != [[1, 2, 13], [[14, 15, 16], [same], [17,... 18, 19]]]  2 of 2 indexes do not match.
    [\
        0:  [\
            0:  1 != "1".  Cannot compare Int with String.\
            1:  2 != 2.0.  Cannot compare Int with Float/Real.\
            2:  3 != 13\
            3:  4 != <missing index>\
        ]\
        1:  [\
            0:  [\
                0:  4 != 14\
                1:  5 != 15\
                2:  6 != 16\
            ]\
            2:  [\
                0:  7 != 17\
                1:  8 != 18\
                2:  9 != 19\
            ]\
        ]\
    ]
Traversing differences:
7 != 17

```

### Deep Dictionary Compare [](https://gut.readthedocs.io/en/latest/Comparing-Things.html\#deep-dictionary-compare "Permalink to this heading")

```
var v1 = {'a':{'b':{'c':{'d':1}}}}
var v2 = {'a':{'b':{'c':{'d':2}}}}
var result = compare_deep(v1, v2)
print(result.summary)

print('Traversing differences:')
print(result.differences['a'].differences['b'].differences['c'])

```

Output

```
{a:{b:{c:{d:1}}}} != {a:{b:{c:{d:2}}}}  1 of 1 keys do not match.
    {
        a:  {
            b:  {
                c:  {
                    d:  1 != 2
                }
            }
        }
    }
Traversing differences:
{d:1} != {d:2}  1 of 1 keys do not match.
    {
        d:  1 != 2
    }

```

### Mix Bag of Differences [](https://gut.readthedocs.io/en/latest/Comparing-Things.html\#mix-bag-of-differences "Permalink to this heading")

```
var a1 = [\
    'a', 'b', 'c',\
    [1, 2, 3, 4],\
    {'a':1, 'b':2, 'c':3},\
    [{'a':1}, {'b':2}]\
]
var a2 = [\
    'a', 2, 'c',\
    ['a', 2, 3, 'd'],\
    {'a':11, 'b':12, 'c':13},\
    [{'a':'diff'}, {'b':2}]\
]
var result = compare_deep(a1, a2)
print(result.summary)

print('Traversing differences:')
print(result.differences[5].differences[0].differences['a'])

```

Output

```
[a, b, c, [1, 2, 3, 4], {a:1, b:2, c:3},...}, {b:2}]] != [a, 2, c, [a, 2, 3, d], {a:11, b:12, c:1...}, {b:2}]]  4 of 6 indexes do not match.
    [\
        1:  "b" != 2.  Cannot compare String with Int.\
        3:  [\
            0:  1 != "a".  Cannot compare Int with String.\
            3:  4 != "d".  Cannot compare Int with String.\
        ]\
        4:  {\
            a:  1 != 11\
            b:  2 != 12\
            c:  3 != 13\
        }\
        5:  [\
            0:  {\
                a:  1 != "diff".  Cannot compare Int with String.\
            }\
        ]\
    ]
    Traversing differences:
    1 != "diff".  Cannot compare Int with String.

```