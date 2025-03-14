- [Home](https://gut.readthedocs.io/en/latest/index.html)
- GutTest
- [Edit on GitHub](https://gut.readthedocs.io/en/latest/class_ref/hide)

* * *

# GutTest [](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html\#guttest "Permalink to this heading")

**Inherits:** [Node](https://docs.godotengine.org/en/stable/classes/class_node.html)

This is the base class for your GUT test scripts.

GUT Wiki: [https://gut.readthedocs.io](https://gut.readthedocs.io/)

Simple Example

```
extends GutTest

func before_all():
    gut.p("before_all called"

func before_each():
    gut.p("before_each called")

func after_each():
    gut.p("after_each called")

func after_all():
    gut.p("after_all called")

func test_assert_eq_letters():
    assert_eq("asdf", "asdf", "Should pass")

func test_assert_eq_number_not_equal():
    assert_eq(1, 2, "Should fail.  1 != 2")

```

## Properties [](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html\#properties "Permalink to this heading")

|     |     |     |
| --- | --- | --- |
| [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) | [DOUBLE\_STRATEGY](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-property-double-strategy) | `{"INCLUDE_NATIVE": 0, "SCRIPT_ONLY": 1}` |
| [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) | [ParameterFactory](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-property-parameterfactory) | `<unknown>` |
| [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) | [InputFactory](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-property-inputfactory) | `GutInputFactory` |
| [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) | [InputSender](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-property-inputsender) | `<unknown>` |
| [GutMain](https://gut.readthedocs.io/en/latest/class_ref/class_gutmain.html#class-gutmain) | [gut](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-property-gut) | `null` |

## Methods [](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html\#methods "Permalink to this heading")

|     |     |
| --- | --- |
| [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) | [add\_child\_autofree](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-add-child-autofree)(node, legible\_unique\_name = false) |
| [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) | [add\_child\_autoqfree](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-add-child-autoqfree)(node, legible\_unique\_name = false) |
| void | [after\_all](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-after-all)() |
| void | [after\_each](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-after-each)() |
| void | [assert\_accessors](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-accessors)(obj, property, default, set\_to) |
| void | [assert\_almost\_eq](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-almost-eq)(got, expected, error\_interval, text = “”) |
| void | [assert\_almost\_ne](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-almost-ne)(got, not\_expected, error\_interval, text = “”) |
| void | [assert\_between](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-between)(got, expect\_low, expect\_high, text = “”) |
| void | [assert\_called](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-called)(inst, method\_name = null, parameters = null) |
| void | [assert\_called\_count](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-called-count)(callable: [Callable](https://docs.godotengine.org/en/stable/classes/class_callable.html), expected\_count: [int](https://docs.godotengine.org/en/stable/classes/class_int.html)) |
| void | [assert\_connected](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-connected)(signaler\_obj, connect\_to\_obj, signal\_name, method\_name = “”) |
| void | [assert\_does\_not\_have](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-does-not-have)(obj, element, text = “”) |
| void | [assert\_eq](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-eq)(got, expected, text = “”) |
| void | [assert\_eq\_deep](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-eq-deep)(v1, v2) |
| void | [assert\_exports](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-exports)(obj, property\_name, type) |
| void | [assert\_false](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-false)(got, text = “”) |
| void | [assert\_file\_does\_not\_exist](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-file-does-not-exist)(file\_path) |
| void | [assert\_file\_empty](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-file-empty)(file\_path) |
| void | [assert\_file\_exists](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-file-exists)(file\_path) |
| void | [assert\_file\_not\_empty](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-file-not-empty)(file\_path) |
| void | [assert\_freed](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-freed)(obj, title = “something”) |
| void | [assert\_gt](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-gt)(got, expected, text = “”) |
| void | [assert\_gte](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-gte)(got, expected, text = “”) |
| void | [assert\_has](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-has)(obj, element, text = “”) |
| void | [assert\_has\_method](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-has-method)(obj, method, text = “”) |
| void | [assert\_has\_signal](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-has-signal)(object, signal\_name, text = “”) |
| void | [assert\_is](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-is)(object, a\_class, text = “”) |
| void | [assert\_lt](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-lt)(got, expected, text = “”) |
| void | [assert\_lte](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-lte)(got, expected, text = “”) |
| void | [assert\_ne](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-ne)(got, not\_expected, text = “”) |
| void | [assert\_ne\_deep](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-ne-deep)(v1, v2) |
| void | [assert\_no\_new\_orphans](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-no-new-orphans)(text = “”) |
| void | [assert\_not\_between](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-not-between)(got, expect\_low, expect\_high, text = “”) |
| void | [assert\_not\_called](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-not-called)(inst, method\_name = null, parameters = null) |
| void | [assert\_not\_connected](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-not-connected)(signaler\_obj, connect\_to\_obj, signal\_name, method\_name = “”) |
| void | [assert\_not\_freed](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-not-freed)(obj, title = “something”) |
| void | [assert\_not\_null](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-not-null)(got, text = “”) |
| void | [assert\_not\_same](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-not-same)(v1, v2, text = “”) |
| void | [assert\_not\_typeof](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-not-typeof)(object, type, text = “”) |
| void | [assert\_null](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-null)(got, text = “”) |
| void | [assert\_property](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-property)(obj, property\_name, default\_value, new\_value) |
| void | [assert\_property\_with\_backing\_variable](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-property-with-backing-variable)(obj, property\_name, default\_value, new\_value, backed\_by\_name = null) |
| void | [assert\_same](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-same)(v1, v2, text = “”) |
| void | [assert\_signal\_emit\_count](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-signal-emit-count)(object, signal\_name, times, text = “”) |
| void | [assert\_signal\_emitted](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-signal-emitted)(object, signal\_name, text = “”) |
| void | [assert\_signal\_emitted\_with\_parameters](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-signal-emitted-with-parameters)(object, signal\_name, parameters, index = -1) |
| void | [assert\_signal\_not\_emitted](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-signal-not-emitted)(object, signal\_name, text = “”) |
| void | [assert\_string\_contains](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-string-contains)(text, search, match\_case = true) |
| void | [assert\_string\_ends\_with](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-string-ends-with)(text, search, match\_case = true) |
| void | [assert\_string\_starts\_with](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-string-starts-with)(text, search, match\_case = true) |
| void | [assert\_true](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-true)(got, text = “”) |
| void | [assert\_typeof](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-typeof)(object, type, text = “”) |
| [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) | [autofree](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-autofree)(thing) |
| [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) | [autoqfree](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-autoqfree)(thing) |
| void | [before\_all](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-before-all)() |
| void | [before\_each](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-before-each)() |
| [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) | [compare\_deep](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-compare-deep)(v1, v2, max\_differences = null) |
| [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) | [did\_wait\_timeout](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-did-wait-timeout)() |
| [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) | [double](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-double)(thing, double\_strat = null, not\_used\_anymore = null) |
| void | [fail\_test](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-fail-test)(text) |
| [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) | [get\_assert\_count](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-get-assert-count)() |
| [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) | [get\_call\_count](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-get-call-count)(object, method\_name = null, parameters = null) |
| [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) | [get\_call\_parameters](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-get-call-parameters)(object, method\_name\_or\_index = -1, idx = -1) |
| [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) | [get\_double\_strategy](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-get-double-strategy)() |
| [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) | [get\_fail\_count](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-get-fail-count)() |
| [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) | [get\_pass\_count](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-get-pass-count)() |
| [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) | [get\_pending\_count](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-get-pending-count)() |
| [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) | [get\_signal\_emit\_count](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-get-signal-emit-count)(object, signal\_name) |
| [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) | [get\_signal\_parameters](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-get-signal-parameters)(object, signal\_name, index = -1) |
| void | [ignore\_method\_when\_doubling](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-ignore-method-when-doubling)(thing, method\_name) |
| [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) | [is\_failing](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-is-failing)() |
| [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) | [is\_passing](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-is-passing)() |
| [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) | [partial\_double](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-partial-double)(thing, double\_strat = null, not\_used\_anymore = null) |
| void | [pass\_test](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-pass-test)(text) |
| void | [pause\_before\_teardown](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-pause-before-teardown)() |
| void | [pending](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-pending)(text = “”) |
| void | [register\_inner\_classes](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-register-inner-classes)(base\_script) |
| void | [replace\_node](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-replace-node)(base\_node, path\_or\_node, with\_this) |
| void | [set\_double\_strategy](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-set-double-strategy)(double\_strategy) |
| [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) | [should\_skip\_script](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-should-skip-script)() |
| void | [simulate](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-simulate)(obj, times, delta, check\_is\_processing: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html) = false) |
| [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) | [skip\_if\_godot\_version\_lt](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-skip-if-godot-version-lt)(expected) |
| [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) | [skip\_if\_godot\_version\_ne](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-skip-if-godot-version-ne)(expected) |
| [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) | [stub](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-stub)(thing, p2 = null, p3 = null) |
| [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) | [use\_parameters](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-use-parameters)(params) |
| [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) | [wait\_for\_signal](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-wait-for-signal)(sig: [Signal](https://docs.godotengine.org/en/stable/classes/class_signal.html), max\_wait, msg = “”) |
| [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) | [wait\_frames](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-wait-frames)(frames, msg = “”) |
| [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) | [wait\_seconds](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-wait-seconds)(time, msg = “”) |
| [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) | [wait\_until](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-wait-until)(callable, max\_wait, p3 = “”, p4 = “”) |
| void | [watch\_signals](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-watch-signals)(object) |

|     |     |     |
| --- | --- | --- |
| Deprecated | void | [assert\_call\_count](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-call-count)(inst, method\_name, expected\_count, parameters = null) |
| Deprecated | void | [assert\_setget](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-setget)(instance, name\_property, const\_or\_setter = null, getter = “\_\_not\_set\_\_”) |
| Deprecated | [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) | [double\_inner](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-double-inner)(path, subpath, strategy = null) |
| Deprecated | [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) | [double\_scene](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-double-scene)(path, strategy = null) |
| Deprecated | [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) | [double\_script](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-double-script)(path, strategy = null) |
| Deprecated | [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) | [yield\_for](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-yield-for)(time, msg = “”) |
| Deprecated | [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) | [yield\_frames](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-yield-frames)(frames, msg = “”) |
| Deprecated | [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) | [yield\_to](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-yield-to)(obj, signal\_name, max\_wait, msg = “”) |

|     |     |     |
| --- | --- | --- |
| Internal Use | void | [clear\_signal\_watcher](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-clear-signal-watcher)() |
| Internal Use | [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) | [double\_singleton](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-double-singleton)(singleton\_name) |
| Internal Use | [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) | [get\_logger](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-get-logger)() |
| Internal Use | [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) | [get\_summary](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-get-summary)() |
| Internal Use | [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) | [get\_summary\_text](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-get-summary-text)() |
| Internal Use | [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) | [partial\_double\_singleton](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-partial-double-singleton)(singleton\_name) |
| Internal Use | [Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) | [run\_x\_times](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-run-x-times)(x) |
| Internal Use | void | [set\_logger](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-set-logger)(logger) |

* * *

## Constants [](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html\#constants "Permalink to this heading")

**EDITOR\_PROPERTY** = `4102` [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-constant-editor-property)

No description

**VARIABLE\_PROPERTY** = `4096` [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-constant-variable-property)

No description

* * *

## Property Descriptions [](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html\#property-descriptions "Permalink to this heading")

[Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) **DOUBLE\_STRATEGY** = `{"INCLUDE_NATIVE": 0, "SCRIPT_ONLY": 1}` [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-property-double-strategy)

No description

* * *

[Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) **ParameterFactory** = `<unknown>` [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-property-parameterfactory)

Reference to [addons/gut/parameter\_factory.gd](https://gut.readthedocs.io/en/latest/class_ref/class_addons_gut_parameter_factory.html#class-addons-gut-parameter-factory-gd) script.

* * *

[Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) **InputFactory** = `GutInputFactory` [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-property-inputfactory)

Reference to [GutInputFactory](https://gut.readthedocs.io/en/latest/class_ref/class_gutinputfactory.html#class-gutinputfactory) class that was originally used to reference the Input Factory before the class\_name was introduced.

* * *

[Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) **InputSender** = `<unknown>` [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-property-inputsender)

Reference to [GutInputSender](https://gut.readthedocs.io/en/latest/class_ref/class_gutinputsender.html#class-gutinputsender). This was the way you got to the [GutInputSender](https://gut.readthedocs.io/en/latest/class_ref/class_gutinputsender.html#class-gutinputsender) before it was given a `class_name`

* * *

[GutMain](https://gut.readthedocs.io/en/latest/class_ref/class_gutmain.html#class-gutmain) **gut** = `null` [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-property-gut)

No description

* * *

## Method Descriptions [](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html\#method-descriptions "Permalink to this heading")

[Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) **should\_skip\_script**() [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-should-skip-script)

Virtual Method. This is run after the script has been prepped for execution, but before before\_all is executed. If you implement this method and return true or a String (the string is displayed in the log) then GUT will stop executing the script and mark it as risky. You might want to do this because: - You are porting tests from 3.x to 4.x and you don’t want to comment everything out.

- Skipping tests that should not be run when in headless mode such as input testing that does not work in headless.


```
func should_skip_script():
    if DisplayServer.get_name() == "headless":
        return "Skip Input tests when running headless"

```

- If you have tests that would normally cause the debugger to break on an error, you can skip the script if the debugger is enabled so that the run is not interrupted.


```
func should_skip_script():
    return EngineDebugger.is_active()

```

* * *

void **before\_all**() [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-before-all)

Virtual method. Run once before anything else in the test script is run.

* * *

void **before\_each**() [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-before-each)

Virtual method. Run before each test is executed

* * *

void **after\_each**() [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-after-each)

Virtual method. Run after each test is executed.

* * *

void **after\_all**() [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-after-all)

Virtual method. Run after all tests have been run.

* * *

void **pending**(text = “”) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-pending)

Mark the current test as pending.

* * *

[Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) **is\_passing**() [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-is-passing)

Returns true if the test is passing as of the time of this call. False if not.

* * *

[Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) **is\_failing**() [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-is-failing)

Returns true if the test is failing as of the time of this call. False if not.

* * *

void **pass\_test**(text) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-pass-test)

Marks the test as passing. Does not override any failing asserts or calls to fail\_test. Same as a passing assert.

* * *

void **fail\_test**(text) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-fail-test)

Marks the test as failing. Same as a failing assert.

* * *

void **clear\_signal\_watcher**() [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-clear-signal-watcher)

**Internal use only.**

* * *

[Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) **get\_double\_strategy**() [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-get-double-strategy)

Returns the current double strategy.

* * *

void **set\_double\_strategy**(double\_strategy) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-set-double-strategy)

Sets the double strategy for all tests in the script. This should usually be done in [before\_all](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-before-all). The double strtegy can be set per run/script/double. See [Double-Strategy](https://gut.readthedocs.io/en/latest/Double-Strategy.html)

* * *

void **pause\_before\_teardown**() [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-pause-before-teardown)

This method will cause Gut to pause before it moves on to the next test. This is useful for debugging, for instance if you want to investigate the screen or anything else after a test has finished executing.

Sometimes you get lazy, and you don’t remove calls to `pause_before_teardown` after you are done with them. You can tell GUT to ignore calls to to this method through the panel or the command line. Setting this in your .gutconfig.json file is recommended for CI/CD Pipelines.

* * *

[Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) **get\_logger**() [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-get-logger)

**Internal use only.**

* * *

void **set\_logger**(logger) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-set-logger)

**Internal use only.**

* * *

void **watch\_signals**(object) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-watch-signals)

This must be called in order to make assertions based on signals being emitted. \_\_Right now, this only supports signals that are emitted with 9 or less parameters.\_\_ This can be extended but nine seemed like enough for now. The Godot documentation suggests that the limit is four but in my testing I found you can pass more.

This must be called in each test in which you want to make signal based assertions in. You can call it multiple times with different objects. You should not call it multiple times with the same object in the same test. The objects that are watched are cleared after each test (specifically right before teardown is called). Under the covers, Gut will connect to all the signals an object has and it will track each time they fire. You can then use the following asserts and methods to verify things are acting correct.

* * *

[Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) **get\_signal\_emit\_count**(object, signal\_name) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-get-signal-emit-count)

This will return the number of times a signal was fired. This gives you the freedom to make more complicated assertions if the spirit moves you. This will return -1 if the signal was not fired or the object was not being watched, or if the object does not have the signal.

* * *

[Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) **get\_signal\_parameters**(object, signal\_name, index = -1) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-get-signal-parameters)

If you need to inspect the parameters in order to make more complicate assertions, then this will give you access to the parameters of any watched signal. This works the same way that `assert_signal_emitted_with_parameters` does. It takes an object, signal name, and an optional index. If the index is not specified then the parameters from the most recent emission will be returned. If the object is not being watched, the signal was not fired, or the object does not have the signal then null will be returned.

```
class SignalObject:
    signal some_signal
    signal other_signal

func test_get_signal_parameters():
    var obj = SignalObject.new()
    watch_signals(obj)
    obj.some_signal.emit(1, 2, 3)
    obj.some_signal.emit('a', 'b', 'c')

    # Passing
    # passes because get_signal_parameters returns the most recent emission
    # by default
    assert_eq(get_signal_parameters(obj, 'some_signal'), ['a', 'b', 'c'])
    assert_eq(get_signal_parameters(obj, 'some_signal', 0), [1, 2, 3])
    # if the signal was not fired null is returned
    assert_eq(get_signal_parameters(obj, 'other_signal'), null)
    # if the signal does not exist or isn't being watched null is returned
    assert_eq(get_signal_parameters(obj, 'signal_dne'), null)

    # Failing
    assert_eq(get_signal_parameters(obj, 'some_signal'), [1, 2, 3])
    assert_eq(get_signal_parameters(obj, 'some_signal', 0), ['a', 'b', 'c'])

```

* * *

[Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) **get\_call\_parameters**(object, method\_name\_or\_index = -1, idx = -1) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-get-call-parameters)

Get the parameters for a method call to a doubled object. By default it will return the most recent call. You can optionally specify an index for which call you want to get the parameters for. Can be called using a Callable for the first parameter instead of specifying an object and method name. When you do this, the seoncd parameter is used as the index. Returns: \* an array of parameter values if a call the method was found \* null when a call to the method was not found or the index specified was invalid.

* * *

[Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) **get\_call\_count**(object, method\_name = null, parameters = null) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-get-call-count)

Returns the call count for a method with optional paramter matching. Can be called with a Callable instead of an object, method\_name, and parameters. Bound arguments will be used to match call arguments.

* * *

void **simulate**(obj, times, delta, check\_is\_processing: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html) = false) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-simulate)

Simulate a number of frames by calling ‘\_process’ and ‘\_physics\_process’ (if the methods exist) on an object and all of its descendents. The specified frame time, ‘delta’, will be passed to each simulated call. NOTE: Objects can disable their processing methods using ‘set\_process(false)’ and ‘set\_physics\_process(false)’. This is reflected in the ‘Object’ methods ‘is\_processing()’ and ‘is\_physics\_processing()’, respectively. To make ‘simulate’ respect this status, for example if you are testing an object which toggles processing, pass ‘check\_is\_processing’ as ‘true’.

* * *

void **replace\_node**(base\_node, path\_or\_node, with\_this) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-replace-node)

