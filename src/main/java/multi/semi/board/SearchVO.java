package multi.semi.board;

public class SearchVO extends PagingVO{
	private String type;
	private String word;
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		this.word = word;
	}
	@Override
	public String toString() {
		return "SearchVO [type=" + type + ", word=" + word + "]";
	}
	
}
