package bt.formation.service.impl;

import bt.formation.dto.ReportDTO;
import bt.formation.entity.Report;
import bt.formation.repository.ReportRepository;
import bt.formation.service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class ReportServiceImpl implements ReportService{

    @Autowired
    ReportRepository reportRepository;

    @Override
    public ReportDTO createReport(ReportDTO report) {
        return reportRepository.save(report.toEntity()).toDto();
    }

    @Override
    public List<ReportDTO> findAll() {
        List<ReportDTO> list = new ArrayList<>();
        for (Report report : reportRepository.findAll()) {
            list.add(report.toDto());
        }
        return list;
    }

    @Override
    public ReportDTO findById(Long id) {
        return reportRepository.findOne(id).toDto();
    }

    @Override
    public ReportDTO updateReport(ReportDTO report) {
        return reportRepository.save(report.toEntity()).toDto();
    }

    @Override
    public int getNewReportsCount() {
        return reportRepository.getNewReportsCount();
    }
}
