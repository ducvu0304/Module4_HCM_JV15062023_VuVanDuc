package com.exercise_14.utils;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.storage.*;

import java.io.FileInputStream;
import java.nio.file.Files;
import java.nio.file.Paths;

public class ImageUploader {
    public static void uploadImage(String imagePath) {
        try {
            StorageOptions storageOptions = StorageOptions.newBuilder()
                    .setCredentials(GoogleCredentials.fromStream(new FileInputStream("C:\\Users\\DUC\\Desktop\\module-4\\Module4_HCM_JV15062023_VuVanDuc\\exercise_12\\src\\main\\resources\\serviceAccountKey.json")))
                    .build();

            Storage storage = storageOptions.getService();

            String bucketName = "joytrav-7d927.appspot.com";
            String objectName = "3.jfif";

            BlobId blobId = BlobId.of(bucketName, objectName);
            BlobInfo blobInfo = BlobInfo.newBuilder(blobId).build();

            Blob blob = storage.create(blobInfo, Files.readAllBytes(Paths.get(imagePath)));

            System.out.println("Image uploaded successfully. URL: " + blob.getMediaLink());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}