package co.grandcircus.pizzapartyapp;

import org.springframework.data.jpa.repository.JpaRepository;

public interface PartyRepository extends JpaRepository<Party, Long> {
	
	

}
