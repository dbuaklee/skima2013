package th.or.innova.skima2013.repository;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.querydsl.QueryDslPredicateExecutor;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

import th.or.innova.skima2013.model.Person;

public interface PersonRepository extends PagingAndSortingRepository<Person, Long>, QueryDslPredicateExecutor<Person> {
	
	List<Person> findAll(Sort sort);
	
	Person findByRegistrationInfo_refCodeLike(String refCode);

	Person findByEmailAndRegistrationInfo_refCode(String email, String refCode);

}
