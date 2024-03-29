package fast.bloc;

/**
 * Nueva excepción. Lanzada por los objetos DAO.
 * @author dit
 *
 */
public class DAOException extends Exception {

	private static final long serialVersionUID = 3214987659088623462L;

	public DAOException() {
	}

	public DAOException(String arg0) {
		super(arg0);
		System.out.println(arg0);
	}

	public DAOException(Throwable arg0) {
		super(arg0);
	}

	public DAOException(String arg0, Throwable arg1) {
		super(arg0, arg1);
	}

	public DAOException(String arg0, Throwable arg1, boolean arg2, boolean arg3) {
		super(arg0, arg1, arg2, arg3);
	}

}
