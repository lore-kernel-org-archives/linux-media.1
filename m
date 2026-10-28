Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793159020;
	b=HNT3ekIaZX4LBqClb5Qvp7SVt829WUIXo2hX1tTIT6VPAdGBjgCbi6s2LOptY2xy/bdo
	 0PyG4b7MZH/d8r8jjpLAsxAqdPsFEY4S8tMdZbeA0GGru6hxW/AzaDtIo8UbS+u3NEVu2
	 5MLCbRde3kTOelRBFL/SCaHVkpAwAcj+zJQd/i8sJq7WQ6HPGXvulc94+sgiF2v/hJlZ1
	 lGjvUTrES1/j+ETj1J8ssgdYUZwuSN+ByZ59c+NsDFG1luwpBDNahIPVSPykLWDEXJcFu
	 zVyU6Sm0PoRxaYlMaHKvXCeSKruKAiIA+RvwIOvCACzBk/ZpWlZu+ARQd2OG+rpOymQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793159020;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AguqB2hO77OHSGF5DZldrtOnUiAVpJyfCorfpUrLfyc=;
	b=fhNbP9nuj8uZGtjCqxFk62fb5pfvQZcycgToEV+hXvvyHeTNn1uQ+AbWiGOhwFp/zatN
	 c4M8OcOL5S8mV85gc9rRaMi5g5nAG70OmmhE0e1jW6p5H5LQzOkWzHKYPyOcbpebdRmyF
	 VUsqoKPtwE5E/ZqkV2nfuWi7P/xTYU4TFqIk4chVb8E1uQYB9YoDvmrtBXrSgENWY9WgM
	 kaXSPBQT8tmmofdVDm7lU3f7yAwvTS7qrhrVX1xDK1khChr2bl0KpL2GMSvWdvY2Tzmx7
	 pI+s9U2ujAmbHZ3W2kW9irWiDnzNgRO7RpPFCLcbJhiLklnjNlOot0cbls/gOyJm+GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UzBy48qb;
	arc=none smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128F7606A32A
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 03:43:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 128F7606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UzBy48qb
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-93f1e5d7450so42322885a.2
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 20:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793159019; x=1793763819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AguqB2hO77OHSGF5DZldrtOnUiAVpJyfCorfpUrLfyc=;
        b=UzBy48qbaAVds69XB0OB9iaLL9WXaRk77Z45TS4mH3FNhwE31+4GHHYBELtDeV2sWv
         G0MQByRGkKelSyu3+rm7xoN+8z5/BqfLjDDtaXCiaySFPU26R2FqU1rnG0f6kvc77UoK
         uamOmYRdO0pEiCkAfkTzDyKJtygNTw5MobmdUSTUs4hcfSCedtTH3zm8ScKULNhx+Sjc
         kcksRZ+palIfqZkKlIDJMp6a/PT08j9qorOU6wi4A0rv6aY4YJ7E+CDvIGxKepcX11Al
         M4B70G5ix7PbrLbYwgKVj8r7H8HVHitxe4CfLEgWRTGRPDqI+4WQ9Qg81nHrox0vu9hs
         1xJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793159019; x=1793763819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AguqB2hO77OHSGF5DZldrtOnUiAVpJyfCorfpUrLfyc=;
        b=PSPpXgx4ihPqh2NSm0kgIvX+RgLL58z44Oc+WyZ9Fc30OpeCXBJUbrq5SYAsb3ptCG
         +ULvT9iyUUDL7SKXujpkCcH5j2OoCpgH0FN2RkNeIrmLVnCth+7ffwNRALR3ycn5naLT
         ct2vL144yLQ43bHV87weQu1T6h9EwT5jifwm/xFMZDeiAjodyBzbcOmet/sOPG5AHIhB
         oazle6YXDF1K0My+G1LdpPbaowBnW4fhFXwPlQ+d2fKUcRkyvqpBk8i6kUbqhsnzAYdw
         +aZNc/8rebIOPJQld15LKI0rWbXNd95MF0qV0JZtz267JJHMBkAw2gqMxO3ZH4dZcWEK
         yCLQ==
