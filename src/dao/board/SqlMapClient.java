package dao.board;

import java.io.IOException;
import java.io.Reader; 

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlMapClient { 
	public static SqlSession sqlSession;   // static 변수를 제한없이 사용하기 위해 public 지정 
	static    // 한번만 실행하고 종료되게 끔 static 영역 지정 
	{ 
		// 여기서의 session 은 접속이라는 의미 (jdbc 의 connection)
		try {
			Reader reader = Resources.getResourceAsReader("board/sqlMapConfig.xml");
			SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(reader);
			sqlSession = factory.openSession(true);
			System.out.println("DB 연결성공");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static SqlSession getSqlSession()
	{
		return sqlSession;
	}
}
