import sys
import os


def get_homedirectory():
    if (sys.platform == "win32"):
        if (os.environ.has_key("USERPROFILE")):
            return os.environ["USERPROFILE"]
        else:
            return "C:\\"
    else:
        if (os.environ.has_key("HOME")):
            return os.environ["HOME"]
        else:
            # No home directory set
            return ""