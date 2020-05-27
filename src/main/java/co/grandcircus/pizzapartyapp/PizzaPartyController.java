package co.grandcircus.pizzapartyapp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class PizzaPartyController {
	
	@Autowired
	private PartyRepository partyRepo;
	
	@Autowired
	private PartyOptionRepository partyOptionRepo;
	
	@RequestMapping("/")
	public String main() {
		return "redirect:/parties";
	}
	
	@RequestMapping("/parties")
	public String parties(@RequestParam(value="keyword",required=false) String keyword, Model model) {
		
		if(keyword != null && !keyword.isEmpty()) {
			List<Party> partyList = partyRepo.findByNameContainingIgnoreCase(keyword);
			model.addAttribute("partyList", partyList);
		} else {
			List<Party> partyList = partyRepo.findByOrderByDate();
			model.addAttribute("partyList", partyList);
		}
		
		return "/parties-list";
	}
	
	@RequestMapping("/vote")
	public String vote(@RequestParam("id") Long id, Model model) {
//		List<PartyOption> pizzas = partyOptionRepo.findByTypeContainingIgnoreCase("pizza");
//		List<PartyOption> sides = partyOptionRepo.findByTypeContainingIgnoreCase("side");
//		List<PartyOption> drinks = partyOptionRepo.findByTypeContainingIgnoreCase("drink");
//		model.addAttribute("pizzas", pizzas);
//		model.addAttribute("sides", sides);
//		model.addAttribute("drinks", drinks);
		
		List<PartyOption> options = partyOptionRepo.findByPartyId(id);
		
		model.addAttribute("options", options);
		model.addAttribute("partyId", id);
				
		return "/vote";
	}
	
	@RequestMapping("/vote/{id}")
	public String castVote(@PathVariable("id") Long id) {
		PartyOption addVoteToMe = partyOptionRepo.findById(id).orElse(null);
		addVoteToMe.setVotes(addVoteToMe.getVotes() + 1);
		partyOptionRepo.save(addVoteToMe);
		// make partyid
		return "redirect:/vote?id=" + addVoteToMe.getParty().getId();
	}
	
	@PostMapping("/add-option")
	public String addOption(PartyOption partyOption) {
		
		partyOptionRepo.save(partyOption);
		
		return "redirect:/vote?id=" + partyOption.getParty().getId();
	}
	
	@PostMapping("/add-party")
	public String addParty(Party party) {
		
		partyRepo.save(party);
		
		return "redirect:/party-admin";
	}
	
	@RequestMapping("/review")
	public String review(@RequestParam("id") Long id,Model model) {
//		List<PartyOption> pizzas = partyOptionRepo.findByTypeContainingAndVotesGreaterThan("pizza", 0);
//		List<PartyOption> sides = partyOptionRepo.findByTypeContainingAndVotesGreaterThan("side", 0);
//		List<PartyOption> drinks = partyOptionRepo.findByTypeContainingAndVotesGreaterThan("drink", 0);
//		model.addAttribute("pizzas", pizzas);
//		model.addAttribute("sides", sides);
//		model.addAttribute("drinks", drinks);
		
		List<PartyOption> options = partyOptionRepo.findByPartyIdAndVotesGreaterThan(id, 0);
		model.addAttribute("options", options);
		model.addAttribute("partyId", id);
		
		return "/review";
	}
	
	@RequestMapping("/party-admin")
	public String admin(Model model) {
		
		List<Party> partyList = partyRepo.findByOrderByDate();
		
		model.addAttribute("partyList", partyList);
		
		return "/party-admin";
	}
	
	@RequestMapping("/edit")
	public String editParty(@RequestParam(value="id", required=false) Long id, Model model) {
		Party party = partyRepo.findById(id).orElse(null);
		model.addAttribute("party", party);
		return "/edit-party";
	}
	
	@PostMapping("/edit")
	public String submitEditForm(Party party) {
		
		partyRepo.save(party);
		
		return "redirect:/party-admin";
	}
	
	@RequestMapping("/delete/{id}")
	public String removeFood(@PathVariable("id") Long id) {
		
		partyRepo.deleteById(id);
		
		return "redirect:/party-admin";
	}
	

}
