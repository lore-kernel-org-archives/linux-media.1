Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B134A2A56
	for <linux-media@vger.kernel.org>; Tue,  1 Sep 2026 19:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788289519; cv=none; b=WYlFRS72TvlYMBOwWagI9h9hNlkmJUbSWTOUavl0GOKXkGSjwqJSKsGtsITJQhqmiDH+F0H2d4FKIyVvuiJB/uLlwYlAB2A5FmHErsYdhttKKsEDNU494gzbnsX2vFmkDlOQN94AO785OPnXjDhxUVPdik3sKEIACh36yCefgHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788289519; c=relaxed/simple;
	bh=//jCPP+eb8u5m4CIItyod+pODqByyo2ifauCpaFZfQo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jg3DEGWRVylvvoo66RCmzHVmOOY6bFOcijQByvdzgGLhHL0eAaklzGF5qKlz4egBSoGCL83pGQnNouhLZtIsqk6Dkzb91PyOXKcC5Hqdy3RvTUh93516SB0Ig1Cfnj3kiLpuxSkgvrKeyeMhmwFbghknG0M9qUSkQn4j2BHMXGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kBOO31QQ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kBOO31QQ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49b8be0409fso940075e9.2
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 12:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788289511; x=1788894311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ch1L0Y83sVLilf517YsasLyC766SqlDIh2xPLCeCC2Y=;
        b=kBOO31QQyFzkZBf3o+UBOXQlcDUEc4nC8sjxp0CsmHOI2yV+rtQ0HSVXw7O21htUPU
         q5SQhMP69fzizKBhAIcEQ6er5zg3DNLZRq9wyg7xaLRE6Vjx2OF9UUXgoG5HLKDv18rZ
         GcdTuzCSHeKOu592VfiPs/dUE6Q7H3rwTiRUCZDC8WqfX7STdnQ7bVxwYWELaGv31aQc
         0MoHYjOzrlZadItpKYvWzSfaB9IKxm5J4G4UL/5Y80h8ZirNOOwEfOBnJyLYEAX5z8ga
         eSQo/Yi+DGIDv5cscGRtlRLf3uXrIqxE4EbW+Hq3Yo4NlVs9352L+F7y0I60Qajb71eW
         IDQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788289511; x=1788894311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ch1L0Y83sVLilf517YsasLyC766SqlDIh2xPLCeCC2Y=;
        b=KiS8rviPfV9O5j9t2EdEFu8p7KgF+lR4mkMFswxiN1Apj6yLaE5UKY14uy50VOGC9k
         pLsUiswOTyTcMNxSHuo/z8573s3IJ7IED3PEOG8uD5fOSWGuj1TVCIsQX4dZ8Qn5YG/A
         TVGgfwjzVec4yqAobnnk1esC7glomYvnX93li7wCp5Xzk0B5m6m3ncYHDSZ66u83DswH
         2K8YIO1+HRAcynfke0/rEvMmxtU/ZHX7SQisnkTNBKDhaypRTc9dn2TBh4o5wg6WGTKz
         b+2QyrEwLJmKPNionwtQtTfzQi1cW8Y0SRpyGNzGJmfYfkL0t+x1mzvFwIIwp/XEFrW/
         uH9Q==
X-Forwarded-Encrypted: i=1; AHgh+RrkZxcB4M+bTUu1Hb7SqBSQvAjoz3lkKFnoEYiMUxVh6C8PDznzEOiB+Sd/BYVMFw8QR0q26Gw4NsD3+g==@vger.kernel.org
X-Gm-Message-State: AFuF++ljywFeVQES/Fcx3UtichNuo3DaTneW1L6GR+CNmsr5ko0Bu+Yw
	rf12ZxXMu0Y8XtxTvVc5uFzxd++9dr0gjZW4iHnS9tPU8rLyiHNM8ArZ
X-Gm-Gg: AR+sD11jw1rDjiUa3eWcLbDL82ebd68OygpBLIj8snrI0ND31sLPDRaQ1ZoPEWia6/v
	V/iKmeLBrh+lO0lJUUpMLOmCuSty+IT9ut7oaJm5re+Ot3H1vxcOehCdhyIGC/zTngHVFwCsF0G
	RRj1pt67NDrTwmqg6URtwR8TbfEu5DjLguRI5w1NuJcxvIkv5uqgRVZTwCfVojfKmnNVeFnN/hu
	vtro+oqF6XjKKxSd9h0vnuDddKiu/xTxuJNj4wZvbtwxNJ1PaiHOm2/zDbf4UyrTDB8QZL9oABm
	h2lxjzdX29EXggi8dJQ1/NQleW/725+gerBfdejcIl6q3b3RNAwp8tO+Wxnw0cL0cFOye4LgwCB
	tmc2iBzYbjDSzuHKsZ/Gv3QGV20MuS8Op0fzPDvYi74nCG7CgEecrpNLSNlUG7/CpXFHQIp2BQM
	dbkPfmL6Sq3JN1e/KHg1OWzEVQ4AMqKbeIztzPc6kZnTfEP59CTrstknvhWK23L/vkQUonzbozg
	NyuLPWH+/K2Aqtkw+0xi5jp6fd/IC+PumAE03fKzQ==
