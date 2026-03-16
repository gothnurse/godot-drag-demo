# godot-drag-demo

A minimal Godot 4 demo showing how to drag a physics object with the mouse using GDScript.

Built as a clean, readable reference — no heavy type annotations, no bloat.

---

## What it does

- Click and drag a physics-based object around the scene
- Object responds to gravity when released
- Simple, beginner-friendly GDScript code

## Requirements

- [Godot 4](https://godotengine.org/download/) (tested on Godot 4.x)

## How to run

1. Clone the repo:
   ```bash
   git clone https://github.com/YOUR_USERNAME/godot-drag-demo.git
   ```
2. Open Godot 4 and import the project (`project.godot`)
3. Press **F5** to run

## Project structure

```
godot-drag-demo/
├── project.godot
├── scenes/
│   └── main.tscn
└── scripts/
    └── draggable.gd
```

## How it works

The dragging logic uses `_input_event()` on a `RigidBody2D` to detect clicks, then moves the object toward the mouse position each physics frame using `linear_velocity`. When released, gravity takes over naturally.

## License

MIT — do whatever you want with it.
