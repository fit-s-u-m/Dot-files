#  !/home/fitsum/Dot-files/bin/.local/bin/cal/venv/bin/python
from kenat import Kenat

today = Kenat.now()

print(today,today.get_ethiopian())

