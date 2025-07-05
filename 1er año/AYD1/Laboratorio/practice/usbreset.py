import pandas as pd
import numpy as np
import ccxt 
import yfinance as yf
import json
import matplotlib.pyplot as plt

# Definir la región del dominio: xy > -2/3
x = np.linspace(-3, 3, 400)
y = np.linspace(-3, 3, 400)
X, Y = np.meshgrid(x, y)
Z = 3*X*Y + 2  # Argumento del logaritmo

# Crear la figura
plt.figure(figsize=(8, 6))

# Graficar la condición del dominio (Z > 0)
plt.contourf(X, Y, Z > 0, levels=[0.5, 1.5], colors=['lightblue'], alpha=0.3)
plt.contour(X, Y, Z, levels=[0], colors='red', linewidths=2, linestyles='dashed', label='$3xy + 2 = 0$')

# Añadir detalles
plt.xlabel('x', fontsize=12)
plt.ylabel('y', fontsize=12)
plt.title('Dominio de $f(x, y) = \ln(3xy + 2)$', fontsize=14)
plt.grid(True, linestyle='--', alpha=0.5)
plt.legend()
plt.colorbar(ticks=[0, 1], label='$3xy + 2 > 0$')

# Resaltar ejes
plt.axhline(0, color='black', linewidth=0.5)
plt.axvline(0, color='black', linewidth=0.5)

plt.show()