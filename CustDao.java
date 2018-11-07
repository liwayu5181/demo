package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import pojo.CustInfo;
import util.DBConnection;

public class CustDao {
	public List<CustInfo> findProdInfo(){
		String sql = "select *  from PROD_INFO order by CONVERT(PROD_ID,SIGNED) asc";
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = DBConnection.createPreparedStatement(conn, sql);
		ResultSet rs = null;
		List<CustInfo> custlist = new ArrayList<CustInfo>();
		try{
			rs = pstmt.executeQuery();
			while(rs.next()){
				CustInfo custInfo = new CustInfo();
				custInfo.setCustName(rs.getString("PROD_NAME"));
				custInfo.setCustNo(rs.getString("PROD_ID"));
				custlist.add(custInfo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, rs);
		}
		return custlist;
	}

	public List<CustInfo> findCustInfo(String selTyp, String value){
		String sql = "select * from CUST_INFO t where t."+selTyp+" = ? LIMIT 0, 600";
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = DBConnection.createPreparedStatement(conn, sql);
		ResultSet rs = null;
		List<CustInfo> custlist = new ArrayList<CustInfo>();
		try{
			pstmt.setString(1, value);
			rs = pstmt.executeQuery();
			while(rs.next()){
				CustInfo custInfo = new CustInfo();
				custInfo.setCustNo(rs.getString("CUST_NO"));
				custInfo.setCustName(rs.getString("CUST_NAME"));
				custInfo.setGender(rs.getString("GENDER"));
				custlist.add(custInfo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, rs);
		}
		return custlist;
	}
}
