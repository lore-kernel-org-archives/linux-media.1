Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793548208;
	b=xPoHgFQY2w8eCHq1m/TlyiPVqT93Sz+laXWwCNZFYQGTb+Su/a7wrSMLDjX1mJezgAO2
	 BBYL3+uHgDt1MPYxAnfYqnJuZlN4DbO8EVraFodaXeWsCPc7oBGlvkXRboTIea6s7A78/
	 lwbiah4L+CdToX0zFF5DSuZeP75+r9rGap0+fENsy7nUJWxe+7USn7p+bKj+VCwfri6VQ
	 rau6hjAw8JkhMuST5x35/W0pCYTDAZF5qNAxv+yJ6h+vbFPFdFP8K2jp1iQruGQSpDB4h
	 SHJ6UhteAQqGq/Pc56yxF69kg8reKmhdRdWM2oBoC64OtIJZoITwhGyJkx5mgBvKWpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793548208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZQZ4ENRlGzy9j1pUwqm6k+qNATZGaMh89x9i7xh06Gw=;
	b=3CFIDK2b0Sp5HxYiSQLM18yc6fgX1FG7LulJ0cWjO/DMVYqOsrU66NBWX0X6XWMVKH3p
	 IhSQJuh9A1zDqdybwGdVsPLnbuWhmzyTsZSjcArcBgS1vciI4Y484osbQrpd6G0e89t/H
	 9M5Sc6AxvU5XW/bTomlbFV2ApQuaXy12LxvHvSsxBohSfU5jSkRaorb3gnPjLt/Z1OGq5
	 3N7kyXwa8nHxI4+hkgsUhch/Aa4QGqN5oMAkSyIwk20X+CHv6k3WdNEpxQnKKy6Bhopx2
	 9kwg6RWk9SzlAUIQwuMU+Gyns72BMnALv56nKfNz/HoSgoOg0+eOqzSpVR2VIWDBQrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I0WcPgM0;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D147606A325
	for <linux-media@vger.kernel.org>; Sun,  1 Nov 2026 15:50:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D147606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I0WcPgM0
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-35829219da8so3882944eec.0
        for <linux-media@vger.kernel.org>; Sun, 01 Nov 2026 07:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793548207; x=1794153007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZQZ4ENRlGzy9j1pUwqm6k+qNATZGaMh89x9i7xh06Gw=;
        b=I0WcPgM0JbD3FfxTYT5J0HGnQrDgbk6nAbHGIXMOXSzsnBcUZF3mApN8BFhpSaLx63
         /6SCyPJBCS9n+8eAhqLkAzYeRrmIvXD24t/MnJyw4Cdbzhoz8lM623vsNsmWlwcgCWlg
         ft+TpiTTKYr9XMtAtZZqj/5TdSiEQEcmhP+TFmbjn+aKAuw8AZj6ooSnev+KkLuUSfCM
         vmu3AyhAGLrS42yVydnvX5lbmUgqzjTw3SZ5OKI2kq2Fi79cgQe0iGCaIRcDKHV63EhU
         WIwGxuSiBzC05w83+sqdfml3azgR3wxOrv2/hmGRsC7mr07eluDzdMNEERPY+ALiBaa7
         AMAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793548207; x=1794153007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZQZ4ENRlGzy9j1pUwqm6k+qNATZGaMh89x9i7xh06Gw=;
        b=Bs3VLKl1Q54mLlmbAJkajydct0ePg3pgq9Ji3c7LW+vzAozuOlNDUlKoFfFIak4hJR
         qDOsxgnZcf97N5LdPqfHJ8qlLb/1aWbzP72dNYr1DIDvC4z5ZBc0agm1TVTVaV9cjqAy
         P2KarbTf+nkiu7ts8wCmEDX5/qzRR9qSG08hvt7xlhRjqY8O1zduBoWhT9PIftjvTwzE
         dnteuYL/7Ty6nCQZR2KgvhaKBQ7kC/FzCXtywuR3jVvwPnCuHEUmoikP1WdvLJgzuyQn
         HEfgsogjV1wKQGB8AIDbCt+ljUmXw5rZ7K3120tf0AtiOy5dJRL4DdDjbWsgZjf6IS9x
         UG6w==
X-Forwarded-Encrypted: i=1; AKwUvBy5Iopc3+rLsgoU8Tjj8q/VmjdMZfhz7e8OluVqeJOj7tgtppq9ZuiEklwNyOHUqhS0195z3bU2BPaPfg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJpY2gI/wY1mKxm06virLHHmC98yLTZ8pKcy5Suq+O+z6tTxEty
	R2gAeQ2MwJv+BZiDG+9vpWU9idZdoiRd6Idm4LLHE/k5AZCYEhEPx9+q
