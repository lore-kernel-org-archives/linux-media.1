Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604915;
	b=uxs2zFK8JEImyRqI2w9Cg7A0LnN55kbK9tysmnPUdFpdqcoEDikdV3AqF2Jv/d31bzac
	 vzyCu10KQlGIUVteW5pF5c9hj+ZbDwwdTqEnvgloj925rQ85whGETTVl8dlUbCfyFhRRX
	 ODfL4NFIcSnP84ggWKUOpZoV/Zd7fja0YbVOmtt+Rg7dFf05zTI56tRFfj4QBucCKPpGK
	 dGTEbSAu6txrNvxa6dBl4F47vLUJEvG5LVJz1UxxFKjMk1rbFoDmUJxjdXC3NtMBAQZl3
	 4ZT534p1+W0XUfHUboR6nUAps6TU9jciwgrlFdW7fvAHchgoTHgmJxeQKM/oDqCyp/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604915;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ttE+DnIFRwVAU5oqEO22iJJyxTTgqP9uAtkgNos0KTU=;
	b=2g+6KxDRxY1vbblEdrRrYJtgjDiY8XMXpGUDTgwSM7BhM0iCg5P1oLx25T2TTWhzoc8n
	 qH4YYfirXTKc2KFgravyIiCKlfBpbJWPV0vaxf92FeHt+VoDXuV3QfKhc2zJZu9hvdR/H
	 JhG+YLtYkM+vfYpno0GDuZjoWeUueQV6mO05Ur1UmZSGgQ9+DNTJC1Z0GNjc9B0HZIJar
	 R53C2sjFD+pjbr6uO6yBDGl2iHq57edn5R51+GHQ/zqMozxfkHNJsj8/UlqARfOW6sWno
	 VesA61h+/CS/wlMUruR5TLuB/b5GZ8NpuomBVYLOXeYZtru7preOsFkLIy/oZ19bOAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i0bNxsSA;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9CF60A2624
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 11:08:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD9CF60A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i0bNxsSA
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4cac7a7d3cso826364366b.3
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 03:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604913; x=1796209713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ttE+DnIFRwVAU5oqEO22iJJyxTTgqP9uAtkgNos0KTU=;
        b=i0bNxsSAPplSF+i2uVIupdpJeDL3eQwMimBa5SA/vIBsjUjtyplTG1IbQi84i6RNzn
         eNJXmub6ECz8KADD2Z613PQxYJ8exBoXN/Q97KmKMinzdBrLUFTknRMnPhZv4RFpE0sV
         gx5IsxnFZnMjvyNvP3qTVrrY/R8egr3FfytWbFARFy6gtcjtbi9r28PraAtW78aSLXxp
         HeiPDwzxwYh06EvSFUxA7d/gfL+vgM83dM6YSPsCr4DWO0m+h6boQKpSwYHTJM/0EXgr
         1yh7WOfJHhnNXICMltD52PM56luCEKeJeNCnd2RGhfIi6/d7kBiNT3qVwvWErFuduhNS
         Z6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604913; x=1796209713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ttE+DnIFRwVAU5oqEO22iJJyxTTgqP9uAtkgNos0KTU=;
        b=OavQYTIf15/5EGIU/EhJHZLE8B3M1gxr3NulA6PhVggg4VqwHYGlV0iXoSYxnt/CW3
         T/e2nf8SP2uF7Z51wNECVIJDPfkMtxynRd5RruDJHhg7bnZ4c8VCCOHjDO4QFuPaYs3o
         FeiFnm/NfD+jz8j3TQoloMahhZROrHkqInsGVrSaOcnduFPwvdY4R7k/MBsW7xSHc7tl
         /ax1SNZgfGEnprYubQ/4bpcdt5EqsGbm8W7mUIKXstq/HNwP9WDeoI4f2U1utbzisowG
         tzhhQIdAKembz7LqMWmAyJp5hCej3ZuUl8lg8A5B9PMvxvrpSt63AMDUdhIMF2yIpsb4
         bffQ==
