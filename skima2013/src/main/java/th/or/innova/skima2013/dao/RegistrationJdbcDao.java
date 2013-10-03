package th.or.innova.skima2013.dao;

import java.util.HashMap;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;



import th.or.innova.skima2013.model.Address;
import th.or.innova.skima2013.model.Person;

@Repository
public class RegistrationJdbcDao implements RegistrationDao {

	private static final Logger logger = LoggerFactory.getLogger(RegistrationJdbcDao.class);
	
	private NamedParameterJdbcTemplate jdbcTemplate;
	
	@Autowired() 
	@Qualifier("dataSource")
	public void setDataSource(DataSource ds) {
		this.jdbcTemplate = new NamedParameterJdbcTemplate(ds);
	}
	
	public void Register(Person person) {
		logger.info("register a person");
		String sql = "insert into t_actor (id, firstname, lastname) values (:id, :firstName, :lastName)";
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("id", 0);
		params.put("firstName", "เดช");
		params.put("lastName", "บัวคลี่");
		
		this.jdbcTemplate.update(sql, params);
	}

	public Person getNewPerson() {
		Person p = new Person();
		p.setMainAddress(new Address());
		p.setBillingAddress(new Address());
		return p;
	}

}
