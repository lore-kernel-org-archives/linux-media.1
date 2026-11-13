Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794537713;
	b=VSJVyWFQLP8SCg8KNM67/468YghoQ1A0y6WbReazvZnqq+0ZGe3F73y6kaWUgCf88A9G
	 GkgvhYtZ4d1Grko0XCL1YDwhi8pWkfWFTUxGb9mc6ihZMdwwgp5reZsfhLp0ZHFfPCK8R
	 +opdM6XlzwmHrmC+RHNL9uTaJar67Hxohh474qlmLgsAGMJ/PsGHSTuud2CqFX3lyIwnJ
	 2XTs9BJ/XAy0ftWkfPSzZkO/FM4vjBRYBZA5oGU5NDvjUkWKOon0GP/7q9KmFxls6pFqp
	 MAUZfnHhEwr+ZcTNIG+jlQyE8v4i55lkkSJE/jT8wMwnfAJ8iFmsOiCJwmNmHss8pVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794537713;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qsJFWwkiWeSuou2Dm+m5vriIMBro6wgj20BeOH0bZaY=;
	b=uJDuUF1bN4W2mVOgUOMHK1lC/muYiYdGCD2M3tR0kTj12uTtb7QjccFTjejmuRXa4OiA
	 0BsnsZC7N2S6x6Czt9o9QOTo7cLv53My5bP0q5nTA5/OyVkz4pH3Ieg04GY2R+bqlGDuD
	 tczp/dzLfQQcV2fiSUMeYWWfiRv2/xau116flT0iW0nwPRH4pN3x5yPLewehu5vHY8LjG
	 AepQ/n1N3XgAt+8EsE9zL5DSLjTcRF8CTh3BLc9WpfhFinCLVaxtNZ06tQLzR7pknrb6T
	 FZENXkhSDg09nP7Vp0I9S89G08x2HuTm4kVzceqX+KGAh3Qwmte0KYa7d6wNXdlutPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jc83i9xd;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D892E606A32D
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 02:41:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D892E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jc83i9xd
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36e2b1db9bfso61700eec.0
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 18:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794537712; x=1795142512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qsJFWwkiWeSuou2Dm+m5vriIMBro6wgj20BeOH0bZaY=;
        b=jc83i9xdJiIcwO0Bu8JPsIg1b+yCo+V/Ib3GjU3TGZ26sOv7vPfap//5dmC8diZKz0
         4r5xIufATZwIrnfqDAA6pBUOHofic5oluIqX3HElbL++lU0PJlyIKqHMVp4nkXnVxm4m
         GB1irmDb8hqvgQp65u/WJnJxZ9HL+lYm0buWolOtjvuLJy6axzPwV5J96yOCWBBDnXmy
         cdGeuSH/xrMbU3f7ylCUMf2A6WDvfsK/RalG1rq8qAmlmPThk3tqzXMN8f3ImSMbMpKR
         /5yv9mBdxmHYailNrVWCUuLlUEkMj96Ha/RLbhx5O8X44HwgYqUUuIcL2jL/Jz40JEzu
         9HXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794537712; x=1795142512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qsJFWwkiWeSuou2Dm+m5vriIMBro6wgj20BeOH0bZaY=;
        b=qylarL7Tnb420HVN6rzW/pRGsYVzKsVTOjD9owG8EC1QVE0MgHqyImHcbM1RqN2oiS
         TCWch/dj6JG1JuJ/GVlS3Napu6OGxiJPfJVJ7eEvo8kyvzkG9NQ/fdpWAKcF+UfUghhV
         qk4xYaekQR6YAov4+vk1bpM/jfdSdXflG3k1A4Kzy2IaG/T8cLapswd2cXmnsK6B1ChC
         iRQnHB1e2Wf9UN7FEX0ZySPxl+Ww8ajhDw+H7pEK/p2qkyHxFaViMThqR8yolsOJ9yeu
         7gvx/43S7HX5pCyEhvtEMmqkpNHaQzfqF6Q2/XiZJ+Lctxk8DcwIZlZ1BYoRSaBEGbfC
         kEtA==
X-Gm-Message-State: APuU4Z8n9VQdCx61MOaRTxdtppM76vbYhL61CyeCQd8s0DDgdK+O2+Yt
	Q2bdIfRo2zXBYWnb/QS+ES+tOA6OOi5j9q2239S86INCeFsmis382chnRJNFlGvsJFxtD14G
