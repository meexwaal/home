# Startup file for ipython.
# Copy this file to ~/.ipython/profile_default/startup/
# and you'll have all these imported when you use ipython

from IPython import get_ipython

ipython = get_ipython()

# Automatically reload modules when they change
# ipython.magic("load_ext autoreload")
# ipython.magic("autoreload 2")

# Disable autosuggest
ipython.pt_app.auto_suggest = None

# Standard libs
import sys
import os
import numpy as np
