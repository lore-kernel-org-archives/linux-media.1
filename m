Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795466053;
	b=MYooFtpBauCtMD1t95fGYCYbmUV5BVn0Lpg8YExciNN1D7m9TjhA+yuSy49eDhF6GSPA
	 5PeKqxWq1DUqoJ0/tfYHOuEs4SqJF2eI7b9hA1nWY48zFqeispdJxZFrsxyjL+KEH4YUy
	 86hoKqUNDPU6xlCGpflx8AhyBPSqkpAnnH5rxFdpx9IN36KlnweC5tlsx8pP+aR2eNn1V
	 vUcPRspej0zzFGVlnsV9dGTMVWpjlkvlDldMbgE1uHyA6qhUjhHALNOsi9lDQCRkeAMP1
	 PXR+9b3cbZcuJ3cPm2jh4jc4JW2c26Za1qDFq0L/2rVIaTmuo3OoMx6BBUYRI/K6eoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795466053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=veXzAwmEVfaxeQ226TGV88z3qOLGC1lncdwhds4Uw+A=;
	b=psQRotsBF4WmaVO1k2U9u0EK8ybGa0w0i2zJKnduOAI0jKFEK6Y2MdX9hO+Hg5fp71IF
	 TtvsB+lINU8HnyW0Q52A8HGaaNpaToenNJfNwP7jFBhwrX1aDq0GtOy6G5Rxwr2CQY9Dz
	 7PSt6gICjvmwaMmzSyW9I3MQxwsqmr7XwfqEHKfBblT49ws/YQJ2KvF0J1JUNnm3xN4gW
	 rrj3uZoxXHT+4/XD7aT74/vA7yUMwgyQfYZbpB3eTfyZ4zydf6dUlXT1+jnVH3yW+mdov
	 9sZSfUBEGw9cUFTP553uvqhRFeSjPHlvtPnVtHE6qAKZHHfYyfTrhjDkqze1WuSKAsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j9Lonnad;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3B6606A699
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 20:34:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD3B6606A699
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j9Lonnad
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso46189135e9.1
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 12:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795466051; x=1796070851; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=veXzAwmEVfaxeQ226TGV88z3qOLGC1lncdwhds4Uw+A=;
        b=j9LonnadtBhcTf4uh0U0BZsh53ugsoPcyeMsAx4M8zEVoUIQZWgx4sd536/f4ke42W
         lzpj1Ltt/hVcEt2NDsDcjBsjhL6TXdtnvHQMM6vxeTXSbmsmCnrbv9f2vKNLe2soN22A
         xBSpTQBvE0IWZwTBwqSReay0ZHWtXtnruWfGeur0k1HgM0c5idG2KW8x5QJpC4dNUx2D
         nLCHdA9w2UntGxU/xuBNR/F2HFG3eohxP+9a9N1MJF6/6vo9XkTN+coK4w3WIriaiLOu
         pPkMuVQgWIesEeKg7fWMjPwkWRDjfxCg5grGIMotONuHmg050PYWgRr4AFL7LyhxCeFn
         Pc5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795466051; x=1796070851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=veXzAwmEVfaxeQ226TGV88z3qOLGC1lncdwhds4Uw+A=;
        b=RJ1bBbEnpmn2obO0w6twP9+Ja7ZuCC52I/yLo6Zov10llHxvSHABC+Z+Wo92lWzfnr
         zyzzVFxwRlYfpLgovxcgt5lLBCOLkP8+6KkiLZzZwmM/5wucgjjleq0b6Uvlqa5e6adL
         ED06c1iL2brojW75MiURRgdIHNfH8K9B7T0SxlQ5whU0JQUtDfkhz3FKwPu7jeef0IQ+
         t9Es2dBycMJ47MFUEaAzsiGPbVa3quFbpemgIkc6M0T4WVdJi/bVjLkshTYTxVv3a/hQ
         g3DXHUwoZp61CNB4oKzgciCSVu4UzK40pjGUPE/v6sk+OKYfsztJCC0XT2UDXdkF8K8y
         +1Tw==
X-Gm-Message-State: APuU4Z9YpsJ0UZxN3vpqpeNITcXfY01GnBRTqCwitc9YLArfFbFhD98D
	KCB3KA2Cv1airIMURDpA5p1i9aZfkbQM2H0Aa/+q145Lw6O1x2FgPUHN
