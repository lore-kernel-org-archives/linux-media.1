Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795466056;
	b=TOdmlsID5bxRkt7yc8vr6pBgQ/+2+Fqj3kIUXQtuemJ10ERGxVFCrMB7OVMEwzeTTxks
	 I63GxAnzvd8hm8fztAcg/lyKnSpnNaHuS3EzQ7t06Ln1hrc2qPVHWPj8t2joIZGUfhsnC
	 RE/9JtSPFLNskyCUE6zvR3hxrwe1OCPGKuLFccMFVRVpWymMJNQDEnPEeZ4LGSostvhRX
	 AfUBaVLEgHgCTNqaltIkcNzQeYqpPoE7READMz2pNIA+QMcS4n3+lPRky2YufJVkC4PBF
	 j4sU8TRNym79hy5BdRKgVKYHimnnAZb5hdCrH21RzApJ7ddxb/z1aAOimKkMUoSmF7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795466056;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=jmJspXYhqF5Ifm6vBoYFDWnnVcY5oxgK5Qh3Vesxuh0=;
	b=AJq5GioxWi76ljAf65p3Bcs27DRTakZKycfa2Rz5p/RzISDOxTMrLfqFzo6dlyEqnifZ
	 rO/K7fWVLXOat2Ol24/smpu6DT4J5dh+zQ9wEd+Pfw2yM8eNfdSgyBVzibDKDlGnopc5l
	 q2+cQJfCIXD3Inj5JPnZyhE/VuboUd3AGg0rsGLYqXa0F4S/Y2wPyABM4zai4WTuc770a
	 lXbklFekrSlBTvS4I7eemQQYTKFENZWrP5wgNQEYd2nrV3Ub5ekpdla9adcuP3yJN1/nW
	 dMhOvHX+xXemzZpuV81v2HK6fdCb7fZhujRTfx34pyvcaaBfpII1qbXGNhwlZkVlQqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eqHfWJa9;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C5860A260E
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 20:34:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5C5860A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eqHfWJa9
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so36604375e9.2
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 12:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795466054; x=1796070854; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jmJspXYhqF5Ifm6vBoYFDWnnVcY5oxgK5Qh3Vesxuh0=;
        b=eqHfWJa9Wea/Fb3/RD4KYoNZlniZ37XLDzgSuVOIwm9447N4+odJLiA9+zkUe8O7X8
         pK0pzNZwfoFcU2dNJid5h6+dBt/TBAwVz5J5T6E+Boe72nNC8S/RYIm3Egeli4/IEMgA
         kMjdkocnsr/jvd8VxembzJJFNYf+KCwWAEdQP5wt6SiDf20JnQi1dTcd+XnXb/P19sdj
         mlD2MvXC8CBGvpHU3jm2kIMGANo69DZbATy6WMiPUyFHx4o6VMlPn0bU5asxKS4JoHHh
         SRDGprAGom/o6GTtJv7uVF3N3HmCr5Me8w2SGAictAeM4pxXxdh5NZwEa1Iqxd1MlJ5A
         eZ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795466054; x=1796070854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jmJspXYhqF5Ifm6vBoYFDWnnVcY5oxgK5Qh3Vesxuh0=;
        b=bli3a6xmbn8JLsQHgtYr51P/8OqVcxpJMaNWQ2AlNkbXICg1z1Uungbm9BNRAB6+lS
         WqoyTuS6ntmXItJVf3Z44MweZd1GrqBLDNfh14lChtIqvbDLq+v27fE0tg3rQpNIFZxG
         f7ton/zBQeUGNV1fEqmdMEi5hkmgLdiBzda9IkgjBJ6ezwslO6EU8pDK0iCL+HR6swJi
         4tPXXj5BVR6Ywc3av7QkSoRSo6S8opoXo/9SvPltND31AEAYCRIWDd0nNtPvPTIDHy8c
         ZrVOLwD6Uql2IZ62tyVNQejzXUyfJD5CWDAX8NKOdnEUV0ku5TWRSqiJGzXArQQQ41cR
         +Z7w==
X-Gm-Message-State: APuU4Z/onrRu7rwxBDTPUuAIuzOLRPLzYqkosXSu0Rp8Hr7SXPaa2bwI
	RnqprNM/pd6CaHpKb+iHPWBHH4TYsIGqi/a/6x7sDXNm1A2ZCADkqoIu
X-Gm-Gg: AZFdTZcW2GiGS5/2Yq+WGePjTFVUYS+iH6ARoVjdRcmVxbMTvAURersn6Nnjyc2HBhH
	gnJpLnvPByc0by6iYWH9OlmSlft8JV7JUei9MAVVG7LkU8LC35R+S44Tpi0reojN8I8Od5m/SNs
	kyX9JT1LpY51pWWvuDgVGbJTTVB43xmhYwZfi6N12UQcFeAtU08JAu0kh3iFVoTP3CqPe9e9tKU
	/309s/90RNhdDjTeeK6OLoh3zGAzpwLKfLFOQazyrjs8bYvVh44amH9ZAblAIMrCFwRyIf3CyAj
	dqkZmsDhjhNTwhDIIGfPig6izUKviJS7xCuf8k86jxqAorVQKLi7YWBu3dOOllZkakdXSRzckbG
	IhY/XObokxEorodwAilYMO1MKAZMAC3PuRHCWY7WzKT6nde1BE81Xx5x8BGVES8sdNDdtOhVWnC
	HyQd4RlCdsdpQZDhXiWnPemN7nsQX2L0m3QRqCSPuoQ16DB7TqqCSjxpTM7hMN5vIo/4CN8m00F
	v4/bIm/6F/cDdjYsjz2FFaDYrqLC6LhCAiWw3+C8HjwcA5u0HInzu2oLnM2MDHhg2VNesr4HD7w
	YpmUysBSHhbr5t3BjyOcCK8XK1Hak40=