No description

* * *

[Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) **use\_parameters**(params) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-use-parameters)

Use this as the default value for the first parameter to a test to create a parameterized test. See also the ParameterFactory and Parameterized Tests.

**Example**

```
func test_with_parameters(p = use_parameters([1, 2, 3])):

```

* * *

[Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) **run\_x\_times**(x) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-run-x-times)

**Internal use only.** When used as the default for a test method parameter, it will cause the test to be run x times. I Hacked this together to test a method that was occassionally failing due to timing issues. I don’t think it’s a great idea, but you be the judge. If you find a good use for it, let me know and I’ll make it a legit member of the api.

* * *

[Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) **skip\_if\_godot\_version\_lt**(expected) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-skip-if-godot-version-lt)

Checks the passed in version string (x.x.x) against the engine version to see if the engine version is less than the expected version. If it is then the test is mareked as passed (for a lack of anything better to do). The result of the check is returned.

**Example**

```
if(skip_if_godot_version_lt('3.5.0')):
    return

```

* * *

[Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) **skip\_if\_godot\_version\_ne**(expected) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-skip-if-godot-version-ne)

Checks if the passed in version matches the engine version. The passed in version can contain just the major, major.minor or major.minor.path. If the version is not the same then the test is marked as passed. The result of the check is returned.

**Example**