X-Gm-Gg: AYBFou2wfliBx8GPvyzPy6kbTPxodAQyeFgmY9o450ENj12E9Agzo1Cej77rfKBdt2t
	E8JaEqLNS076vPpFc021X1ELKeNpq0038qia1HQpJv36yH5rID3O6vSYkn5faqpWsZ196zmERMf
	bGR0qMLC6A3SyGkaWaAGUZsy5/ZUkHEN1D9qLrr2hhz1xAAfN+wfExX8stYOLpjmYe3848oBqCu
	om7lUf1TNcXh9sIi8HVRap7ejbsu68z/898wqkie8T7XweBO5dUJQvK9pIpy9/u+AkcIWZhNfEh
	qRqkzm/cP3JDJIu2kXHk5NZkL+qOyEWEcIYfXKmL0Z6OUCMqRT7F6r5DJGkxXyDCjA8goNyROx9
	bHU+sqq4KB+KKzx2i0cZQvzVtk0N1IZM99ldFlaUk8fm4Z5vhouaroqQ52GhoqLudk3fxdlpco0
	slmzYQKm3Jkh9X/RWpAxoSvoONrVPq22AxW4OFTsj3j+JSlsOa4upz5CkEL6CO2JtZbcYOdEwYR
	h+kNoPwW8KyB1bnGBRzFAPTK196oF+ovu4Xnlj+T/mmKAlkxOphE6Bn4CgzFXvfhbHkcpjN+DOF
	/fTfeWJ+4AsUY8PXhjxcJlU2PD//NVXogkdG+KRpAGmCofj7Ib9b/xZwbZS4EJlVeH2jdwyG
X-Received: by 2002:a05:7022:7f02:b0:156:d588:c881 with SMTP id a92af1059eb24-1a9420e36c4mr15374530c88.2.1793548206589;
        Sun, 01 Nov 2026 07:50:06 -0800 (PST)
Received: from X.tail7c3ebe.ts.net ([103.190.40.31])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1a136537sm25437817c88.18.2026.11.01.07.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 07:50:06 -0800 (PST)
From: Avishek Chaulagain <chaulagainavishek14@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Avishek Chaulagain <chaulagainavishek14@gmail.com>
Subject: [PATCH] media: atomisp: Remove unused atomisp_get_pixel_depth()
Date: Sun,  1 Nov 2026 15:49:59 +0000
Message-ID: <20261101154959.381-1-chaulagainavishek14@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

atomisp_get_pixel_depth() has no callers anywhere in the tree. Remove
the unused function and its declaration.

Signed-off-by: Avishek Chaulagain <chaulagainavishek14@gmail.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 41 -------------------
 .../staging/media/atomisp/pci/atomisp_cmd.h   |  2 -
 2 files changed, 43 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index e66a7d1c7..4f876b02c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -1080,47 +1080,6 @@ static int raw_output_format_match_input(u32 input, u32 output)
 	return -EINVAL;
 }
 
-u32 atomisp_get_pixel_depth(u32 pixelformat)
-{
-	switch (pixelformat) {
-	case V4L2_PIX_FMT_YUV420:
-	case V4L2_PIX_FMT_NV12:
-	case V4L2_PIX_FMT_NV21:
-	case V4L2_PIX_FMT_YVU420:
-		return 12;
-	case V4L2_PIX_FMT_YUV422P:
-	case V4L2_PIX_FMT_YUYV:
-	case V4L2_PIX_FMT_UYVY:
-	case V4L2_PIX_FMT_NV16:
-	case V4L2_PIX_FMT_NV61:
-	case V4L2_PIX_FMT_RGB565:
-	case V4L2_PIX_FMT_SBGGR16:
-	case V4L2_PIX_FMT_SBGGR12:
-	case V4L2_PIX_FMT_SGBRG12:
-	case V4L2_PIX_FMT_SGRBG12:
-	case V4L2_PIX_FMT_SRGGB12:
-	case V4L2_PIX_FMT_SBGGR10:
-	case V4L2_PIX_FMT_SGBRG10:
-	case V4L2_PIX_FMT_SGRBG10:
-	case V4L2_PIX_FMT_SRGGB10:
-		return 16;
-	case V4L2_PIX_FMT_RGB24:
-	case V4L2_PIX_FMT_YUV444:
-		return 24;
-	case V4L2_PIX_FMT_RGBX32:
-		return 32;
-	case V4L2_PIX_FMT_JPEG:
-	case V4L2_PIX_FMT_CUSTOM_M10MO_RAW:
-	case V4L2_PIX_FMT_SBGGR8:
-	case V4L2_PIX_FMT_SGBRG8:
-	case V4L2_PIX_FMT_SGRBG8:
-	case V4L2_PIX_FMT_SRGGB8:
-		return 8;
-	default:
-		return 8 * 2;	/* raw type now */
-	}
-}
-
 bool atomisp_is_mbuscode_raw(uint32_t code)
 {
 	return code >= 0x3000 && code < 0x4000;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
index d3d1f2574..937b64ac8 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
@@ -284,8 +284,6 @@ void atomisp_init_raw_buffer_bitmap(struct atomisp_sub_device *asd);
 int atomisp_enable_dz_capt_pipe(struct atomisp_sub_device *asd,
 				unsigned int *enable);
 
-u32 atomisp_get_pixel_depth(u32 pixelformat);
-
 /* Function for HAL to inject a fake event to wake up poll thread */
 int atomisp_inject_a_fake_event(struct atomisp_sub_device *asd, int *event);
 
-- 
2.43.0