X-Forwarded-Encrypted: i=1; AKwUvBx7oHst4RSp7pks9Frz84xHxex6PDVZU1YSHJNG9BJMIaBZEA4f4iWjkLWFy8f5xx8wRs/7u+pEnDYkPw==@vger.kernel.org
X-Gm-Message-State: AFq9FYI34QBbafOvFCM4dqKrCyhG3vavZyvq9Cy9/U1nWANgPTlav3Go
	namOyFlBGaaUN97p87lFRzwMPQfpc3MZLMt7ve0e117De2UZcgmDVuwK
X-Gm-Gg: AYBFou1LDS7/+0vOagqOckoeGf7M91dQffCKTImTMjKpHkNp0UmboTMgFx+s6LjVjxy
	nWozLXDzqhMGjRDWIiC0/sve2siQcJ+X5YNef2NxKEUrTXSJMi6Yvbzr2YIiQq/t/MfpPm3VWja
	a6386JXrGQz3fFEamZEpA/3YLSUgDXQZPbxpWwbjerW2kpCcnKg+RiTzz3teGgC8NutaqQjOcgo
	Ad/X8ZbJBU+RfjbTAFD8btUogb3RrRB9elEjpa3n1G/NNbLBbAwxne76yirnA2vIGFbMUhBHyM+
	22MvZPuuraNIscE6xyCrZwJwh1pUPDe88YLqHWp8/YiqPa8z/U6VgZwhNx0UTW3tKh4i3E0p9Tk
	QjWu/FEKscoJhj5dZTqL8zz9vOagvXLVqt8ti8mFQORnDTaCkzPqixBbFrHhVtj21U20JFiqDXk
	pCtceXq5Xf9iQ7/bqfvsDdQxwenWiv+p/sgIPhr3J567FJtuQlkcmRKrXBcw0uEXazGzGrxQWug
	A+IlFF3P12cKYmAGoSqgZ+kk8Cbm+fpWzMweL6yiZqpCis2rFYMgDoKHNTJOpG7oIIbH9gsWvOi
	UTmgmy5CDRM6qW8GzfZib4hjskfqs7Bx3kcigV1NBJDzGKd9FlNVJIlF94y6SlHRCfKVX8kocPI
	f2MWLgg==
X-Received: by 2002:a05:620a:17a9:b0:93a:2d07:142f with SMTP id af79cd13be357-9440896db89mr147075985a.7.1793159018981;
        Tue, 27 Oct 2026 20:43:38 -0700 (PDT)
Received: from localhost (h159-112-31-107.euclwi.broadband.dynamic.tds.net. [159.112.31.107])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f05b20d5sm1151879485a.2.2026.10.27.20.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 20:43:38 -0700 (PDT)
From: Christian Cortner <ccortner@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Birk Skyum <birk.skyum@pm.me>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [RFC PATCH v2 2/4] media: iris: Update the CAPTURE stride and size on S_FMT(OUTPUT)
Date: Tue, 27 Oct 2026 22:43:33 -0500
Message-ID: <20261028034335.26075-3-ccortner@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028034335.26075-1-ccortner@gmail.com>
References: <20261028034335.26075-1-ccortner@gmail.com>
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

S_FMT(OUTPUT) updates the CAPTURE width and height but not
bytesperline and sizeimage, which keep the values of the previous
format. With a 640x360 stream, REQBUFS(CAPTURE) then allocates buffers
that iris_vb2_buf_prepare() rejects with -EINVAL.

Move the CAPTURE format rules of S_FMT(CAPTURE) into a helper and use
it for S_FMT(OUTPUT) as well.

