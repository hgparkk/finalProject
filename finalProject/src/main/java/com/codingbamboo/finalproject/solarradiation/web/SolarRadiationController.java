package com.codingbamboo.finalproject.solarradiation.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.codingbamboo.finalproject.building.dto.BEUDTO;
import com.codingbamboo.finalproject.building.dto.BuildingDTO;
import com.codingbamboo.finalproject.building.service.BuildingService;
import com.codingbamboo.finalproject.coefficient.dto.CoefficientDTO;
import com.codingbamboo.finalproject.coefficient.service.CoefficientService;
import com.codingbamboo.finalproject.solarradiation.dto.SolarRadiationDTO;
import com.codingbamboo.finalproject.solarradiation.service.SolarRadiationService;

@Controller
public class SolarRadiationController {

	@Autowired
	BuildingService buildingService;

	@Autowired
	CoefficientService coefficientService;

	@Autowired
	SolarRadiationService solarRadiationService;

	@RequestMapping(value = "/solarRadiationView", method = RequestMethod.GET)
	public String solarRadiationView(Model model) {

		List<BuildingDTO> allBuildingList = buildingService.selectAllBuildingList();

		model.addAttribute("buildingList", allBuildingList);

		return "solarRadiationMap/solarRadiationView";
	}

	@RequestMapping(value = "/getElectricUsage", method = RequestMethod.POST)
	@ResponseBody
	public List<BEUDTO> getElectricUsage(int buildingNo) {
		return buildingService.selectBEUList(buildingNo);
	}

	@RequestMapping(value = "/getEmission", method = RequestMethod.POST)
	@ResponseBody
	public CoefficientDTO getElectricEmission(String coefficientName) {
		List<CoefficientDTO> coefficientList = coefficientService.getCoefficientValue();
		for (int i = 0; i < coefficientList.size(); i++) {
			if (coefficientList.get(i).getCoefficientName().equals(coefficientName)) {
				return coefficientList.get(i);
			}
		}
		return null;
	}

	@RequestMapping(value = "/getSolarRadiation", method = RequestMethod.POST)
	@ResponseBody
	public List<SolarRadiationDTO> getSolarRadiation(String year) {
		return solarRadiationService.selectSolarRadiation(year);
	}
}