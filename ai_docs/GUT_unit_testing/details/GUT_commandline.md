GPT Icon
GPT Icon
GPT Icon
GPT Icon
GPT Icon
GPT Icon

You said:
Create an MD file with this information:


Creating Tests

Much more information is available in the Creating Tests document, but here are some basics:

    All test scripts must extend GutTest (res://addons/gut/test.gd) script supplied by GUT.

extends GutTest

    By default, all test files must begin with test_ to be found by GUT. You can change the prefix and suffix of test files in the GUT settings.

There is a plethora of asserts and helpers that are listed here

Setup and teardown methods:

    before_all

    before_each

    after_each

    after_all

Any method that starts with “test” will be run as a test.

extends GutTest

func before_all():
	gut.p("Runs once before all tests")

func before_each():
	gut.p("Runs before each test.")

func after_each():
	gut.p("Runs after each test.")

func after_all():
	gut.p("Runs once after all tests")

func test_assert_eq_number_not_equal():
	assert_eq(1, 2, "Should fail.  1 != 2")

func test_assert_eq_number_equal():
	assert_eq('asdf', 'asdf', "Should pass")

You can use inner classes to group tests together. The class name must start with “Test” and extend test.gd.

extends GutTest

class TestSomeAspects:
	extends GutTest

	func test_assert_eq_number_not_equal():
		assert_eq(1, 2, "Should fail.  1 != 2")

	func test_assert_eq_number_equal():
		assert_eq('asdf', 'asdf', "Should pass")

class TestOtherAspects:
	extends GutTest

	func test_assert_true_with_true():
		assert_true(true, "Should pass, true is true")

Doubles/Spies/Stubs

More Information: Doubles, Spies, Stubs

You can make a double of just about anything. double returns a loaded class/scene, not an instance. Doubles extend the object to be doubled and have empty implementations for all methods defined in the script or parent scripts, but not parent Godot methods that are not overridden.

var Foo = load('res://foo.gd')
var MyScene = load('res://my_scene.tscn')

var double_foo = double(Foo).new()
var double_scene = double(MyScene).instantiate()

You can stub your double to do different things. Unstubbed methods that are called generate log messages.

var double_foo = double(Foo).new()
stub(double_foo.bar).to_return(42)
stub(double_foo, "something").to_call_super() # do what method would normally do
stub(double_foo.other_thing).to_return(77).when_passed(1, 2, 'c')
stub(double_foo.other_thing.bind(4, 5, 'z')).to_do_nothing()

You can spy on your doubles with various asserts and helpers.

var double_foo = double(Foo).new()

...

assert_called(double_foo, 'bar')
assert_not_called(double_foo, 'something')
assert_call_count(double_foo, 'call_me', 10)

# assert other_thing called with parameters in array.
assert_called(double_foo, 'other_thing', [1, 2, 'c'])

# Get an array of the parameters sent to the last
# call to call_me
var called_with_last = get_call_parameters(double_foo, 'call_me')

# get the parameters passed to the 4th call of call_me
var called_with_4 = get_call_parameters(double_foo, 'call_me', 4))

Partial Doubles

More Information

Partial doubles have all the same properties of a double except they retain the source functionality by default. You can stub and spy on them just like a double, but anything not stubbed will behave as if it wasn’t a double.

var double_bar = partial_double(Bar).instance()

# the foo method will do nothing always now
stub(double_ba.foo).to_do_nothing()

# the something method will return 27 when passed 32,
# but act normally when passed anything else.
stub(double_bar.something).to_return(27).when_passed(32)

# example of spying
assert_called(double_bar, 'other_thing')

Parameterized Tests

More Information

You can create tests that will be run multiple times and be passed multiple values.

    The test must have one and only one parameter.

    That parameter must be defaulted to call use_parameters.

    The value passed to use_parameters must be an array.

        Each element in the array will result in one execution of the test with that element passed in.

var test_params = [[1, 2, 3], [4, 5, 6]]
func test_with_parameters(p=use_parameters(test_params)):
	assert_eq(p[0], p[2] - p[1])

# The first array contains the name of the parameters, the 2nd array contains the values.
var named_params = ParameterFactory.named_parameters(['a', 'b'], [[1, 2], ['one', 'two']])
func test_with_named_params(p=use_parameters(better_params)):
	assert_ne(p.a, p.b)

There are helpers to make your parameters more readable.
Await

More Information

