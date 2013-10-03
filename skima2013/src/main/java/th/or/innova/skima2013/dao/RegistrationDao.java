package th.or.innova.skima2013.dao;

import th.or.innova.skima2013.model.Person;

public interface RegistrationDao {
	public void Register(Person person);
	
	public Person getNewPerson();
	
}
