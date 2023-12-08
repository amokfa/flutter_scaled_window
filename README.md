# flutter_scaled_window

Render a widget/app at a specified resolution inside a scaled down window. Useful for testing desktop/web apps in
a thin window:

<img src="https://raw.githubusercontent.com/amokfa/flutter_scaled_window/main/readme_assets/scaled_window_demo.png" />

## Usage:

```
ScaledWindow(
  barrierColor: Colors.transparent,
  resolution: Size(1366, 768),
  builder: (context, scale) => MyComponent(),
);
```