You can use await in your tests to allow time to pass before making assertions. This can be useful if you need to wait for some interaction to play out, a signal to be emitted, or wait for things to happen in the next frames, such as physics process or draw.

If you want to wait for a certain amount of time you can use wait_seconds.

await wait_seconds(10)

You can await to a signal or an amount of time, whichever comes first with wait_for_signal. This ensures that your tests do not hang when a signal is not emitted.

var my_obj = load('res://my_obj.gd').new()
await wait_for_signal(my_obj.some_signal, 3)

You can also await for a number of frames using wait_frames. It’s best to wait at least 2 frames as waiting one frame can be flaky.

await wait_frames(5)

Leak Testing and Memory Management

More Information

Call autofree or autoqfree on anything you want to be automatically freed up after your test. These return whatever you pass it so you can save a line of code!

var my_node = autofree(Node.new())

autofree calls free on the object and autoqfree calls queue_free.

If you plan to add your object to the tree you can use the add_child_autofree and add_child_autoqfree methods to add them as a child of the test script and free them at the end of the test.

var my_node = add_child_autofree(Node2D.new())

Orphan counts are displayed after each test/script that generates orphans and at the end of the run. If you don’t see output, then you don’t have any orphans! You can disable this feature if you want.

All objects created with double or partial_double are freed automatically after a test finishes.

You can assert you didn’t make any new orphans with assert_no_new_orphans. assert_no_new_orphans doesn’t know about objects passed to autofree so they will be counted if they are not in the tree.

func test_freeing():
	var node = Node.new()
	assert_no_new_orphans('this one fails')
	node.free()
	assert_no_new_orphans('this one passes')

# If you queue_free then you have to wait for it to be freed.
func test_queue_freeing():
	var node = Node.new()
	node.queue_free()
	assert_no_new_orphans('this one fails')
	await(wait_seconds(.1))
	assert_no_new_orphans('this one passes')
ChatGPT said:

Here's your Markdown file:

It looks like your document update was successful. Let me know if you need any further modifications or improvements!
2/2
You said:
Okay convert this one to an md file 


Command Line

Also supplied in this repo is the gut_cmdln.gd script that can be run from the command line. This is also used by the VSCode Plugin gut-extension.

Note: All the examples here come from my Mac/Bash.

In the examples below I will be using godot as a command. This is an alias I have created as:

alias godot='/Applications/Godot.app/Contents/MacOS/Godot'

From the command line, at the root of your project, use the following command to run the script. Use the options below to run tests.

godot -d -s --path "$PWD" addons/gut/gut_cmdln.gd

The -d option tells Godot to run in debug mode which is helpful. The -s option tells Godot to run a script. --path "$PWD" tells Godot to treat the current directory as the root of a project.

When running from command line, 0 will be returned if all tests pass and 1 will be returned if any fail (pending doesn’t affect the return value).
Options

Output from the command line help (-gh)

---  Gut  ---
---------------------------------------------------------
This is the command line interface for the unit testing tool Gut.  With this
interface you can run one or more test scripts from the command line.  In order
for the Gut options to not clash with any other godot options, each option
starts with a "g".  Also, any option that requires a value will take the form
of "-g<name>=<value>".  There cannot be any spaces between the option, the "=",
or inside a specified value or godot will think you are trying to run a scene.

Options
-------
  -gtest                    Comma delimited list of full paths to test scripts to run.
  -gdir                     Comma delimited list of directories to add tests from.
  -gprefix                  Prefix used to find tests when specifying -gdir.  Default "test_".
  -gsuffix                  Suffix used to find tests when specifying -gdir.  Default ".gd".
  -ghide_orphans            Display orphan counts for tests and scripts.  Default "False".
  -gmaximize                Maximizes test runner window to fit the viewport.
  -gexit                    Exit after running tests.  If not specified you have to manually close the window.
  -gexit_on_success         Only exit if all tests pass.
  -glog                     Log level.  Default 1
  -gignore_pause            Ignores any calls to gut.pause_before_teardown.
  -gselect                  Select a script to run initially.  The first script that was loaded using -gtest or -gdir that contains the specified string will be executed.  You may run others by interacting with the GUI.
  -gunit_test_name          Name of a test to run.  Any test that contains the specified text will be run, all others will be skipped.
  -gh                       Print this help, then quit
  -gconfig                  A config file that contains configuration information.  Default is res://.gutconfig.json
  -ginner_class             Only run inner classes that contain this string
  -gopacity                 Set opacity of test runner window. Use range 0 - 100. 0 = transparent, 100 = opaque.
  -gpo                      Print option values from all sources and the value used, then quit.
  -ginclude_subdirs         Include subdirectories of -gdir.
  -gdouble_strategy         Default strategy to use when doubling.  Valid values are [partial, full].  Default "partial"
  -gdisable_colors          Disable command line colors.
  -gpre_run_script          pre-run hook script path
  -gpost_run_script         post-run hook script path
  -gprint_gutconfig_sample  Print out json that can be used to make a gutconfig file then quit.
  -gfont_name               Valid values are:  [AnonymousPro, CourierPro, LobsterTwo, Default].  Default "CourierPrime"
  -gfont_size               Font size, default "16"
  -gbackground_color        Background color as an html color, default "ff262626"
  -gfont_color              Font color as an html color, default "ffcccccc"
  -gjunit_xml_file          Export results of run to this file in the Junit XML format.
  -gjunit_xml_timestamp     Include a timestamp in the -gjunit_xml_file, default False
