import QtQuick 2.15

Canvas {
    id: polyCanvas

    property color color: "white"
    property var points: [
        {
            x: 0,
            y: 0
        },
        {
            x: width / 2,
            y: height
        },
        {
            x: width,
            y: 0
        },
    ]
    property real radius: 20

    function roundedPoly(ctx, points, radiusAll) {
        ctx.beginPath();
        var i, x, y, len, p1, p2, p3, v1, v2, sinA, sinA90, radDirection, drawDirection, angle, halfAngle, cRadius, lenOut, radius;
        var asVec = function (p, pp, v) {
            v.x = pp.x - p.x;
            v.y = pp.y - p.y;
            v.len = Math.sqrt(v.x * v.x + v.y * v.y);
            v.nx = v.x / v.len;
            v.ny = v.y / v.len;
            v.ang = Math.atan2(v.ny, v.nx);
        };
        radius = radiusAll;
        v1 = {};
        v2 = {};
        len = points.length;
        p1 = points[len - 1];
        for (i = 0; i < len; i++) {
            p2 = points[(i) % len];
            p3 = points[(i + 1) % len];
            asVec(p2, p1, v1);
            asVec(p2, p3, v2);
            sinA = v1.nx * v2.ny - v1.ny * v2.nx;
            sinA90 = v1.nx * v2.nx - v1.ny * -v2.ny;
            angle = Math.asin(Math.max(-1, Math.min(1, sinA)));
            radDirection = 1;
            drawDirection = false;
            if (sinA90 < 0) {
                if (angle < 0) {
                    angle = Math.PI + angle;
                } else {
                    angle = Math.PI - angle;
                    radDirection = -1;
                    drawDirection = true;
                }
            } else {
                if (angle > 0) {
                    radDirection = -1;
                    drawDirection = true;
                }
            }
            if (p2.radius !== undefined) {
                radius = p2.radius;
            } else {
                radius = radiusAll;
            }
            halfAngle = angle / 2;
            lenOut = Math.abs(Math.cos(halfAngle) * radius / Math.sin(halfAngle));
            if (lenOut > Math.min(v1.len / 2, v2.len / 2)) {
                lenOut = Math.min(v1.len / 2, v2.len / 2);
                cRadius = Math.abs(lenOut * Math.sin(halfAngle) / Math.cos(halfAngle));
            } else {
                cRadius = radius;
            }
            x = p2.x + v2.nx * lenOut;
            y = p2.y + v2.ny * lenOut;
            x += -v2.ny * cRadius * radDirection;
            y += v2.nx * cRadius * radDirection;
            ctx.arc(x, y, cRadius, v1.ang + Math.PI / 2 * radDirection, v2.ang - Math.PI / 2 * radDirection, drawDirection);
            p1 = p2;
            p2 = p3;
        }
        ctx.closePath();
    }

    anchors.centerIn: parent
    antialiasing: true
    height: 200
    width: 200

    onColorChanged: {
        requestPaint();
    }
    onHeightChanged: {
        requestPaint();
    }
    onPaint: {
        var ctx = getContext("2d");
        ctx.clearRect(0, 0, width, height);
        roundedPoly(ctx, points, radius);
        ctx.fillStyle = color;
        ctx.fill();
    }
    onPointsChanged: {
        requestPaint();
    }
    onWidthChanged: {
        requestPaint();
    }
}
