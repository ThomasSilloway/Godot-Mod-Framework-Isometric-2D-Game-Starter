- Godot Engine 4.4 documentation in English

  - [Home](https://docs.godotengine.org/en/stable/index.html)
  - [All classes](https://docs.godotengine.org/en/stable/classes/index.html)
  - AStar2D

* * *

# AStar2D [](https://docs.godotengine.org/en/stable/classes/class_astar2d.html\#astar2d "Link to this heading")

**Inherits:** [RefCounted](https://docs.godotengine.org/en/stable/classes/class_refcounted.html#class-refcounted) **<** [Object](https://docs.godotengine.org/en/stable/classes/class_object.html#class-object)

An implementation of A\* for finding the shortest path between two vertices on a connected graph in 2D space.

## Description [](https://docs.godotengine.org/en/stable/classes/class_astar2d.html\#description "Link to this heading")

An implementation of the A\* algorithm, used to find the shortest path between two vertices on a connected graph in 2D space.

See [AStar3D](https://docs.godotengine.org/en/stable/classes/class_astar3d.html#class-astar3d) for a more thorough explanation on how to use this class. **AStar2D** is a wrapper for [AStar3D](https://docs.godotengine.org/en/stable/classes/class_astar3d.html#class-astar3d) that enforces 2D coordinates.

## Methods [](https://docs.godotengine.org/en/stable/classes/class_astar2d.html\#methods "Link to this heading")

|     |     |
| --- | --- |
| [float](https://docs.godotengine.org/en/stable/classes/class_float.html#class-float) | [\_compute\_cost](https://docs.godotengine.org/en/stable/classes/class_astar2d.html#class-astar2d-private-method-compute-cost)(from\_id: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), to\_id: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int)) virtualconst |
| [float](https://docs.godotengine.org/en/stable/classes/class_float.html#class-float) | [\_estimate\_cost](https://docs.godotengine.org/en/stable/classes/class_astar2d.html#class-astar2d-private-method-estimate-cost)(from\_id: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), end\_id: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int)) virtualconst |
| void | [add\_point](https://docs.godotengine.org/en/stable/classes/class_astar2d.html#class-astar2d-method-add-point)(id: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), position: [Vector2](https://docs.godotengine.org/en/stable/classes/class_vector2.html#class-vector2), weight\_scale: [float](https://docs.godotengine.org/en/stable/classes/class_float.html#class-float) = 1.0) |
| [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) | [are\_points\_connected](https://docs.godotengine.org/en/stable/classes/class_astar2d.html#class-astar2d-method-are-points-connected)(id: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), to\_id: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), bidirectional: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) = true) const |
| void | [clear](https://docs.godotengine.org/en/stable/classes/class_astar2d.html#class-astar2d-method-clear)() |
| void | [connect\_points](https://docs.godotengine.org/en/stable/classes/class_astar2d.html#class-astar2d-method-connect-points)(id: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), to\_id: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), bidirectional: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) = true) |
| void | [disconnect\_points](https://docs.godotengine.org/en/stable/classes/class_astar2d.html#class-astar2d-method-disconnect-points)(id: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), to\_id: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), bidirectional: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) = true) |
| [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int) | [get\_available\_point\_id](https://docs.godotengine.org/en/stable/classes/class_astar2d.html#class-astar2d-method-get-available-point-id)() const |
| [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int) | [get\_closest\_point](https://docs.godotengine.org/en/stable/classes/class_astar2d.html#class-astar2d-method-get-closest-point)(to\_position: [Vector2](https://docs.godotengine.org/en/stable/classes/class_vector2.html#class-vector2), include\_disabled: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) = false) const |
| [Vector2](https://docs.godotengine.org/en/stable/classes/class_vector2.html#class-vector2) | [get\_closest\_position\_in\_segment](https://docs.godotengine.org/en/stable/classes/class_astar2d.html#class-astar2d-method-get-closest-position-in-segment)(to\_position: [Vector2](https://docs.godotengine.org/en/stable/classes/class_vector2.html#class-vector2)) const |
| [PackedInt64Array](https://docs.godotengine.org/en/stable/classes/class_packedint64array.html#class-packedint64array) | [get\_id\_path](https://docs.godotengine.org/en/stable/classes/class_astar2d.html#class-astar2d-method-get-id-path)(from\_id: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), to\_id: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), allow\_partial\_path: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) = false) |
| [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int) | [get\_point\_capacity](https://docs.godotengine.org/en/stable/classes/class_astar2d.html#class-astar2d-method-get-point-capacity)() const |
| [PackedInt64Array](https://docs.godotengine.org/en/stable/classes/class_packedint64array.html#class-packedint64array) | [get\_point\_connections](https://docs.godotengine.org/en/stable/classes/class_astar2d.html#class-astar2d-method-get-point-connections)(id: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int)) |
| [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int) | [get\_point\_count](https://docs.godotengine.org/en/stable/classes/class_astar2d.html#class-astar2d-method-get-point-count)() const |
| [PackedInt64Array](https://docs.godotengine.org/en/stable/classes/class_packedint64array.html#class-packedint64array) | [get\_point\_ids](https://docs.godotengine.org/en/stable/classes/class_astar2d.html#class-astar2d-method-get-point-ids)() |
| [PackedVector2Array](https://docs.godotengine.org/en/stable/classes/class_packedvector2array.html#class-packedvector2array) | [get\_point\_path](https://docs.godotengine.org/en/stable/classes/class_astar2d.html#class-astar2d-method-get-point-path)(from\_id: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), to\_id: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), allow\_partial\_path: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) = false) |
| [Vector2](https://docs.godotengine.org/en/stable/classes/class_vector2.html#class-vector2) | [get\_point\_position](https://docs.godotengine.org/en/stable/classes/class_astar2d.html#class-astar2d-method-get-point-position)(id: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int)) const |
| [float](https://docs.godotengine.org/en/stable/classes/class_float.html#class-float) | [get\_point\_weight\_scale](https://docs.godotengine.org/en/stable/classes/class_astar2d.html#class-astar2d-method-get-point-weight-scale)(id: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int)) const |
| [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) | [has\_point](https://docs.godotengine.org/en/stable/classes/class_astar2d.html#class-astar2d-method-has-point)(id: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int)) const |
| [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) | [is\_point\_disabled](https://docs.godotengine.org/en/stable/classes/class_astar2d.html#class-astar2d-method-is-point-disabled)(id: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int)) const |
| void | [remove\_point](https://docs.godotengine.org/en/stable/classes/class_astar2d.html#class-astar2d-method-remove-point)(id: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int)) |
| void | [reserve\_space](https://docs.godotengine.org/en/stable/classes/class_astar2d.html#class-astar2d-method-reserve-space)(num\_nodes: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int)) |
| void | [set\_point\_disabled](https://docs.godotengine.org/en/stable/classes/class_astar2d.html#class-astar2d-method-set-point-disabled)(id: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), disabled: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) = true) |
| void | [set\_point\_position](https://docs.godotengine.org/en/stable/classes/class_astar2d.html#class-astar2d-method-set-point-position)(id: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), position: [Vector2](https://docs.godotengine.org/en/stable/classes/class_vector2.html#class-vector2)) |
| void | [set\_point\_weight\_scale](https://docs.godotengine.org/en/stable/classes/class_astar2d.html#class-astar2d-method-set-point-weight-scale)(id: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), weight\_scale: [float](https://docs.godotengine.org/en/stable/classes/class_float.html#class-float)) |

* * *

## Method Descriptions [](https://docs.godotengine.org/en/stable/classes/class_astar2d.html\#method-descriptions "Link to this heading")

[float](https://docs.godotengine.org/en/stable/classes/class_float.html#class-float) **\_compute\_cost**(from\_id: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), to\_id: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int)) virtualconst [🔗](https://docs.godotengine.org/en/stable/classes/class_astar2d.html#class-astar2d-private-method-compute-cost)

Called when computing the cost between two connected points.

Note that this function is hidden in the default **AStar2D** class.

* * *

[float](https://docs.godotengine.org/en/stable/classes/class_float.html#class-float) **\_estimate\_cost**(from\_id: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), end\_id: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int)) virtualconst [🔗](https://docs.godotengine.org/en/stable/classes/class_astar2d.html#class-astar2d-private-method-estimate-cost)

Called when estimating the cost between a point and the path's ending point.

Note that this function is hidden in the default **AStar2D** class.

* * *

void **add\_point**(id: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), position: [Vector2](https://docs.godotengine.org/en/stable/classes/class_vector2.html#class-vector2), weight\_scale: [float](https://docs.godotengine.org/en/stable/classes/class_float.html#class-float) = 1.0) [🔗](https://docs.godotengine.org/en/stable/classes/class_astar2d.html#class-astar2d-method-add-point)

Adds a new point at the given position with the given identifier. The `id` must be 0 or larger, and the `weight_scale` must be 0.0 or greater.

The `weight_scale` is multiplied by the result of [\_compute\_cost()](https://docs.godotengine.org/en/stable/classes/class_astar2d.html#class-astar2d-private-method-compute-cost) when determining the overall cost of traveling across a segment from a neighboring point to this point. Thus, all else being equal, the algorithm prefers points with lower `weight_scale` s to form a path.

GDScriptC#

```
var astar = AStar2D.new()
astar.add_point(1, Vector2(1, 0), 4) # Adds the point (1, 0) with weight_scale 4 and id 1

```

Copy to clipboard

```
var astar = new AStar2D();
astar.AddPoint(1, new Vector2(1, 0), 4); // Adds the point (1, 0) with weight_scale 4 and id 1

```

Copy to clipboard

If there already exists a point for the given `id`, its position and weight scale are updated to the given values.

* * *

[bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) **are\_points\_connected**(id: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), to\_id: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), bidirectional: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) = true) const [🔗](https://docs.godotengine.org/en/stable/classes/class_astar2d.html#class-astar2d-method-are-points-connected)

Returns whether there is a connection/segment between the given points. If `bidirectional` is `false`, returns whether movement from `id` to `to_id` is possible through this segment.

* * *

void **clear**() [🔗](https://docs.godotengine.org/en/stable/classes/class_astar2d.html#class-astar2d-method-clear)

Clears all the points and segments.

* * *

void **connect\_points**(id: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), to\_id: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), bidirectional: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) = true) [🔗](https://docs.godotengine.org/en/stable/classes/class_astar2d.html#class-astar2d-method-connect-points)

Creates a segment between the given points. If `bidirectional` is `false`, only movement from `id` to `to_id` is allowed, not the reverse direction.

GDScriptC#

```
var astar = AStar2D.new()
astar.add_point(1, Vector2(1, 1))
astar.add_point(2, Vector2(0, 5))
astar.connect_points(1, 2, false)

```

Copy to clipboard

```
var astar = new AStar2D();
astar.AddPoint(1, new Vector2(1, 1));
astar.AddPoint(2, new Vector2(0, 5));
astar.ConnectPoints(1, 2, false);

```

Copy to clipboard

* * *

void **disconnect\_points**(id: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), to\_id: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), bidirectional: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) = true) [🔗](https://docs.godotengine.org/en/stable/classes/class_astar2d.html#class-astar2d-method-disconnect-points)

Deletes the segment between the given points. If `bidirectional` is `false`, only movement from `id` to `to_id` is prevented, and a unidirectional segment possibly remains.

* * *

[int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int) **get\_available\_point\_id**() const [🔗](https://docs.godotengine.org/en/stable/classes/class_astar2d.html#class-astar2d-method-get-available-point-id)

Returns the next available point ID with no point associated to it.

* * *

[int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int) **get\_closest\_point**(to\_position: [Vector2](https://docs.godotengine.org/en/stable/classes/class_vector2.html#class-vector2), include\_disabled: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) = false) const [🔗](https://docs.godotengine.org/en/stable/classes/class_astar2d.html#class-astar2d-method-get-closest-point)

Returns the ID of the closest point to `to_position`, optionally taking disabled points into account. Returns `-1` if there are no points in the points pool.

**Note:** If several points are the closest to `to_position`, the one with the smallest ID will be returned, ensuring a deterministic result.

* * *

[Vector2](https://docs.godotengine.org/en/stable/classes/class_vector2.html#class-vector2) **get\_closest\_position\_in\_segment**(to\_position: [Vector2](https://docs.godotengine.org/en/stable/classes/class_vector2.html#class-vector2)) const [🔗](https://docs.godotengine.org/en/stable/classes/class_astar2d.html#class-astar2d-method-get-closest-position-in-segment)

Returns the closest position to `to_position` that resides inside a segment between two connected points.

GDScriptC#

```
var astar = AStar2D.new()
astar.add_point(1, Vector2(0, 0))
astar.add_point(2, Vector2(0, 5))
astar.connect_points(1, 2)
var res = astar.get_closest_position_in_segment(Vector2(3, 3)) # Returns (0, 3)

```

Copy to clipboard

```
var astar = new AStar2D();
astar.AddPoint(1, new Vector2(0, 0));
astar.AddPoint(2, new Vector2(0, 5));
astar.ConnectPoints(1, 2);
Vector2 res = astar.GetClosestPositionInSegment(new Vector2(3, 3)); // Returns (0, 3)

```

Copy to clipboard

The result is in the segment that goes from `y = 0` to `y = 5`. It's the closest position in the segment to the given point.

* * *

[PackedInt64Array](https://docs.godotengine.org/en/stable/classes/class_packedint64array.html#class-packedint64array) **get\_id\_path**(from\_id: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), to\_id: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), allow\_partial\_path: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) = false) [🔗](https://docs.godotengine.org/en/stable/classes/class_astar2d.html#class-astar2d-method-get-id-path)

Returns an array with the IDs of the points that form the path found by AStar2D between the given points. The array is ordered from the starting point to the ending point of the path.

If there is no valid path to the target, and `allow_partial_path` is `true`, returns a path to the point closest to the target that can be reached.

**Note:** When `allow_partial_path` is `true` and `to_id` is disabled the search may take an unusually long time to finish.

GDScriptC#

```
var astar = AStar2D.new()
astar.add_point(1, Vector2(0, 0))
astar.add_point(2, Vector2(0, 1), 1) # Default weight is 1
astar.add_point(3, Vector2(1, 1))
astar.add_point(4, Vector2(2, 0))

astar.connect_points(1, 2, false)
astar.connect_points(2, 3, false)
astar.connect_points(4, 3, false)
astar.connect_points(1, 4, false)

var res = astar.get_id_path(1, 3) # Returns [1, 2, 3]

```

Copy to clipboard

```
var astar = new AStar2D();
astar.AddPoint(1, new Vector2(0, 0));
astar.AddPoint(2, new Vector2(0, 1), 1); // Default weight is 1
astar.AddPoint(3, new Vector2(1, 1));
astar.AddPoint(4, new Vector2(2, 0));

astar.ConnectPoints(1, 2, false);
astar.ConnectPoints(2, 3, false);
astar.ConnectPoints(4, 3, false);
astar.ConnectPoints(1, 4, false);
long[] res = astar.GetIdPath(1, 3); // Returns [1, 2, 3]

```

Copy to clipboard

If you change the 2nd point's weight to 3, then the result will be `[1, 4, 3]` instead, because now even though the distance is longer, it's "easier" to get through point 4 than through point 2.

* * *

[int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int) **get\_point\_capacity**() const [🔗](https://docs.godotengine.org/en/stable/classes/class_astar2d.html#class-astar2d-method-get-point-capacity)

Returns the capacity of the structure backing the points, useful in conjunction with [reserve\_space()](https://docs.godotengine.org/en/stable/classes/class_astar2d.html#class-astar2d-method-reserve-space).

* * *

[PackedInt64Array](https://docs.godotengine.org/en/stable/classes/class_packedint64array.html#class-packedint64array) **get\_point\_connections**(id: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int)) [🔗](https://docs.godotengine.org/en/stable/classes/class_astar2d.html#class-astar2d-method-get-point-connections)

Returns an array with the IDs of the points that form the connection with the given point.

GDScriptC#

```
var astar = AStar2D.new()
astar.add_point(1, Vector2(0, 0))
astar.add_point(2, Vector2(0, 1))
astar.add_point(3, Vector2(1, 1))
astar.add_point(4, Vector2(2, 0))

astar.connect_points(1, 2, true)
astar.connect_points(1, 3, true)

var neighbors = astar.get_point_connections(1) # Returns [2, 3]

```

Copy to clipboard

```
var astar = new AStar2D();
astar.AddPoint(1, new Vector2(0, 0));
astar.AddPoint(2, new Vector2(0, 1));
astar.AddPoint(3, new Vector2(1, 1));
astar.AddPoint(4, new Vector2(2, 0));

astar.ConnectPoints(1, 2, true);
astar.ConnectPoints(1, 3, true);

long[] neighbors = astar.GetPointConnections(1); // Returns [2, 3]

```

Copy to clipboard

* * *

[int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int) **get\_point\_count**() const [🔗](https://docs.godotengine.org/en/stable/classes/class_astar2d.html#class-astar2d-method-get-point-count)

Returns the number of points currently in the points pool.

* * *

[PackedInt64Array](https://docs.godotengine.org/en/stable/classes/class_packedint64array.html#class-packedint64array) **get\_point\_ids**() [🔗](https://docs.godotengine.org/en/stable/classes/class_astar2d.html#class-astar2d-method-get-point-ids)

Returns an array of all point IDs.

* * *

[PackedVector2Array](https://docs.godotengine.org/en/stable/classes/class_packedvector2array.html#class-packedvector2array) **get\_point\_path**(from\_id: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), to\_id: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), allow\_partial\_path: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) = false) [🔗](https://docs.godotengine.org/en/stable/classes/class_astar2d.html#class-astar2d-method-get-point-path)

Returns an array with the points that are in the path found by AStar2D between the given points. The array is ordered from the starting point to the ending point of the path.

If there is no valid path to the target, and `allow_partial_path` is `true`, returns a path to the point closest to the target that can be reached.

**Note:** This method is not thread-safe. If called from a [Thread](https://docs.godotengine.org/en/stable/classes/class_thread.html#class-thread), it will return an empty array and will print an error message.

Additionally, when `allow_partial_path` is `true` and `to_id` is disabled the search may take an unusually long time to finish.

* * *

[Vector2](https://docs.godotengine.org/en/stable/classes/class_vector2.html#class-vector2) **get\_point\_position**(id: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int)) const [🔗](https://docs.godotengine.org/en/stable/classes/class_astar2d.html#class-astar2d-method-get-point-position)

Returns the position of the point associated with the given `id`.

* * *

[float](https://docs.godotengine.org/en/stable/classes/class_float.html#class-float) **get\_point\_weight\_scale**(id: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int)) const [🔗](https://docs.godotengine.org/en/stable/classes/class_astar2d.html#class-astar2d-method-get-point-weight-scale)

Returns the weight scale of the point associated with the given `id`.

* * *

[bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) **has\_point**(id: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int)) const [🔗](https://docs.godotengine.org/en/stable/classes/class_astar2d.html#class-astar2d-method-has-point)

Returns whether a point associated with the given `id` exists.

* * *

[bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) **is\_point\_disabled**(id: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int)) const [🔗](https://docs.godotengine.org/en/stable/classes/class_astar2d.html#class-astar2d-method-is-point-disabled)

Returns whether a point is disabled or not for pathfinding. By default, all points are enabled.

* * *

void **remove\_point**(id: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int)) [🔗](https://docs.godotengine.org/en/stable/classes/class_astar2d.html#class-astar2d-method-remove-point)

Removes the point associated with the given `id` from the points pool.

* * *

void **reserve\_space**(num\_nodes: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int)) [🔗](https://docs.godotengine.org/en/stable/classes/class_astar2d.html#class-astar2d-method-reserve-space)

Reserves space internally for `num_nodes` points. Useful if you're adding a known large number of points at once, such as points on a grid. The new capacity must be greater or equal to the old capacity.

* * *

void **set\_point\_disabled**(id: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), disabled: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) = true) [🔗](https://docs.godotengine.org/en/stable/classes/class_astar2d.html#class-astar2d-method-set-point-disabled)

Disables or enables the specified point for pathfinding. Useful for making a temporary obstacle.

* * *

void **set\_point\_position**(id: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), position: [Vector2](https://docs.godotengine.org/en/stable/classes/class_vector2.html#class-vector2)) [🔗](https://docs.godotengine.org/en/stable/classes/class_astar2d.html#class-astar2d-method-set-point-position)

Sets the `position` for the point with the given `id`.

* * *

void **set\_point\_weight\_scale**(id: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), weight\_scale: [float](https://docs.godotengine.org/en/stable/classes/class_float.html#class-float)) [🔗](https://docs.godotengine.org/en/stable/classes/class_astar2d.html#class-astar2d-method-set-point-weight-scale)

Sets the `weight_scale` for the point with the given `id`. The `weight_scale` is multiplied by the result of [\_compute\_cost()](https://docs.godotengine.org/en/stable/classes/class_astar2d.html#class-astar2d-private-method-compute-cost) when determining the overall cost of traveling across a segment from a neighboring point to this point.

[Previous](https://docs.godotengine.org/en/stable/classes/class_aescontext.html "AESContext") [Next](https://docs.godotengine.org/en/stable/classes/class_astar3d.html "AStar3D")


