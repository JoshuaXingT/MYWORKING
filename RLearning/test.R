abline(h = 0, col = gray(.90))
lines(x, col = "green4", lty = "dotted")
points(x, bg = "limegreen", pch = 21)
title(
    main = "Simple Use of Color In a Plot",
    xlab = "Just a Whisper of a Label",
    col.main = "blue", col.lab = gray(.8),
    cex.main = 1.2, cex.lab = 1.0, font.main = 4, font.lab = 3
)
