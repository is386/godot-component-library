# godot-component-library

Reusable Godot components, kept decoupled from any one game

## Components

| Component           | Files                                  | What it does                                                                                                                        | Copy with              | Needs a scene                                                       |
| ------------------- | -------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------- | ---------------------- | ------------------------------------------------------------------- |
| Health              | `health_component.gd`                  | Hit points on a `Node`, emits `died` at zero. No opinion on what dying looks like.                                                  | —                      | No                                                                  |
| Hitbox / Hurtbox    | `hitbox.gd`, `hurtbox.gd`              | Paired `Area2D`s. Hitbox finds hurtboxes and reports the hit; hurtbox announces it. Neither touches health, i-frames, or knockback. | each other             | **Yes** — each needs a `CollisionShape2D` child                     |
| Shaking component   | `shaking_component.gd`                 | Noise-based shake driven onto the parent's `offset`. Parent must be a `Camera2D` or `Sprite2D`.                                     | —                      | No                                                                  |
| Shaking camera      | `shaking_camera.gd`                    | `Camera2D` that shakes itself.                                                                                                      | `shaking_component.gd` | **Yes** — needs a `ShakingComponent` child named `ShakingComponent` |
| Aim line            | `aim_line.gd`                          | `Line2D` drawn from origin to mouse, clipped at the first collision.                                                                | —                      | **Yes** — needs a `RayCast2D` child named `RayCast2D`               |
| State machine       | `state.gd`, `state_machine.gd`         | States transition by returning an integer id. Owner defines the enum; machine indexes children by id.                               | each other             | No                                                                  |