```
if(skip_if_godot_version_ne('3.4')):
   return

```

* * *

void **register\_inner\_classes**(base\_script) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-register-inner-classes)

Registers all the inner classes in a script with the doubler. This is required before you can double any inner class.

* * *

[Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) **compare\_deep**(v1, v2, max\_differences = null) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-compare-deep)

Peforms a deep compare on both values, a CompareResult instnace is returned. The optional max\_differences paramter sets the max\_differences to be displayed.

* * *

void **assert\_eq**(got, expected, text = “”) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-eq)

Asserts that the expected value equals the value got. assert got == expected and prints optional text. See [Comparing-Things](https://gut.readthedocs.io/en/latest/Comparing-Things.html) for information about comparing dictionaries and arrays.

See also: [assert\_ne](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-ne), [assert\_same](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-same), [assert\_not\_same](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-not-same)

```
var one = 1
var node1 = Node.new()
var node2 = node1

# Passing
assert_eq(one, 1, 'one should equal one')
assert_eq('racecar', 'racecar')
assert_eq(node2, node1)
assert_eq([1, 2, 3], [1, 2, 3])
var d1_pass = {'a':1}
var d2_pass = d1_pass
assert_eq(d1_pass, d2_pass)

# Failing
assert_eq(1, 2) # FAIL
assert_eq('hello', 'world')
assert_eq(self, node1)
assert_eq([1, 'two', 3], [1, 2, 3, 4])
assert_eq({'a':1}, {'a':1})

```

* * *

void **assert\_ne**(got, not\_expected, text = “”) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-ne)

