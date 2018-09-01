package cn.edu.nyist.springboot09_jsp_hbi.reposity;


import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import cn.edu.nyist.springboot09_jsp_hbi.model.Admin;

/*
 * 方法一：
 * 1.继承接口
 *   1.1Repository
 *   1.2CrudRepository
 *   
 *   2.不继承接口，使用注解
 *   @RepositoryDefinition
 */
/*
 * SQL语句：
 *   1.遵循sql语句命名规范，方法+属性值
 *   2.HSQL自定义语句，添加注解
 *   3.本地查询
 */
public interface AdminRepository extends CrudRepository<Admin, Integer>{
	  //1.遵循命名规范查询
		 public Admin findByNameAndPwd(String name,String pwd);
	
	/*   2.HSQL查询语句，占位符，严格依赖位置
	    @Query("from Admin where name=? and pwd=?")
		public Admin find(String name,String pwd);
	*/
	/*
	 * 2.HSQL查询语句,命名参数法，不依赖位置-----------推荐使用
	   @Query("from Admin where name=:name and pwd=:pwd")
		public Admin find(@Param(value = "name") String name,@Param(value = "pwd") String pwd);
	 * 
	 */
	/*
	 * 3.本地查询
	@Query(value="select * from t_admin where name=:name and pwd=:pwd",nativeQuery=true)
	public Admin find(@Param(value = "name") String name,@Param(value = "pwd") String pwd);
	 */
	
	

}