X-Gm-Gg: AYBFou2BXX5bIgzEK/oafDsRIoMqdNqk6okLaD9vjMwV8hHcrthb83xRvme5BAswgip
	vYXrpa7jZ5usqLwNBo3VZXgQIGtT+xzv6uwTLUWcM2gPZRYJAm/Mpf5uhtDSpY+hy1rdiwDZkT4
	ltPXxEN6pDfv8YR/420qD5fVt/GAt4RYCMZ1eSHbVxPRQtM10XKZ0lu1f1qSmxdgK2p4267DB2U
	kMXjPXefic7h5FkBPBLKWr2CkBn0FrrNmlonixnHYnKR/UdIhvoonACL6vV2FCHV/dyZwppoN16
	cf7C4hfvsSmFmeNuPKe6b6cMK3yyvwM1o3lhrEOPZyoUM+HV74ysZQbVVXxU22iU8YLP+E2HvRs
	j26osjmZzPW6u6NkLhRv0ZVFqomCN8AYilCzwO8eUAVbq3g9scb0yz4SOIRlSiGfeIXIYp5govu
	Sc4k6OioGk0RcAhDOuV1ttw9JxHAVTtAFp4x9fGpjmYVDv2PdEysJm0IvRLKvmMlM9RHadRxVu0
	5c6nD321G/n7yfTBbci7On1ADuJmQ4qMoNckvRhvlKv3S/aJ/VqNfw0lrVn4kbDErGEa25uhSOS
	gJViRMPiL01Bne++XYq40qK8Dncyt1FULgDDLpcSQtGeLksLGI5pnb0pr1D6P3qCVx1i0bdbEMO
	tTd0QGrijI7hrss2+3LiuKuoueitKaJBTAPf0vNm7E2VJvHyum1ih2VdXu6A51Xy60+xVgMJIDI
	rO8XYj45j+UZU=
X-Received: by 2002:a05:693c:20cd:10b0:36a:13fd:b5c with SMTP id 5a478bee46e88-379652f16f8mr1543196eec.2.1794537711864;
        Thu, 12 Nov 2026 18:41:51 -0800 (PST)
Received: from esteban.tail1178e6.ts.net ([240b:c020:623:52c6::44d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d07b3sm2334704eec.22.2026.11.12.18.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:41:51 -0800 (PST)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	hansg@kernel.org,
	andriy.shevchenko@linux.intel.com,
	dan.scally@ideasonboard.com,
	djrscally@gmail.com,
	dmanresa@gmail.com,
	dave.stevenson@raspberrypi.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/9] media: i2c: ov7251: Add orientation and rotation controls
Date: Fri, 13 Nov 2026 11:40:56 +0900
Message-ID: <20261113024059.1087031-7-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113024059.1087031-1-antoine.pichot@gmail.com>
References: <20261113024059.1087031-1-antoine.pichot@gmail.com>
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

Parse the firmware device properties and register the
V4L2_CID_CAMERA_ORIENTATION and V4L2_CID_CAMERA_SENSOR_ROTATION
controls, as documented in
Documentation/driver-api/media/camera-sensor.rst. libcamera uses them to
place the camera and to correct the image orientation.

While at it, bump the control handler size hint to the number of
controls the driver now creates.

On the Microsoft Surface Book 2 the ACPI _PLD (via ipu-bridge) reports
the IR sensor as front facing with no rotation.

Signed-off-by: Antoine Pichot <antoine.pichot@gmail.com>
Tested-by: D. Manresa <dmanresa@gmail.com> # Surface Pro 7+, IPU6 (8086:9a19)
---
 drivers/media/i2c/ov7251.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index c7489c6305aa..834420f2f843 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -1513,10 +1513,16 @@ static int ov7251_detect_chip(struct ov7251 *ov7251)
 static int ov7251_init_ctrls(struct ov7251 *ov7251)
 {
 	const struct ov7251_mode_info *mode = ov7251->current_mode;
+	struct v4l2_fwnode_device_properties props;
 	int vblank_max, vblank_def;
 	int hblank;
+	int ret;
 
-	v4l2_ctrl_handler_init(&ov7251->ctrls, 7);
+	ret = v4l2_fwnode_device_parse(ov7251->dev, &props);
+	if (ret)
+		return ret;
+
+	v4l2_ctrl_handler_init(&ov7251->ctrls, 11);
 
 	v4l2_ctrl_new_std(&ov7251->ctrls, &ov7251_ctrl_ops,
 			  V4L2_CID_HFLIP, 0, 1, 1, 0);
@@ -1564,6 +1570,9 @@ static int ov7251_init_ctrls(struct ov7251 *ov7251)
 					   OV7251_TIMING_MIN_VTS, vblank_max, 1,
 					   vblank_def);
 
+	v4l2_ctrl_new_fwnode_properties(&ov7251->ctrls, &ov7251_ctrl_ops,
+					&props);
+
 	ov7251->sd.ctrl_handler = &ov7251->ctrls;
 
 	if (ov7251->ctrls.error) {
-- 
2.56.0