asserts got != expected and prints optional text. See [Comparing-Things](https://gut.readthedocs.io/en/latest/Comparing-Things.html) for information about comparing dictionaries and arrays.

See also: [assert\_eq](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-eq), [assert\_same](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-same), [assert\_not\_same](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-not-same)

```
var two = 2
var node1 = Node.new()

# Passing
assert_ne(two, 1, 'Two should not equal one.')
assert_ne('hello', 'world')
assert_ne(self, node1)

# Failing
assert_ne(two, 2)
assert_ne('one', 'one')
assert_ne('2', 2)

```

* * *

void **assert\_almost\_eq**(got, expected, error\_interval, text = “”) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-almost-eq)

Asserts that `got` is within the range of `expected` \+/\- `error_interval`. The upper and lower bounds are included in the check. Verified to work with integers, floats, and Vector2. Should work with anything that can be added/subtracted.

```
# Passing
assert_almost_eq(0, 1, 1, '0 within range of 1 +/- 1')
assert_almost_eq(2, 1, 1, '2 within range of 1 +/- 1')
assert_almost_eq(1.2, 1.0, .5, '1.2 within range of 1 +/- .5')
assert_almost_eq(.5, 1.0, .5, '.5 within range of 1 +/- .5')
assert_almost_eq(Vector2(.5, 1.5), Vector2(1.0, 1.0), Vector2(.5, .5))
assert_almost_eq(Vector2(.5, 1.5), Vector2(1.0, 1.0), Vector2(.25, .25))

# Failing
assert_almost_eq(1, 3, 1, '1 outside range of 3 +/- 1')
assert_almost_eq(2.6, 3.0, .2, '2.6 outside range of 3 +/- .2')

```

* * *

void **assert\_almost\_ne**(got, not\_expected, error\_interval, text = “”) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-almost-ne)

This is the inverse of [assert\_almost\_eq](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-almost-eq). This will pass if `got` is outside the range of `not_expected` \+/\- `error_interval`.

* * *

void **assert\_gt**(got, expected, text = “”) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-gt)

assserts got > expected

```
var bigger = 5
var smaller = 0

# Passing
assert_gt(bigger, smaller, 'Bigger should be greater than smaller')
assert_gt('b', 'a')
assert_gt('a', 'A')
assert_gt(1.1, 1)

# Failing
assert_gt('a', 'a')
assert_gt(1.0, 1)
assert_gt(smaller, bigger)

```

* * *

void **assert\_gte**(got, expected, text = “”) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-gte)

Asserts got is greater than or equal to expected.

```
var bigger = 5
var smaller = 0

# Passing
assert_gte(bigger, smaller, 'Bigger should be greater than or equal to smaller')
assert_gte('b', 'a')
assert_gte('a', 'A')
assert_gte(1.1, 1)
assert_gte('a', 'a')

# Failing
assert_gte(0.9, 1.0)
assert_gte(smaller, bigger)

```

* * *

void **assert\_lt**(got, expected, text = “”) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-lt)

Asserts `got` is less than `expected`

```
var bigger = 5
var smaller = 0

# Passing
assert_lt(smaller, bigger, 'Smaller should be less than bigger')
assert_lt('a', 'b')
assert_lt(99, 100)

# Failing
assert_lt('z', 'x')
assert_lt(-5, -5)

```

* * *

void **assert\_lte**(got, expected, text = “”) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-lte)

Asserts got is less than or equal to expected

* * *

void **assert\_true**(got, text = “”) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-true)

asserts that got is true. Does not assert truthiness, only boolean values will pass.

* * *

void **assert\_false**(got, text = “”) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-false)

Asserts that got is false. Does not assert truthiness, only boolean values will pass.

* * *

void **assert\_between**(got, expect\_low, expect\_high, text = “”) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-between)

Asserts value is between (inclusive) the two expected values.