X-Received: by 2002:a05:600c:820e:b0:4ac:da92:2bd4 with SMTP id 5b1f17b1804b1-4bb887c9936mr256814445e9.1.1795466054054;
        Mon, 23 Nov 2026 12:34:14 -0800 (PST)
Received: from unknown.local ([151.34.53.154])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm515946805e9.13.2026.11.23.12.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:34:13 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
Date: Mon, 23 Nov 2026 21:33:56 +0100
Subject: [PATCH 4/5] media: ccs: Make the source pad format follow the crop
 rectangle
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-b4-ccs-imx376-v1-4-2b26850a6f11@gmail.com>
References: <20261123-b4-ccs-imx376-v1-0-2b26850a6f11@gmail.com>
In-Reply-To: <20261123-b4-ccs-imx376-v1-0-2b26850a6f11@gmail.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, stable@vger.kernel.org, 
 Gianluca Boiano <morf3089@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795466045; l=3197;
 i=morf3089@gmail.com; s=20240402; h=from:subject:message-id;
 bh=AfhBJJT/dYmW+sBV6vyFvVaWagbgV6JhE5LC9kE6/9w=;
 b=nA+mPZum9SfgJ6ZaFHnBsjvxZSARCOiB7wSvuXdYHv0c3WlskBv1F9e4K0z64Lp5zVi/LfWCS
 bsfvfP9bsrpApXIBaGZJ8QAEOn0BW8kIsqyx1hwoN5rRmPBZz/5icF1
X-Developer-Key: i=morf3089@gmail.com; a=ed25519;
 pk=HsGrEQ3ia8BGGGO8/nUM2K2UX9JKvRPV+nbrVDGrYhA=

The size of the format on the source pad of the pixel array, and on the
source pad of the sub-device that is the source of the CSI-2 bus, is that
of the crop rectangle on the same pad: the analogue crop of the pixel
array and the digital crop at the end of the pipeline, respectively. The
format was only initialised from the pixel array size or the compose
rectangle and never updated when the crop was set, so after setting such a
crop the format did not match what the sensor outputs.

As the format of a source pad can not be set from user space, and the
format of the sink pad it is linked to has to match it, link validation
fails with -EPIPE for any crop other than the full area.

Update the size of the format when the crop is set. As the size of the
pixel array format is then no longer its native size, use the native size
as the bounds for its crop.

Fixes: d8bca3ed1d70 ("media: ccs: Use sub-device active state")
Cc: stable@vger.kernel.org
Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index a4af27de5453..acea07d906f3 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -2541,6 +2541,14 @@ static int ccs_sel_supported(struct v4l2_subdev *subdev,
 	}
 }
 
+static void ccs_get_native_size(struct ccs_subdev *ssd, struct v4l2_rect *r)
+{
+	r->top = 0;
+	r->left = 0;
+	r->width = CCS_LIM(ssd->sensor, X_ADDR_MAX) + 1;
+	r->height = CCS_LIM(ssd->sensor, Y_ADDR_MAX) + 1;
+}
+
 static int ccs_set_crop(struct v4l2_subdev *subdev,
 			const struct v4l2_subdev_client_info *ci,
 			struct v4l2_subdev_state *sd_state,
@@ -2556,7 +2564,9 @@ static int ccs_set_crop(struct v4l2_subdev *subdev,
 	comp = v4l2_subdev_state_get_compose(sd_state, ssd->sink_pad,
 					     CCS_STREAM_PIXEL);
 
-	if (sel->pad == ssd->sink_pad) {
+	if (ssd == sensor->pixel_array) {
+		ccs_get_native_size(ssd, &src_size);
+	} else if (sel->pad == ssd->sink_pad) {
 		struct v4l2_mbus_framefmt *mfmt =
 			v4l2_subdev_state_get_format(sd_state, sel->pad);
 
@@ -2579,20 +2589,21 @@ static int ccs_set_crop(struct v4l2_subdev *subdev,
 
 	*crop = sel->r;
 
-	if (ssd != sensor->pixel_array && sel->pad == CCS_PAD_SINK)
+	if (sel->pad == ssd->source_pad) {
+		struct v4l2_mbus_framefmt *fmt =
+			v4l2_subdev_state_get_format(sd_state, sel->pad,
+						     CCS_STREAM_PIXEL);
+
+		/* The size of the source pad format is that of the crop. */
+		fmt->width = crop->width;
+		fmt->height = crop->height;
+	} else {
 		ccs_propagate(subdev, sd_state, V4L2_SEL_TGT_CROP);
+	}
 
 	return 0;
 }
 
-static void ccs_get_native_size(struct ccs_subdev *ssd, struct v4l2_rect *r)
-{
-	r->top = 0;
-	r->left = 0;
-	r->width = CCS_LIM(ssd->sensor, X_ADDR_MAX) + 1;
-	r->height = CCS_LIM(ssd->sensor, Y_ADDR_MAX) + 1;
-}
-
 static int ccs_get_selection(struct v4l2_subdev *subdev,
 			     const struct v4l2_subdev_client_info *ci,
 			     struct v4l2_subdev_state *sd_state,

-- 
2.56.1

