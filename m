Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795466054;
	b=ZXS/8/nyg2EfaoEXYLDLWH6SI20PQJkRGFTACIPxNDGIWDGsLqr2Tl/mhdupOT94vEtF
	 iBeXRoDg9jNpKgc5GSUSJjY/PP4SOVjLYZNeuxh2wvTSfWwiLxPSxYw/rShoeBDx4H0Sf
	 KP0OYLnvgZ41bEzZ3IbMGyR0hS31idcjcu7kNdNQtxTvk/vtq+CCJv6NsPMLEf9zLvdgd
	 o6cjt7Tj1/7MxGg5HV83WHR5f44760FGKNEtWKLQsbTjvJkajWHRi8sZdCA/YQ5K1rO0L
	 hOcHz0gCkxE/79A7XIgbSQVz2ZseNZbD7t1K17N8KVBufET+cAq6giOxac6iI5UdUyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795466054;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=6OR603YV4U0OwPPTqnIgdhTgPtFX3ZXpQfBjAD1u2oU=;
	b=YSUghlVCDgaQxhYz8rSdBf9EKZj5MQmH9t5k5+PeHfPxxOm8ziB/JRmB+91QMsyi7Wc+
	 XYfCbobZqcL49ZZ/IOTkp2LGgTOlaKKkBODM/WCRtYcxQ9qPo6EZfHCVU+XF4YWrP96VS
	 CMIC6WUSz2mZPuCk3W6uqmFEcG3OIw3ZIL42DYjZo9YYZJ1qAYLoyyzM/IQFsegyq3QvC
	 SaMrJah3DFar2msyIIU6/dJo7bDA/du4gFbfM5jR/R2U98B29S/Tnc1NmnJ4c+ZIUymqj
	 7LsfOZrXX1et7NFoSwvlC5I3jH52JUV689mjHG0Uvz8ICTUEnqhKNeoaz8uLRxk0f0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z8KvwE2H;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F426606A6B3
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 20:34:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F426606A6B3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z8KvwE2H
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso42665855e9.0
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 12:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795466053; x=1796070853; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6OR603YV4U0OwPPTqnIgdhTgPtFX3ZXpQfBjAD1u2oU=;
        b=Z8KvwE2HmbcjiuKTw78Oy+YNYHN8GNMgYBZwyBWDc/CS0fSAzLEia6d20eoogHK0Hn
         vOuMZc1tGZkHl7DRiiN+t3bG2IFgC252SnyjViZZKXxG9fRFGcYKfrBO+gk8UHSk3PWe
         S4iem9nIFGhaqX9NQ4Js9uiYZ1+inGXClZv/XXVbBl4Y69Qr784kcrIcx08WVIOgzljm
         plrZjF8lPFXblMkh0/Wvq2uMJQ9p88D/hQep5TZFnT808MyazsF/ICLskauneupXUkER
         9bkaRo6Qx+GEcxY/itzEn9R2ug2yuZuI5MRf0EGq41C1Fta/MjuipuTd+qCOu4na/voY
         H/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795466053; x=1796070853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6OR603YV4U0OwPPTqnIgdhTgPtFX3ZXpQfBjAD1u2oU=;
        b=A2BUMXEz0jr+ySBIkiEMNDJ79yZ0zGRvLFHW3hJCaVBJwkjIq3yulSvfZIktAYLMh1
         kHb8SINkx7FO0saFbsxZIhVaLlfSBVrjXuH0DB5tM9Ul0D47mVHpengHwgKAaCgJi38Q
         +KqFtbKkA57xnvTI2nxklE8saifYB+Q3UqgtLO0ySqpUCKqoCXRQVMvVZQpOiWgoGP6b
         Cn3bBPPeP/MOuC0lMT2wAQa1gsW5DY7gspIci/dRP7m4HBN8hN/WcW5WvvpGvM1M8H1H
         ubmcGX75/jmn3IiNSqviJtVhgUw6WqgRFH96Ww3GhLcrg0vLl1M6nNPbnefbhSAPUnE8
         KJow==
X-Gm-Message-State: APuU4Z/4Rg+v8600iSLPvxBCpfJsTaHJTjuihefQNSnxyK4/+BkI9ojS
	MdD8C4nMPHCrvjWF3MzMiNwouNMIZPhHwMrQELqvQe/vsrYdmo4W/63F
