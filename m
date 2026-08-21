Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAB839D6F6
	for <linux-media@vger.kernel.org>; Fri, 21 Aug 2026 21:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787347637; cv=none; b=OjB8snIH0lMXJdmKvbls+cn3aV5wxow/RwZt8GtKNx6I5Mbdn4tqHoRpuY4PHSwOIQzTrf96cY9K9t10QZTq653f7D4QyCNAt6TL58M5WpKSIXVR2EG1zZNx7R2DECcgyX89XRZai9+peIRA2ShHtXtk3MUC+kbYwEJ6+Y8U6bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787347637; c=relaxed/simple;
	bh=iW5v4cPa+jY4BUhIVqaq+GenRgtpAr+S8n1Qt7BhIyc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ra/5YThFT9Pdas+sCLS7rdCl1q8HrntacbONz1rEBxJugIshKYmJfIP26h+bH5mYNi0sntemXGGGGmxFcB16sGdlWHnmcidjLkl5P44VDf02oaRGArC8jQ4vK2v5BAAVkCFyDFenoLGlv5y6SGbeAeMQsk/DGyH8vaHHy57CMAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qk9RHGIF; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qk9RHGIF"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47f6609c657so678787f8f.2
        for <linux-media@vger.kernel.org>; Fri, 21 Aug 2026 14:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787347634; x=1787952434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cUXEtXgpHp+az+q2AbTUR3kHFspQTU4Js/4VE5CWhoE=;
        b=Qk9RHGIFDRSYvt9zH9r0js6ahnqDiAbXE5ppxRd5izdcAhKEVfxRqLJOhDjpD400Ot
         NjUdXhdMfJ+FX9rlsrE2BkBEkIuowQ7nkPI+ECM4ia7wvSROYSAFJpfgy3q7sqzGENFa
         PfRvZpCx7oswVn4k9VgWEciDoZjI868n26NDG2n1982FnD9CFuMAqrboIa5gOgKcU8Mo
         KQo4eOMzamjuRy9TErVNKaF1lJLfESK0u/GdrEBwBzstiQDnjxx28Etea+Yxc12f5sp0
         +7M5ciGxXNUEjiED2F3gORB79rXbcz/fA/DdAN1vg+Zw5dHRKfEWch6WiC7Kz1YMwD3K
         krBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787347634; x=1787952434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cUXEtXgpHp+az+q2AbTUR3kHFspQTU4Js/4VE5CWhoE=;
        b=qu9OJSiNBU8RGOZ783BSJVydgWWCYe6KChRT2hEpZyiHQtn7YOk0XSYJ4gIQyvlKoc
         21QaqeBzvSMTLa5olUddHYBRAvHiJ2mp2nL4aqkNxgi9CM+CmxLMB/m2vzoeJYKb1fcQ
         ma+pHXh8IDRZcb9GMo+LQMjq5y+EriIv64s4njqjn4DlQM6sfmVxsmcMidN0y2Wwzs2p
         qtQBq1MBnxlrTwZzPUAd3BFyAB9NToRw3pTXVbhUF9R+XfqccBhQA0uBQRPmZfhnz3xq
         uPUTmcvOK82jWridDALfb3SP9MCtHcVR8aA5OePmdGGjxuuUIb7/n00TeKgUMMcTyN2R
         CZ9Q==
X-Forwarded-Encrypted: i=1; AHgh+RoqEThhzmhznMMkNY5jCu8mbpl+B+04RL2Sh5CZhpN4AuA/uo9+yeWmvADURH27Tr/V+tJgsPCYulNCmQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lwXAAJarlAEYyXEXZ6sTUameC1IlbddBMzshPHUHiiWC0K8/aI
	jkTWuCtnZIi25IwO0rPH+dKY+HWW/odRw7ASz0zVgks9S911u8pkmZgT
