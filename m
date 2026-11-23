Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795466051;
	b=uxkX/D2SB6a9vfJuRQ1DSNwTTf6d/P/LYA4pen9wRKDDDpug19rUIUThzeDEhggppx65
	 iP1BHL/ref6s3QCzjfraDhe122044Bj6gjPvqj+tMfxzblJzkW3yfJnTc/jfTSGdejuAT
	 rlbe9RsmeHhLfMaRM2tCiJLM4p6tX927j18sc13nrMXV8B+WVWKyP7c8F7LHvhVO85tsR
	 Ro6FKUaJCT8CSFo0joqpKsqwikfzp7Cujbj9bxgprvD7kApXQ/GtxAH10EwSKTSmkvZKv
	 Mv77uugYE9ueCKkXfkiFjAvI6yIEIJK6Z0EwcRxkB0FquOGf5kylALtjof+roTirZCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795466051;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=aIw52i3FBNaM3JlX95PdSZS9UEeuj75BOGnG58YJQCs=;
	b=AoZcmqey136c0qKyILgpz69GiRqefEcXP4bPgwKGz+Oo5UsTzH77OjaY6Q4Orzx6PdlZ
	 6KBmMjieQQaQS3iA/FSFBy+Y20OKzFDtd8sGXsa4368YvGeT4z0TOg6bj8o44U2V9wlv9
	 HIxyzJn//7c8v17v5aA5tcBZ9oVMfVXOCJ7HCedA9HD6fyNTF3vHqNlFP80R59iRRBeCq
	 sxzp/nJRhwmYu7FA+asP3JtmLwsWdYAuCgkHgXUd5WysjAaP5V9rffWhAvEEWUX62ymjr
	 lsjUJXQ96pWsl9V57qQBp+zd6/9UPj3CYV40bT0fItZns8wiBVnAQyV9xlI/9QXJL8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aIdd2c40;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F963606A32C
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 20:34:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F963606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aIdd2c40
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-492690dd5daso2864861f8f.1
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 12:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795466050; x=1796070850; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aIw52i3FBNaM3JlX95PdSZS9UEeuj75BOGnG58YJQCs=;
        b=aIdd2c40s7v7UqrYtMn/jdUeRjG7uf8VxYLfXRlPixAm9l4+qo6Zry/e6kW5iGuQXM
         4/4QjacbUa4z6jrFzYieNIM7FCZYdR5wA0z1BdcOXepZG+ucsqAktjaO4/HLL4LowQHL
         pWwSA/9NXB6tx3Muc4nGbSrho2WWMRPvv7tGDpOO86m6ixO7BgKtDgcdPGcK1iTp33OF
         P2RLNpMUhxb9Gyng/a2C6ur7+sxnjgVZvD1s0pvNxm7fBq/XCKdduImgG0m6BNW34Rxa
         7i7bTPnLoc0cuzhpnbEz4wD1Wmm6q3whg+F1cgcb2EbpIzVh16l8mf4QVQOpu306DGtM
         9mWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795466050; x=1796070850;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aIw52i3FBNaM3JlX95PdSZS9UEeuj75BOGnG58YJQCs=;
        b=lGklZUFbCHIiww4b2NvZmasNDb3h2JGtfrlmVpAOj+2SaPjtCvQlZJP1a/jYfsguIm
         z53iXPi8FcRBxabwbIlEdvpN3cwTle6ONX/late7mo5fcmNWppbhtaMWVBpoSq3qV4Lb
         ewCP55LZMaXbdKPnAeJ8DGMm5cNM7LQOPcKZrYTAAH+kK0sZl1w6KmOzxN19Gb6Z7Ztm
         iGNqwPCWNRbSAAVukSmiN/zpj+ILooDuDaKDDwwUQgGSa70YNLKlf3D70GrdyiUlp6Z5
         gvKgmnPT5SDhe9w5q4nSxMKqBVilP05PtlkHdVQDcJDFZEjfeJC+dbW224ilVaypdUYx
         Gh9Q==
X-Gm-Message-State: APuU4Z+JFjjgnXgPnlTm9gjTKoD95Zitl5U3Ur6QZq4Bj2hV0vgNuYTR
	5FXNUNb0N4DmKv2zjnhS662gefcudEHH0usL8/3x4XKQ8MV+UfCOeBXb
X-Gm-Gg: AZFdTZeph6nAMFFrVZtYLLUy08YgMnLYFOC16FdjSds/sibAWBcpwrj4KSE2xUscfgZ
	v0q+5c8PWIZ6Y0YQfKsls5bkxhYZFSP2ci+99nhGp+0ti3FDkk4qiUDJ4RfuhwuCkm/PY5BDblA
	h300HngoCK8wGVbrgluxmrYuL2K+yoPxHqvs42gaWirGoswNEAwV0JFfyxSvt8axQUpdS5uL8O9
	w7rDS6nz/8J49sq27+Z6D0FOXhfspK65JthDCwXocMXrmAz2A7pOUpy9w6tSCFKBNuFSypVuoVX
	8eYVsgzMnh2SKnd1Nob7tqoEYQr+Eia92/leb1Upo1nHUFGj0x0H85xXu3632igbgveZGyVYvBS
	s80unQ9DsO+xIrDv/UZ3dmPvp+TtnHWssW/IBE3gT664tRQeAW71mkFdamPEJvgarsqsfkSWmCR
	6OFFfrw7BK8RpBThNk6cZhtVEXPxoU2VBpbK5mCTK3i96iqIFyj9UuIHhD7EFxIzk8WB08Usf94
	Ygh1ttpYRR+mCA2HJcewlNoF0cEPFVx3KC1rTSXMJ+4q/RGTzcpByPQM54b7uoijDKWZepmIrkG
	76cFnnWpYqgpNoGEFfiQ6iucPGwPCQqnMwQ8amzmLB482cMCvNQ=
