/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author Đỗ Tuấn Anh
 */
import model.Sale;
import util.DBContext;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SaleDAO extends DBContext {

    public void setConnection(Connection conn) {
        this.connection = conn;
    }

    // 1. Lấy danh sách tất cả khuyến mãi
    public List<Sale> getAllSales() {
        List<Sale> list = new ArrayList<>();
        String sql = "SELECT * FROM Sale";

        try (PreparedStatement ps = connection.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Sale sale = new Sale(
                        rs.getInt("sale_id"),
                        rs.getInt("min_slot"),
                        rs.getInt("sale_percent"),
                        rs.getString("description"),
                        rs.getString("sale_name")
                );
                list.add(sale);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public Sale getSaleBySaleId(String saleId) {
        String sql = "SELECT *\n"
                + "  FROM [FootballFieldBooking].[dbo].[Sale]\n"
                + "  where sale_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, saleId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return new Sale(
                        rs.getInt("sale_id"),
                        rs.getInt("min_slot"),
                        rs.getInt("sale_percent"),
                        rs.getString("description"),
                        rs.getString("sale_name")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;

    }

    // 2. Lấy sale phù hợp theo số lượng ca (slot) đặt
    public Sale getSaleBySlotCount(int slotCount) {
        String sql = "SELECT TOP 1 * FROM Sale WHERE ? >= min_slot  ORDER BY sale_percent DESC";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, slotCount);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return new Sale(
                        rs.getInt("sale_id"),
                        rs.getInt("min_slot"),
                        rs.getInt("sale_percent"),
                        rs.getString("description"),
                        rs.getString("sale_name")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // 3. Thêm khuyến mãi mới
    public boolean insertSale(Sale sale) {
        String sql = "INSERT INTO [dbo].[Sale]\n"
                + "           ([min_slot]\n"
                + "           ,[sale_percent]\n"
                + "           ,[description]\n"
                + "           ,[sale_name])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, sale.getMinSlot());
            ps.setInt(2, sale.getSalePercent());
            ps.setString(3, sale.getDescription());
            ps.setString(4, sale.getSale_name());

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // 4. Cập nhật khuyến mãi
    public boolean updateSale(Sale sale) {
        String sql = "UPDATE [dbo].[Sale]\n"
                + "   SET [min_slot] = ?\n"
                + "      ,[sale_percent] = ?\n"
                + "      ,[description] = ?\n"
                + "      ,[sale_name] = ?\n"
                + "WHERE sale_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, sale.getMinSlot());
            ps.setInt(2, sale.getSalePercent());
            ps.setString(3, sale.getDescription());
            ps.setString(4, sale.getSale_name());
            ps.setInt(5, sale.getSaleId());

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // 5. Xóa khuyến mãi
    public boolean deleteSale(int saleId) {
        String sql = "DELETE FROM Sale WHERE sale_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, saleId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public int getSalePercentById(Integer saleId) {
        if (saleId == null) {
            return 0;
        }

        String sql = "SELECT sale_percent FROM Sale WHERE sale_id = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, saleId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("sale_percent");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return 0; // Trường hợp không tìm thấy
    }
////////////////////////////////do not update here//////////////////////////////

    public int getDiscountPercent(int slotCount) {
        String sql = "SELECT TOP 1 sale_percent FROM Sale WHERE ? >= min_slot ORDER BY sale_percent DESC";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, slotCount);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt("sale_percent");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return 0; // Không có khuyến mãi phù hợp
    }
    /////////////////////////////

    //////ham nay lay ra uu dai tot nhattt////////update here
    public Integer getSaleIdBySlotCount(int slotCount) {
        String sql = "  SELECT TOP 1 sale_id FROM Sale WHERE ? >= min_slot\n"
                + "  ORDER BY sale_percent DESC";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, slotCount);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("sale_id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /////////////////////////////////
    public static void main(String[] args) {
        SaleDAO sDao = new SaleDAO();
        
        int s = sDao.getSaleIdBySlotCount(2);
        System.out.println(s);

    }

}
