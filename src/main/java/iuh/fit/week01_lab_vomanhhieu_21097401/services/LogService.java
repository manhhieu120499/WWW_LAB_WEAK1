package iuh.fit.week01_lab_vomanhhieu_21097401.services;

import iuh.fit.week01_lab_vomanhhieu_21097401.entities.Log;
import iuh.fit.week01_lab_vomanhhieu_21097401.repositories.LogRepository;
import jakarta.persistence.EntityManagerFactory;

public class LogService {
    private LogRepository logRepository;

    public LogService() {
        logRepository = new LogRepository();
    }

    public boolean writeLog(Log log) {
        return logRepository.addLog(log);
    }

    public Log getLog(String accountId) {
        return logRepository.getLog(accountId);
    }

    public boolean updateLog(Log log) {
        return logRepository.updateLog(log);
    }
}
