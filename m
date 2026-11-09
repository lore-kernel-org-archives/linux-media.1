Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794223591;
	b=KZ1EztvunIvvE128Pf0XfcMw8HROWWiLs8j4eaLk+h6/nJ1BZZLBG6vxZb5eJCcpBlMg
	 PkSXD0sVLL3GXHhkcoakzA03QQdBrbGvhNjqWgyuLou6SUgaZm2/4SCYlIXMDVPSp5pF+
	 ibKSEJqCnmcOfzKr6zJsv2kO/3AwywR9YGpBwTQdsrtqlNh6PvJln0gTGJGDOgk43kyK0
	 ApjC8KRsp+cEUs/1wxMPajcNqJJHvrZO/ooO75BkutDvpm434ydqckBQkdl8bNuEcwTAY
	 u3JCNxnmbtRBU1OWRXCc727TxoUhlKcX/mzJYQmDShr0RKljVIav6GMZ3dh1/RB/eWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794223591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ohyyU3d5fCDMIA+Xz1oydu2LA2MYuLIcnUp0rP9irJk=;
	b=eV6fqr6qQTc8aCDKCg8wk0m31c6O0BxOFwZMoRZRiEp7yTx+3K5TPjWJw3xFPIU0coDw
	 YQCMZ/Ve7c0Ut/lsTdgzU8yYVOIunNkRcPKbpfHeLPb5C9ibHp4XXaZ3R0dZ8h7wVgvPU
	 mkr/m1C3sT10Sr7bT7Egz6sVt4AqvwLqQVtFf203ts+HHEXzG5QapjX3rnrVoGtumy/V9
	 upvzvTAxQbE8TRu6jy1SjM2DPkFuNNmXcaAUyiTR91qhVUwa4jGFy69h93Ns+nwQYansw
	 6e7W+eaU4PhTIUgp+VAcydx0Ha9yjFipahF5yhM9ElOTipRsA3e81pyYKKTiFvwhLWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fatecpompeia.edu.br;
	spf=none smtp.mailfrom=fatecpompeia.edu.br;
	dkim=pass header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=L+FW6aib;
	arc=none smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0198606D80E
	for <linux-media@vger.kernel.org>; Mon,  9 Nov 2026 11:26:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0198606D80E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=L+FW6aib
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b31261e8a9so4691637b3.0
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 03:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fatecpompeia-edu-br.20260707.gappssmtp.com; s=20260707; t=1794223590; x=1794828390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ohyyU3d5fCDMIA+Xz1oydu2LA2MYuLIcnUp0rP9irJk=;
        b=L+FW6aibCHTP+TRnSSxMUeKf4LzOHnogNwEmXqAYaYmIX6MWtcdz/OajbMNlosZUI9
         ZZsGPE3sym3Ru6n0AEIsmx59ZH+FsE+x7pG+5EG0U+M2z4wHBmX6g3RVbqmfWjKxEIIh
         FGrm8MpLIJ1OUqLf4UM6xWFpOPY0g/6xfAZ0Odx6uo6D/iDRzKjnsNVU9r6k3+k8YtRj
         yKgMqp3EDHqsK0Y0h2Abm8xQ22laYhHb6laCY/JBAole5v5VvIEc90mzzjgwPQpcmt9l
         I1jPXBj9wqpxX3Na3IM1JojEJ+ab18U4B/bsV9ov3ZqhqRbWtpkEV5GLAZimogZmjNrW
         qUqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794223590; x=1794828390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ohyyU3d5fCDMIA+Xz1oydu2LA2MYuLIcnUp0rP9irJk=;
        b=bh0yJmK94ng8vk+7CW8ShQhzVfQK2/e/trdOG+DOxl4u0kfka2Coqih8pqAstPWEHa
         yV6jTtINoSI93BE7QRt8gKY3kGjRgW3hEYpXo2VOnastZZcfF/W9JNKryXo3Mu9lQ+Hn
         kIHX+OqG/trqz5liT1h3gI5rVoOVLURtiz8gB9QU9pRILyKByrHPHwZdrbWu5FmpEWjK
         60wKaVbVsgOPtmGd94afFWW75Ct+ZTe7v+r2Cbl9v5/9rNZDmfZFDy8/3Szd6GVq/uSS
         1gEGF00Non7EmBbEL2BDUBD9uYNGZ5yQSF1GobzhyeIV2tO3behoZ8lPOD2KZnAzjdjN
         KC1g==