X-Forwarded-Encrypted: i=1; AL+hErGmVuDv8sUmuIcHul9cVi82rB9tsxu0/EUSuhV3e6hPXioNQIwrfa8xD8slEv/ClK1EhGBtoVBIEkIwuQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+lbf3aNc69SD88R8LDuwcdsN5kgl/LbzEkSloYbko7/J3hOEAA
	vTIyz8qscpzqtTCq5BThdvdUS4kxqLZRHR/6NWsF6AEAvNOQI+NOW4uZ
X-Gm-Gg: AZFdTZced9g8oaYY20QB145Ep/PaiUbzLvyhj6ihmNSfGpvWY+j2Zdjid25ni6DEpWU
	lVQYcfwuu/Hv4WMjLinm+F+WwvECuTwsjJLQ1PBXGb74Po7bqxbceCWurh1jwjna45Wf7L9KEeg
	SQxwWpqWgp7E1lxP1NndbH0D65jVh1BlfL475rl1r80j5KVidZQBwv1WBAJ0F295U3lZPnYoY7B
	Q//JADlz2X+fpWeXWJr9Tt+n/QlZqEl4cqdDXJDnjZLu9jxB+zao0ghsmsQEzcbarqg2d9rNgQh
	/es/0lUK7iuOT2v8NSPwljPpYxPf4RZUub/Azisqdw6YMV+b7OlCuplfXvNjbCxpWycnBso1GM0
	6dsL7IJHEmeuhqCETL1lJi7QolZJgWz4tw7x4b1vmEgUcxLh/04Sa6VLj8noarmqhkh/WUXRGYc
	uH98d70+Eyf5W4R+t/7vnuB8vJh9yCr5L41A5U1XD/3AwM8tknU262o1d0aYH0ob9oBgCQqfyEQ
	AHhIyLmeCHODP8XBNb2lNoGQknOK5QAc4yi2LadAeJlsmpbWeu7tQe3aHXWQn6eDnVU4Hi7vmMw
	KUdn3U1/kyM7KRJp9vi/hVIdKB5MRfUh2T1I1A5khh9QNGBbg/og+4C3Uy55hlQ71bK6nwbjlGL
	RvuVoHFgoSQ==
X-Received: by 2002:a17:907:c641:10b0:c42:e6c8:e494 with SMTP id a640c23a62f3a-c513ab47855mr991039366b.37.1795604913063;
        Wed, 25 Nov 2026 03:08:33 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfeda1sm654562066b.6.2026.11.25.03.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:08:32 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 09/13] media: tegra-video: vi: Configure capture format locally without subdev calls
Date: Wed, 25 Nov 2026 13:07:46 +0200
Message-ID: <20261125110750.223628-10-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125110750.223628-1-clamor95@gmail.com>
References: <20261125110750.223628-1-clamor95@gmail.com>
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

Simplify __tegra_channel_try_format() and tegra_channel_set_format() to
validate, align, and store the capture pixel format locally on the video
channel instead of querying or setting formats on the remote subdevice
and allocating temporary subdev state.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../media/platform/nvidia/tegra-video/vi.c    | 81 +------------------
 1 file changed, 4 insertions(+), 77 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-video/vi.c b/drivers/media/platform/nvidia/tegra-video/vi.c
