
from plumbum import local

from __init__ import Status, appLog

# os.environ["PATH"] = (
#     os.path.expanduser("C:/Users/xxx/Scoop/shims") + ";" + os.environ["PATH"]
# )
pwsh = local["pwsh"]


class Scoop:
    @staticmethod
    def setup(prereq):
        if Status.isConnected():
            pass
        else:
            appLog.err("cannot reach https://get.scoop.sh")
            exit()

        pwsh["Set-ExecutionPolicy", "RemoteSigned", "-Scope", "CurrentUser"]
        pwsh["-c", "irm", "get.scoop.sh", "|", "iex"]

        for _ in prereq:
            try:
                pwsh["-c", "scoop", "install", _]
                appLog.install("scoop apps",_)
            except:
                appLog.err(f"an error occured in installing {_}")
            finally:
                pass
