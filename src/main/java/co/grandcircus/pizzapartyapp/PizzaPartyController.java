package co.grandcircus.pizzapartyapp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class PizzaPartyController {
	
	@Autowired
	private PartyRepository partyRepo;
	
	@Autowired
	private PartyOptionRepository partyOptionRepo;
	
	@RequestMapping("/")
	public String main(Model model) {
		
		List<Party> partyList = partyRepo.findAll();
		model.addAttribute("partyList", partyList);
		return "parties-list";
	}
	
	@RequestMapping("/vote")
	public String vote(Model model) {
		List<PartyOption> pizzas = partyOptionRepo.findByTypeContainingIgnoreCase("pizza");
		List<PartyOption> sides = partyOptionRepo.findByTypeContainingIgnoreCase("side");
		List<PartyOption> drinks = partyOptionRepo.findByTypeContainingIgnoreCase("drink");
		model.addAttribute("pizzas", pizzas);
		model.addAttribute("sides", sides);
		model.addAttribute("drinks", drinks);
		return "/vote";
	}
	
	@RequestMapping("/vote/{id}")
	public String castVote(@PathVariable("id") Long id) {
		PartyOption addVoteToMe = partyOptionRepo.findById(id).orElse(null);
		addVoteToMe.setVotes(addVoteToMe.getVotes() + 1);
		partyOptionRepo.save(addVoteToMe);
		return "redirect:/vote";
	}
	
	@PostMapping("/add")
	public String addOption(PartyOption partyOption) {
		
		partyOptionRepo.save(partyOption);
		
		return "redirect:/vote";
	}
	
	@RequestMapping("/review")
	public String review(Model model) {
		List<PartyOption> pizzas = partyOptionRepo.findByTypeContainingAndVotesGreaterThan("pizza", 0);
		List<PartyOption> sides = partyOptionRepo.findByTypeContainingAndVotesGreaterThan("side", 0);
		List<PartyOption> drinks = partyOptionRepo.findByTypeContainingAndVotesGreaterThan("drink", 0);
		model.addAttribute("pizzas", pizzas);
		model.addAttribute("sides", sides);
		model.addAttribute("drinks", drinks);
		return "/review";
	}
	

}
