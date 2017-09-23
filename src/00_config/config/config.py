import json
import configparser
import os

class Config:

    configType = "JSON"
    configPath = ""

    # 초기자(initializer)
    def __init__(self):
        # self.* : 인스턴스변수
        self.configType = "JSON"
        self.configPath = "{0}.json".format(os.getcwd())
        with open('config.json', 'r') as f:
            config = json.load(f)

        secret_key = config['DEFAULT']['SECRET_KEY']  # 'secret-key-of-myapp'
        ci_hook_url = config['CI']['HOOK_URL']  # 'web-hooking-url-from-ci-service'

        config = configparser.ConfigParser()
        config.read('config.ini')


    # 초기자(initializer)
    def __init__(self, filetype, filepath):
        # self.* : 인스턴스변수
        self.configType = filetype
        self.configPath = filepath


     # 메서드
    def getConfig(key):
        area = self.width * self.height
        return area

    # 메서드
    def setConfig(key, value):
            area = self.width * self.height
            return area

    # 정적 메서드
    @staticmethod
    def isSquare(rectWidth, rectHeight):
        return rectWidth == rectHeight

    # 클래스 메서드
    @classmethod
    def printCount(cls):
        print(cls.count)

