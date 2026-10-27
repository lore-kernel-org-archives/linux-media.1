Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793067579;
	b=tBonpeLQX0QZH3zj2HUDp9Xb/B8vCn2DUbZNsDP+8Uqfrf+krKxPI/XaEfC65/Dgi6YK
	 fU/3/eKr5qwIOxLO6ycQqoDDV+RNbv4HWaPy3v9Pxq+kvVkrqD8cXHCdK8mZE95NXfpaU
	 pssMYdXsXTC43UPrc9nRv5pTlrWF/NsjJHzfTyXPlTlPaWpSXmvM53gvR7dLjWdgRc6Fc
	 1Cqap9s+kMqr7KZ4iQ2WNJ6aUlgGbWTUiRArkHUmZUHrYHlOSsUmTCz4R3mzvMkkVgp5O
	 hDXQxvvxw5FGrWscLxYRmZtrPq4C8emKZhr9bizzU6JApCB5QCHp4jH3evItPA4sY8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793067579;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rGJs3M9F82xCblFenHDo0jIt0qYw6QbBFb+UcxLWqpU=;
	b=sNgcrwaux1M9frf8wxV8vm/pJ3h127FkHX/wCHU1d/NoHT6V5RRyD8Bdc8VoazP1MswE
	 kc4YYwP9v5Csz9tiyi2eKr828ZxoH6a6EQXmx2KE1oANBD38iYMrrGJxjoSX6R72A1liM
	 99NdjVkrmL+BsD8XXXDOhcYfh7+IFddr6dd6oMZO1hwD8SH8OHbT0TTkrRPAjGAXBuDRf
	 9ZcjshHg8h2vs2r9/NN6t4Olm7GjuTgxpGW92gCN9FKEU9uee7OThp0kVz7BO6Fsg9Tqw
	 b2HI7ECKnkZyJli5Wenjn1SNvYQy3uMDEcKSZIvTkK4OEsOABTDC/1xH5P8VA+XYRWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="FytQ/h49";
	arc=none smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCD2606A323
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 02:19:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FCD2606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FytQ/h49
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-675617e81f9so3298861d50.3
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 19:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793067578; x=1793672378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rGJs3M9F82xCblFenHDo0jIt0qYw6QbBFb+UcxLWqpU=;
        b=FytQ/h49Nz1JtagSYrBXGqkyF0lxtTCICxee/P01w7ZJBZxW3yiFAwJAGUGiuw1tg3
         ZefVCnpJqtBK4fE/FyXSAUZ3lycXUOxZmR9nZFrmpdtOW5WWUbDjeZzpeeog9kKOpHCy
         8OEM9Vh040xMFbPlwhiELO47WE7Typt3J3uHHtcQGyvg9DvDAoFYW3dUENcYm7SA5ZY7
         CR+V3ZNfJqxDRGGLCQXdS6n4hSqK091JHhDdBWlVMGo5TrgCe9UPXTFYw5bIG/hU3Kam
         ZMqpHu0jCEEWzHwARhij7/5Ooe0aT1iBb8HqWTdH4JmPBy3Y+q5lsGnyO8fdBQkoPVRH
         Nk7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793067578; x=1793672378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rGJs3M9F82xCblFenHDo0jIt0qYw6QbBFb+UcxLWqpU=;
        b=Q1r57nbIghXylK5M7ONqtjuCYHMbU7K9v93CVEPZ95YViNMb7yhPrbQWOXfHc7TAgu
         0kMlsK9e9M5n9BO2Dv2N3mKJYQlfNyWB5+vuYSz/irruAQbPKeF0MvncdFq6xhQbEKc/
         4qUO8POrK78QMHtgfxKvB1MOmzM+0lTwJtlBXej6Xi3+bejODFzFna6Pi3oK7tGoI/2c
         hyvm9OeIrKm2a6LYHZ1Kqtj43kts9SZ3KrqqagDMmmawM1+YEk549+fRLR+2KSsQ1Ri6
         LvW4rS6MbAYK2e2TXUG2CvCLRKn8CAfOAx9TqKs7lZnDxSH7UFk4ttAyaFJGTCeOTqn5
         5QHw==
