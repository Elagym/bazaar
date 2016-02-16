package bt.formation.service;

import bt.formation.dto.PropositionDTO;
import bt.formation.dto.UserDTO;

public interface PropositionService {
    PropositionDTO createProposition(PropositionDTO prop);
    PropositionDTO updateProposition(PropositionDTO prop);
    PropositionDTO findById(Long id);
}
