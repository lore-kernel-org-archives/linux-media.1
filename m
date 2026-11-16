Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851926;
	b=3wjR30zI1qeuajsqlUiI5mOSi8unY0cLjOlZr5A4k5EpzfYyo00RZFNEr5jODsLHp0j3
	 VU+pykAQh3MbmOl8DaSbYNWg+b4MzJgK5nbaFN2vicAKXuEc9pGUibvY0i4neAx+d47UD
	 jZhuy42SIW/6zLlXaq56QsiBKnKQQw3xIp3sxSUatefLpm+SGEO0meogQJ7Kk8SsvZftJ
	 QkQJovvQJEXOAka5Gptyhoq31j/se9w80VICyI/tByEx8N40RVQ6wJCVwQ16hPrCGnPsS
	 CSs54sLe18a+1SLRXFETuYb/SjGXc50IVBkstGICw57PZrImGrBXxYwA/kVU08NkvUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851926;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=m6gUtX6ff6h8dx/Z60Kd+xo5KMp1HfTClHuuO+KE208=;
	b=HNFQC5waDeDfFGNLa8vonDewFvZDX3VsHTJi6jDx2QpbdPeecnNMjirKvOQDj8ACmVmw
	 OA9MdDZGTWTOxyY47WrVIrDf+bESN7oF3NOpnAOpQELAID07iLONeX1Di1Ykgxv+tzTCx
	 Lvufv/uqL2IOdRsGgmqeAKopUULRRydyNLDPTlRKxMUpkKMcQvX5/edBDMuoLPbMmghf0
	 AWukoU9f7iC74X2MtAH1f+nfeW8I/CUHhUuGHVaXbel6Soz7gP2zGsO/4xHQVfcLmS6Gv
	 EvUaP6Ce4sjIAuCaDTLTVaoB29EIZlKMUgnBFOVw7ytVHDhWc7SeM1YUltLbwfW8vPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Nsc7m/2a";
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B165A606A882
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 17:58:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B165A606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nsc7m/2a
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so2000696f8f.3
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 09:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851922; x=1795456722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m6gUtX6ff6h8dx/Z60Kd+xo5KMp1HfTClHuuO+KE208=;
        b=Nsc7m/2aYHWLD35CNEWLYIGzTRtzPuGCtwMoRKpLkd5KLK+tTZZus24QOMY/67UY+U
         9sjpDWYUOxdCczR3F18jfAkyNGnY7EUVzwITRHfLbtA7YV0+xbdwkY2VpsBWqLmJeSe0
         wi8H1qdUCk0WCZ9klAExyy1qr6G34DUW84gzB7ZLdV4E8ktjxXv9xdySH/eBXQ3yn99f
         PpPKAzpYgp16NTRAZktauePNf8HLeWryfY+cccHbz4hpMoT9q0DE8UJTuVJ971YkcQTN
         USkVKtJ9aHLARL71Gb/a3ipFtqFaH8Jo4BcEriZoNm5iBr1MdJjDU8jlfnONS3Pmp6/G
         9Qag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851922; x=1795456722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m6gUtX6ff6h8dx/Z60Kd+xo5KMp1HfTClHuuO+KE208=;
        b=r5RE7oIH5nvRUzGOwHAMEMsR2DgQ1YRFaW/VQfYoWsbRQeyA9PmP2MEX62qKTVEO4R
         qVb4OUKEepV7jzWKpIxsqqwAuIVxVSxoYv5gIpLHr89Z+/dJaIZdQY0bzTwTvp9eiKDn
         iU9kfMYCN561q+kaH4uLqJGaCBvJTLKNC6ziCwU1yjLvvN9adbko8IPBn15tteKZ2jK5
         PFGnOxeK69p9jbeGIJmKm/UOni7TvbJ5gYNe0xKdR5kqBY8vjPSmosPYTUAiD7eoY2K3
         ZIv8BomAL7QwtsrTH2w2eZI1y4G9PmMddsN02g1MDFu7nrQI6D4vOCXhpVoynpvnvMmG
         6WCw==
X-Forwarded-Encrypted: i=1; AL+hErEZIyDYCG5AjRLibnoO3asoHD/SaSJBItyeildJRdGYNNVoXibSf/Hl6UXA366uenxf5jBWPeBcch7MgQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+U1CU3yWJ3vzn8yGOxBacUYjmgrKbGJCcv+EgzcfBcD8uquEQ2
	VV4Y5OAUQYmOiklj3hj7uBgvOmrDHBrIwEYo4hsIgM0t3wRQFcvO0cq8
