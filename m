Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795762532;
	b=LwO4NlnS9cK9llS52h9r5FzlV0eurjyyBzDzYk2MyAQ91wHh1t1hvmYHIC9jqSzxu1e5
	 qDktWSs4w5FE1NBxOa4j5RkTkomqNxe70m0qG7aPBYtdP1fep97r/zqCxk81RFIwTBL+9
	 GbU0Kd1bd3VYOxz9/EQ3t04ORyNDXTT4eykD78oMU73KXE72XOXAOG6XjtWoTkZ2R+pqj
	 Fp+ON1fhOeTLs44yycK69p2Q+qUG6W1EUxBuqhVglgYuECUO2Gaxfm3a0x99BPM4j2PIO
	 PrkPAxjUjhJ81pqFNphhN6WuW9cgb1k/2oq+wsMwXAY8ImQD/uxov7VH5oK9AqiJTaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795762532;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AaDlPP9AgpeRRzKJsnNMnsNsKii7YPU68T/y3zRCJcQ=;
	b=AAIqkkKF2PZtjMTSTUSKQgHl6hQtjwddOzREnhhfv3fiZcecWs6AgHOV9+ms/8WMmNfo
	 +038ieQQTGnle/LwsZMNn3q6HZwsF4fZHDPWgDM7TDgIHiVeqbjgmKIElJaL5xgtgktVR
	 THsFa5CYWYq9M0fHTibCQMfTQuHG1bw/rMcULSIqfA8Qq739yWEZVuxeSvd9hJvDsBuXk
	 I9CSfD8UOa4P0OhHlIiFZNnR+I5zRrBEOkFMPp8/d8Sdr42pDz/arGVVt5nvmvHFss23s
	 jE5PrnW04TrF+YkxPfLkWuAmMb5WAWXQc4kjfL5MG/hJ7cfufqm2mYwEn1nKjSehfWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g2xuAocn;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D46606A338
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 06:55:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94D46606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g2xuAocn
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb61185057so49595595e9.1
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 22:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762531; x=1796367331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AaDlPP9AgpeRRzKJsnNMnsNsKii7YPU68T/y3zRCJcQ=;
        b=g2xuAocnacVaAosQ4bsauTwXhKOyLKai2HfYp59zEHJI+QD7kOe4u+O7o8uKC9W0nD
         YxgCZUSYxOyxpd+pHmLQExrgi3I/NoZcew78Upxfm2WvWX9E+CMl1EY7Ir3z3UN3xECl
         MG8QdcwfpvSFGtCExR2kc0czFv/zKolauCizynLu6lvFZnXxAB8Kaa9hMCjWoiMPbF6y
         3a9WPhPsJDfvrmSSH+yASALrordT+7dU0k/VVeAZlhP/IdN/yzbmO8qGxHb0iOpJU44S
         FQZ0H3paGckUr5T1j86q2JXEcs5o0k9bCpzjlW+kIRdTNxVZVNJrgMltwZm538UFaPnZ
         T2SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762531; x=1796367331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AaDlPP9AgpeRRzKJsnNMnsNsKii7YPU68T/y3zRCJcQ=;
        b=jWi2cv37p94iWNENKvsw3NeS4/AEOCc41fvghACEwGIA3DKsvicqV6kkCZ3sxk3dPW
         1Gfqm9WC/AVCklbsW59Bgpk4zJHiSFrPNh22Whw/eATH0ykeXf6HJc55g/9F9TopMiaR
         kdpwjdAv0vnaAjxdY5RjbDy5nYYxGsKx+O/2+whdTJJJUBBdV7biqaeS3M2Wxi4OLHsb
         hS1C8rc096PVpRtbAH9goxJZMs0KIC5QoMK3u6KZ0arCb2QNGIHVD/9eku6iEHm4L1IJ
         bDqw8vjtBcA22WeZHPOnlzYEpKMJPGWG52ANgTyT4PMCoMT2pWZ71FjY0xV4cDo1Upbp
         6Ggw==
X-Forwarded-Encrypted: i=1; AL+hErEK43NujSn18fc+mj+miMAZU6rc2Rl5DU18I+gsv9mo4BgWsmHX6cN5++XLc3oVMg7I9oHFu7ejZPzcTA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+JxTD0/m/kHHKU8rduYiuM8NP458aicEdbWiyiZh436eneO2Hv
	nYkLBr58i7zzR/FZHQphOdxUZ+kE0Bi85RlgYFtKu4IqdDBcklt1u6F9
