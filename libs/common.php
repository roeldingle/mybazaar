<?php


class Common{

	public function file_upload($file, $upload_dir){

		 /*step 1 check and validate file to upload*/
	    // Check if file was uploaded without errors
	    if(isset($file) && $file["error"] == 0){
	        $allowed = array("jpg" => "image/jpg", "jpeg" => "image/jpeg", "gif" => "image/gif", "png" => "image/png");
	        $filename = $file["name"];
	        $filetype = $file["type"];
	        $filesize = $file["size"];
	    
	        // Verify file extension
	        $ext = pathinfo($filename, PATHINFO_EXTENSION);
	        if(!array_key_exists($ext, $allowed)) die("Error: Please select a valid file format.");
	    
	        // Verify file size - 5MB maximum
	        $maxsize = 5 * 1024 * 1024;
	        if($filesize > $maxsize) die("Error: File size is larger than the allowed limit.");
	    
	        // Verify MYME type of the file
	        if(in_array($filetype, $allowed)){

	          $unique_filename = time().uniqid(rand())."-".$filename;
	          move_uploaded_file($file["tmp_name"], $upload_dir . $unique_filename);
	          return  $unique_filename;
	        } 
	    } else {
	        return '';
	    }
	}
}