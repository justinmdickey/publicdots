# Configuration Guide

## How to Configure Colors and Radius

Edit the `rounded-overlay.py` file and look for the **CONFIGURATION** section near the top (around lines 17-32):

```python
# ============= CONFIGURATION =============
# Corner radius in pixels (can be overridden by command line argument)
DEFAULT_CORNER_RADIUS = 20

# Corner color (RGBA values from 0.0 to 1.0)
CORNER_COLOR = (0, 0, 0, 1)  # Black
# =========================================
```

## Changing Corner Radius

### Method 1: Command Line (Temporary)
```bash
./run-overlay.sh 30    # 30 pixel radius
./run-overlay.sh 15    # 15 pixel radius
./run-overlay.sh 50    # 50 pixel radius
```

### Method 2: Edit Config File (Permanent)
Change the `DEFAULT_CORNER_RADIUS` value in the script:
```python
DEFAULT_CORNER_RADIUS = 30  # Change from 20 to 30
```

## Changing Corner Colors

Edit the `CORNER_COLOR` value. Colors are in RGBA format where each value is between 0.0 and 1.0:

### Color Examples:

**Black (default):**
```python
CORNER_COLOR = (0, 0, 0, 1)
```

**White:**
```python
CORNER_COLOR = (1, 1, 1, 1)
```

**Dark Gray:**
```python
CORNER_COLOR = (0.1, 0.1, 0.1, 1)
```

**Dark Blue:**
```python
CORNER_COLOR = (0, 0, 0.2, 1)
```

**Custom Color:**
```python
CORNER_COLOR = (R, G, B, Alpha)
# R = Red (0.0 to 1.0)
# G = Green (0.0 to 1.0)
# B = Blue (0.0 to 1.0)
# Alpha = Opacity (0.0 = transparent, 1.0 = opaque)
```

## Converting Hex Colors to RGBA

If you have a hex color like `#1a1a1a`, convert it like this:
- Split into RGB: `1a`, `1a`, `1a`
- Convert each to decimal: `26`, `26`, `26`
- Divide by 255: `0.102`, `0.102`, `0.102`
- Result: `(0.102, 0.102, 0.102, 1)`

## Applying Changes

After editing the configuration:
```bash
# Stop the current overlay
pkill -f rounded-overlay.py

# Start with new settings
./run-overlay.sh
```

## Examples

### Large white corners:
```python
DEFAULT_CORNER_RADIUS = 40
CORNER_COLOR = (1, 1, 1, 1)
```

### Small dark gray corners:
```python
DEFAULT_CORNER_RADIUS = 15
CORNER_COLOR = (0.15, 0.15, 0.15, 1)
```

### Medium colored corners (dark purple):
```python
DEFAULT_CORNER_RADIUS = 25
CORNER_COLOR = (0.2, 0, 0.3, 1)
```