---------------------------------------------------------

Examples

Run godot in debug mode (-d), run a test script (-gtest), set log level to lowest (-glog), exit when done (-gexit)

godot -s addons/gut/gut_cmdln.gd -d --path "$PWD" -gtest=res://test/unit/sample_tests.gd -glog=1 -gexit

Load all test scripts that begin with ‘me_’ and end in ‘.res’ and run me_only_only_me.res (given that the directory contains the following scripts: me_and_only_me.res, me_only.res, me_one.res, me_two.res). I don’t specify the -gexit on this one since I might want to run all the scripts using the GUI after I run this one script.

godot -s addons/gut/gut_cmdln.gd -d --path "$PWD" -gdir=res://test/unit -gprefix=me_ -gsuffix=.res -gselect=only_me

Config file

To cut down on the amount of arguments you have to pass to gut and to make it easier to change them, you can optionally use a json file to specify some of the values. By default gut_cmdln looks for a config file at res://.gutconfig.json. You can specify a different file using the -gconfig option.

Here is a sample file. You can print out the text for a gutconfig file using the -gprint_gutconfig_sample option.
Example

{
  "dirs":["res://test/unit/","res://test/integration/"],
  "double_strategy":"partial",
  "ignore_pause":false,
  "include_subdirs":true,
  "inner_class":"",
  "log_level":3,
  "opacity":100,
  "prefix":"test_",
  "selected":"",
  "should_exit":true,
  "should_maximize":true,
  "suffix":".gd",
  "tests":[],
  "unit_test_name":"",
}

Common Errors

I really only know of one so far, but if you get a space in your command somewhere, you might see something like this:

ERROR:  No loader found for resource: res://samples3
At:  core\io\resource_loader.cpp:209
ERROR:  Failed loading scene: res://samples3
At:  main\main.cpp:1260

I got this one when I accidentally put a space instead of an “=” after -gselect.
2/2
ChatGPT said:


ChatGPT can make mistakes. Check important info.
89
90
91
92
93
94
95
96
97
98
99
100
101
102
103
104
105
106
107
108
109
110
111
112
113
114
115
116
117
118
119
120
121
122
123
124
125
126
127
128
129
130
131
---

## Config file

To cut down on the number of arguments you have to pass to Gut and to make it easier to change them, you can optionally use a JSON file to specify some of the values. By default, `gut_cmdln` looks for a config file at `res://.gutconfig.json`. You can specify a different file using the `-gconfig` option.

### Example

Here is a sample file. You can print out the text for a gutconfig file using the `-gprint_gutconfig_sample` option.

```json
{
  "dirs": ["res://test/unit/", "res://test/integration/"],
  "double_strategy": "partial",
  "ignore_pause": false,
  "include_subdirs": true,
  "inner_class": "",
  "log_level": 3,
  "opacity": 100,
  "prefix": "test_",
  "selected": "",
  "should_exit": true,
  "should_maximize": true,
  "suffix": ".gd",
  "tests": [],
  "unit_test_name": ""
}
```

---

## Common Errors

I really only know of one so far, but if you get a space in your command somewhere, you might see something like this:

```
ERROR:  No loader found for resource: res://samples3
At:  core\io\resource_loader.cpp:209
ERROR:  Failed loading scene: res://samples3
At:  main\main.cpp:1260
```

I got this one when I accidentally put a space instead of an `=` after `-gselect`.
ChatGPT is still generating a response...
