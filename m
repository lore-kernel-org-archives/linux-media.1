Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEAB38736C
	for <linux-media@vger.kernel.org>; Sun, 13 Sep 2026 18:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789323495; cv=none; b=fOwHKo4Pk8uyAdeDfwkV7Hr7gKF/SFYG6KH0w0TIj+kXIItAyg9Ag/gTVhVQYSClzQ1EUp+a2YyVlroywTVePol+WFWbhpmV1aTrDuUCVGwaNQ3SYFgaAb+ocbuq833NzxHbB47ArQ8O7Q63U2HnnMCbgkncbacJ4raAxVUIvO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789323495; c=relaxed/simple;
	bh=EYJEQeWZXpC4q1hs1aDBjE02f7P9uvF3tPgEzaXJUb0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aOMEECSgADCKS2OrS4R2HGwN6zhTW9YUCY2H2Eda77SKXYA/KIez2zPCedD3AZE+DqEVBed44sp/diatK6tlYbHkNrKF814LDIzFdAelfpiO1ZFzL1x/QZqHX1KOymzRbkNG4NXWhtF/fFYvaVu1mnpqgY0/Mvr3QUjb6qKTV6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oLmWojUJ; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oLmWojUJ"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d8239so6899665e9.0
        for <linux-media@vger.kernel.org>; Sun, 13 Sep 2026 11:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789323488; x=1789928288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rHIxooepb9924ls5YjTjITRA+NDKs/8Zm+hsV2hDul4=;
        b=oLmWojUJTYi6fU/XnfTXqM+1oy8JuRA1hE4O2cZXEYj7BAEYk6z7jQyY/pLEL1v+aq
         BTi2w14hc/dDRf6KM0/Q+5L/VZ5EbNgOFvY6Nv0ioMHS4v2SRFyUMxeIykcHJ5640lYk
         vtArOYCGijdxC+/XfRVw+F12viAQe45CaRZOQoYURYBaY14DxQu6QmfAwSyL7orel3Ia
         YSZVhLTrjav7Fz+Vcb7vAo/rBXChjquvEHGo2McGhCTbt1tJzFoTgkM91vDlXMizPeUW
         GYI0YksWBLq8Eig1ShdwapduuNNRVXxqZHRtlA1MI0gT8q61Q+q0TDF/iCcBE+B5eNO5
         Lw/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789323488; x=1789928288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rHIxooepb9924ls5YjTjITRA+NDKs/8Zm+hsV2hDul4=;
        b=khuNGEjmaFYNAhkxY5xpv1lPpQpBJcnhKVJP7UokdFiFE/EUL7eP5s8rwPWbMn4q69
         XNFT0+lEK+bDobDVy9gzkM7UG93fAk20XG+Bp11c+Z87N21V5kc6zWObAGNiXOCKDF1T
         TFkDMbIOmqJPqhZglBDfhYopP9+jcvawHxxL+Vm/4pREPl+15PPHvc7+7pJYkvJl/tp/
         ejhTpRfT94o/fQ40iLF90SBB80AzlhtFoPkEkMr/YrBLuwVDILxpcm9VuRuim9o2WnL2
         TXb/IX0PC5BktyjBgq7AfThal56oxyz9/Qn8/dt6yZLeRSAochyahWKh5WUNsdRsiUYl
         lLdg==
X-Forwarded-Encrypted: i=1; AKwUvBz18WoLcOqEtk7tTiaD0KSnOpEdb3nvJA/b8qtgKb8P76rMJAJ6Cm7ZutWG9vZIDt3C2vUkGhdgw6sr8g==@vger.kernel.org
X-Gm-Message-State: AFuF++lzMeg78WB5hEA0HfvAc5zFONLiSDI0+sbaCZ0efV4MhexNfICW
	Wk6um50V2dQ/8akO/2fkp5r5rhm5/4kXMiN6lCiOXwIzrig2dx5a7JHf