Fixes: 8aadfd445373 ("media: iris: Update CAPTURE format info based on OUTPUT format")
Cc: stable@vger.kernel.org
Assisted-by: LLM sparse smatch
---
 drivers/media/platform/qcom/iris/iris_vdec.c | 61 +++++++++++---------
 1 file changed, 33 insertions(+), 28 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 0dd33ff447bb..472e8e50830d 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -212,6 +212,35 @@ int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
 	return 0;
 }
 
+static void iris_vdec_set_capture_size(struct iris_inst *inst, u32 width,
+				       u32 height)
+{
+	struct v4l2_pix_format_mplane *pix_mp = &inst->fmt_dst->fmt.pix_mp;
+	struct iris_buffers *bufs = &inst->buffers[BUF_OUTPUT];
+
+	switch (pix_mp->pixelformat) {
+	case V4L2_PIX_FMT_P010:
+		pix_mp->width = ALIGN(width, 128);
+		pix_mp->height = ALIGN(height, 32);
+		pix_mp->plane_fmt[0].bytesperline = ALIGN(width * 2, 256);
+		break;
+	case V4L2_PIX_FMT_QC10C:
+		pix_mp->width = roundup(width, 192);
+		pix_mp->height = ALIGN(height, 16);
+		pix_mp->plane_fmt[0].bytesperline = ALIGN(width * 4 / 3, 256);
+		break;
+	case V4L2_PIX_FMT_NV12:
+	case V4L2_PIX_FMT_QC08C:
+		pix_mp->width = ALIGN(width, 128);
+		pix_mp->height = ALIGN(height, 32);
+		pix_mp->plane_fmt[0].bytesperline = ALIGN(width, 128);
+		break;
+	}
+	pix_mp->plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_OUTPUT);
+	bufs->min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
+	bufs->size = pix_mp->plane_fmt[0].sizeimage;
+}
+
 int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 {
 	struct v4l2_format *fmt, *output_fmt;
@@ -263,10 +292,8 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 		output_fmt->fmt.pix_mp.quantization = f->fmt.pix_mp.quantization;
 
 		/* Update capture format based on new ip w/h */
-		output_fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 128);
-		output_fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 32);
-		inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
-		inst->buffers[BUF_OUTPUT].size = iris_get_buffer_size(inst, BUF_OUTPUT);
+		iris_vdec_set_capture_size(inst, f->fmt.pix_mp.width,
+					   f->fmt.pix_mp.height);
 
 		inst->crop.left = 0;
 		inst->crop.top = 0;
@@ -281,30 +308,8 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 		fmt->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 		fmt->fmt.pix_mp.pixelformat = f->fmt.pix_mp.pixelformat;
 		fmt->fmt.pix_mp.num_planes = 1;
-		switch (f->fmt.pix_mp.pixelformat) {
-		case V4L2_PIX_FMT_P010:
-			fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 128);
-			fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 32);
-			fmt->fmt.pix_mp.plane_fmt[0].bytesperline =
-				ALIGN(f->fmt.pix_mp.width * 2, 256);
-			break;
-		case V4L2_PIX_FMT_QC10C:
-			fmt->fmt.pix_mp.width = roundup(f->fmt.pix_mp.width, 192);
-			fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 16);
-			fmt->fmt.pix_mp.plane_fmt[0].bytesperline =
-				ALIGN(f->fmt.pix_mp.width * 4 / 3, 256);
-			break;
-		case V4L2_PIX_FMT_NV12:
-		case V4L2_PIX_FMT_QC08C:
-			fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 128);
-			fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 32);
-			fmt->fmt.pix_mp.plane_fmt[0].bytesperline =
-				ALIGN(f->fmt.pix_mp.width, 128);
-			break;
-		}
-		fmt->fmt.pix_mp.plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_OUTPUT);
-		inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
-		inst->buffers[BUF_OUTPUT].size = fmt->fmt.pix_mp.plane_fmt[0].sizeimage;
+		iris_vdec_set_capture_size(inst, f->fmt.pix_mp.width,
+					   f->fmt.pix_mp.height);
 
 		inst->crop.top = 0;
 		inst->crop.left = 0;
-- 
2.56.0

