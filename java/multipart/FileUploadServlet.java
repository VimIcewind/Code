import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

public class FileUploadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String UPLOAD_DIR = "uploads";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        // Create the upload directory if it doesn't exist
        File uploadDir = new File(getServletContext().getRealPath("/") + UPLOAD_DIR);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        // Process multipart/form-data request
        for (Part part : request.getParts()) {
            String fileName = extractFileName(part);
            if (!fileName.isEmpty()) {
                // Generate unique file name using UUID
                String uuid = UUID.randomUUID().toString();
                fileName = uuid + "_" + fileName;

                // Save file to upload directory
                Path filePath = uploadDir.toPath().resolve(fileName);
                try (InputStream input = part.getInputStream()) {
                    Files.copy(input, filePath, StandardCopyOption.REPLACE_EXISTING);
                }
            }
        }

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html><body><h1>Files uploaded successfully!</h1></body></html>");
    }

    private String extractFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] elements = contentDisposition.split(";");
        for (String element : elements) {
            if (element.trim().startsWith("filename")) {
                return element.substring(element.indexOf("=") + 2, element.length() - 1);
            }
        }
        return "";
    }
}