X-Gm-Gg: AYBFou0bJ4mC93X0238ZS5MmoZggsvBh8ZVdJWe4ecIb+SiZtihwO30AHx4GS5wTtG1
	/kjpwKcYpE4HRpgo0jkg0om9JExjV7huj9YB/xqyIisJo9sei/bJk63KkbIodI/fhupUqQWbwr8
	OHnn/3OBex/phHdMJtS3exCQ80M1vtVB1s9LS4bEygIazUU6rTjSDAlTLIsZnW0c38VLXvtGA4l
	o84X1hOoLiLg9JK5i4hZWnkj0FgOzYjgD8I1JQnvq8gLX8/E7ImBTmAyYZZFYfd6z3XtW4PL2QX
	TKGuVh9Bo+t2Z4BJl1Oozh25HXh79exWkZqdNfv5FSkkRpjhBwLX8yjZ5YWxgFg6qknDVCFfk78
	O3/2fn+cAdOK8UNx4/qzzka7JxIZI3PTooC+ikDZoIcNHo0Tl8dNXxzRFb6wgRGUKuZGwmk9LyD
	wqZMhghMoN/F0k+Th+GlUTbWDSWtplA6c0cHaHrU291HlMN59F3BqJDiC/Wj3TwAI4bAwB6Ue1t
	ULFcIrvWLIVVDYhLm5xG8hAtMIWskoxTQzMkBHHZybnWJUP9QHdCQ==
X-Received: by 2002:a05:600c:3492:b0:49c:fa21:1c8c with SMTP id 5b1f17b1804b1-49e6cc233aemr68189665e9.33.1789323487257;
        Sun, 13 Sep 2026 11:18:07 -0700 (PDT)
