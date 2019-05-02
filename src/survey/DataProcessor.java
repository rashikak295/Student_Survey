//Author: Rashika Koul
//SWE 642 : Homework 4
//Class to calculate mean and standard deviation
package survey;

public class DataProcessor {
	public DataBean processData(String s) {
		String[] data;
		DataBean d = new DataBean();
		data = s.split(",");
		
		int[] numbers = new int[data.length];
		for (int i = 0; i < data.length; i++) {
			numbers[i] = Integer.parseInt(data[i]);
		}

		d.setMean(calcMean(numbers));
		d.setStandardDeviation(calcStandardDeviation(numbers));
		return d;
	}

	public double calcMean(int n[]) {
		double sum = 0;
		for (int i = 0; i < n.length; i++)
			sum += n[i];
		return sum / n.length;
	}

	public double calcStandardDeviation(int n[]) {
		double mean = calcMean(n);
		double sd = 0;
		for (int i = 0; i < n.length; i++)
			sd += Math.pow(n[i] - mean, 2);
		return (Math.sqrt(sd / n.length));
	}
}
