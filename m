Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794405230;
	b=ZcDOHfgi9g9EovId0wnING5ymsgpH0WWB5kOSUrHf0E8ao00WO0EOX+Q6fYAj3vg5Acx
	 nKrF+s1gtODk5fF/wpicQIWBAoidHA/+2KjMfjKYO0OVRJr15I8DRw3ZLjWaT+sjj61EU
	 v/Ce56WJZiS3AgFBoiUSJiTcIpWsmJiqHTyyPq/InZEDsc+B/TIOIlKbxHOeYCmt2Up7x
	 qxy437laH/2dQa2KZPSIRPXJss1f1oMRrYmFy0G8HZHeUoldxD0xNkSaWc4L1tHCvSPdV
	 cl9bcmzIxapIhCFI8At5AQMq4GCQxUqEuEr/CCImagRkYWpo7m54STtUGIzriVIk7bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794405230;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4LnKOcOfjOxw1Gy1LWaPdnyzL4eZDSNOc7K6l6M5+J8=;
	b=tiQuJ2soZHKaTUCnupYNYHDD1RZrqBvitju9SW7+CPmmI3SGqogOOFKBuBJM+IDJIIxT
	 mifZVfOcP5QrC3lZhds7caaU+0z0EYM1/s5K9eOq1yvUEcOEZC2zPgKpy3KI+tuYd4yfJ
	 5Hg98PPuiirh8FrO9PXfkSoe424bMAass61xoyZAtgrsoOFqW4ZqeAMPivK4VG1NOjP7a
	 sa/ITpC+PrVx45tCNeCrWUHwThtzdt6dBWznv24PUm9oVhjApvqPerrvzsBCHpKOvyIk1
	 +AoTgDH9wfUZmHbsN4bGd+bmqWlVWpt0S7ZIjBxJBmJ3okg6QNgyRJjulJpxEDdmTug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fatecpompeia.edu.br;
	spf=none smtp.mailfrom=fatecpompeia.edu.br;
	dkim=pass header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=mSGsVa6M;
	arc=none smtp.remote-ip=209.85.217.44
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E42606A326
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 13:53:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79E42606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=mSGsVa6M
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7d2bf046ceaso1733708137.3
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 05:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fatecpompeia-edu-br.20260707.gappssmtp.com; s=20260707; t=1794405229; x=1795010029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4LnKOcOfjOxw1Gy1LWaPdnyzL4eZDSNOc7K6l6M5+J8=;
        b=mSGsVa6MpoA0wwqqzUZGMS1Cfv9b3he1UpVvnji8ex3161GXzP8G3PSlbdn/B/btrX
         l8/vnWATVYuPA3HS8z0UDdJUfoRyx+xa/spzUi40IhdYjJsPA6/A2MjGqNY1S00yxV/e
         gnizpnEGwfgDb5fD7rq4QfQE8vWCEpNPPq7sanEvmRiBiQFqxpNanntt/dT1FeB2icgX
         ZDdxI53dBKUvN+IVaruho6evdWXTXVN9JyF6H8KXwbOpkfgoUNI+4uekWNFJo4OcsVdq
         +sJbBZKqNzi+Q3fpEydCUMLrKnzPJ5brap5CAznx+TV6yymxtvCITvpLvIpl3Z9HGGHu
         dD1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794405229; x=1795010029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4LnKOcOfjOxw1Gy1LWaPdnyzL4eZDSNOc7K6l6M5+J8=;
        b=NtjKStVBRcGnHa+Lomn9T5JfrbsFBm1zoi2+3omld0oOxvF8DdX5xtn7wwCnYuEtkQ
         37YQNTyaOqNlEQqQptbB0HFx41bpwYBhZDGTy5BjKkzyBXZS49OaI3KEdLPTnb0l7hMp
         3yGVB35inBhgqot97xBZcStr+Iao6qM+SP4pt99dVYwBQ078glt3Q7tql3oXxMdO1VPW
         EWwRewG/AL+6EfdWIZsPwoGkc8Xp8w/ya1Vz2/QJWXXe5JloUH3LFncZgnqb0AeYkjo9
         hF255gAVsOoLCWUTkyui8QoApIznaEDCJmcAfx44HoFPAYR8UG5JeIGdQOYuxDLmy35e
         Gs2g==
X-Forwarded-Encrypted: i=1; AL+hErEgJwJgq/umGrCjT2J9ir4WEoZt2EBGX7Jk/wNgS9OWToXPfKsVYB/NcqVV0jORPbOvS5YMZJ91F7oA9w==@vger.kernel.org
X-Gm-Message-State: APuU4Z9wHPGt1HvpgkjjfRF9pGOJj+chQ5MoC9wuQvk5gvglpe7RsiRb
	sf0s+RCBj84sC4hVpbCKVTJ+zIEkxFGr7SOrx0GSABdFlN+V5N8sdfGnlTziBuw9x3s=