X-Received: by 2002:a05:600d:8449:b0:49b:96a0:5c00 with SMTP id 5b1f17b1804b1-49b96a05caemr527810025e9.13.1788289511378;
        Tue, 01 Sep 2026 12:05:11 -0700 (PDT)
Received: from 1Z10 ([78.213.73.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10148sm85481985e9.5.2026.09.01.12.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:05:10 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 15/16] media: atomisp: allow raw Bayer capture
Date: Tue,  1 Sep 2026 21:04:37 +0200
Message-ID: <7ff456265a838f201118adb178107bc7fa72a7d1.1788286339.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788286339.git.mauriziocasciano7@gmail.com>
References: <cover.1788286339.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

AtomISP currently rejects all raw formats and silently substitutes
YUV420. This prevents userspace camera processing stacks from obtaining
unprocessed sensor frames.

Enumerate only the raw format matching the sensor media-bus code and
reconcile raw requests with the code selected by the sensor. Userspace
opts in by selecting that raw V4L2 pixel format with VIDIOC_S_FMT.

Raw formats expose the full sensor transport frame so ISP2401 can use
its copy pipeline. Processed formats retain the existing global padding
behavior; selecting a smaller receiver crop remains a userspace pipeline
decision.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 14 +++++++++++---
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 19 ++++++++++++++++---
 2 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 759effdb2e8d..99d2b73b160d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3815,8 +3815,7 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 	int ret;
 
 	fmt = atomisp_get_format_bridge(f->pixelformat);
-	/* Currently, raw formats are broken!!! */
-	if (!fmt || fmt->sh_fmt == IA_CSS_FRAME_FORMAT_RAW) {
+	if (!fmt) {
 		f->pixelformat = V4L2_PIX_FMT_YUV420;
 
 		fmt = atomisp_get_format_bridge(f->pixelformat);
@@ -3838,7 +3837,10 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 	 * resolution + padding. Add padding here and remove it again after
 	 * the set_fmt call, like atomisp_set_fmt_to_snr() does.
 	 */
-	atomisp_get_pix_padding(isp, f, &padding);
+	if (fmt->sh_fmt == IA_CSS_FRAME_FORMAT_RAW)
+		padding = (struct v4l2_area) { };
+	else
+		atomisp_get_pix_padding(isp, f, &padding);
 	v4l2_fill_mbus_format(&ffmt, f, fmt->mbus_code);
 	ffmt.width += padding.width;
 	ffmt.height += padding.height;
@@ -3858,6 +3860,12 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 		return -EINVAL;
 	}
 
+	if (fmt->sh_fmt == IA_CSS_FRAME_FORMAT_RAW &&
+	    fmt->mbus_code != snr_fmt->mbus_code) {
+		fmt = snr_fmt;
+		f->pixelformat = fmt->pixelformat;
+	}
+
 	f->width = ffmt.width - padding.width;
 	f->height = ffmt.height - padding.height;
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 87c29a940f9b..aa6d13a4de89 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -537,12 +537,21 @@ static int atomisp_enum_framesizes(struct file *file, void *priv,
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 		.code = input->code,
 	};
+	const struct atomisp_format_bridge *format;
 	struct v4l2_subdev_state *act_sd_state;
+	struct v4l2_area padding = {
+		.width = pad_w,
+		.height = pad_h,
+	};
 	int ret;
 
 	if (!input->sensor)
 		return -EINVAL;
 
+	format = atomisp_get_format_bridge(fsize->pixel_format);
+	if (!format)
+		return -EINVAL;
+
 	if (input->crop_support)
 		return atomisp_enum_framesizes_crop(isp, fsize);
 
@@ -554,9 +563,12 @@ static int atomisp_enum_framesizes(struct file *file, void *priv,
 	if (ret)
 		return ret;
 
+	if (format->sh_fmt == IA_CSS_FRAME_FORMAT_RAW)
+		padding = (struct v4l2_area) { };
+
 	fsize->type = V4L2_FRMSIZE_TYPE_DISCRETE;
-	fsize->discrete.width = fse.max_width - pad_w;
-	fsize->discrete.height = fse.max_height - pad_h;
+	fsize->discrete.width = fse.max_width - padding.width;
+	fsize->discrete.height = fse.max_height - padding.height;
 
 	return 0;
 }
@@ -630,7 +642,8 @@ static int atomisp_enum_fmt_cap(struct file *file, void *fh,
 		 *
 		 * FIXME: fix the pipeline to allow sensor format too.
 		 */
-		if (format->sh_fmt == IA_CSS_FRAME_FORMAT_RAW)
+		if (format->sh_fmt == IA_CSS_FRAME_FORMAT_RAW &&
+		    format->mbus_code != code.code)
 			continue;
 
 		/* Found a match. Now let's pick f->index'th one. */
-- 
2.53.0

