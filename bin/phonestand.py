#!/usr/bin/python

from __future__ import division
from math import cos, sin, tan, radians
from sys import stdout
from reportlab.lib.pagesizes import letter
from reportlab.pdfgen import canvas

# Input geometry factors.
height = 1.75           # inches  - height of back spine
thickness = 0.375       # inches  - thickness of phone
tilt = 20               # degrees - tilt angle of phone from vertical
spread = 75             # degrees - spread angle of legs

# Fixed geometry factors.
clearance = 0.25        # inches  - bottom and edge clearances
tip = 0.125             # inches  - width at tip of back spine

# Calculated geometry factors
tilt = radians(tilt)
scale = 1.0/cos(radians(spread/2.0))

coords = []

# Coordinates of half the stand in projected plane.
coords.append((0.0, height))
coords.append((tip, height))
coords.append((coords[-1][0]+(height-0.25)*tan(tilt), clearance))
coords.append((coords[-1][0]+thickness*cos(tilt), coords[-1][1]+thickness*sin(tilt)))
coords.append((coords[-1][0]-thickness*sin(tilt), coords[-1][1]+thickness*cos(tilt)))
coords.append((coords[-2][0]+clearance, coords[-1][1]))
coords.append((coords[-1][0], 0.0))
coords.append((0.0, 0.0))

# Coordinates of half the stand in its own plane.
coords = [  (x*scale, y) for (x, y) in coords ]

# Mirror image for other half of stand.
mirror = coords[:-1]
mirror.reverse()
mirror = [ (-x, y) for (x, y) in mirror ]

# All together.
coords = coords + mirror

# Convert from inches to points.
coords = [ (x*72, y*72) for (x, y) in coords ]

# The ends of what will be the fold line.
top = coords[0]
bottom = coords[7]

# Now that we have the coordinates, we'll draw the stand.
c = canvas.Canvas(stdout, pagesize=letter)

# Centered left/right and 0.75 inches from top.
c.translate(letter[0]/2, letter[1] - top[1] - 0.75*72)

# The outline.
c.setLineWidth(2)
p = c.beginPath()
p.moveTo(*coords[0])
for pt in coords[1:]:
  p.lineTo(*pt)
c.drawPath(p)

# The fold line.
c.setDash(8, 4)
c.setLineWidth(1)
f = c.beginPath()
f.moveTo(*top)
f.lineTo(*bottom)
c.drawPath(f)

# Finish up.
c.showPage()
c.save()