got >= expect\_low and <= expect\_high

```
# Passing
assert_between(5, 0, 10, 'Five should be between 0 and 10')
assert_between(10, 0, 10)
assert_between(0, 0, 10)
assert_between(2.25, 2, 4.0)

# Failing
assert_between('a', 'b', 'c')
assert_between(1, 5, 10)

```

* * *

void **assert\_not\_between**(got, expect\_low, expect\_high, text = “”) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-not-between)

Asserts value is not between (exclusive) the two expected values.

asserts that got <= expect\_low or got >= expect\_high.

```
# Passing
assert_not_between(1, 5, 10)
assert_not_between('a', 'b', 'd')
assert_not_between('d', 'b', 'd')
assert_not_between(10, 0, 10)
assert_not_between(-2, -2, 10)

# Failing
assert_not_between(5, 0, 10, 'Five shouldnt be between 0 and 10')
assert_not_between(0.25, -2.0, 4.0)

```

* * *

void **assert\_has**(obj, element, text = “”) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-has)

Uses the ‘has’ method of the object passed in to determine if it contains the passed in element.

```
var an_array = [1, 2, 3, 'four', 'five']
var a_hash = { 'one':1, 'two':2, '3':'three'}

# Passing
assert_has(an_array, 'four') # PASS
assert_has(an_array, 2) # PASS
# the hash's has method checks indexes not values
assert_has(a_hash, 'one') # PASS
assert_has(a_hash, '3') # PASS

# Failing
assert_has(an_array, 5) # FAIL
assert_has(an_array, self) # FAIL
assert_has(a_hash, 3) # FAIL
assert_has(a_hash, 'three') # FAIL

```

* * *

void **assert\_does\_not\_have**(obj, element, text = “”) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-does-not-have)

The inverse of assert\_has.

* * *

void **assert\_file\_exists**(file\_path) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-file-exists)

asserts a file exists at the specified path

```
func before_each():
    gut.file_touch('user://some_test_file')

func after_each():
    gut.file_delete('user://some_test_file')

func test_assert_file_exists():
    # Passing
    assert_file_exists('res://addons/gut/gut.gd')
    assert_file_exists('user://some_test_file')

    # Failing
    assert_file_exists('user://file_does_not.exist')
    assert_file_exists('res://some_dir/another_dir/file_does_not.exist')

```

* * *

void **assert\_file\_does\_not\_exist**(file\_path) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-file-does-not-exist)

asserts a file does not exist at the specified path

```
func before_each():
    gut.file_touch('user://some_test_file')

func after_each():
    gut.file_delete('user://some_test_file')

func test_assert_file_does_not_exist():
    # Passing
    assert_file_does_not_exist('user://file_does_not.exist')
    assert_file_does_not_exist('res://some_dir/another_dir/file_does_not.exist')

    # Failing
    assert_file_does_not_exist('res://addons/gut/gut.gd')

```

* * *

void **assert\_file\_empty**(file\_path) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-file-empty)

asserts the specified file is empty

```
func before_each():
    gut.file_touch('user://some_test_file')

func after_each():
    gut.file_delete('user://some_test_file')

func test_assert_file_empty():
    # Passing
    assert_file_empty('user://some_test_file')

    # Failing
    assert_file_empty('res://addons/gut/gut.gd')

```

* * *

void **assert\_file\_not\_empty**(file\_path) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-file-not-empty)

Asserts the specified file is not empty

```
func before_each():
    gut.file_touch('user://some_test_file')

func after_each():
    gut.file_delete('user://some_test_file')

func test_assert_file_not_empty():
    # Passing
    assert_file_not_empty('res://addons/gut/gut.gd') # PASS

    # Failing
    assert_file_not_empty('user://some_test_file') # FAIL

```

* * *

void **assert\_has\_method**(obj, method, text = “”) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-has-method)

Asserts that the passed in object has a method named `method`.

* * *

void **assert\_accessors**(obj, property, default, set\_to) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-accessors)

This is meant to make testing public get/set methods for a member variable. This was originally created for early Godot 3.x setter and getter methods. See [assert\_property](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-property) for verifying Godot 4.x accessors. This makes multiple assertions to verify:

- The object has a method called `get_<PROPERTY_NAME>`

- The object has a method called `set_<PROPERTY_NAME>`

- The method `get_<PROPERTY_NAME>` returns the expected default value when first called.

- Once you set the property, the `get_<PROPERTY_NAME>` returns the new value.


* * *

void **assert\_exports**(obj, property\_name, type) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-exports)

Asserts that `obj` exports a property with the name `property_name` and a type of `type`. The `type` must be one of the various Godot built-in `TYPE_` constants.

```
class ExportClass:
    export var some_number = 5
    export(PackedScene) var some_scene
    var some_variable = 1

func test_assert_exports():
    var obj = ExportClass.new()

    # Passing
    assert_exports(obj, "some_number", TYPE_INT)
    assert_exports(obj, "some_scene", TYPE_OBJECT)

    # Failing
    assert_exports(obj, 'some_number', TYPE_VECTOR2)
    assert_exports(obj, 'some_scene', TYPE_AABB)
    assert_exports(obj, 'some_variable', TYPE_INT)

```

* * *

void **assert\_connected**(signaler\_obj, connect\_to\_obj, signal\_name, method\_name = “”) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-connected)

Asserts that signaler\_obj is connected to connect\_to\_obj on signal signal\_name. The method that is connected is optional. If method\_name is supplied then this will pass only if the signal is connected to the method. If it is not provided then any connection to the signal will cause a pass.

```
class Signaler:
    signal the_signal

class Connector:
    func connect_this():
        pass
    func  other_method():
        pass

func test_assert_connected():
    var signaler = Signaler.new()
    var connector  = Connector.new()
    signaler.connect('the_signal', connector, 'connect_this')

    # Passing
    assert_connected(signaler, connector, 'the_signal')
    assert_connected(signaler, connector, 'the_signal', 'connect_this')

    # Failing
    var foo = Connector.new()
    assert_connected(signaler,  connector, 'the_signal', 'other_method')
    assert_connected(signaler, connector, 'other_signal')
    assert_connected(signaler, foo, 'the_signal')

```

* * *

void **assert\_not\_connected**(signaler\_obj, connect\_to\_obj, signal\_name, method\_name = “”) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-not-connected)

Asserts that an object is not connected to a signal on another object

This will fail with specific messages if the target object is connected to the specified signal on the source object.

* * *

void **assert\_signal\_emitted**(object, signal\_name, text = “”) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-signal-emitted)

