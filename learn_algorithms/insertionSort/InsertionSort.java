package algorithms;

public class InsertionSort {

	public static void main(String[] args) {
		// Given some array of numbers <a1, a2, a3... aN>
		// sort the array such that <a1', a2', a2'...> and a1' < a2' < a3'...
		// Psuedocode:
		//for( j=2 to A.length)
		//	key = A[j]
		//  //Insert A[j] into the sorted sequence A[1..j-1]
		//  i = j - 1
		//  while( i > 0 and A[i] > key)
		//    A[i+1] = A[i]
		//    i = i - 1
		//  A[i+1] = key
	
		int[] list = {5, 2, 4, 6, 1, 3};
		int[] sorted;
		System.out.println("Before the sort: ");
		printList(list);
		sorted = insertionSort(list);
		System.out.println("\n\nAfter the sort: ");
		printList(sorted);

	}

	public static int[] insertionSort(int[] list) {
		int key;
		for(int j = 1; j < list.length; ++j) {
			key = list[j];
			int i = j - 1;
			while(i >= 0 && list[i] > key) {
				list[i+1] = list[i];
				i -= 1;
			}
			list[i+1] = key;
		}
		return list;
	}
	
	public static void printList(int[] list) {
		for( int i=0; i < list.length; ++i) {
			System.out.print(list[i] + " ");
		}
	}
}
