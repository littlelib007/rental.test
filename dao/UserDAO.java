package jp.ken.school.dao;

import java.util.List;

import jp.ken.school.entity.User;

public interface UserDAO<T> {
	public List<T> allList();
	public User getById(int id);
	public List<T> getByName(String name);
	public User getByEmail(String email);
	public boolean insertUserData(User usr);
	public int updateUserData(User usr);

}