Assert that the specified object emitted the named signal. You must call [watch\_signals](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-watch-signals) and pass it the object that you are making assertions about. This will fail if the object is not being watched or if the object does not have the specified signal. Since this will fail if the signal does not exist, you can often skip using [assert\_has\_signal](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-has-signal).

```
class SignalObject:
    signal some_signal
    signal other_signal

func test_assert_signal_emitted():
    var obj = SignalObject.new()

    watch_signals(obj)
    obj.emit_signal('some_signal')

    ## Passing
    assert_signal_emitted(obj, 'some_signal')

    ## Failing
    # Fails with specific message that the object does not have the signal
    assert_signal_emitted(obj, 'signal_does_not_exist')
    # Fails because the object passed is not being watched
    assert_signal_emitted(SignalObject.new(), 'some_signal')
    # Fails because the signal was not emitted
    assert_signal_emitted(obj, 'other_signal')

```

* * *

void **assert\_signal\_not\_emitted**(object, signal\_name, text = “”) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-signal-not-emitted)

This works opposite of assert\_signal\_emitted. This will fail if the object is not being watched or if the object does not have the signal.

```
class SignalObject:
    signal some_signal
    signal other_signal

func test_assert_signal_not_emitted():
    var obj = SignalObject.new()

    watch_signals(obj)
    obj.emit_signal('some_signal')

    # Passing
    assert_signal_not_emitted(obj, 'other_signal')

    # Failing
    # Fails with specific message that the object does not have the signal
    assert_signal_not_emitted(obj, 'signal_does_not_exist')
    # Fails because the object passed is not being watched
    assert_signal_not_emitted(SignalObject.new(), 'some_signal')
    # Fails because the signal was emitted
    assert_signal_not_emitted(obj, 'some_signal')

```

* * *

void **assert\_signal\_emitted\_with\_parameters**(object, signal\_name, parameters, index = -1) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-signal-emitted-with-parameters)

Asserts that a signal was fired with the specified parameters. The expected parameters should be passed in as an array. An optional index can be passed when a signal has fired more than once. The default is to retrieve the most recent emission of the signal.

This will fail with specific messages if the object is not being watched or the object does not have the specified signal

```
class SignalObject:
    signal some_signal
    signal other_signal

func test_assert_signal_emitted_with_parameters():
    var obj = SignalObject.new()

    watch_signals(obj)
    # emit the signal 3 times to illustrate how the index works in
    # assert_signal_emitted_with_parameters
    obj.emit_signal('some_signal', 1, 2, 3)
    obj.emit_signal('some_signal', 'a', 'b', 'c')
    obj.emit_signal('some_signal', 'one', 'two', 'three')

    # Passing
    # Passes b/c the default parameters to check are the last emission of
    # the signal
    assert_signal_emitted_with_parameters(obj, 'some_signal', ['one', 'two', 'three'])
    # Passes because the parameters match the specified emission based on index.
    assert_signal_emitted_with_parameters(obj, 'some_signal', [1, 2, 3], 0)

    # Failing
    # Fails with specific message that the object does not have the signal
    assert_signal_emitted_with_parameters(obj, 'signal_does_not_exist', [])
    # Fails because the object passed is not being watched
    assert_signal_emitted_with_parameters(SignalObject.new(), 'some_signal', [])
    # Fails because parameters do not match latest emission
    assert_signal_emitted_with_parameters(obj, 'some_signal', [1, 2, 3])
    # Fails because the parameters for the specified index do not match
    assert_signal_emitted_with_parameters(obj, 'some_signal', [1, 2, 3], 1)

```

* * *

void **assert\_signal\_emit\_count**(object, signal\_name, times, text = “”) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-signal-emit-count)

Asserts that a signal fired a specific number of times.

```
class SignalObject:
    signal some_signal
    signal other_signal

func test_assert_signal_emit_count():
    var obj_a = SignalObject.new()
    var obj_b = SignalObject.new()

    watch_signals(obj_a)
    watch_signals(obj_b)
    obj_a.emit_signal('some_signal')
    obj_a.emit_signal('some_signal')

    obj_b.emit_signal('some_signal')
    obj_b.emit_signal('other_signal')

    # Passing
    assert_signal_emit_count(obj_a, 'some_signal', 2)
    assert_signal_emit_count(obj_a, 'other_signal', 0)

    assert_signal_emit_count(obj_b, 'other_signal', 1)

    # Failing
    # Fails with specific message that the object does not have the signal
    assert_signal_emit_count(obj_a, 'signal_does_not_exist', 99)
    # Fails because the object passed is not being watched
    assert_signal_emit_count(SignalObject.new(), 'some_signal', 99)
    # The following fail for obvious reasons
    assert_signal_emit_count(obj_a, 'some_signal', 0)
    assert_signal_emit_count(obj_b, 'other_signal', 283)

```

* * *

void **assert\_has\_signal**(object, signal\_name, text = “”) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-has-signal)

Asserts the passed in object has a signal with the specified name. It should be noted that all the asserts that verify a signal was/wasn’t emitted will first check that the object has the signal being asserted against. If it does not, a specific failure message will be given. This means you can usually skip the step of specifically verifying that the object has a signal and move on to making sure it emits the signal correctly.

```
class SignalObject:
    signal some_signal
    signal other_signal

func test_assert_has_signal():
    var obj = SignalObject.new()

    ## Passing
    assert_has_signal(obj, 'some_signal')
    assert_has_signal(obj, 'other_signal')

    ## Failing
    assert_has_signal(obj, 'not_a real SIGNAL')
    assert_has_signal(obj, 'yea, this one doesnt exist either')
    # Fails because the signal is not a user signal.  Node2D does have the
    # specified signal but it can't be checked this way.  It could be watched
    # and asserted that it fired though.
    assert_has_signal(Node2D.new(), 'exit_tree')

```

* * *

void **assert\_is**(object, a\_class, text = “”) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-is)

Asserts that `object` extends `a_class`. object must be an instance of an object. It cannot be any of the built in classes like Array or Int or Float. `a_class` must be a class, it can be loaded via load, a GDNative class such as Node or Label or anything else.

```
# Passing
assert_is(Node2D.new(), Node2D)
assert_is(Label.new(), CanvasItem)
assert_is(SubClass.new(), BaseClass)
# Since this is a test script that inherits from test.gd, so
# this passes.  It's not obvious w/o seeing the whole script
# so I'm telling you.  You'll just have to trust me.
assert_is(self, load('res://addons/gut/test.gd'))

var Gut = load('res://addons/gut/gut.gd')
var a_gut = Gut.new()
assert_is(a_gut, Gut)

# Failing
assert_is(Node2D.new(), Node2D.new())
assert_is(BaseClass.new(), SubClass)
assert_is('a', 'b')
assert_is([], Node)

```

