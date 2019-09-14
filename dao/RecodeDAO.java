package jp.ken.school.dao;

import java.util.List;

import jp.ken.school.entity.Recode;

public interface RecodeDAO<T> {
	public List<T> allList();
	public List<T> userRecodeList(int id);
	public Recode getById(int id);
	public boolean insertRecodeData(Recode recode);
	public int updateRecodeData(Recode recode);
	public int deleteRecodeData(int id);
}
