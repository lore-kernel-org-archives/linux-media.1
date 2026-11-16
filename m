Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794850318;
	b=jgzRFuiFfL0xno1KAYOcBab4zVceJYGhOCZgTd+KZ6UMVH+8iNcwdhUNns3Wg2OB1FtO
	 vFJVjS2IwkD+iIfd8Va+Ketyuv3W+tsmHL+hbkU61KpmyRp/UdslCTzx8sEOidIjttJ8Y
	 o8ezByfb2JCI/tnt1R52rmQhoufhfsjqmSVDmR4rjWgrMgd7qr70UsUDVtkd42nD/Lem5
	 c3z2ZkSVdWJChb3Vy1HlvUcwyn2Y5XDfg+od300/FtFAufR7mA2gKVjIev7i2ViJ4xtA4
	 T/R7Tu+AN0JoJMPN4YSOyT8Kev/arnwuHAyfS6e+pw2FcJ7uCmyCqAQYR+9dGDldV0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794850318;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BtzJTBkGllC2z/+DmnD2D5jXx4V+JoeyDI7VKbMd1ao=;
	b=1WvuQljvU1Dwfq3EERLJeVOaMvTkhNTs1yvh3/GWeMZRahpN1Me6L+1YqXSsAV76wc50
	 kY68eNeFV4Nj9MSADXjfmPaKy9242he7oI7WxJ8EB+E5ZKRPyRZI95G3oq/iAkVGxyaUO
	 FvrJiON8kVmAWtzudQH/iCJbC9MkhvqAH2qYdApUbhJcYe8tQhH6tg5dvoWKH5HiYXZtr
	 fDUqu/3M/Sh2FHblN9EfC/5727koIGE8qcZrsKC0WbVT3Q9qzVN9KiFsNUta9NxLPwTda
	 7BbVfx/SSMJrCs0+ZfpAfTdwgh6dHk0IP4jHuW5/6VyZRrbAS7YHKIp2CXxU4Y4TDaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zmChHf+g;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59BC606A882
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 17:31:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E59BC606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zmChHf+g
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48fd2e38825so2404615f8f.2
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 09:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794850316; x=1795455116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BtzJTBkGllC2z/+DmnD2D5jXx4V+JoeyDI7VKbMd1ao=;
        b=zmChHf+gtSp2/7m/ODDyhctUUA8ZgKoQFFaIvWMXbupLeLZ2UMG+2F/8CAgvTdjtus
         /f7ztL3vpk5I3etcc6eUxWXyk/xqDcCRcGgvzeuyZj1cGOyNVtZ/S8E6AcIwoS+bisDn
         eYQjR0JU5ikThjQBQSfMFLd/tFpBaJOykUQvO30d4bT/rjTuRuDoMp3DO1pfHb2o9RH5
         JMmI17tNfoEv95axZMjloVNszj7NDaa7pLlnIxIbSwAkUP+RzXwUxJ1F4fncbJA03r/E
         Rapn9SFf7mnN50x5zfcd/ZriUVTXcZOs/7tT4K/A3+Oa1LFHEC+ukrYF2u+Y11hXnJBc
         MUew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794850316; x=1795455116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BtzJTBkGllC2z/+DmnD2D5jXx4V+JoeyDI7VKbMd1ao=;
        b=cxheQqxUt33pdYahQaOiqmR70AW/55FiZYWTz+gbQ8XlnYB/xicCINO8HT7WbbNyH8
         ycxRs16hRdgNa+vS2mDghVBts4kK/Ywex1A6st9mfiofpi+rUiO7MaHh69t75708ddq5
         3o0tbIKKG3/nEMVFOfxB99ipTvkWFulxpmHCb/EeTALKzm/t3QCV1D9ybU6vd19OfBEu
         kVMb5weruyBBMDnTm3FM6WayIyA4GjtKgjjPuihBMgEn8vWNTcDAYWp5D7wKzJN0SUpe
         fboQY+383SleuC1u1LLZXqiMxsXUMCqgsCMygc6/ln8Ilk49Vn1yCJPmyreI2nntJWRa
         Epkg==
X-Forwarded-Encrypted: i=1; AL+hErF1u5yV/qg8xaUoEDIHBw9i4FjrOiLX/GEpAA0IcE1+HVxzcImtMNBse8OAkdHajplj7ExcbRyNNW7MoA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/wtlxy8jVCMVhm6oCPFXs5hTdYNr1DdAHetllpasE/LZ23FeHq
	bn+1W9dqrIlgchtv885IM+WLDlVcIhXBzTMq8tbylPl/Yc4pmBJZgt32
X-Gm-Gg: AZFdTZfDmgrl9nVw5XduJ4BIiRnhPoT+2ylW+BPdN4PALLzHfW4tsN/mx4s9bpbazS+
	BuU58xNbctB1xFzPcgVhoidWE9A/X7hQGpxLy2VgYx5vksnHmOP0RbMHTdjya7MSeio2MYsAD87
	Ke6xp+T2mBrwLcTEpVo4zcLRrIfR/iF+Ou8ULBEDE4onBqOTwswLrOp1l5gjjxsP9t5lgVorrMP
	7uxID34DjigNkf4/rYZsTWKgKmJyAQ3VaJ1jeFigDdPUVE+1hmUh52aYIppSUuuIYdMV72/ubmX
	OgwG/ZQXudMx+wseVAuHS8P51WzQKM0WqK6KAYTCzlLPuXEDMudggFTpyYe5dgWJ7cU63lSTWya
	um9sCu2aZ/iiUBg80ThLi4uRA8EA/yrbq7No++OmEPR16doS39XOnAVJtD1cg84XTck1mHC+tVO
	IHX7oSOB3L5GUah1zw+lzm/bAZ4ix1V3b+8lctpF3Si9dMIgd0zetILntHt+I8SmU9xAbCwaEZq
	BxHhSw3fATgm9imIArcNvoROVIlKZsWVRQ5lV8JnjKoFSoWZ/E8nJh9E2Wl6ouaTnRshnlfG+ky
	bxOYy+mhD0oiYiqQAOCGFNg4iLPplb+eSGnFymQQ/x+u7A==
