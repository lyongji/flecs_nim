# Shared test types and helpers for flecs_nim tests.
import std/assertions
import flecs

type
  Position* = object
    x*, y*: float64
  Velocity* = object
    vx*, vy*: float64
  Health* = object
    hp*: float64
  Gravity* = object
    value*: float64
  TagA* = object

template withWorld*(body: untyped): untyped =
  block:
    let world = ecs_init()
    defer: discard ecs_fini(world)
    body

proc makePosEntity*(world: ptr ecs_world_t; x, y: float64): ecs_entity_t =
  discard ecs_component(world, Position)
  result = ecs_new(world)
  ecs_set(world, result, Position, Position(x: x, y: y))
