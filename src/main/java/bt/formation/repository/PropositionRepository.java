package bt.formation.repository;

import bt.formation.entity.Proposition;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PropositionRepository extends JpaRepository<Proposition, Long> {
}
