package co.grandcircus.pizzapartyapp;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface PartyOptionRepository extends JpaRepository<PartyOption, Long>{
	
	List<PartyOption> findByTypeContainingIgnoreCase(String name);

	List<PartyOption> findByTypeContainingAndVotesGreaterThan(String type, int votes);

	List<PartyOption> findByPartyId(Long id);

	List<PartyOption> findByPartyIdAndVotesGreaterThan(Long id, int i);

}