index 4a0742b514a2b..f2de3aeb05bbc 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.c
+++ b/drivers/media/platform/nvidia/tegra-video/vi.c
@@ -340,82 +340,23 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 				      struct v4l2_pix_format *pix)
 {
 	const struct tegra_video_format *fmtinfo;
-	static struct lock_class_key key;
-	struct v4l2_subdev *subdev;
-	struct v4l2_subdev_format fmt = {
-		.which = V4L2_SUBDEV_FORMAT_TRY,
-	};
-	struct v4l2_subdev_state *sd_state;
-	struct v4l2_subdev_frame_size_enum fse = {
-		.which = V4L2_SUBDEV_FORMAT_TRY,
-	};
-	struct v4l2_subdev_selection sdsel = {
-		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
-		.target = V4L2_SEL_TGT_CROP_BOUNDS,
-	};
-	struct v4l2_rect *try_crop;
-	int ret = 0;
-
-	subdev = tegra_channel_get_remote_source_subdev(chan);
-	if (!subdev)
-		return -ENODEV;
+	struct tegra_vi *vi = chan->vi;
 
-	/*
-	 * FIXME: Drop this call, drivers are not supposed to use
-	 * __v4l2_subdev_state_alloc().
-	 */
-	sd_state = __v4l2_subdev_state_alloc(subdev, "tegra:state->lock",
-					     &key);
-	if (IS_ERR(sd_state))
-		return PTR_ERR(sd_state);
 	/*
 	 * Retrieve the format information and if requested format isn't
 	 * supported, keep the current format.
 	 */
-	fmtinfo = tegra_get_format_by_fourcc(chan->vi, pix->pixelformat);
+	fmtinfo = tegra_get_format_by_fourcc(vi, pix->pixelformat);
 	if (!fmtinfo) {
 		pix->pixelformat = chan->format.pixelformat;
 		pix->colorspace = chan->format.colorspace;
-		fmtinfo = tegra_get_format_by_fourcc(chan->vi,
-						     pix->pixelformat);
+		fmtinfo = tegra_get_format_by_fourcc(vi, pix->pixelformat);
 	}
 
 	pix->field = V4L2_FIELD_NONE;
-	fmt.pad = 0;
-	v4l2_fill_mbus_format(&fmt.format, pix, fmtinfo->code);
-
-	/*
-	 * Attempt to obtain the format size from subdev.
-	 * If not available, try to get crop boundary from subdev.
-	 */
-	try_crop = v4l2_subdev_state_get_crop(sd_state, 0);
-	fse.code = fmtinfo->code;
-	ret = v4l2_subdev_call(subdev, pad, enum_frame_size, sd_state, &fse);
-	if (ret) {
-		if (!v4l2_subdev_has_op(subdev, pad, get_selection) ||
-		    v4l2_subdev_call(subdev, pad, get_selection, NULL, NULL, &sdsel)) {
-			try_crop->width = 0;
-			try_crop->height = 0;
-		} else {
-			try_crop->width = sdsel.r.width;
-			try_crop->height = sdsel.r.height;
-		}
-	} else {
-		try_crop->width = fse.max_width;
-		try_crop->height = fse.max_height;
-	}
-
-	ret = v4l2_subdev_call(subdev, pad, set_fmt, NULL, sd_state, &fmt);
-	if (ret < 0)
-		goto out_free;
-
-	v4l2_fill_pix_format(pix, &fmt.format);
 	chan->vi->ops->vi_fmt_align(pix, NULL, fmtinfo->bpp);
 
-out_free:
-	__v4l2_subdev_state_free(sd_state);
-
-	return ret;
+	return 0;
 }
 
 static int tegra_channel_try_format(struct file *file, void *fh,
@@ -439,10 +380,6 @@ static int tegra_channel_set_format(struct file *file, void *fh,
 {
 	struct tegra_vi_channel *chan = video_drvdata(file);
 	const struct tegra_video_format *fmtinfo;
-	struct v4l2_subdev_format fmt = {
-		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
-	};
-	struct v4l2_subdev *subdev;
 	struct v4l2_pix_format *pix = &format->fmt.pix;
 	int ret;
 
@@ -456,16 +393,6 @@ static int tegra_channel_set_format(struct file *file, void *fh,
 
 	fmtinfo = tegra_get_format_by_fourcc(chan->vi, pix->pixelformat);
 
-	fmt.pad = 0;
-	v4l2_fill_mbus_format(&fmt.format, pix, fmtinfo->code);
-	subdev = tegra_channel_get_remote_source_subdev(chan);
-	ret = v4l2_subdev_call(subdev, pad, set_fmt, NULL, NULL, &fmt);
-	if (ret < 0)
-		return ret;
-
-	v4l2_fill_pix_format(pix, &fmt.format);
-	chan->vi->ops->vi_fmt_align(pix, NULL, fmtinfo->bpp);
-
 	chan->format = *pix;
 	chan->fmtinfo = fmtinfo;
 	tegra_channel_update_gangports(chan);
-- 
2.53.0

