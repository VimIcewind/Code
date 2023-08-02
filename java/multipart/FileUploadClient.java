import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.UUID;

public class FileUploadClient {
    private static final String UPLOAD_URL = "http://localhost:8080/upload";

    public static void main(String[] args) throws IOException {
        // Specify the file to upload
        File file = new File("path/to/file.jpg");

        // Generate a unique file name using UUID
        String uuid = UUID.randomUUID().toString();
        String fileName = uuid + "_" + file.getName();

        // Set up the HTTP connection
        URL url = new URL(UPLOAD_URL);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setDoOutput(true);
        connection.setRequestMethod("POST");
        connection.setRequestProperty("Content-Type", "multipart/form-data; boundary=---1234567890");

        // Write the file data to the output stream
        try (OutputStream output = connection.getOutputStream();
            PrintWriter writer = new PrintWriter(output)) {

            // Write the start boundary
            writer.println("---1234567890");

            // Write the file data
            writer.println("Content-Disposition: form-data; name=\"file\"; filename=\"" + fileName + "\"");
            writer
            writer.println("Content-Type: " + Files.probeContentType(Paths.get(file.getAbsolutePath())));
            writer.println();
            Files.copy(file.toPath(), output);
            writer.println();

            // Write the end boundary
            writer.println("---1234567890--");
        }

        // Read the response from the server
        try (InputStream input = connection.getInputStream();
            PrintWriter writer = new PrintWriter(System.out)) {
            int c;
            while ((c = input.read()) != -1) {
                writer.write(c);
            }
        }
    }

