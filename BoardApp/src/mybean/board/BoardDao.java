package mybean.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDao {
   private Connection con;
   private PreparedStatement ptst;
   private ResultSet rs;
   private DataSource ds;

   public BoardDao() {
      try {
         Context ctx = new InitialContext();
         ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracleDB");
      } catch (Exception err) {
         System.out.println("DB연결 실패 : " + err);
      }
   }

   public void freeCon() {
      if (con != null)
         try {
            con.close();
         } catch (Exception err) {
         }
      if (ptst != null)
         try {
            con.close();
         } catch (Exception err) {
         }
      if (rs != null)
         try {
            con.close();
         } catch (Exception err) {
         }
   }

   // 글 리스트 가져오기
   public Vector getBoardList(String keyField, String keyWord) {
      Vector list = new Vector();
      String sql;
      try {
         con = ds.getConnection();
         if (keyWord == null || keyWord.isEmpty()) {
            sql = "select * from tblboard order by num desc";
         } else {
            sql = "Select * from tblboard where " + keyField + " like '%"
                  + keyWord + "%' order by num desc";
         }

         ptst = con.prepareStatement(sql);
         rs = ptst.executeQuery();
         while (rs.next()) {
            BoardDto dto = new BoardDto();
            dto.setNum(rs.getInt("num"));
            dto.setSubject(rs.getString("subject"));
            dto.setName(rs.getString("name"));
            dto.setRegdate(rs.getString("regdate"));
            dto.setCount(rs.getInt("count"));
            dto.setPos(rs.getInt("pos"));
            dto.setPass(rs.getString("pass"));
            dto.setIp(rs.getString("ip"));
            dto.setDepth(rs.getInt("depth"));
            dto.setEmail(rs.getString("email"));
            dto.setHomepage(rs.getString("homepage"));

            list.add(dto);
         }
      } catch (SQLException err) {
         System.out.println("SQL오류 : " + err);
      } catch (Exception err) {
         System.out.println("뭔지 모를 오류" + err);
      } finally {
         freeCon();
      }
      return list;
   }

   // 글 추가
   public void addBoard(BoardDto dto) {
      try {   
         con = ds.getConnection();
         String sql = "insert into tblboard(num, subject, name, regdate, "
               + "count, pos, pass, ip, depth, email, homepage, content) "
               + "values(seq_num.nextVal,?,?,sysdate,0,0,?,?,0,?,?,?)";
         ptst = con.prepareStatement(sql);
         ptst.setString(1, dto.getSubject());
         ptst.setString(2, dto.getName());
         ptst.setString(3, dto.getPass());
         ptst.setString(4, dto.getIp());
         ptst.setString(5, dto.getEmail());
         ptst.setString(6, dto.getHomepage());
         ptst.setString(7, dto.getContent());
         ptst.executeUpdate();
      } catch (SQLException e) {
         System.out.println("SQL오류 : " + e);
      } catch (Exception e) {
         System.out.println("뭔지 모를 오류" + e);
      } finally {
         freeCon();
      }
   }
}