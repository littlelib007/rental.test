package jp.ken.school.dao;

import java.util.List;

import jp.ken.school.entity.Item;

public interface ItemDAO <T>{
	public List<T> allList();
	public boolean InsertItem(Item item);
	public boolean DeleteOrUpdateUser(Item item);
	public int updateItem(Item item);
	public boolean deleteItem(int id);
	public  List<T> getByName(String name);
	public  Item getById(int id);


}