* * *

void **assert\_typeof**(object, type, text = “”) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-typeof)

Asserts that `object` is the the `type` specified. `type` should be one of the Godot `TYPE_` constants.

```
# Passing
var c = Color(1, 1, 1, 1)
gr.test.assert_typeof(c, TYPE_COLOR)
assert_pass(gr.test)

# Failing
gr.test.assert_typeof('some string', TYPE_INT)
assert_fail(gr.test)

```

* * *

void **assert\_not\_typeof**(object, type, text = “”) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-not-typeof)

The inverse of [assert\_typeof](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-typeof)

* * *

void **assert\_string\_contains**(text, search, match\_case = true) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-string-contains)

Assert that text contains search. Can perform case insensitive search by passing false for match\_case.

```
# Passing
assert_string_contains('abc 123', 'a')
assert_string_contains('abc 123', 'BC', false)
assert_string_contains('abc 123', '3')

# Failing
assert_string_contains('abc 123', 'A')
assert_string_contains('abc 123', 'BC')
assert_string_contains('abc 123', '012')

```

* * *

void **assert\_string\_starts\_with**(text, search, match\_case = true) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-string-starts-with)

Assert that text starts with search. Can perform case insensitive check by passing false for match\_case

```
# Passing
assert_string_starts_with('abc 123', 'a')
assert_string_starts_with('abc 123', 'ABC', false)
assert_string_starts_with('abc 123', 'abc 123')

## Failing
assert_string_starts_with('abc 123', 'z')
assert_string_starts_with('abc 123', 'ABC')
assert_string_starts_with('abc 123', 'abc 1234')

```

* * *

void **assert\_string\_ends\_with**(text, search, match\_case = true) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-string-ends-with)

Assert that `text` ends with `search`. Can perform case insensitive check by passing false for `match_case`

```
## Passing
assert_string_ends_with('abc 123', '123')
assert_string_ends_with('abc 123', 'C 123', false)
assert_string_ends_with('abc 123', 'abc 123')

## Failing
assert_string_ends_with('abc 123', '1234')
assert_string_ends_with('abc 123', 'C 123')
assert_string_ends_with('abc 123', 'nope')

```

* * *

void **assert\_called**(inst, method\_name = null, parameters = null) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-called)

Assert that a method was called on an instance of a doubled class. If parameters are supplied then the params passed in when called must match. Can be called with a Callabe instead of specifying the object, method\_name, and parameters. The Callable’s object must be a double. Bound arguments will be used to match calls based on values passed to the method.

See also: [Doubles](https://gut.readthedocs.io/en/latest/Doubles.html), [Spies](https://gut.readthedocs.io/en/latest/Spies.html)

**Examples**

```
var my_double = double(Foobar).new()
...
assert_called(my_double, 'foo')
assert_called(my_double.foo)
assert_called(my_double, 'foo', [1, 2, 3])
assert_called(my_double.foo.bind(1, 2, 3))

```

* * *

void **assert\_not\_called**(inst, method\_name = null, parameters = null) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-not-called)

Assert that a method was not called on an instance of a doubled class. If parameters are specified then this will only fail if it finds a call that was sent matching parameters. Can be called with a Callabe instead of specifying the object, method\_name, and parameters. The Callable’s object must be a double. Bound arguments will be used to match calls based on values passed to the method.

See also: [Doubles](https://gut.readthedocs.io/en/latest/Doubles.html), [Spies](https://gut.readthedocs.io/en/latest/Spies.html)

**Examples**

```
assert_not_called(my_double, 'foo')
assert_not_called(my_double.foo)
assert_not_called(my_double, 'foo', [1, 2, 3])
assert_not_called(my_double.foo.bind(1, 2, 3))

```

* * *

void **assert\_called\_count**(callable: [Callable](https://docs.godotengine.org/en/stable/classes/class_callable.html), expected\_count: [int](https://docs.godotengine.org/en/stable/classes/class_int.html)) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-called-count)

Asserts the the method of a double was called an expected number of times. If any arguments are bound to the callable then only calls with matching arguments will be counted.

See also: [Doubles](https://gut.readthedocs.io/en/latest/Doubles.html), [Spies](https://gut.readthedocs.io/en/latest/Spies.html)

**Examples**

```
# assert foo was called on my_double 5 times
assert_called_count(my_double.foo, 5)
# assert foo, with parameters [1,2,3], was called on my_double 4 times.
assert_called_count(my_double.foo.bind(1, 2, 3), 4)

```

* * *

void **assert\_null**(got, text = “”) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-null)

Asserts the passed in value is null

* * *

void **assert\_not\_null**(got, text = “”) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-not-null)

Asserts the passed in value is not null.

* * *

void **assert\_freed**(obj, title = “something”) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-freed)

Asserts that the passed in object has been freed. This assertion requires that you pass in some text in the form of a title since, if the object is freed, we won’t have anything to convert to a string to put in the output statement.

**Note** that this currently does not detect if a node has been queued free.

```
var obj = Node.new()
obj.free()
test.assert_freed(obj, "New Node")

```

* * *

void **assert\_not\_freed**(obj, title = “something”) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-not-freed)

The inverse of [assert\_freed](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-freed)

* * *

void **assert\_no\_new\_orphans**(text = “”) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-no-new-orphans)

This method will assert that no orphaned nodes have been introduced by the test when the assert is executed. See the [Memory-Management](https://gut.readthedocs.io/en/latest/Memory-Management.html) page for more information.

* * *

void **assert\_property\_with\_backing\_variable**(obj, property\_name, default\_value, new\_value, backed\_by\_name = null) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-property-with-backing-variable)

Assumes backing varible with be \_<property\_name>. This will perform all the asserts of assert\_property. Then this will set the value through the setter and check the backing variable value. It will then reset throught the setter and set the backing variable and check the getter.

* * *

void **assert\_property**(obj, property\_name, default\_value, new\_value) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-property)

This will verify that the method has a setter and getter for the property. It will then use the getter to check the default. Then use the setter with new\_value and verify the getter returns the same value.

* * *

void **assert\_eq\_deep**(v1, v2) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-eq-deep)

Performs a deep comparison between two arrays or dictionaries and asserts they are equal. If they are not equal then a formatted list of differences are displayed. See [Comparing-Things](https://gut.readthedocs.io/en/latest/Comparing-Things.html) for more information.

* * *

void **assert\_ne\_deep**(v1, v2) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-ne-deep)

