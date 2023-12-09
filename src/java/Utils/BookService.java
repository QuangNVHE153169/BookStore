/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Utils;

import Model.Book;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 *
 * @author dell
 */
public class BookService {

    public static ArrayList<Book> GetRandomBook(ArrayList<Book> books, int randomQuantity) {
        // Ensure that there are at least 'randomQuantity' elements in the list
        if (books.size() >= randomQuantity) {
            // Shuffle the list
            Collections.shuffle(books);
            // Get the first 3 elements (random and non-duplicate)
            List<Book> randomPublishers = books.subList(0, randomQuantity);
            books = new ArrayList<>(randomPublishers);
        }
        return books;
    }
}