X-Gm-Gg: AR+sD100+V2gYZmoBtHUdoTxef27vcXKw5ZqKXScs6FlnpJVFo7E4VXkeiGEBFk3fQt
	d+RUawxwcJFhwL96FI8L5Q4ngkld+LOwycPMKrzLab6EZHv4Pt0AZBuFVOuqSlD/NGJHCqVOiMR
	6G06HpK1PrDMLXnRgWzKREtoTxQ+A/L4eKFD52LHqzW+vMIBpHaAIdb+JH9p2yMUHyDDdWOoJNV
	YRL1xafl+K0pZiwzR4BeqI7EtURJQJrfulObX30ffKL/NodsiXZoS8/f0fBT1yo6B+mVUKkmHaO
	2i31g+D4FfT4+VlmvQeVyo9Ot99jamRBz6lql0jvIZO4ufjkJAjwJiLPBG+z3j9IPTHmfxlLsZs
	JX+ZrEzLMI2ePxJmrwI+FpUHt9384V2ctuyrMNKi3WoKcyuZWMJJPKUspQ/cp7AUcSykxUg0OUq
	9pfZOqDJ8WhPu+GQ1JN2/FQe6snPzFPDMFMZxj7h2TjF/Qqe9OhVRMxOEzYjorwkFVUogAKWccl
	YoGqlowRkndBF2m+6QI8UgsaCPfFD43Ht97mSbLu4iFQVri
X-Received: by 2002:a05:6000:186d:b0:47f:9662:85fe with SMTP id ffacd0b85a97d-482c0ba6008mr12996998f8f.16.1787347633811;
        Fri, 21 Aug 2026 14:27:13 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9bfc383sm115175f8f.23.2026.08.21.14.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 14:27:12 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: Keke Li <keke.li@amlogic.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: amlogic-c3: Fix out-of-bounds read of metering zone coordinates
Date: Fri, 21 Aug 2026 22:27:10 +0100
Message-ID: <20260821212710.214388-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AWB, AE and AF coordinate loops bound themselves by
max(horiz_zones_num, vert_zones_num) + 1. Both counts are u8 values
taken verbatim from userspace, so the bound reaches 256 while the
coordinate arrays hold 18 entries (AE, AF) or 33 (AWB). An AF block
placed last in a full payload reads 474 bytes past the parameters
buffer.

Clamp the point count to the array size, as the zone weight loops
already do.

Cc: stable@vger.kernel.org
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/media/platform/amlogic/c3/isp/c3-isp-params.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
index ae0777a20bda..f2396e2c6640 100644
--- a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
+++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
@@ -139,7 +139,8 @@ static void c3_isp_params_awb_cood(struct c3_isp_device *isp,
 	unsigned int max_point_num;
 
 	/* The number of points is one more than the number of edges */
-	max_point_num = max(cfg->horiz_zones_num, cfg->vert_zones_num) + 1;
+	max_point_num = min(max(cfg->horiz_zones_num, cfg->vert_zones_num) + 1,
+			    C3_ISP_AWB_MAX_PT_NUM);
 
 	/* Set the index address to 0 position */
 	c3_isp_write(isp, ISP_AWB_IDX_ADDR, 0);
@@ -258,7 +259,8 @@ static void c3_isp_params_ae_cood(struct c3_isp_device *isp,
 	unsigned int max_point_num;
 
 	/* The number of points is one more than the number of edges */
-	max_point_num = max(cfg->horiz_zones_num, cfg->vert_zones_num) + 1;
+	max_point_num = min(max(cfg->horiz_zones_num, cfg->vert_zones_num) + 1,
+			    C3_ISP_AE_MAX_PT_NUM);
 
 	/* Set the index address to 0 position */
 	c3_isp_write(isp, ISP_AE_IDX_ADDR, 0);
@@ -316,7 +318,8 @@ static void c3_isp_params_af_cood(struct c3_isp_device *isp,
 	unsigned int max_point_num;
 
 	/* The number of points is one more than the number of edges */
-	max_point_num = max(cfg->horiz_zones_num, cfg->vert_zones_num) + 1;
+	max_point_num = min(max(cfg->horiz_zones_num, cfg->vert_zones_num) + 1,
+			    C3_ISP_AF_MAX_PT_NUM);
 
 	/* Set the index address to 0 position */
 	c3_isp_write(isp, ISP_AF_IDX_ADDR, 0);
-- 
2.55.0