X-Received: by 2002:a05:600c:37c9:b0:4a6:eca1:7d5c with SMTP id 5b1f17b1804b1-4bb888251b4mr232152425e9.32.1795466049774;
        Mon, 23 Nov 2026 12:34:09 -0800 (PST)
Received: from unknown.local ([151.34.53.154])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm515946805e9.13.2026.11.23.12.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:34:09 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
Date: Mon, 23 Nov 2026 21:33:53 +0100
Subject: [PATCH 1/5] media: qcom: camss: Don't stream sub-devices upstream
 of the sensor
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
Message-Id: <20261123-b4-ccs-imx376-v1-1-2b26850a6f11@gmail.com>
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
 David Heidelberg <david@ixit.cz>, Gianluca Boiano <morf3089@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795466045; l=3624;
 i=morf3089@gmail.com; s=20240402; h=from:subject:message-id;
 bh=0Cz0qn0VW15LMMWXLllItkJYlosLYSu3ppAkBWYN+0E=;
 b=TYQR3uZ0JKNjjuCaIe/VTJRQvP3xRFLWYplEX4zBGUU1wNIBU22W0RXaFbVTKX689Platxtbd
 SSsPUfocmrCDCd0Et1KHBXKfdNGLdxFoh+XhRydbOr2NydckOtFuRjh
X-Developer-Key: i=morf3089@gmail.com; a=ed25519;
 pk=HsGrEQ3ia8BGGGO8/nUM2K2UX9JKvRPV+nbrVDGrYhA=

video_start_streaming() and video_stop_streaming() walk the media
pipeline from the video node upstream and call s_stream on every
sub-device they find, including every sub-device behind the one that is
linked to the CSIPHY. That is fine for a sensor that is a single
sub-device, but a sensor that consists of several sub-devices gets
s_stream called on each of them, not just on the one that is linked to
the CSIPHY.

The MIPI CCS driver is such a sensor: it exposes a pixel array, a binner
and a scaler sub-device, and the scaler (or the binner when there is no
scaler) is the one linked to the CSIPHY. Streaming is started by that
sub-device and covers the whole sensor. Calling s_stream also on the
binner and on the pixel array is at best redundant and, as the CCS
enable_streams operation only accepts the sensor's source pad, makes the
pixel array fail with -EINVAL, so streaming cannot be started.

This is not specific to CCS. Other drivers that have a sensor on one end
of a pipeline, e.g. ipu3-cio2, rkisp1, ti-cal, ipu6 and rcar-vin, start
only the sub-device that is directly connected to them and leave
propagating the start request upstream to that sub-device.

Do the same in CAMSS: after the first sub-device that is not part of CAMSS
(i.e. the one that was bound by the async notifier, which is the one whose
host private data points to the CSIPHY), stop walking the pipeline.

Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
---
 drivers/media/platform/qcom/camss/camss-video.c | 28 +++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 0852eb6f1315..71ca16f15dab 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -249,6 +249,28 @@ static int video_prepare_streaming(struct vb2_queue *q)
 	return ret;
 }
 
+/*
+ * video_subdev_is_external - Check if a pipeline sub-device is not part of CAMSS
+ * @subdev: Sub-device in the pipeline
+ *
+ * camss_subdev_notifier_bound() sets the host private data of every external
+ * sub-device it binds, i.e. the one that is linked to a CSIPHY, to the CSIPHY.
+ * CAMSS sub-devices never have it set.
+ *
+ * Streaming is controlled from the video node, one CAMSS sub-device at a time.
+ * The external sub-device is the end of that chain: the pipeline upstream of it
+ * is not CAMSS' business, and the sub-device is responsible for starting and
+ * stopping whatever else it is made of. Sensors that consist of several
+ * sub-devices, such as MIPI CCS ones, are not expected to be controlled
+ * separately for each of them.
+ *
+ * Return true if @subdev is not a CAMSS sub-device.
+ */
+static bool video_subdev_is_external(struct v4l2_subdev *subdev)
+{
+	return v4l2_get_subdev_hostdata(subdev);
+}
+
 static int video_start_streaming(struct vb2_queue *q, unsigned int count)
 {
 	struct camss_video *video = vb2_get_drv_priv(q);
@@ -284,6 +306,9 @@ static int video_start_streaming(struct vb2_queue *q, unsigned int count)
 		ret = v4l2_subdev_call(subdev, video, s_stream, 1);
 		if (ret < 0 && ret != -ENOIOCTLCMD)
 			goto error;
+
+		if (video_subdev_is_external(subdev))
+			break;
 	}
 
 	return 0;
@@ -325,6 +350,9 @@ static void video_stop_streaming(struct vb2_queue *q)
 			dev_err(video->camss->dev, "Video pipeline stop failed: %d\n", ret);
 			return;
 		}
+
+		if (video_subdev_is_external(subdev))
+			break;
 	}
 
 	video_device_pipeline_stop(vdev);

-- 
2.56.1

