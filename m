Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38752BDC0F
	for <linux-media@vger.kernel.org>; Sat, 15 Aug 2026 19:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786822726; cv=none; b=hl39JMfYxFCMV9DPXC5BDysBcfUgArQpikGQTZ0Tdx7hlH2ihczR2ufX2Wtti6wMVmyDilvH+FLNVjd3o2YXZzVlpqAmekcTHkGFjCoaTFKFDr3wnfHQXbRUtzksB1MY+/l1efKNye4Xd8KdRYxZfMVP5kQSs3KNNAxnPuqmIrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786822726; c=relaxed/simple;
	bh=m2/jhBAYg2/LawuSqK1sjJNSGD3aaB4RYTaRo3ybk8s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CSwO3njCQnTn5+R6+nBZTkf8j9TtshnvLqKmEedd0jWNt8VhRtr/JDXGrEhPUbT+KIsOQPwPH/WB2lY4Bp0Rr/V2r/OwR7didQ6IOaUXpgpzT+L19o1QjKw4+Bz8Nd/DSMREu0coCaBvECO0nXaxGSEqyiOgwbVpZPsB1kmNZoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=quwHRhxl; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="quwHRhxl"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49978908b35so17199405e9.0
        for <linux-media@vger.kernel.org>; Sat, 15 Aug 2026 12:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786822723; x=1787427523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eaUiQBv7IUsoP0lKzTE6/BdETxQ+RizUmTEW5rmY3XY=;
        b=quwHRhxlUpi5qslJfGtJAe4Ssdgl5NSWHCGzufE/bLT56vPK1UqDJtsQiOxEdKcATy
         uUIXLFgyet7FAI2edZaWDdGJZAb38fkHnATCcMHylxHsEOJRSamcteEmvRuXGLqhaJqh
         7Jnis00azx7zoiCFFN7o1NfgSZ8oM6WVGf2dtbwF6WlObeTJ2EHSobmiDSaIsut/5fbx
         8uo7WQez9XT6gX/SUYs8zLxl19hsSi87c39SgVnTfcQMTVebvESuH5KaQZjcSitn+K2d
         gBDpuXSjyby87b7wnCo4vsme/CcgXi3+w/IEijFuLUBR8chlJn2fq0R/lWh1YfesBK3D
         8JfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786822723; x=1787427523;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eaUiQBv7IUsoP0lKzTE6/BdETxQ+RizUmTEW5rmY3XY=;
        b=XZwWWdN58HdxVo4glEOgk16pmG00IPNFo+Yy0fpztpwhrR/Q6SlrHJuYjB0UQVTpqi
         GE0/tDj32qCwfHqVucOXy7wQwxoilqoBk83nxjEyBz9pHVnCQh7DfY1ovOP+syi4Ngye
         Wyfm2i21Ekvs6vBue+nIwlvRmGp6JvYniTaBclOxL4Q8PTpIQl6r4ygkrIFtbH1L3HZL
         dyYQ9gX4TvPTOgblzmXQrl1N5RSfKhRsKLs1q9RjTi+mwOaMqw4GgL002cmutZ7OWB5P
         KtPNPXIUfB8ZFHuci0ak4go6YegV6ZFamAUEs7GT3sk5vWRgDVWsdI7pKnncKNYhyh+7
         xO3w==
X-Forwarded-Encrypted: i=1; AHgh+RrCj1R5KyeNklhJ+7afsr36WiDiEN+v485szv7mK7IcVR879zO5AShFlxZrVfgBZX05FGsz0Jw31f5d6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbLDVM7824d5Lf7BXwYYAxIMvxuNtZhkkuLyHhphqVGNejczhA
	QZUF288v5XuFE1sKWYjHFNOHb4V9i7Jvmg5UrCQwfAsqaCY7tC9khpLnSihq+g==
X-Gm-Gg: AR+sD10a8ZA9JzxwW4+xfnySJp6MFGemgwsHWVrzkgqzd2tygilaiVPmUjOQ3OJ1MmS
	6BY+Y64qNmmOFJMB1R8ml3cnMXPkHQQ3+TSxTnTD4cW8DGDOwuIKxNXyXWgv7XDG4k7O/ssJZ9n
	wmVQxaGbthU9fSWbiN0LRSYxDhfQVz8M3c4yKDxxL/vwxEK9JgAcuIYXHVaEaC1IiApvqmkhOQe
	rgRVbAqm6Qv5qB/YOvpG3pF3owfEFGaGsPAtbD6VvwQABHDfkXJuScYZJD0ruVe7Wynt7Ixp5VF
	235iPnNqqNi/TCs9hLwcEvmq/udac004/hKNkQV0QZe3QpQRjLRNXK0RMJDrX6ZdV9y82AcAhAJ
	y08UrzdluWMrN0u6UeZZDWhml1XyQ8JLKCNj+hviVxNjbPeEP0zaaMU7hoWFY8fb31kR3STTniu
	m80ZW2xCkcgq/7a+1kyw84kbQsVioBHuLCSWc79DblOE3232aRDGN0nrYA0sMs2QL53X8rFqebB
	woF8VDDE/cxsobVYwv7785j00dTRGRab49c48V5WfJ+emGX
X-Received: by 2002:a7b:c5ce:0:b0:499:726c:d658 with SMTP id 5b1f17b1804b1-499879bb9e5mr156201405e9.19.1786822722856;
        Sat, 15 Aug 2026 12:38:42 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f15b946sm19640500f8f.0.2026.08.15.12.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 12:38:42 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Riesch <michael.riesch@collabora.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: David Carlier <devnexen@gmail.com>,
	stable@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: v4l2-isp: reject zero-sized parameter blocks
Date: Sat, 15 Aug 2026 20:38:39 +0100
Message-ID: <20260815193839.141406-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v4l2_isp_params_validate_buffer() advances by block->size but never
bounds it from below. A block with size 0 passes both the
block->size > buffer_size test and the comparison against info->size
whenever the driver's type_info[] entry is an uninitialised hole, so
the walk makes no forward progress and loops forever.

Drivers call this from vb2 .buf_prepare, so VIDIOC_QBUF on the
parameters video device hangs the calling task with the queue mutex
held. rppx1 has such a hole today; fix the core so the walk terminates
for any driver.

Require every block to be at least as large as its header. Blocks
carrying only a header to disable a block are exactly that size and
still pass.

Fixes: 3cb6de6fafb8 ("media: v4l2-core: Introduce v4l2-isp.c")
Cc: stable@vger.kernel.org
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/media/v4l2-core/v4l2-isp.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-isp.c b/drivers/media/v4l2-core/v4l2-isp.c
index 1eb46e080afa..760e16a5ba9d 100644
--- a/drivers/media/v4l2-core/v4l2-isp.c
+++ b/drivers/media/v4l2-core/v4l2-isp.c
@@ -84,6 +84,13 @@ int v4l2_isp_params_validate_buffer(struct device *dev, struct vb2_buffer *vb,
 			return -EINVAL;
 		}
 
+		if (block->size < sizeof(*block)) {
+			dev_dbg(dev,
+				"Invalid block size %u at offset %zu\n",
+				block->size, block_offset);
+			return -EINVAL;
+		}
+
 		if (block->size > buffer_size) {
 			dev_dbg(dev, "Premature end of parameters data\n");
 			return -EINVAL;
-- 
2.55.0

