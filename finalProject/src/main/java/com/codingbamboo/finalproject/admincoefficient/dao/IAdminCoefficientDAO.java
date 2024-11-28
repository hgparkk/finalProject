package com.codingbamboo.finalproject.admincoefficient.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Map;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;

import com.codingbamboo.finalproject.admincoefficient.dto.AdminCoefficientDTO;

public interface IAdminCoefficientDAO {
    private Connection conn;

    public IAdminCoefficientDAO(Connection conn) {
        this.conn = conn;
    }

    // 특정 계수 조회 (모든 계수 가져오기)
    public Map<Integer, AdminCoefficientDTO> getAllCoefficients() throws SQLException {
        String sql = "SELECT coefficient_no, coefficient_name, coefficient_value FROM coefficient";
        Map<Integer, AdminCoefficientDTO> coefficients = new HashMap<>();

        try (PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
            	AdminCoefficientDTO coefficient = new AdminCoefficientDTO(
                        rs.getInt("coefficient_no"),
                        rs.getString("coefficient_name"),
                        rs.getDouble("coefficient_value")
                );
                coefficients.put(coefficient.getCoefficientNo(), coefficient);
            }
        }
        return coefficients;
    }

    // 계수 값 수정
    public void updateCoefficient(int coefficientNo, double coefficientValue) throws SQLException {
        String sql = "UPDATE coefficient SET coefficient_value = ? WHERE coefficient_no = ?";

        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setDouble(1, coefficientValue);
            pstmt.setInt(2, coefficientNo);
            pstmt.executeUpdate();
        }
    }
}
