package com.liukaijv.note.controller;

import com.liukaijv.note.common.base.BaseController;
import com.liukaijv.note.common.constant.Config;
import com.liukaijv.note.common.utils.URLUtils;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.UUID;

@Controller
public class CommonController extends BaseController {

    /**
     * 文件上传
     *
     * @param files
     * @return
     * @throws Exception
     */
    @PostMapping("/upload")
    @ResponseBody
    public Object upload(@RequestParam("file") MultipartFile[] files) throws Exception {

        ArrayList<String> dataList = new ArrayList<>();

        for (MultipartFile file : files) {
            String result = this.upload(file);
            if (result != null) {
                dataList.add(result);
            }
        }

        if (dataList.size() > 0) {
            return this.success(dataList);
        }

        return this.error("上传文件失败");

    }

    /**
     * 文件下载
     *
     * @param filename
     * @param request
     * @return
     * @throws Exception
     */
    @GetMapping("/download/{filename:.+}")
    public ResponseEntity<Resource> download(@PathVariable String filename, HttpServletRequest request) throws Exception {

        String downloadPath = request.getServletContext().getRealPath(Config.DOWNLOAD_DIR);

        File file = new File(downloadPath, filename);

        if (!file.exists()) {
//            throw new Exception("file not exist");
        }

        return this.download(file);

    }

    /**
     * upload file
     *
     * @param file
     * @return
     */
    protected String upload(MultipartFile file) {

        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();

        if (!file.isEmpty()) {
            String rootPath = request.getServletContext().getRealPath(Config.UPLOAD_DIR);

            String uuid = UUID.randomUUID().toString().replaceAll("-", "");
            String contentType = file.getContentType();

            //不允许的mime-type
            if (!Config.ALLOW_UPLOAD_MIME.contains(contentType)) {
                return null;
            }
            String ext = contentType.substring(contentType.indexOf("/") + 1);

            String filename = uuid + "." + ext;
            File targetFile = new File(rootPath, filename);

            if (!targetFile.getParentFile().exists()) {
                targetFile.getParentFile().mkdirs();
            }

            try {
                file.transferTo(targetFile);
                return Config.UPLOAD_DIR + File.separator + filename;

            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }

        }

        return null;

    }

    /**
     * download file
     *
     * @param file
     * @return
     */
    protected ResponseEntity<Resource> download(File file) {

        String filename = file.getName();

        return this.download(file, filename);
    }

    /**
     * download file
     *
     * @param file
     * @param filename
     * @return
     */
    protected ResponseEntity<Resource> download(File file, String filename) {

        Resource resource = new FileSystemResource(file);

        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();

        String header = request.getHeader("User-Agent");

        header = header == null ? "" : header.toUpperCase();

        HttpStatus status;

        if (header.contains("MSIE") || header.contains("TRIDENT") || header.contains("EDGE")) {
            filename = URLUtils.encodeURL(filename, Charset.forName("UTF-8"));
            status = HttpStatus.OK;
        } else {
            filename = new String(filename.getBytes(Charset.forName("UTF-8")), Charset.forName("iso-8859-1"));
            status = HttpStatus.CREATED;
        }

        HttpHeaders headers = new HttpHeaders();

        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        headers.setContentDispositionFormData("attachment", filename);

        return new ResponseEntity<Resource>(resource, headers, status);

    }


}