X-Gm-Gg: AZFdTZdDdqSDrAh1Kq+rJFhGVgANhcj5CX+bJMeaGEnhIBoewtDA9rwOsEMeVfmOOwe
	dRJZZsLCBiCO3q605aXEmq5JLHh44NCU/QhsZy1fXStVts82oSOqoJ1D6yNGREm2bfcre27At6V
	QOh/E8CddHKDnYFz6Rf8USbDW225plexEClCJSE20hpviN2kuMepJMkDN4CJtsN2D5fXteDaWAt
	NSWyvOypfSKoZJoqpXOgQ1bfLZ0/9bXRqd6TNeuTfuCnHAuvUvHEzwtVGmceyPnmhWjnTmJ6UTh
	Lcf49nPhOIlgghqKNasZHc555agDF9+fXkohNPtwUTYzsWfCVfSnFHmWnr0QVO1Ybfo6UEBNze/
	rlcn2cd3XYtVpG9/jcNAVZURg0ie++I0nUsbcqhzu8GX04ab9udzMFQuNZr6Z2myM4Jirvcvp47
	xZFOFVwFATsnn16c+0JMLDGhjbR2TrK5IGz5M5PfDtnbr+QoZr/KgABMmumYVC88/4kMqf1AoUH
	Arefk5KrvU8ZK2hycTzy0hg3rPCsu7AiqxZQA2w7EZcGeop2yWen6grsTQIxn8LRjw9XpDCmPSv
	X2Yt7cPfRklZe/D5J8xdYNVPNUTSL4+q5fo//MuFuZqsV7rMTk0=
X-Received: by 2002:a05:600c:1548:b0:4a3:5aea:21e5 with SMTP id 5b1f17b1804b1-4bb887fe7e0mr275033015e9.9.1795466051182;
        Mon, 23 Nov 2026 12:34:11 -0800 (PST)
Received: from unknown.local ([151.34.53.154])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm515946805e9.13.2026.11.23.12.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:34:10 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
Date: Mon, 23 Nov 2026 21:33:54 +0100
Subject: [PATCH 2/5] media: qcom: camss: Look up link frequency from the
 sub-device on the CSI-2 link
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
Message-Id: <20261123-b4-ccs-imx376-v1-2-2b26850a6f11@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795466045; l=2505;
 i=morf3089@gmail.com; s=20240402; h=from:subject:message-id;
 bh=SE9OTwNvO9+JP6HZCDsYQZuthYLCpe7RvJgDUw4zQ8k=;
 b=hp2zuUZq1Czsv84vJJBNUjKi1nRxNsBpPpdGFETpRZzJgomrKPLSiFPYImHQcAeT+XcHEeqRD
 dUfY47p4cu+CtXJ/2yK8asGvU6efWWj6ePDXG3u1MfbzlagG0IgUUpw
X-Developer-Key: i=morf3089@gmail.com; a=ed25519;
 pk=HsGrEQ3ia8BGGGO8/nUM2K2UX9JKvRPV+nbrVDGrYhA=

camss_find_sensor_pad() returns the pad of the first sub-device found
upstream of the CSIPHY that has the MEDIA_ENT_F_CAM_SENSOR function. This
is the pixel array for a sensor that consists of several sub-devices, such
as a MIPI CCS one, and the link frequency and the pixel rate are then
looked up from the controls of the pixel array.

The pixel array does not have a link frequency control, and the pixel rate
it has is the rate at which pixels are read out from the array, not the
one on the CSI-2 bus. The link frequency used for the CSIPHY clock and
the settle count and the pixel clock used for the VFE clock rate are then
derived from the wrong rate. On Sony IMX376 that is 800 MHz instead of
400 MHz at a 500 MHz link frequency, and the kernel warns:

  v4l2_get_link_freq_ctrl: Link frequency estimated using pixel rate:
  result might be inaccurate

The controls describing the CSI-2 bus (V4L2_CID_LINK_FREQ and the CSI-2
V4L2_CID_PIXEL_RATE) are those of the sub-device that transmits on the
bus, i.e. the one that CAMSS has bound. Return the pad of that sub-device
instead, as the other CSI-2 receiver drivers do.

For a sensor consisting of a single sub-device the result is the same.

Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
---
 drivers/media/platform/qcom/camss/camss.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index c54185c93a8a..cf86bf04dfe7 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4513,6 +4513,10 @@ void camss_disable_clocks(int nclocks, struct camss_clock *clock)
  * camss_find_sensor_pad - Find the media pad via which the sensor is linked
  * @entity: Media entity to start searching from
  *
+ * The sensor pad is the source pad of the sub-device bound to CAMSS, i.e. the
+ * one that transmits on the CSI-2 bus. For a sensor made of several sub-devices
+ * this is not necessarily the pad of the pixel array.
+ *
  * Return a pointer to sensor media pad or NULL if not found
  */
 struct media_pad *camss_find_sensor_pad(struct media_entity *entity)
@@ -4530,7 +4534,7 @@ struct media_pad *camss_find_sensor_pad(struct media_entity *entity)
 
 		entity = pad->entity;
 
-		if (entity->function == MEDIA_ENT_F_CAM_SENSOR)
+		if (v4l2_get_subdev_hostdata(media_entity_to_v4l2_subdev(entity)))
 			return pad;
 	}
 }

-- 
2.56.1