Received: from cachyos-x8664 (159.red-83-38-226.dynamicip.rima-tde.net. [83.38.226.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ecf2esm21736289f8f.2.2026.09.13.11.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 11:18:06 -0700 (PDT)
From: German Pablo Lindo <germanpapulindez@gmail.com>
To: lsa.uz@pm.me
Cc: andre.gilerson@gmail.com,
	dan.scally@ideasonboard.com,
	germanpapulindez@gmail.com,
	hansg@kernel.org,
	linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com
Subject: Reply cause of the image error in Gnome Snapshot [PATCH v3 0/3] media: Add support for the Sony IMX681
Date: Sun, 13 Sep 2026 20:18:06 +0200
Message-ID: <20260913181806.8626-1-germanpapulindez@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913082400.29504-1-lsa.uz@pm.me>
References: <20260913082400.29504-1-lsa.uz@pm.me>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After testing the command LIBCAMERA_SOFTISP_MODE=cpu qcam --stream "width=1920,height=1080" and seeing the correct colors, it was evident that the error was related to the GPU Intel Arc 130V or the OpenGL that libcamera uses.
The strongest evidence i have is this output from qcam in 1920x1080

for the IMX681 (off color and lines):
INFO SimplePipeline simple.cpp:1570 Input buffer stride ignored by the driver. Requested 7936, got 7744
INFO SoftwareIsp software_isp.cpp:299 Input 3844x2640-GRBG-10 stride 7744

for the OV13858 (a thin purple line from top to bottom):
INFO SimplePipeline simple.cpp:1570 Input buffer stride ignored by the driver. Requested 4352, got 4224
INFO SoftwareIsp software_isp.cpp:299 Input 2112x1188-GRBG-10 stride 4224

Which only appears when the GPU is used instead of the CPU.
This issue is not related to the driver at all, proven due to its consistency in both cameras (but in the OV the error is less noticable)

The versions of libcamera (0.7.2-4.1) and mesa (3:26.2.2-2) i use are the latest one available in pacman

I also attach the whole output of qcam 1920x1080 on the fonr camera  if its usefull

[0:06:11.667137492] [5678]  INFO Camera camera_manager.cpp:340 libcamera v0.7.2
[0:06:11.674897162] [5689]  WARN CameraSensorProperties camera_sensor_properties.cpp:548 No static properties available for 'imx681'
[0:06:11.674927311] [5689]  WARN CameraSensorProperties camera_sensor_properties.cpp:550 Please consider updating the camera sensor properties database
[0:06:11.674933218] [5689]  WARN CameraSensor camera_sensor_legacy.cpp:502 'imx681 3-0010': No sensor delays found in static properties. Assuming unverified defaults.
[0:06:11.693798163] [5689]  WARN IPAProxy ipa_proxy.cpp:196 Configuration file 'imx681.yaml' not found for IPA module 'simple', falling back to '/usr/share/libcamera/ipa/simple/uncalibrated.yaml'
[0:06:11.693827954] [5689]  WARN IPASoft soft_simple.cpp:104 IPASoft: Failed to create camera sensor helper for imx681
[0:06:11.693904223] [5689]  INFO Camera camera_manager.cpp:223 Adding camera '\_SB_.PC00.I2C5.CAMF' for pipeline handler simple
[0:06:11.702819518] [5678]  INFO Camera camera.cpp:1216 configuring streams: (0) 1920x1080-ABGR8888/sRGB
[0:06:11.702870406] [5689]  INFO SimplePipeline simple.cpp:1570 Input buffer stride ignored by the driver. Requested 7936, got 7744
[0:06:11.702884892] [5689]  INFO IPASoft soft_simple.cpp:258 IPASoft: Exposure 4-3173, gain 0-960 (1)
[0:06:11.702898306] [5689]  INFO SoftwareIsp software_isp.cpp:299 Input 3844x2640-GRBG-10 stride 7744
Zero-copy enabled
[0:06:11.717519321] [5696]  INFO eGL egl.cpp:412 EGL: EGL_VERSION: 1.5
[0:06:11.717538642] [5696]  INFO eGL egl.cpp:413 EGL: EGL_VENDOR: Mesa Project
[0:06:11.717540176] [5696]  INFO eGL egl.cpp:414 EGL: EGL_CLIENT_APIS: OpenGL OpenGL_ES 
[0:06:11.717541393] [5696]  INFO eGL egl.cpp:415 EGL: EGL_EXTENSIONS: EGL_ANDROID_blob_cache EGL_ANDROID_native_fence_sync EGL_EXT_config_select_group EGL_EXT_create_context_robustness EGL_EXT_image_dma_buf_import EGL_EXT_image_dma_buf_import_modifiers EGL_EXT_protected_content EGL_EXT_query_reset_notification_strategy EGL_EXT_surface_compression EGL_IMG_context_priority EGL_KHR_cl_event2 EGL_KHR_config_attribs EGL_KHR_context_flush_control EGL_KHR_create_context EGL_KHR_create_context_no_error EGL_KHR_fence_sync EGL_KHR_get_all_proc_addresses EGL_KHR_gl_colorspace EGL_KHR_gl_renderbuffer_image EGL_KHR_gl_texture_2D_image EGL_KHR_gl_texture_3D_image EGL_KHR_gl_texture_cubemap_image EGL_KHR_image_base EGL_KHR_no_config_context EGL_KHR_partial_update EGL_KHR_reusable_sync EGL_KHR_surfaceless_context EGL_EXT_pixel_format_float EGL_KHR_wait_sync EGL_MESA_configless_context EGL_MESA_gl_interop EGL_MESA_image_dma_buf_export EGL_MESA_query_driver EGL_MESA_x11_native_visual_id 
[0:06:11.721067142] [5696]  INFO eGL egl.cpp:456 EGL: GL_RENDERER: Mesa Intel(R) Graphics (LNL)
[0:06:11.721080235] [5696]  INFO eGL egl.cpp:457 EGL: GL_VERSION: OpenGL ES 3.2 Mesa 26.2.2-arch3.2

