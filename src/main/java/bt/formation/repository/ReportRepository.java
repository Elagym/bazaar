package bt.formation.repository;

import bt.formation.entity.Report;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ReportRepository extends JpaRepository<Report, Long> {

    @Query("select count(r) from Report r where r.viewed = 0")
    int getNewReportsCount();
}