Performs a deep comparison of two arrays or dictionaries and asserts they are not equal. See [Comparing-Things](https://gut.readthedocs.io/en/latest/Comparing-Things.html) for more information.

* * *

void **assert\_same**(v1, v2, text = “”) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-same)

Assert v1 and v2 are the same using `is_same`. See @GlobalScope.is\_same.

* * *

void **assert\_not\_same**(v1, v2, text = “”) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-not-same)

Assert using v1 and v2 are not the same using `is_same`. See @GlobalScope.is\_same.

* * *

[Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) **wait\_seconds**(time, msg = “”) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-wait-seconds)

Use with await to wait an amount of time in seconds. The optional message will be printed when the await starts.

See [Awaiting](https://gut.readthedocs.io/en/latest/Awaiting.html)

* * *

[Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) **wait\_for\_signal**(sig: [Signal](https://docs.godotengine.org/en/stable/classes/class_signal.html), max\_wait, msg = “”) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-wait-for-signal)

Use with await to wait for a signal to be emitted or a maximum amount of time. Returns true if the signal was emitted, false if not.

See [Awaiting](https://gut.readthedocs.io/en/latest/Awaiting.html)

* * *

[Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) **wait\_frames**(frames, msg = “”) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-wait-frames)

Use with await to wait a number of frames. The optional message will be printed

See [Awaiting](https://gut.readthedocs.io/en/latest/Awaiting.html)

* * *

[Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) **wait\_until**(callable, max\_wait, p3 = “”, p4 = “”) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-wait-until)

Use with await to wait for the passed in callable to return true or a maximum amount of time. The callable is called every \_physics\_process tick unless an optional time between calls is specified.

p3 can be the optional message or an amount of time to wait between tests. p4 is the optional message if you have specified an amount of time to wait between tests.

Returns true if the callable returned true before the timeout, false if not.

See [Awaiting](https://gut.readthedocs.io/en/latest/Awaiting.html)

* * *

[Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) **did\_wait\_timeout**() [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-did-wait-timeout)

Returns whether the last wait\_\* method timed out. This is always true if the last method was wait\_frames or wait\_seconds. It will be false when using wait\_for\_signal and wait\_until if the timeout occurs before what is being waited on. The wait\_\* methods return this value so you should be able to avoid calling this directly, but you can.

* * *

[Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) **get\_summary**() [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-get-summary)

**Internal use only.**

* * *

[Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) **get\_fail\_count**() [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-get-fail-count)

Returns the number of failing asserts in this script at the time this method was called. Call in [after\_all](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-after-all) to get total count for script.

* * *

[Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) **get\_pass\_count**() [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-get-pass-count)

Returns the number of passing asserts in this script at the time this method was called. Call in [after\_all](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-after-all) to get total count for script.

* * *

[Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) **get\_pending\_count**() [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-get-pending-count)

Returns the number of pending tests in this script at the time this method was called. Call in [after\_all](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-after-all) to get total count for script.

* * *

[Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) **get\_assert\_count**() [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-get-assert-count)

Returns the total number of asserts this script has made as of the time of this was called. Call in [after\_all](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-after-all) to get total count for script.

* * *

[Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) **get\_summary\_text**() [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-get-summary-text)

**Internal use only.**

* * *

[Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) **double**(thing, double\_strat = null, not\_used\_anymore = null) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-double)

Create a Double of `thing`. `thing` should be a Class, script, or scene. See [Doubles](https://gut.readthedocs.io/en/latest/Doubles.html)

* * *

[Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) **partial\_double**(thing, double\_strat = null, not\_used\_anymore = null) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-partial-double)

Create a Partial Double of `thing`. `thing` should be a Class, script, or scene. See [Partial-Doubles](https://gut.readthedocs.io/en/latest/Partial-Doubles.html)

* * *

[Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) **double\_singleton**(singleton\_name) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-double-singleton)

**Internal use only.**

* * *

[Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) **partial\_double\_singleton**(singleton\_name) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-partial-double-singleton)

**Internal use only.**

* * *

void **ignore\_method\_when\_doubling**(thing, method\_name) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-ignore-method-when-doubling)

This was implemented to allow the doubling of classes with static methods. There might be other valid use cases for this method, but you should always try stubbing before using this method. Using `stub(my_double, 'method').to_call_super()` or creating a [partial\_double](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-partial-double) works for any other known scenario. You cannot stub or spy on methods passed to `ignore_method_when_doubling`.

* * *

[Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) **stub**(thing, p2 = null, p3 = null) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-stub)

Stub something. See [Stubbing](https://gut.readthedocs.io/en/latest/Stubbing.html) for detailed information about stubbing.

* * *

[Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) **autofree**(thing) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-autofree)

Marks whatever is passed in to be freed after the test finishes. It also returns what is passed in so you can save a line of code. var thing = autofree(Thing.new())

* * *

[Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) **autoqfree**(thing) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-autoqfree)

Works the same as autofree except queue\_free will be called on the object instead. This also imparts a brief pause after the test finishes so that the queued object has time to free.

* * *

[Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) **add\_child\_autofree**(node, legible\_unique\_name = false) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-add-child-autofree)

The same as autofree but it also adds the object as a child of the test.

* * *

[Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) **add\_child\_autoqfree**(node, legible\_unique\_name = false) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-add-child-autoqfree)

The same as autoqfree but it also adds the object as a child of the test.

* * *

[Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) **yield\_for**(time, msg = “”) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-yield-for)

**Deprecated:** use wait\_seconds

* * *

[Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) **yield\_to**(obj, signal\_name, max\_wait, msg = “”) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-yield-to)

**Deprecated:** use wait\_for\_signal

* * *

[Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) **yield\_frames**(frames, msg = “”) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-yield-frames)

**Deprecated:** use wait\_frames

* * *

[Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) **double\_scene**(path, strategy = null) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-double-scene)

**Deprecated:** no longer supported. Use double

* * *

[Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) **double\_script**(path, strategy = null) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-double-script)

**Deprecated:** no longer supported. Use double

* * *

[Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html) **double\_inner**(path, subpath, strategy = null) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-double-inner)

**Deprecated:** no longer supported. Use register\_inner\_classes + double

* * *

void **assert\_call\_count**(inst, method\_name, expected\_count, parameters = null) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-call-count)

**Deprecated:** Use [assert\_called\_count](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-called-count) instead.

* * *

void **assert\_setget**(instance, name\_property, const\_or\_setter = null, getter = “\_\_not\_set\_\_”) [🔗](https://gut.readthedocs.io/en/latest/class_ref/class_guttest.html#class-guttest-method-assert-setget)

**Deprecated:** no longer supported.