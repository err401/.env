from urllib.request import urlopen


class Status:
    @staticmethod
    def isConnected():
            try:
                urlopen(url='https://get.scoop.sh', timeout=10)
                return True
            except:
                return False
