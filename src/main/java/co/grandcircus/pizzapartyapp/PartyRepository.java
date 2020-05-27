package co.grandcircus.pizzapartyapp;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface PartyRepository extends JpaRepository<Party, Long> {

	List<Party> findByNameContainingIgnoreCase(String keyword);

	List<Party> findByOrderByDate();

	
	
}