X-Gm-Gg: AZFdTZedkLHTxRvJzwcsHUdsEH5ax5+IXj0kXfq+I26pT2u7WUdeIPAl/DxEDGLYayz
	6kivZopW9qOgmGRZJt0kKlK1VPrm39z1YANoEW7xpCXP9UKUTrGb6Kb1lZnszdXad6DJPqnufg0
	HBJOzHdBPVxgG1yqusV+fdQz/fH0N/euQkEEHpmOokRslhsIS4JSfBWpkSh6M2Y5+vvyrhqZVp3
	6gJeWuqJpSb+Nlv3hexxiF68opPeGskkFZa8RXmlXmjHnOxw9fbtEGAwMzVlTEhazliCyzqmCzO
	Mkc+0SonZ6BbkU8nqfHM3YsmR6Hx5JGqc0lxNFUgVZ77dJLwZfUOBAXCGztGczfkaTCCz07qgjl
	LUtkSYvrf8XZ0hmUKnW11yrSznWg1qgQqMcvit7YcEDqPvbYjtIZI8vSQN+ARumV8kaBIwHR6z8
	Bx+7NzRWXJUHqDvawYbkamTryM35t/rWUqgVzisbTgb4gi7HfU47u0UlqwADRMxdVJCAjMoh4pN
	cOkqBcFhcQtEgzo9Mbm5vgI6qduU8OPgkVhxIWD9tyzmvk/9Dyq8fPeaBT0v3Dn+9SjwjtEjSVt
	DBuRLMtAFasmTWUA730AEhRykSXlGA==
X-Received: by 2002:a05:600c:1d09:b0:4bb:66fd:ad68 with SMTP id 5b1f17b1804b1-4bb888160cdmr275019355e9.14.1795466052668;
        Mon, 23 Nov 2026 12:34:12 -0800 (PST)
Received: from unknown.local ([151.34.53.154])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm515946805e9.13.2026.11.23.12.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:34:12 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
Date: Mon, 23 Nov 2026 21:33:55 +0100
Subject: [PATCH 3/5] media: ccs: Store the format set on a sink pad
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
Message-Id: <20261123-b4-ccs-imx376-v1-3-2b26850a6f11@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795466045; l=1782;
 i=morf3089@gmail.com; s=20240402; h=from:subject:message-id;
 bh=4SRiFW3bBAJ1IlBIN9DDyNFw3BbzT3m+KdYlz1JrA0Y=;
 b=l6DYb4OFrWa8aj8hDAV/Ql3Ppfpp3sLbxSS9XESSX/YP2O41q74bDTNHZvj54ZnsZPqr/xJx3
 rqMTCmBBAI2BQpjfkeyJakYJMMHHDCYCa1+p9Lfedm9CmP0aFocujWP
X-Developer-Key: i=morf3089@gmail.com; a=ed25519;
 pk=HsGrEQ3ia8BGGGO8/nUM2K2UX9JKvRPV+nbrVDGrYhA=

Setting the format on the sink pad of the binner or the scaler only
updated the crop and compose rectangles of the sub-device and its source
pad, the format itself was never stored in the sub-device state. Reading
the format back returned the one set up by ccs_init_state(), i.e. the
size of the pixel array, and the selection rectangles, which depend on
the size of the sink pad format, were bounded by it.

Link validation then fails with -EPIPE for any readout mode that does not
output the full pixel array: the scaler's sink pad format is the pixel
array size whereas the binner's source pad format is the binned size, and
there is no way to make the two match from user space since setting the
sink format has no effect.

Before the sub-device active state was used, the active sink format was
stored in struct ccs_subdev (sink_fmt) in ccs_set_format(). The switch to
the sub-device state dropped storing it. Store it in the state again.

Fixes: d8bca3ed1d70 ("media: ccs: Use sub-device active state")
Cc: stable@vger.kernel.org
Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 1cc4350856fd..a4af27de5453 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -2275,6 +2275,9 @@ static int ccs_set_format(struct v4l2_subdev *subdev,
 		      CCS_LIM(sensor, MIN_Y_OUTPUT_SIZE),
 		      CCS_LIM(sensor, MAX_Y_OUTPUT_SIZE));
 
+	*v4l2_subdev_state_get_format(sd_state, ssd->sink_pad,
+				      CCS_STREAM_PIXEL) = fmt->format;
+
 	crop = v4l2_subdev_state_get_crop(sd_state, ssd->sink_pad,
 					  CCS_STREAM_PIXEL);
 

-- 
2.56.1