X-Received: by 2002:a05:6000:1884:b0:498:42e3:3f6f with SMTP id ffacd0b85a97d-49c6d63fa5amr26505111f8f.5.1794850316246;
        Mon, 16 Nov 2026 09:31:56 -0800 (PST)
Received: from Kyiv.home.arpa ([2a0e:1d47:4093:b600:498f:88ac:2ca1:60d5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c7da37b19sm24022722f8f.5.2026.11.16.09.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:31:55 -0800 (PST)
From: Volodymyr Chapman <volodymyrchapman@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Volodymyr Chapman <volodymyrchapman@gmail.com>
Subject: [PATCH] media: atomisp: ov2722: Report SGRBG10 consistently as media bus code
Date: Mon, 16 Nov 2026 17:31:42 +0000
Message-ID: <20261116173143.13584-1-volodymyrchapman@gmail.com>
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

ov2722_set_fmt() returns MEDIA_BUS_FMT_SGRBG10_1X10, while
ov2722_get_fmt(), ov2722_enum_mbus_code() and the format initialised in
ov2722_probe() all use MEDIA_BUS_FMT_SBGGR10_1X10.

atomisp propagates the code returned by set_fmt() to the sink pad of the
CSI-2 receiver, but link validation compares that pad against the
sensor's get_fmt(). Since link validation runs on every stream start,
the mismatch makes streaming fail unconditionally:

  atomisp-isp2 0000:00:03.0: Error starting mc pipeline: -32

and VIDIOC_STREAMON returns -EPIPE.

The sensor registers atomisp_bayer_order_grbg as its platform data, and
because the platform data sets an input format, atomisp configures the
ISP's Bayer order from mipi_info->raw_bayer_order rather than from the
media bus code. Changing the platform data to BGGR as an experiment
produced a nearly colourless image, while GRBG produces correct colours,
so GRBG is the order the sensor actually outputs with this driver's
register settings. Use MEDIA_BUS_FMT_SGRBG10_1X10 everywhere.

The Bayer order does not depend on the platform: the driver passes
atomisp_bayer_order_grbg to gmin_camera_platform_data() itself, and the
board specific data which atomisp reads from EFI variables, its DMI tables
or ACPI only sets the CSI port, lane count and clock. All three sensor
modes program the same mirror and flip settings (0x3820 = 0x80,
0x3821 = 0x06), an even horizontal crop start and the same vertical crop
start, so they all output GRBG.

Tested on a Lenovo ThinkPad 10 (20C3, Atom Z3795, BIOS GWET50WW 1.50)
with the ISP configured as PCI device 00:03.0, using this driver built
out of tree against a 7.2.15 kernel. Before the change VIDIOC_STREAMON
fails with -EPIPE; after it, 1616x1076 YUYV frames are captured with
correct colours, and YUV420 frames in all three modes (1916x1076,
1616x1076 and 1436x1076) have correct colours too. v4l2-compliance on
/dev/video0 goes from 8 to 7 failures (the streaming test now passes);
the results for the ov2722 subdev are unchanged.

The problem was found, and this patch and changelog drafted, with the
help of an AI coding assistant (Claude); the testing above was done on
the hardware by the submitter.

Fixes: 1c3432df2339 ("media: atomisp: Call media_pipeline_alloc_start() in stream start")
Signed-off-by: Volodymyr Chapman <volodymyrchapman@gmail.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-ov2722.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
index 2a8c3ee77..4d0ab2555 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
@@ -711,7 +711,7 @@ static int ov2722_get_fmt(struct v4l2_subdev *sd,
 
 	fmt->width = dev->res->width;
 	fmt->height = dev->res->height;
-	fmt->code = MEDIA_BUS_FMT_SBGGR10_1X10;
+	fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
 
 	return 0;
 }
@@ -851,7 +851,7 @@ static int ov2722_enum_mbus_code(struct v4l2_subdev *sd,
 	if (code->index >= MAX_FMTS)
 		return -EINVAL;
 
-	code->code = MEDIA_BUS_FMT_SBGGR10_1X10;
+	code->code = MEDIA_BUS_FMT_SGRBG10_1X10;
 	return 0;
 }
 
@@ -976,7 +976,7 @@ static int ov2722_probe(struct i2c_client *client)
 
 	dev->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	dev->pad.flags = MEDIA_PAD_FL_SOURCE;
-	dev->format.code = MEDIA_BUS_FMT_SBGGR10_1X10;
+	dev->format.code = MEDIA_BUS_FMT_SGRBG10_1X10;
 	dev->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
 
 	ret = media_entity_pads_init(&dev->sd.entity, 1, &dev->pad);

base-commit: 3fc9303dba01676c2090768126e5327e341b7761
-- 
2.43.0

