Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793823809;
	b=eCN9LKM6oTVWBdM/CwOKwJowOaiuFWJEkaqaaDjaDZ7lI4gibf7O1wh5YQXOa65POO3x
	 OldWHKvgXN8xvIlurUwX31uZWNp71C1YIEnEAblsw2PPkq1rsCqhDvLNE/Xl6Y8u4GQJ2
	 2/8dYsPXEMOXM0H8lX+KM8Hi0PL4JxVZoqu0kaXwMUnxDvSKFGNmPqeArNuCbUtzZXLZj
	 yRuksIce5uCaeJx8lXmP0RqiB4JoLntqu0PjJs0BJimFlUjCRt5ucdhDFvn9RaInZrP3M
	 GDI/sZ+SVcckGuaOwUoQoM3jnDI2sce7qSAjzmUxWDmu3XEHh3sDHwNt8O1KroMPlcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793823809;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=E7LZocK/+GQCTR5yix2Tw7sEbUYmazzv1KQynZMkd84=;
	b=xY9t/gntA8gvjifg7LACSHY0zPti4KocYQQth1Pgmtg37l14KsRYRAx8ZRdS6EOkxzcc
	 Ir06ostHsMIwD+ryKTP4DAQUai+mH7SByQp4eLDlMBVrPzL+OUgrJrQdqMhDGwQvT5T4G
	 ZR6T6qIMLWyjBsWvHW05ok7PMVHV6zMPEcIQWwrC92u0hP+cvhsgzvF+X/DbKkHZwZzVs
	 BqMFWRPDH3EM8c2iAGnVG6IerBWMejmX01lkTxyHgPE+eRg4+dUIWH8V5QEco2rps3Kev
	 3zAyPbnPUIsWvy8BI7sq/YoPGSZmBZpyXFBTciKJrqkNniMY3vpOoyYZrp7PHUaFuiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fatecpompeia.edu.br;
	spf=none smtp.mailfrom=fatecpompeia.edu.br;
	dkim=pass header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=YHarwSmG;
	arc=none smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733016072F99
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 20:23:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 733016072F99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=YHarwSmG
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b315dd057bso6916207b3.1
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 12:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fatecpompeia-edu-br.20260707.gappssmtp.com; s=20260707; t=1793823808; x=1794428608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E7LZocK/+GQCTR5yix2Tw7sEbUYmazzv1KQynZMkd84=;
        b=YHarwSmGlmrLNnexUV8TCu9qAmUPUm7BS2v7N2S8h/bK6nAmrGBOAd4CtsmQkbRDTc
         aIvemPAxoul3uySgUhX++Ey7szslUFPOwEyBOyvvzYN9zZnXd8PJmU/Mrng4JWKWTQkf
         hEL3rMp9ZmG4tz1LOLG2F1ObftrE6xY3YNN0Xni7MagFAgkKxJp8G+uoLhiFAdpSvyU9
         x8AsSUKQhTKi1v5b5GrPqK7OGbRZhuxmehhk6B9aJG46N6Ag9IJ+4kjbry8xLV9y42fJ
         APsk/qq0rNZrcNO2kxX53Y3c/c2rT7digdE5OzKCWqHNXlvw71IOoNtcZpuAjd6mGUUZ
         VTyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793823808; x=1794428608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E7LZocK/+GQCTR5yix2Tw7sEbUYmazzv1KQynZMkd84=;
        b=0bpcDZvTJM8rjQMwFJY9KF/iiFHyhDUWZ371OkmIBg/XeI5GqRY2BMGdIZ9EOZuBf6
         lyMvFbMceOrFpZx+hzosKue1cZ11fkRGKqSwYxJIT6qvhkX0x5CFtIOgziEYWYstpTPH
         UI+Ju6UjmzUgVAXmTieltkrf9Nf/afNu/7d7Wn16a0amqiRdMzT7BhTN8fCBak2bH844
         C4ErWzMEz2JYeC5BcjAvabl/b7JhB2swdWzFzIwSpw+/YR5MPEvddReDyT+W2oIjIIiX
         +wovPr6JtYOZewDyZ/utTW66yP1jwhuGkgonUqj/+aV2+fAwgbMbdI1AYZLl+Cp2qfas
         meiQ==
X-Forwarded-Encrypted: i=1; AKwUvByj8hMV0CXdp5VYgImfx7kSlOsIEcE21luCBFCgyiWRGpjuE2lMVGWve/hI8xxL/+C8DS1oJGkUtGRONA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9VjUU0ARPNqzvsrNe6SD7B+/0Pl0eCZT6ogJk0Mjc7HHMHcaw2
	uIgWsmOOjRQgClCqaURb9atJjWtFn9Q7BRMkJf1GJCIB4QVqiVsXZ8/DQMUBJasUJlQ=
