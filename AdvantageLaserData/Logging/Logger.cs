using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NLog;

namespace AdvLaser.Logging
{
    public static class Logger
    {
        static Logger()
        {
        }
        public static NLog.Logger logger = LogManager.GetLogger("WebCheck");

        public static void LogInfo(string msg)
        {
            logger.Log(LogLevel.Info, msg);
        }

        public static void LogError(string msg)
        {
            logger.Log(LogLevel.Error, msg);
        }

        public static void LogError(string msg, System.Exception ex)
        {
            LogError(msg + " " + ex.Message);
        }
    }
}
