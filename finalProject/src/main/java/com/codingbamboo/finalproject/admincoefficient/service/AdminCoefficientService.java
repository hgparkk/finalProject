package com.codingbamboo.finalproject.admincoefficient.service;

import java.sql.SQLException;
import java.util.Map;

import com.codingbamboo.finalproject.admincoefficient.dao.IAdminCoefficientDAO;
import com.codingbamboo.finalproject.admincoefficient.dto.AdminCoefficientDTO;

public class AdminCoefficientService {
    private IAdminCoefficientDAO dao;

    public AdminCoefficientService(IAdminCoefficientDAO coefficientDAO) {
        this.dao = coefficientDAO;
    }

    // 전체 계수 조회
    public Map<Integer, AdminCoefficientDTO> getAllCoefficients() throws SQLException {
        return dao.getAllCoefficients();
    }

    // 계수 수정
    public void updateCoefficient(int coefficientNo, double coefficientValue) throws IllegalArgumentException, SQLException {
        if (coefficientValue < 0) {
            throw new IllegalArgumentException("계수 값은 0 이상이어야 합니다.");
        }
        dao.updateCoefficient(coefficientNo, coefficientValue);
    }
}