X-Forwarded-Encrypted: i=1; AKwUvBwtHFdtYVXbsbiBiqHBR5GRSEPVm+/WjenpSJ0wP2WyFhPG1IcNOzAPaTjXg3zyjiDtRQVsTIAh9sslIw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLx3EtTtHZ0t8nFvrQMIiWUtS5UkDES80ZYSx027IEZCQvDAERL
	eKKWjVSAcffcHNVk6Z8ZBOatUdEYQRSVUHz5lFDqh5db/EAn8hKwDdoT
X-Gm-Gg: AYBFou2iWQFXit5etnGY8SDX7rGQm7MIFYysMIdbVAZzfZ7D/MdItiQ99giWbqn+Ry5
	Ay2x+7iZ7cKGouy75JrMYaRqBI13kARIYuurYgKJbeY7WIEDxR4YmwbrITKWfJ8w/cKlVlZ+meZ
	bIu9vWemdkC7MjGwhoY1bXux9j4qvmUxlC/WnwMEg1tFgZWJVdIvASioKjJ2DFiQF6Wuiv7b2I8
	5FXYGgCNGTqVaed6BP6roagf7LlpyCC9BrOAIF8LvtTRWYmt57wFcWoWYQoLJV2itGRBzrv+Okk
	FCCe2B9lL8AEV9esSQgDR0drMbGyfCgZEzeB9DHkTv+alfhBljFeaVG2rpCqMIFlA+JCglxMs+h
	MGnzwnOv7v+IyfU7G5ko1gLE+7e0hPDrIJa8pLSRujtGxARNfCzB9vXpHOmAl2nnIYj5e2AL2Xj
	spdtI0dmrud+XVi4MD2adoxY+RlfGFDuhn+cMBtOlhf2iagmmeXWG7pt/G7v7dDY30CFJrEzmx3
	iMQqcK9RlHX+mElY28R9iDkshYhmU8CiYPqw6SrwbSmtaDauGGdkbNSGNcrof0EO1rfZ7mXerPv
	kW8YqmLQ9AE2xdc69E2mf6PVGnXpCqeu
X-Received: by 2002:a53:cf02:0:b0:677:cbfc:be34 with SMTP id 956f58d0204a3-67a454435a0mr4785926d50.66.1793067578051;
        Mon, 26 Oct 2026 19:19:38 -0700 (PDT)
Received: from localhost (h159-112-31-107.euclwi.broadband.dynamic.tds.net. [159.112.31.107])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a6c4f9312sm909426d50.8.2026.10.26.19.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 19:19:37 -0700 (PDT)
From: Christian Cortner <ccortner@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Birk Skyum <birk.skyum@pm.me>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [RFC PATCH 2/5] media: iris: Update the CAPTURE stride and size on S_FMT(OUTPUT)
Date: Mon, 26 Oct 2026 21:19:31 -0500
Message-ID: <20261027021934.22113-3-ccortner@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027021934.22113-1-ccortner@gmail.com>
References: <179306719855.20070.15625203453374418392.iris-rfc-reply@gmail.com>
 <20261027021934.22113-1-ccortner@gmail.com>
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

Setting the OUTPUT format also updates the width and height of the
CAPTURE format, but bytesperline and sizeimage keep their old values,
those of the 320x240 default on a new instance. For a 640x360 stream,
VIDIOC_G_FMT(CAPTURE) then reports 640x384 NV12 with a sizeimage of
147456 bytes. VIDIOC_REQBUFS(CAPTURE) allocates buffers of that size,
and iris_vb2_buf_prepare() rejects every one of them with -EINVAL,
because it checks them against the size computed from the new width
and height.

Move the per-format rules S_FMT(CAPTURE) uses into a helper and call it
for both queues, so that S_FMT(OUTPUT) leaves the CAPTURE format exactly
as S_FMT(CAPTURE) would set it for the same size.

Fixes: 8aadfd445373 ("media: iris: Update CAPTURE format info based on OUTPUT format")
Cc: stable@vger.kernel.org
Assisted-by: LLM sparse smatch
---
Reference only, not for merging (no Signed-off-by); see the cover
letter.

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

