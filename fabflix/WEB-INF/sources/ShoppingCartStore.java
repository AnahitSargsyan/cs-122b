import java.util.Vector;
import String;

public class ShoppingCartStore{
	Vector<String> movies = new Vector<String>();
	public ShoppingCartStore(){}

	public void add(String item){
		movies.add(item);
	}
	public void remove(String item){
		movies.remove(item);
	}
	public Vector<String> getMovies(){
		return movies;
	}


}