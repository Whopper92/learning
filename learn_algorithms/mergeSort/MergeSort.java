package algorithms;

public class MergeSort {
	
	public static void main(String[] args) {
		int[] list = {7, 4, 5, 2, 3, 2, 1, 6};
		int[] sorted;
				
		System.out.println("Before the sort: ");
		printList(list);
		sorted = mergeSort(list, 0, list.length-1);
		System.out.println("\n\nAfter the sort: ");
		printList(sorted);
	}
	
	public static int[] mergeSort(int[] list, int lowIndex, int highIndex) {
		if(lowIndex < highIndex) {
			// Get the index of the element which is in the middle
		    int middleIndex = lowIndex + (highIndex - lowIndex) / 2;
		    // Sort the left side of the array
		    mergeSort(list, lowIndex, middleIndex);
		    // Sort the right side of the array
		    mergeSort(list, middleIndex + 1, highIndex);
		    // Combine them both
		    merge(list, lowIndex, middleIndex, highIndex);
		}
		return list;
	}
	
	public static int[] merge(int[] list, int lowIndex, int middleIndex, int highIndex) {

		int[] helper = new int[list.length];
		// Copy both parts into the helper array
	    for (int i = lowIndex; i <= highIndex; i++) {
	      helper[i] = list[i];
	    }

	    int i = lowIndex;
	    int j = middleIndex + 1;
	    int k = lowIndex;
	    
	    // Copy the smallest values from either the left or the right side back
	    // to the original array
	    while (i <= middleIndex && j <= highIndex) {
	      if (helper[i] <= helper[j]) {
	        list[k] = helper[i];
	        i++;
	      } else {
	        list[k] = helper[j];
	        j++;
	      }
	      k++;
	    }
	    // Copy the rest of the left side of the array into the target array
	    while (i <= middleIndex) {
	      list[k] = helper[i];
	      k++;
	      i++;
	    }
		return list;
	}
	
	public static void printList(int[] list) {
		for( int i=0; i < list.length; ++i) {
			System.out.print(list[i] + " ");
		}
	}
}