X-Gm-Gg: AYBFou1aWOGdrpMFq4sG6/eVFB0FTablxZ+SBUGrOOMYJBVijZ4nlISyD4vNEa+4ll9
	+1j54DSbh8FkRdeUV6HPadcRCO9FAaOoBN186HgDX1peZTTxcs3ctmxhx8BUvHAqFOpa/pDSEEc
	xHz/cmy/ytVK29pNxa6HwVGYGVzywwC7BcvmWhT+X83RLSlggvTP+v2QNvg37+DmYp3yS6yewmY
	DAGGlwxr5HeP7gZFV6irQvohwV61ssUp2J4fK1NSsgpmhdrxoaGdLZ9qK7iwBTnpsQ+T1iM5/k/
	TJXgiKeewTge1xjKOIgOjNmZdbp033/0L/sRs3hZzPVC3h8VP30HOQUDmWEI0Tcr9UpxRAceNU7
	u0g5h+1TtL48SNC9xMGZ90KPA5Mza8a9hOXQgJnkHViY1ZHAAB+u0fGhhfbbyJSemY4HI2RBw6f
	Ijar/1rosA3sfbHTHD5WKg205EjYGxqawTee9biWTsx+FbIjajKauyH0L+Us9ZeCM5oJbZWAN3C
	WW8I28HGh4cMIPAFwbXu0+BGW8HRB8FU0WpOa1rDskO7ZYsd3XDuAFJ1lEfN3onmOJTOyCavM/b
	E28lHVq3Keek8wuBHi7KVNrmXBV10IEbiYenjixndBo2MzpHHMNE+aRkrtYAbGb2L6G66Tz77ap
	tkQU=
X-Received: by 2002:a05:6102:5125:b0:7d0:65f5:2bac with SMTP id ada2fe7eead31-7d50624044cmr789463137.35.1794405229433;
        Wed, 11 Nov 2026 05:53:49 -0800 (PST)
Received: from localhost.localdomain ([104.28.212.25])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d62241eca6sm786932137.11.2026.11.11.05.53.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 05:53:48 -0800 (PST)
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
Subject: [PATCH v3 1/4] media: qcom: camss: Use contiguous DMA buffers
Date: Wed, 11 Nov 2026 10:53:35 -0300
Message-Id: <20261111135338.27008-2-allan@fatecpompeia.edu.br>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261111135338.27008-1-allan@fatecpompeia.edu.br>
References: <20261111135338.27008-1-allan@fatecpompeia.edu.br>
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

From: Loic Poulain <loic.poulain@oss.qualcomm.com>

The VFE write masters are programmed with a single base address per
plane and then write the whole plane from there. video_buf_init() took
that address from sg_dma_address() of the first scatterlist entry of a
vb2_dma_sg buffer, which is only correct when the whole plane is mapped
as one contiguous range in the device address space.

Neither the driver nor the hardware can handle a plane split across
several DMA segments, so scatter-gather buffers were never really
supported here. The issue stayed dormant because vb2_dma_sg gives no
IOVA contiguity guarantee but still tries hard to keep the number of
segments low, and with an IOMMU dma_map_sgtable() usually maps the
whole table into a single IOVA range. The mapping therefore almost
always came back contiguous in the device address space, so reading
only the first entry happened to work.

Where that does not hold, the write master runs past the first segment
and writes the rest of the frame into memory belonging to someone else.

This recently surfaced as patch proposals enforcing contiguity in
camss itself, walking the scatterlist to verify that the DMA segments
follow each other, which amounts to re-implementing what the dma-contig
framework already provides.

Use vb2_dma_contig instead. It guarantees that each plane is mapped as
a single contiguous range in the device address space, one IOVA range
when an IOMMU is present, physically contiguous memory when there is
none.

Fixes: 0ac2586c410f ("media: camss: Add files which handle the video device nodes")
Reported-by: Allan Siriani <allan@fatecpompeia.edu.br>
Link: https://lore.kernel.org/all/20261104202313.72494-2-allan@fatecpompeia.edu.br/
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Allan Siriani <allan@fatecpompeia.edu.br> # MSM8226 (no IOMMU), both sensors
Signed-off-by: Allan Siriani <allan@fatecpompeia.edu.br>
---
 drivers/media/platform/qcom/camss/Kconfig       |  2 +-
 drivers/media/platform/qcom/camss/camss-video.c | 14 ++++----------
 2 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/platform/qcom/camss/Kconfig
index b51745c94..e1967bc20 100644
--- a/drivers/media/platform/qcom/camss/Kconfig
+++ b/drivers/media/platform/qcom/camss/Kconfig
@@ -5,7 +5,7 @@ config VIDEO_QCOM_CAMSS
 	depends on (ARCH_QCOM && IOMMU_DMA) || COMPILE_TEST
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
-	select VIDEOBUF2_DMA_SG
+	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_FWNODE
 	select GENERIC_PHY
 	imply PHY_QCOM_MIPI_CSI2
diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 0852eb6f1..5de6ff5ec 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -13,7 +13,7 @@
 #include <media/v4l2-device.h>
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-mc.h>
-#include <media/videobuf2-dma-sg.h>
+#include <media/videobuf2-dma-contig.h>
 
 #include "camss-video.h"
 #include "camss.h"
@@ -154,16 +154,10 @@ static int video_buf_init(struct vb2_buffer *vb)
 						   vb);
 	const struct v4l2_pix_format_mplane *format =
 						&video->active_fmt.fmt.pix_mp;
-	struct sg_table *sgt;
 	unsigned int i;
 
-	for (i = 0; i < format->num_planes; i++) {
-		sgt = vb2_dma_sg_plane_desc(vb, i);
-		if (!sgt)
-			return -EFAULT;
-
-		buffer->addr[i] = sg_dma_address(sgt->sgl);
-	}
+	for (i = 0; i < format->num_planes; i++)
+		buffer->addr[i] = vb2_dma_contig_plane_dma_addr(vb, i);
 
 	if (format->pixelformat == V4L2_PIX_FMT_NV12 ||
 			format->pixelformat == V4L2_PIX_FMT_NV21 ||
@@ -699,7 +693,7 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
 
 	q = &video->vb2_q;
 	q->drv_priv = video;
-	q->mem_ops = &vb2_dma_sg_memops;
+	q->mem_ops = &vb2_dma_contig_memops;
 	q->ops = &msm_video_vb2_q_ops;
 	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 	q->io_modes = VB2_DMABUF | VB2_MMAP | VB2_READ;
-- 
2.43.0