X-Gm-Gg: AZFdTZeetB9HMbqZzn1I2vbADI04Kh6RrFo4eJ4DqYuaJLHhfbJJ0XEyxp+w8Y1d3mD
	ODGukJTnYOEQtGiMzQddXe+cdMb2iOBgOj/nJXKM5aOdG9yfZwyatN/dI5NdDIQKKpNdSRglsDS
	6sKp4y5yvxCzvSHCnyfvMgTD8jdAzfkkxK8L2i+M+/J7QZbpXTezlPcvTVwyM2iu5IENzA3r1Mm
	j+2do+76t9fRUVxeyHzMlEilht3uEFcv29In76Y0QySY0MY1awHDePpIcMk0NIrIKCdsZ8TU1rH
	1WzLZyPEiKiqjjeDgmN4Vagd6D1UMr4Djrv/ARsz3HtAKFZ8iPosZHUTa9iT+dfls+TM7EQI40n
	cjrmi8sfLACjtoFrfCxR1qOYr7I1aEbGunJdMGnfOvgsA6wKQsUi0Ion5fEptJVtou1RnkdO4W8
	AjVYYqCEOG+UwLYskHMyk48VlhY1DvZfdzratOVP+dJvbNCkqZ49jWwtJJt6k4dsLEmhoNcM7iF
	hgPhzaMUI2tYbW+rdkZEcZDNRJ9m+C+AQQJ9OYrvTdV1YHe6y28Mb88JWeswfKD/1vpGmAk0J1N
	yj2NgsbNlgzRQASRJFSy+Lhl5Siap5+kvSuxMFcn6HGZSQ687XkxumqhQ05xIh3LH4Kape+E4oa
	R/HLCjpp72FGESJsnsPKzJMQJQCBU+PXlNaIrcxI/CoRP30IL/VIhIBgGJJgbjP5v6q78rk7J4g
	Up5EHxSMNamzbY0nabe1xjTkLKipFy9bizdO2q2EkNDth5Jhcy698nVObB5FNkud5h1AWiWvxzS
	k8n/wkzB8eIP7RW8bbOhu3IhwfYoMU3vNvJYuXETyv6pclVkOfQgJhwISrvuTY=
X-Received: by 2002:a05:600c:3b99:b0:4a1:777b:8a12 with SMTP id 5b1f17b1804b1-4bb8880b984mr542353575e9.14.1795762530660;
        Thu, 26 Nov 2026 22:55:30 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm42574611f8f.34.2026.11.26.22.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:55:30 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 1/3] staging: media: cedrus: take the output line stride from the capture format
Date: Fri, 27 Nov 2026 07:55:21 +0100
Message-ID: <20261127065523.3685726-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127065523.3685726-1-jernej.skrabec@gmail.com>
References: <20261127065523.3685726-1-jernej.skrabec@gmail.com>
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

cedrus_dst_format_set() programs the line stride of the untiled output
formats as the width aligned to 16, which is the bytesperline that
cedrus_prepare_format() gives these formats. Program bytesperline
itself instead, so that a decoder can use a larger stride, and so that
the stride is the one of the buffer when a decoder sets the format up
for a frame smaller than it.

Likewise, take the height as it is: cedrus_prepare_format() already
aligns it to 16 for these formats.

No functional change.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
index b66d855daaf8..7e742cbb1cdd 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
@@ -84,7 +84,7 @@ void cedrus_engine_disable(struct cedrus_dev *dev)
 void cedrus_dst_format_set(struct cedrus_dev *dev,
 			   struct v4l2_pix_format *fmt)
 {
-	unsigned int width = fmt->width;
+	unsigned int bytesperline = fmt->bytesperline;
 	unsigned int height = fmt->height;
 	u32 chroma_size;
 	u32 reg;
@@ -94,7 +94,7 @@ void cedrus_dst_format_set(struct cedrus_dev *dev,
 	case V4L2_PIX_FMT_NV21:
 	case V4L2_PIX_FMT_YUV420:
 	case V4L2_PIX_FMT_YVU420:
-		chroma_size = ALIGN(width, 16) * ALIGN(height, 16) / 2;
+		chroma_size = bytesperline * height / 2;
 
 		switch (fmt->pixelformat) {
 		case V4L2_PIX_FMT_NV12:
@@ -116,8 +116,8 @@ void cedrus_dst_format_set(struct cedrus_dev *dev,
 		reg = chroma_size / 2;
 		cedrus_write(dev, VE_PRIMARY_CHROMA_BUF_LEN, reg);
 
-		reg = VE_PRIMARY_FB_LINE_STRIDE_LUMA(ALIGN(width, 16)) |
-		      VE_PRIMARY_FB_LINE_STRIDE_CHROMA(ALIGN(width, 16) / 2);
+		reg = VE_PRIMARY_FB_LINE_STRIDE_LUMA(bytesperline) |
+		      VE_PRIMARY_FB_LINE_STRIDE_CHROMA(bytesperline / 2);
 		cedrus_write(dev, VE_PRIMARY_FB_LINE_STRIDE, reg);
 
 		break;
-- 
2.43.0

