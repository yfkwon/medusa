import os
import copy
import datetime
import socket
import logging.handlers

# This is the main class for the logging module

class Logger:

    _instance = None

    _logger = None
    _loggerLevel = logging.DEBUG
    _hostname = socket.gethostname()
    _logger_formatstring = None
    _logger_filename = None
    _logger_file_handler = None
    _logger_stream_handler = None


    def __init__(self, loggername='applogger'):
        print('생성자 호출!')
        # 인스턴스 생성
        self._logger = logging.getLogger(loggername)
        Logger._instance = self

        # 포매터를 만든다
        self._logger_formatstring = logging.Formatter('%(asctime)s %(process)d[%(processName)s] %(thread)d[%(threadName)s] [%(levelname)s] [%(filename)s:%(lineno)s] %(module)s %(funcName)s] > %(message)s')

        # Logger file name
        now = datetime.datetime.now()
        #logfiletime = "%04d-%02d-%02d %02d:%02d:%02d" % (now.tm_year, now.tm_mon, now.tm_mday, now.tm_hour, now.tm_min, now.tm_sec)
        self._logger_filename = "{0}.log".format("%04d-%02d-%02d" % (now.year, now.month, now.day))

        # set basic config
        #logging.basicConfig(level=logging.DEBUG, format='%(asctime)s %(levelname)s: %(message)s', filename='log.log', filemode='a')

        # 환경변수를 읽어서 로깅 레벨과 로그를 남길 파일의 경로를 변수에 저장한다
        """
        if (os.environ['NODE_ENV'] == 'local'):
            loggerLevel = logging.DEBUG
            filename = '/tmp/test.log'
        elif (os.environ['NODE_ENV'] == 'test'):
            loggerLevel = logging.DEBUG
            filename = '/home/www/log/testServer.log'
        else:
            loggerLevel = logging.INFO
            filename = '/home/www/log/server.log'
        """

        # 스트림과 파일로 로그를 출력하는 핸들러를 각각 만든다.
        self._logger_file_handler = logging.FileHandler(self._logger_filename)
        self._logger_stream_handler = logging.StreamHandler()

        # set logging levels
        self._loggerLevel = logging.DEBUG
        self._logger.setLevel(self._loggerLevel)
        self._logger_file_handler.setLevel(self._loggerLevel)
        self._logger_stream_handler.setLevel(self._loggerLevel)

        # 각 핸들러에 포매터를 지정한다.
        self._logger_file_handler.setFormatter(self._logger_formatstring)
        self._logger_stream_handler.setFormatter(self._logger_formatstring)

        # 로거 인스턴스에 스트림 핸들러와 파일핸들러를 붙인다.
        self._logger.addHandler(self._logger_file_handler)
        self._logger.addHandler(self._logger_stream_handler)

    def __del__(self):
        print('소멸자 호출!')

    # 정적 메서드
    @staticmethod
    def get_instance(loggername):

        if (not Logger._instance):
            instance = Logger(loggername)
        else:
            instance = Logger._instance

        return instance

    def set_loglevel(self, loglevel=logging.DEBUG):
        """ Set the loglevel for the current instance. """
        self._loggerLevel = loglevel

        # set logging levels
        self._logger.setLevel(self._loggerLevel)
        self._logger_file_handler.setLevel(self._loggerLevel)
        self._logger_stream_handler.setLevel(self._loggerLevel)


    def set_formatstring(self, formatstring):
        """ Set a format string. """
        self._logger_formatstring = formatstring

        # 각 핸들러에 포매터를 지정한다.
        self._logger_file_handler.setFormatter(self._Logger_formatstring)
        self._logger_stream_handler.setFormatter(self._Logger_formatstring)


mylogger = Logger.get_instance('myapp')
mylogger.set_loglevel(logging.DEBUG)
logger = mylogger._logger

print('\nStart from logger\n')
logger.info("info 111")
logger.debug("debug 111")
logger.error("error 111")
logger.warning("warn 111")
print('\nEnd from logger\n')