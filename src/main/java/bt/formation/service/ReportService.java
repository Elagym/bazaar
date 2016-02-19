package bt.formation.service;

import bt.formation.dto.ReportDTO;

import java.util.List;

public interface ReportService {
    ReportDTO createReport(ReportDTO report);
    List<ReportDTO> findAll();
}