X-Gm-Gg: AYBFou2OIj51e7wN+SchpAEV8Suypwe4lrlLYGJv7WafGuZWHWL3eAebCOe5CAG9CmL
	W/a7UxKhsTIk6iY+xk0Qa6+KI15mgS7esmtPhH3z25GUozNImpC/PlHtM/EKR3uGBZOMx39TMpe
	No7w1nf0ElV6+dzBEeyjem2JrKVYHk2TlpiPTbyRIc7voxhdlrYZNLMDpUtohMVSngIfhp5vmAa
	GGJA3WJN9z+bayCCWSfejNnFVhg7nk3wO0bWyFVXLdw38rVexi5FXWMwiL/BY9IekiYh8pIbCWG
	yyN+tzdeMrKiJ/ai+VTQv7+9j/npskZvmzhXM0tTSzErJb4y2HzCH4mt7Z7hg42HhAY3cnRdYdL
	OpgFrMDm1WVvhHYdPnbe8gMfjhZCt9hAF3hCuJIMBEDBkmzPWhjRvTaNPz5hIm+otrllzizPBa9
	sXZr1VHmd9TJPFBW4O1rklKoHmF2U519Xa+tPeaUsu7XsPqFBnY7etyELQDeZcnSPbyDFRVa7OG
	SgYpJx8Cn+7a6qiXOjt8pgGin2DoyfU8erJNUL1K0cMuyRDAWC5hRQ2/16DksgGyjoNaj/bwFNI
	1tHTKpOCMs5qm6eoivxNPS8ZKcJ0WiU24IXk6v5W61VN0WpB8gTY+3aDD0ZMJrtL+Zz3NNxwOSa
	BCIs=
X-Received: by 2002:a05:690c:3489:b0:89c:41f9:b886 with SMTP id 00721157ae682-8b2b67f3125mr116898717b3.55.1793823808412;
        Wed, 04 Nov 2026 12:23:28 -0800 (PST)
Received: from localhost.localdomain ([104.28.244.23])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67bf91b6e7dsm1298292d50.13.2026.11.04.12.23.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 12:23:27 -0800 (PST)
From: Allan Siriani <allan@fatecpompeia.edu.br>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] media: qcom: camss: always stop the pipeline in stop_streaming
Date: Wed,  4 Nov 2026 17:23:12 -0300
Message-Id: <20261104202313.72494-4-allan@fatecpompeia.edu.br>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261104202313.72494-1-allan@fatecpompeia.edu.br>
References: <20261104202313.72494-1-allan@fatecpompeia.edu.br>
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

video_stop_streaming() walks the pipeline upstream and calls
.s_stream(0) on every subdev. It gives up on the first non-zero return,
without stopping the media pipeline and without returning the queued
buffers to vb2.

A subdev without .s_stream() returns -ENOIOCTLCMD. video_start_streaming()
already ignores that, but video_stop_streaming() does not, so with such a
subdev in the pipeline, e.g. the pixel array entity of the MT9M114 sensor
driver, every stream off:

- triggers the vb2 WARN about buffers still owned by the driver,
- leaves the pipeline started, so the next VIDIOC_STREAMON and
  "media-ctl -r" fail with -EBUSY.

Treat -ENOIOCTLCMD as success, as at stream on, and only log real
errors, then always stop the pipeline and flush the buffers: a
.stop_streaming() callback cannot fail and must give back all buffers.

Signed-off-by: Allan Siriani <allan@fatecpompeia.edu.br>
---
 drivers/media/platform/qcom/camss/camss-video.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 2c15546c8..9091eaa18 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -361,12 +361,16 @@ static void video_stop_streaming(struct vb2_queue *q)
 		entity = pad->entity;
 		subdev = media_entity_to_v4l2_subdev(entity);
 
+		/*
+		 * Subdevs without .s_stream(), such as a sensor pixel array
+		 * entity, return -ENOIOCTLCMD, as at stream on. On a real error
+		 * keep going: the pipeline must be stopped and the buffers
+		 * returned to vb2 in any case.
+		 */
 		ret = v4l2_subdev_call(subdev, video, s_stream, 0);
-
-		if (ret) {
-			dev_err(video->camss->dev, "Video pipeline stop failed: %d\n", ret);
-			return;
-		}
+		if (ret && ret != -ENOIOCTLCMD)
+			dev_err(video->camss->dev,
+				"Failed to stop %s: %d\n", entity->name, ret);
 	}
 
 	video_device_pipeline_stop(vdev);
-- 
2.43.0