X-Forwarded-Encrypted: i=1; AL+hErECLu2SXwSM9cBvw9TX8ua6I1+ThukLSLeLe+uHOlDOVjIixHmVEA7t2qdkvYjyP5VmPwNFKJEx2Avckw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+6cfgguaQ4FG3d4y7fK9PJYRTdYthZ/sRZguHIOz77nC7rvqi5
	m2Jj+XUm4Ky/N1+uLH1d3Hr1dpk9E632HG6AXORZ5CfkXOdV6VroYLZfhY/RucGWDzk=
X-Gm-Gg: AYBFou1QNADw8HPgUUWOXUvpR6RpF7zL8mzbuAlBqndxvuNxMcWpd06CYs5RBUpmmOS
	eQA4qXYnbb5j7YiJ5G4pBzdCKcPnnQmyPccaIX+OlMWUE5ZrpCH0i/A94EZ5drp9HxjBw8XdsoI
	aB/1T+FwU+KPg/iGuftsXjl/OBY0R+qRWYj4/3x8DImv2JbgmXe8Af8VN8OAd55myDV97UZcKcC
	++PEnwD0Sx8rPTx3NixcUTlFlfpg2Nmqy+QtvIwlO12WM2mmpsaU6MV7/BHzT3lguAmzsDmFyEz
	xJ36GCLBwxloriRMEfM9FsfU/1h1HfBimORPncgaryjDoGxOR60WHDVCwOZLFFgH/dMHPSGZcH1
	/tOgw7xe4gXchFrrz1yv0K+JV/t3K9WG/G7cyMCASM2h0jHF0IHheL+qbgVx0d5GeW+DwoIF9ab
	Ut872QRx/rwLsjS4lbsLilQFwLe1aCFa9i4t05SxVf+VtBGK1IzSYxfzJ86jZcAXjY58c/1wGaM
	PBqn0PQC2U+ExueNfqgN+5RpzvGJwKNKq+O3uHyoMe8gXfVZESwwDmOvZLnOCVqmUTBMDrLl+IV
	k3VfIcpGgkxEiIqZJLCj09jsYdA+a8q+PXlB1ntgJoLyS9xFNPqFfvSyhQ5B/CUB4Jc=
X-Received: by 2002:a05:690c:a211:10b0:8b1:ce5:be39 with SMTP id 00721157ae682-8b36cb386dfmr20292887b3.38.1794223589604;
        Mon, 09 Nov 2026 03:26:29 -0800 (PST)
Received: from localhost.localdomain ([2a09:bac5:dd4:1c96::2d9:5d])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b36bbffb49sm32385477b3.28.2026.11.09.03.26.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 03:26:29 -0800 (PST)
From: Allan Siriani <allan@fatecpompeia.edu.br>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Todor Tomov <todor.too@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] media: qcom: camss: always stop the pipeline in stop_streaming
Date: Mon,  9 Nov 2026 08:26:10 -0300
Message-Id: <20261109112611.94010-4-allan@fatecpompeia.edu.br>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261109112611.94010-1-allan@fatecpompeia.edu.br>
References: <20261109112611.94010-1-allan@fatecpompeia.edu.br>
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

Fixes: 89013969e232 ("media: camss: sm8250: Pipeline starting and stopping for multiple virtual channels")
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Allan Siriani <allan@fatecpompeia.edu.br>
---
 drivers/media/platform/qcom/camss/camss-video.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 5de6ff5ec..8341666f9 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -313,12 +313,16 @@ static void video_stop_streaming(struct vb2_queue *q)
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

