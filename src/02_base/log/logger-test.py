import logger

class LoggerTest:
    def __init__(self):
        self.logger = Logger.get_instance('mytest')

    def run(self):
        self.logger_instance = Logger.get_instance('myapp')
        self.logger_instance.set_loglevel(logging.DEBUG)
        self.logger = self.logger_instance._logger

        print('\nStart from logger\n')
        self.logger.error("error")
        self.logger.warn("warn")
        self.logger.info("info")
        self.logger.debug("debug")
        print('\nEnd from logger\n')

    def output(self, message):
        self.logger.info(message)


mytest = LoggerTest()

print('\nSettings from logger\n')
mytest.run()

