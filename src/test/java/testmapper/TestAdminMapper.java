package testmapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import mapper.AdminMapper;
import pojo.Admin;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class TestAdminMapper {
	@Autowired
	private AdminMapper adminMapper;

	@Test
    public void TestverifyAdmin() {
		Admin a = adminMapper.verifyAdmin(10001, 10001);
		if (a!=null) {
			System.out.println(a);
		}
		
	}
}