X-Gm-Gg: AZFdTZdQLWZp7OWIxYXtuvEQ3M1KSCps+unH2ZT/SmOCza10+3Rjw48h3yA0CN7AT24
	WbEoocvl0cJmKufFNnxNriW1MLM6EcLe7GLZ+ZLWgbcINHk3Nm6PiOmRXzL+/xGkS7noVEtp59R
	8cVruQE+bW3XrmX+JzdqP4u3mowkxgrZIkdywby+nM9zjqES+VCHl2CLKY5FK4y1ULRe/busNs0
	xpZneySqWkoISQVcaLSjJIpxjUCoejQiTIFPKct3SapReK9Z2LISUj51qIfV1b8TxPToAB+SnIU
	Y3nqpIZSDmaQORE+RMH8MWwva9/38Tl7sB8JNznU0j1PKHWZoXANO6lCKX4xmkx1K0L3394FzHS
	bJ9rS4SbPDROTepvO2YlkVl6RBjI9c8tf86tfctoZ3yJzJ6BlmoUTcfZAnPcEOsqe6dFUNDnFaH
	SmgDkGO71h1pCkK8Hk/6y8IO4xobK1eHJITjvyvI+Z0tThx/x7yLh7Re8dfQw0KDn3s+Ua8pztp
	6rwf6sr1oZ5gr5f+LsmAc0CgS5X/VnUtSjbEL8i9zIKpezuxT6HIXF2q3A/f0aY/pO4MrDChVbl
	TWVLXXjF6SgA2C78WzthEX9yeMRqNvxRb9u8/YP1i5nt7w==
X-Received: by 2002:a05:6000:1862:b0:48b:a21:87f7 with SMTP id ffacd0b85a97d-49c7439bd78mr26344360f8f.44.1794851922165;
        Mon, 16 Nov 2026 09:58:42 -0800 (PST)
Received: from Kyiv.home.arpa ([2a0e:1d47:4093:b600:498f:88ac:2ca1:60d5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d22394esm24171374f8f.3.2026.11.16.09.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:58:41 -0800 (PST)
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
Subject: [PATCH 1/2] media: atomisp: Don't enumerate frame sizes the preview pipe can't output
Date: Mon, 16 Nov 2026 17:57:49 +0000
Message-ID: <20261116175750.21905-2-volodymyrchapman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116175750.21905-1-volodymyrchapman@gmail.com>
References: <20261116175750.21905-1-volodymyrchapman@gmail.com>
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

In preview mode atomisp_try_fmt() limits the size to 1920x1440, since the
preview pipeline cannot output anything larger. For sensors without crop
support atomisp_enum_framesizes() however passes on all sensor sizes,
minus the padding, so VIDIOC_ENUM_FRAMESIZES lists sizes for which
VIDIOC_S_FMT returns a different, smaller size.

Userspace which picks the largest enumerated size and then checks that
S_FMT gave it that size fails. For example PipeWire's V4L2 source cannot
negotiate a format with Firefox for the IMX175 rear sensor of a Lenovo
ThinkPad 10, which lists 3264x2448 and 1624x1216: Firefox picks
3264x2448, S_FMT returns 1624x1216 and the stream fails with "error set
output format: -22 (Invalid argument)".

Skip the sizes which do not fit the preview pipeline when in preview mode,
so that only sizes which S_FMT can set are enumerated.

Tested on a Lenovo ThinkPad 10 (20C3, Atom Z3795) with this file built out
of tree against a 7.2.15 kernel: ENUM_FRAMESIZES for the IMX175 now lists
only 1624x1216, and Firefox 160 streams from both the IMX175 and the
OV2722 front sensor through PipeWire. This was build-tested on top of
media.git next.

The problem was investigated and this patch drafted with the help of an
AI coding assistant (Claude); the testing was done on the hardware by the
submitter.

Fixes: d86c33af672d ("media: atomisp: Clamp width to max 1920 pixels when in ATOMISP_RUN_MODE_PREVIEW")
Signed-off-by: Volodymyr Chapman <volodymyrchapman@gmail.com>
---
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 22 ++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 50366bf10..046a95857 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -532,11 +532,11 @@ static int atomisp_enum_framesizes(struct file *file, void *priv,
 	struct atomisp_sub_device *asd = atomisp_to_video_pipe(vdev)->asd;
 	struct atomisp_input_subdev *input = &isp->inputs[asd->input_curr];
 	struct v4l2_subdev_frame_size_enum fse = {
-		.index = fsize->index,
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 		.code = input->code,
 	};
 	struct v4l2_subdev_state *act_sd_state;
+	unsigned int valid_sizes = 0;
 	int ret;
 
 	if (!input->sensor)
@@ -546,8 +546,24 @@ static int atomisp_enum_framesizes(struct file *file, void *priv,
 		return atomisp_enum_framesizes_crop(isp, fsize);
 
 	act_sd_state = v4l2_subdev_lock_and_get_active_state(input->sensor);
-	ret = v4l2_subdev_call(input->sensor, pad, enum_frame_size,
-			       act_sd_state, &fse);
+	for (fse.index = 0; ; fse.index++) {
+		ret = v4l2_subdev_call(input->sensor, pad, enum_frame_size,
+				       act_sd_state, &fse);
+		if (ret)
+			break;
+
+		/*
+		 * Skip sizes the preview pipeline cannot output, for which
+		 * atomisp_try_fmt() would return a smaller size.
+		 */
+		if (asd->run_mode->val == ATOMISP_RUN_MODE_PREVIEW &&
+		    (fse.max_width - pad_w > 1920 ||
+		     fse.max_height - pad_h > 1440))
+			continue;
+
+		if (valid_sizes++ == fsize->index)
+			break;
+	}
 	if (act_sd_state)
 		v4l2_subdev_unlock_state(act_sd_state);
 	if (ret)
-- 
2.43.0

