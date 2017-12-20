package dao;

import model.Users;

public interface UsersDAO {
	// kt ten tk ton tai chua

	public boolean CheckUsers(String userEmail);

	// them tk
	public void AddUsers(Users tk);

	// kt login
	public boolean CheckLogin(String userEmail, String userPass);

	
	public Users getUsers(String userEmail);
}
