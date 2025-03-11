- Godot Engine 4.4 documentation in English

  - [Home](https://docs.godotengine.org/en/stable/index.html)
  - [All classes](https://docs.godotengine.org/en/stable/classes/index.html)
  - AStarGrid2D

* * *

# AStarGrid2D [](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html\#astargrid2d "Link to this heading")

**Inherits:** [RefCounted](https://docs.godotengine.org/en/stable/classes/class_refcounted.html#class-refcounted) **<** [Object](https://docs.godotengine.org/en/stable/classes/class_object.html#class-object)

An implementation of A\* for finding the shortest path between two points on a partial 2D grid.

## Description [](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html\#description "Link to this heading")

**AStarGrid2D** is a variant of [AStar2D](https://docs.godotengine.org/en/stable/classes/class_astar2d.html#class-astar2d) that is specialized for partial 2D grids. It is simpler to use because it doesn't require you to manually create points and connect them together. This class also supports multiple types of heuristics, modes for diagonal movement, and a jumping mode to speed up calculations.

To use **AStarGrid2D**, you only need to set the [region](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-property-region) of the grid, optionally set the [cell\_size](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-property-cell-size), and then call the [update()](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-method-update) method:

GDScriptC#

```
var astar_grid = AStarGrid2D.new()
astar_grid.region = Rect2i(0, 0, 32, 32)
astar_grid.cell_size = Vector2(16, 16)
astar_grid.update()
print(astar_grid.get_id_path(Vector2i(0, 0), Vector2i(3, 4))) # Prints [(0, 0), (1, 1), (2, 2), (3, 3), (3, 4)]
print(astar_grid.get_point_path(Vector2i(0, 0), Vector2i(3, 4))) # Prints [(0, 0), (16, 16), (32, 32), (48, 48), (48, 64)]

```

Copy to clipboard

```
AStarGrid2D astarGrid = new AStarGrid2D();
astarGrid.Region = new Rect2I(0, 0, 32, 32);
astarGrid.CellSize = new Vector2I(16, 16);
astarGrid.Update();
GD.Print(astarGrid.GetIdPath(Vector2I.Zero, new Vector2I(3, 4))); // Prints [(0, 0), (1, 1), (2, 2), (3, 3), (3, 4)]
GD.Print(astarGrid.GetPointPath(Vector2I.Zero, new Vector2I(3, 4))); // Prints [(0, 0), (16, 16), (32, 32), (48, 48), (48, 64)]

```

Copy to clipboard

To remove a point from the pathfinding grid, it must be set as "solid" with [set\_point\_solid()](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-method-set-point-solid).

## Properties [](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html\#properties "Link to this heading")

|     |     |     |
| --- | --- | --- |
| [CellShape](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#enum-astargrid2d-cellshape) | [cell\_shape](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-property-cell-shape) | `0` |
| [Vector2](https://docs.godotengine.org/en/stable/classes/class_vector2.html#class-vector2) | [cell\_size](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-property-cell-size) | `Vector2(1, 1)` |
| [Heuristic](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#enum-astargrid2d-heuristic) | [default\_compute\_heuristic](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-property-default-compute-heuristic) | `0` |
| [Heuristic](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#enum-astargrid2d-heuristic) | [default\_estimate\_heuristic](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-property-default-estimate-heuristic) | `0` |
| [DiagonalMode](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#enum-astargrid2d-diagonalmode) | [diagonal\_mode](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-property-diagonal-mode) | `0` |
| [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) | [jumping\_enabled](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-property-jumping-enabled) | `false` |
| [Vector2](https://docs.godotengine.org/en/stable/classes/class_vector2.html#class-vector2) | [offset](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-property-offset) | `Vector2(0, 0)` |
| [Rect2i](https://docs.godotengine.org/en/stable/classes/class_rect2i.html#class-rect2i) | [region](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-property-region) | `Rect2i(0, 0, 0, 0)` |
| [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i) | [size](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-property-size) | `Vector2i(0, 0)` |

## Methods [](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html\#methods "Link to this heading")

|     |     |
| --- | --- |
| [float](https://docs.godotengine.org/en/stable/classes/class_float.html#class-float) | [\_compute\_cost](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-private-method-compute-cost)(from\_id: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i), to\_id: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)) virtualconst |
| [float](https://docs.godotengine.org/en/stable/classes/class_float.html#class-float) | [\_estimate\_cost](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-private-method-estimate-cost)(from\_id: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i), end\_id: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)) virtualconst |
| void | [clear](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-method-clear)() |
| void | [fill\_solid\_region](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-method-fill-solid-region)(region: [Rect2i](https://docs.godotengine.org/en/stable/classes/class_rect2i.html#class-rect2i), solid: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) = true) |
| void | [fill\_weight\_scale\_region](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-method-fill-weight-scale-region)(region: [Rect2i](https://docs.godotengine.org/en/stable/classes/class_rect2i.html#class-rect2i), weight\_scale: [float](https://docs.godotengine.org/en/stable/classes/class_float.html#class-float)) |
| [Array](https://docs.godotengine.org/en/stable/classes/class_array.html#class-array)\[ [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)\] | [get\_id\_path](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-method-get-id-path)(from\_id: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i), to\_id: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i), allow\_partial\_path: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) = false) |
| [Array](https://docs.godotengine.org/en/stable/classes/class_array.html#class-array)\[ [Dictionary](https://docs.godotengine.org/en/stable/classes/class_dictionary.html#class-dictionary)\] | [get\_point\_data\_in\_region](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-method-get-point-data-in-region)(region: [Rect2i](https://docs.godotengine.org/en/stable/classes/class_rect2i.html#class-rect2i)) const |
| [PackedVector2Array](https://docs.godotengine.org/en/stable/classes/class_packedvector2array.html#class-packedvector2array) | [get\_point\_path](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-method-get-point-path)(from\_id: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i), to\_id: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i), allow\_partial\_path: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) = false) |
| [Vector2](https://docs.godotengine.org/en/stable/classes/class_vector2.html#class-vector2) | [get\_point\_position](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-method-get-point-position)(id: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)) const |
| [float](https://docs.godotengine.org/en/stable/classes/class_float.html#class-float) | [get\_point\_weight\_scale](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-method-get-point-weight-scale)(id: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)) const |
| [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) | [is\_dirty](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-method-is-dirty)() const |
| [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) | [is\_in\_bounds](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-method-is-in-bounds)(x: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), y: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int)) const |
| [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) | [is\_in\_boundsv](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-method-is-in-boundsv)(id: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)) const |
| [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) | [is\_point\_solid](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-method-is-point-solid)(id: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)) const |
| void | [set\_point\_solid](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-method-set-point-solid)(id: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i), solid: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) = true) |
| void | [set\_point\_weight\_scale](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-method-set-point-weight-scale)(id: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i), weight\_scale: [float](https://docs.godotengine.org/en/stable/classes/class_float.html#class-float)) |
| void | [update](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-method-update)() |

* * *

## Enumerations [](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html\#enumerations "Link to this heading")

enum **Heuristic**: [🔗](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#enum-astargrid2d-heuristic)

[Heuristic](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#enum-astargrid2d-heuristic) **HEURISTIC\_EUCLIDEAN** = `0`

The [Euclidean heuristic](https://en.wikipedia.org/wiki/Euclidean_distance) to be used for the pathfinding using the following formula:

```
dx = abs(to_id.x - from_id.x)
dy = abs(to_id.y - from_id.y)
result = sqrt(dx * dx + dy * dy)

```

Copy to clipboard

**Note:** This is also the internal heuristic used in [AStar3D](https://docs.godotengine.org/en/stable/classes/class_astar3d.html#class-astar3d) and [AStar2D](https://docs.godotengine.org/en/stable/classes/class_astar2d.html#class-astar2d) by default (with the inclusion of possible z-axis coordinate).

[Heuristic](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#enum-astargrid2d-heuristic) **HEURISTIC\_MANHATTAN** = `1`

The [Manhattan heuristic](https://en.wikipedia.org/wiki/Taxicab_geometry) to be used for the pathfinding using the following formula:

```
dx = abs(to_id.x - from_id.x)
dy = abs(to_id.y - from_id.y)
result = dx + dy

```

Copy to clipboard

**Note:** This heuristic is intended to be used with 4-side orthogonal movements, provided by setting the [diagonal\_mode](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-property-diagonal-mode) to [DIAGONAL\_MODE\_NEVER](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-constant-diagonal-mode-never).

[Heuristic](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#enum-astargrid2d-heuristic) **HEURISTIC\_OCTILE** = `2`

The Octile heuristic to be used for the pathfinding using the following formula:

```
dx = abs(to_id.x - from_id.x)
dy = abs(to_id.y - from_id.y)
f = sqrt(2) - 1
result = (dx < dy) ? f * dx + dy : f * dy + dx;

```

Copy to clipboard

[Heuristic](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#enum-astargrid2d-heuristic) **HEURISTIC\_CHEBYSHEV** = `3`

The [Chebyshev heuristic](https://en.wikipedia.org/wiki/Chebyshev_distance) to be used for the pathfinding using the following formula:

```
dx = abs(to_id.x - from_id.x)
dy = abs(to_id.y - from_id.y)
result = max(dx, dy)

```

Copy to clipboard

[Heuristic](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#enum-astargrid2d-heuristic) **HEURISTIC\_MAX** = `4`

Represents the size of the [Heuristic](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#enum-astargrid2d-heuristic) enum.

* * *

enum **DiagonalMode**: [🔗](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#enum-astargrid2d-diagonalmode)

[DiagonalMode](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#enum-astargrid2d-diagonalmode) **DIAGONAL\_MODE\_ALWAYS** = `0`

The pathfinding algorithm will ignore solid neighbors around the target cell and allow passing using diagonals.

[DiagonalMode](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#enum-astargrid2d-diagonalmode) **DIAGONAL\_MODE\_NEVER** = `1`

The pathfinding algorithm will ignore all diagonals and the way will be always orthogonal.

[DiagonalMode](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#enum-astargrid2d-diagonalmode) **DIAGONAL\_MODE\_AT\_LEAST\_ONE\_WALKABLE** = `2`

The pathfinding algorithm will avoid using diagonals if at least two obstacles have been placed around the neighboring cells of the specific path segment.

[DiagonalMode](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#enum-astargrid2d-diagonalmode) **DIAGONAL\_MODE\_ONLY\_IF\_NO\_OBSTACLES** = `3`

The pathfinding algorithm will avoid using diagonals if any obstacle has been placed around the neighboring cells of the specific path segment.

[DiagonalMode](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#enum-astargrid2d-diagonalmode) **DIAGONAL\_MODE\_MAX** = `4`

Represents the size of the [DiagonalMode](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#enum-astargrid2d-diagonalmode) enum.

* * *

enum **CellShape**: [🔗](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#enum-astargrid2d-cellshape)

[CellShape](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#enum-astargrid2d-cellshape) **CELL\_SHAPE\_SQUARE** = `0`

Rectangular cell shape.

[CellShape](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#enum-astargrid2d-cellshape) **CELL\_SHAPE\_ISOMETRIC\_RIGHT** = `1`

Diamond cell shape (for isometric look). Cell coordinates layout where the horizontal axis goes up-right, and the vertical one goes down-right.

[CellShape](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#enum-astargrid2d-cellshape) **CELL\_SHAPE\_ISOMETRIC\_DOWN** = `2`

Diamond cell shape (for isometric look). Cell coordinates layout where the horizontal axis goes down-right, and the vertical one goes down-left.

[CellShape](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#enum-astargrid2d-cellshape) **CELL\_SHAPE\_MAX** = `3`

Represents the size of the [CellShape](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#enum-astargrid2d-cellshape) enum.

* * *

## Property Descriptions [](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html\#property-descriptions "Link to this heading")

[CellShape](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#enum-astargrid2d-cellshape) **cell\_shape** = `0` [🔗](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-property-cell-shape)

- void **set\_cell\_shape**(value: [CellShape](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#enum-astargrid2d-cellshape))

- [CellShape](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#enum-astargrid2d-cellshape) **get\_cell\_shape**()


The cell shape. Affects how the positions are placed in the grid. If changed, [update()](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-method-update) needs to be called before finding the next path.

* * *

[Vector2](https://docs.godotengine.org/en/stable/classes/class_vector2.html#class-vector2) **cell\_size** = `Vector2(1, 1)` [🔗](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-property-cell-size)

- void **set\_cell\_size**(value: [Vector2](https://docs.godotengine.org/en/stable/classes/class_vector2.html#class-vector2))

- [Vector2](https://docs.godotengine.org/en/stable/classes/class_vector2.html#class-vector2) **get\_cell\_size**()


The size of the point cell which will be applied to calculate the resulting point position returned by [get\_point\_path()](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-method-get-point-path). If changed, [update()](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-method-update) needs to be called before finding the next path.

* * *

[Heuristic](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#enum-astargrid2d-heuristic) **default\_compute\_heuristic** = `0` [🔗](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-property-default-compute-heuristic)

- void **set\_default\_compute\_heuristic**(value: [Heuristic](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#enum-astargrid2d-heuristic))

- [Heuristic](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#enum-astargrid2d-heuristic) **get\_default\_compute\_heuristic**()


The default [Heuristic](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#enum-astargrid2d-heuristic) which will be used to calculate the cost between two points if [\_compute\_cost()](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-private-method-compute-cost) was not overridden.

* * *

[Heuristic](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#enum-astargrid2d-heuristic) **default\_estimate\_heuristic** = `0` [🔗](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-property-default-estimate-heuristic)

- void **set\_default\_estimate\_heuristic**(value: [Heuristic](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#enum-astargrid2d-heuristic))

- [Heuristic](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#enum-astargrid2d-heuristic) **get\_default\_estimate\_heuristic**()


The default [Heuristic](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#enum-astargrid2d-heuristic) which will be used to calculate the cost between the point and the end point if [\_estimate\_cost()](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-private-method-estimate-cost) was not overridden.

* * *

[DiagonalMode](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#enum-astargrid2d-diagonalmode) **diagonal\_mode** = `0` [🔗](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-property-diagonal-mode)

- void **set\_diagonal\_mode**(value: [DiagonalMode](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#enum-astargrid2d-diagonalmode))

- [DiagonalMode](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#enum-astargrid2d-diagonalmode) **get\_diagonal\_mode**()


A specific [DiagonalMode](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#enum-astargrid2d-diagonalmode) mode which will force the path to avoid or accept the specified diagonals.

* * *

[bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) **jumping\_enabled** = `false` [🔗](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-property-jumping-enabled)

- void **set\_jumping\_enabled**(value: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool))

- [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) **is\_jumping\_enabled**()


Enables or disables jumping to skip up the intermediate points and speeds up the searching algorithm.

**Note:** Currently, toggling it on disables the consideration of weight scaling in pathfinding.

* * *

[Vector2](https://docs.godotengine.org/en/stable/classes/class_vector2.html#class-vector2) **offset** = `Vector2(0, 0)` [🔗](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-property-offset)

- void **set\_offset**(value: [Vector2](https://docs.godotengine.org/en/stable/classes/class_vector2.html#class-vector2))

- [Vector2](https://docs.godotengine.org/en/stable/classes/class_vector2.html#class-vector2) **get\_offset**()


The offset of the grid which will be applied to calculate the resulting point position returned by [get\_point\_path()](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-method-get-point-path). If changed, [update()](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-method-update) needs to be called before finding the next path.

* * *

[Rect2i](https://docs.godotengine.org/en/stable/classes/class_rect2i.html#class-rect2i) **region** = `Rect2i(0, 0, 0, 0)` [🔗](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-property-region)

- void **set\_region**(value: [Rect2i](https://docs.godotengine.org/en/stable/classes/class_rect2i.html#class-rect2i))

- [Rect2i](https://docs.godotengine.org/en/stable/classes/class_rect2i.html#class-rect2i) **get\_region**()


The region of grid cells available for pathfinding. If changed, [update()](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-method-update) needs to be called before finding the next path.

* * *

[Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i) **size** = `Vector2i(0, 0)` [🔗](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-property-size)

- void **set\_size**(value: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i))

- [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i) **get\_size**()


**Deprecated:** Use [region](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-property-region) instead.

The size of the grid (number of cells of size [cell\_size](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-property-cell-size) on each axis). If changed, [update()](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-method-update) needs to be called before finding the next path.

* * *

## Method Descriptions [](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html\#method-descriptions "Link to this heading")

[float](https://docs.godotengine.org/en/stable/classes/class_float.html#class-float) **\_compute\_cost**(from\_id: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i), to\_id: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)) virtualconst [🔗](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-private-method-compute-cost)

Called when computing the cost between two connected points.

Note that this function is hidden in the default **AStarGrid2D** class.

* * *

[float](https://docs.godotengine.org/en/stable/classes/class_float.html#class-float) **\_estimate\_cost**(from\_id: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i), end\_id: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)) virtualconst [🔗](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-private-method-estimate-cost)

Called when estimating the cost between a point and the path's ending point.

Note that this function is hidden in the default **AStarGrid2D** class.

* * *

void **clear**() [🔗](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-method-clear)

Clears the grid and sets the [region](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-property-region) to `Rect2i(0, 0, 0, 0)`.

* * *

void **fill\_solid\_region**(region: [Rect2i](https://docs.godotengine.org/en/stable/classes/class_rect2i.html#class-rect2i), solid: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) = true) [🔗](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-method-fill-solid-region)

Fills the given `region` on the grid with the specified value for the solid flag.

**Note:** Calling [update()](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-method-update) is not needed after the call of this function.

* * *

void **fill\_weight\_scale\_region**(region: [Rect2i](https://docs.godotengine.org/en/stable/classes/class_rect2i.html#class-rect2i), weight\_scale: [float](https://docs.godotengine.org/en/stable/classes/class_float.html#class-float)) [🔗](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-method-fill-weight-scale-region)

Fills the given `region` on the grid with the specified value for the weight scale.

**Note:** Calling [update()](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-method-update) is not needed after the call of this function.

* * *

[Array](https://docs.godotengine.org/en/stable/classes/class_array.html#class-array)\[ [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)\] **get\_id\_path**(from\_id: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i), to\_id: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i), allow\_partial\_path: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) = false) [🔗](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-method-get-id-path)

Returns an array with the IDs of the points that form the path found by AStar2D between the given points. The array is ordered from the starting point to the ending point of the path.

If there is no valid path to the target, and `allow_partial_path` is `true`, returns a path to the point closest to the target that can be reached.

**Note:** When `allow_partial_path` is `true` and `to_id` is solid the search may take an unusually long time to finish.

* * *

[Array](https://docs.godotengine.org/en/stable/classes/class_array.html#class-array)\[ [Dictionary](https://docs.godotengine.org/en/stable/classes/class_dictionary.html#class-dictionary)\] **get\_point\_data\_in\_region**(region: [Rect2i](https://docs.godotengine.org/en/stable/classes/class_rect2i.html#class-rect2i)) const [🔗](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-method-get-point-data-in-region)

Returns an array of dictionaries with point data ( `id`: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i), `position`: [Vector2](https://docs.godotengine.org/en/stable/classes/class_vector2.html#class-vector2), `solid`: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool), `weight_scale`: [float](https://docs.godotengine.org/en/stable/classes/class_float.html#class-float)) within a `region`.

* * *

[PackedVector2Array](https://docs.godotengine.org/en/stable/classes/class_packedvector2array.html#class-packedvector2array) **get\_point\_path**(from\_id: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i), to\_id: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i), allow\_partial\_path: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) = false) [🔗](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-method-get-point-path)

Returns an array with the points that are in the path found by **AStarGrid2D** between the given points. The array is ordered from the starting point to the ending point of the path.

If there is no valid path to the target, and `allow_partial_path` is `true`, returns a path to the point closest to the target that can be reached.

**Note:** This method is not thread-safe. If called from a [Thread](https://docs.godotengine.org/en/stable/classes/class_thread.html#class-thread), it will return an empty array and will print an error message.

Additionally, when `allow_partial_path` is `true` and `to_id` is solid the search may take an unusually long time to finish.

* * *

[Vector2](https://docs.godotengine.org/en/stable/classes/class_vector2.html#class-vector2) **get\_point\_position**(id: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)) const [🔗](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-method-get-point-position)

Returns the position of the point associated with the given `id`.

* * *

[float](https://docs.godotengine.org/en/stable/classes/class_float.html#class-float) **get\_point\_weight\_scale**(id: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)) const [🔗](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-method-get-point-weight-scale)

Returns the weight scale of the point associated with the given `id`.

* * *

[bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) **is\_dirty**() const [🔗](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-method-is-dirty)

Indicates that the grid parameters were changed and [update()](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-method-update) needs to be called.

* * *

[bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) **is\_in\_bounds**(x: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int), y: [int](https://docs.godotengine.org/en/stable/classes/class_int.html#class-int)) const [🔗](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-method-is-in-bounds)

Returns `true` if the `x` and `y` is a valid grid coordinate (id), i.e. if it is inside [region](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-property-region). Equivalent to `region.has_point(Vector2i(x, y))`.

* * *

[bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) **is\_in\_boundsv**(id: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)) const [🔗](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-method-is-in-boundsv)

Returns `true` if the `id` vector is a valid grid coordinate, i.e. if it is inside [region](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-property-region). Equivalent to `region.has_point(id)`.

* * *

[bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) **is\_point\_solid**(id: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i)) const [🔗](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-method-is-point-solid)

Returns `true` if a point is disabled for pathfinding. By default, all points are enabled.

* * *

void **set\_point\_solid**(id: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i), solid: [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html#class-bool) = true) [🔗](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-method-set-point-solid)

Disables or enables the specified point for pathfinding. Useful for making an obstacle. By default, all points are enabled.

**Note:** Calling [update()](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-method-update) is not needed after the call of this function.

* * *

void **set\_point\_weight\_scale**(id: [Vector2i](https://docs.godotengine.org/en/stable/classes/class_vector2i.html#class-vector2i), weight\_scale: [float](https://docs.godotengine.org/en/stable/classes/class_float.html#class-float)) [🔗](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-method-set-point-weight-scale)

Sets the `weight_scale` for the point with the given `id`. The `weight_scale` is multiplied by the result of [\_compute\_cost()](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-private-method-compute-cost) when determining the overall cost of traveling across a segment from a neighboring point to this point.

**Note:** Calling [update()](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-method-update) is not needed after the call of this function.

* * *

void **update**() [🔗](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-method-update)

Updates the internal state of the grid according to the parameters to prepare it to search the path. Needs to be called if parameters like [region](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-property-region), [cell\_size](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-property-cell-size) or [offset](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-property-offset) are changed. [is\_dirty()](https://docs.godotengine.org/en/stable/classes/class_astargrid2d.html#class-astargrid2d-method-is-dirty) will return `true` if this is the case and this needs to be called.

**Note:** All point data (solidity and weight scale) will be cleared.

[Previous](https://docs.godotengine.org/en/stable/classes/class_astar3d.html "AStar3D") [Next](https://docs.godotengine.org/en/stable/classes/class_audioeffectinstance.html "AudioEffectInstance")

* * *
