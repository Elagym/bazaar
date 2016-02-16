package bt.formation.service.impl;

import bt.formation.dto.PropositionDTO;
import bt.formation.dto.UserDTO;
import bt.formation.repository.PropositionRepository;
import bt.formation.repository.UserRepository;
import bt.formation.service.PropositionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class PropositionServiceImpl implements PropositionService {

    @Autowired
    PropositionRepository propositionRepository;

    @Override
    public PropositionDTO createProposition(PropositionDTO prop) {
        return propositionRepository.save(prop.toEntity()).toDto();
    }

    @Override
    public PropositionDTO updateProposition(PropositionDTO prop) {
        return propositionRepository.save(prop.toEntity()).toDto();
    }

    @Override
    public PropositionDTO findById(Long id) {
        return propositionRepository.findOne(id).toDto();
    }
}
