Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E529347BA9
	for <linux-media@vger.kernel.org>; Fri, 21 Aug 2026 21:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787347672; cv=none; b=Af98CIJ7Nwutz2UlpRFEQD0M+ljOqm59GISAI7mGEqUTWPtTj1pOImGH4oJjpj7Hl51/R1KYGNURc0gLdrpILA+CQakAvjZuKiY1apXWzKX5WU5nuWyaau0GvEgkKsjA8eC5sjMhuqUJxC7/DmxFRRutqZ/7w9UotQcOID+HwAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787347672; c=relaxed/simple;
	bh=iW5v4cPa+jY4BUhIVqaq+GenRgtpAr+S8n1Qt7BhIyc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s0IbkDxhPtTbOITeuD2YL3NPC835d/YucXiMGCb+YPFu+gZ2nvLW/uafK/hcC0D6220W2RhkaQ0Y3VF7MD7Is75OkY9QdbpjCKQjKxA1jvyU3Q9bxh3iLy7wvBORGkJzRDY/48RIoCsrWJ/f9Z/JIJXWQDHAZjnvQrORaSM1bTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W2HLMES4; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W2HLMES4"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-499a4d1d7f1so9545615e9.3
        for <linux-media@vger.kernel.org>; Fri, 21 Aug 2026 14:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787347669; x=1787952469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cUXEtXgpHp+az+q2AbTUR3kHFspQTU4Js/4VE5CWhoE=;
        b=W2HLMES4gWANIVB20ZDK8ATmZfmA7qo6wkl3EqlTXnODAIH0Q9awyigSw3joOUk0t/
         curZpS3CrBNvfNUkxdFmRn05wk9sJebKHaYP6dZ3W0l//2UqWK3KdMAb2/atbRYJOZgc
         yDyVzms2c8kDbJPTlJNx2V8aILEHoe/5jCLlMhnTOZLD5n2iqyGRpLupunuZuWCUrYDQ
         /Q0btAjKAycwkL04y27vCzAVwMxlqdWO1loSs8wz8q6DyBY8RAor/eVOUdIZlhN2U62+
         XOw1CzA5nXkYls1tJRtb+ZYGeUq/7IA24Lk1Kn7AiZFfo+SQN4TVfA9buu2dzyfedUNH
         SzsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787347669; x=1787952469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cUXEtXgpHp+az+q2AbTUR3kHFspQTU4Js/4VE5CWhoE=;
        b=KwMJ+MhG0K7vRCukuTVPh6ljp0HJNjBhIBBkAdKsxctIgE7BElgbvRh3fz8qFgoGEh
         b3CtN8TGM7DRJhILkQrx10dMFuV4n4NDx+FWUaevvHctMOs4iUvBnr6lpRGK5/fQ5VtT
         nZA7w96e3P05LyicwD52b/xBlywbqwFpzRwpHEq9X9d2vek34hWVqtxrTH5yQhhV6wrJ
         aNZ/4a4wRf19VPZx3IB+McYMBAzQ9Sy2DsXHQAyEmKZLr9pUilm+f2eQmgs2R8wraWRc
         etreqRLP78Qph/rtsRLM80Ck2BulMQ/2fSXRVNjOoL2Awl7jgMP1bSjBkXHZIjRmXr+O
         dWLg==
X-Forwarded-Encrypted: i=1; AHgh+RpJrZ4uef5ZuDYOjf6I1NdpzF1ALEMfWhd5QuFPIoTw8I1pvR5Qw0cMqIiKVv0ZMK+j8gHYjpCr+vhx4A==@vger.kernel.org
X-Gm-Message-State: AFuF++mGZMFPszClOtEZ5CETUqHm55d1EvssoUNMZ2e8IZpVP1uYdthb
	g54MlQZg7KvJ2A1zNWwFpMm7QPw/egvRWjGdHzMWwHGatnQ3djzDR+8n
X-Gm-Gg: AR+sD11nLpQvJAJKBVa9sdMrGQoUrGVVRoNyOp3xSMpvYKbZa2KHNrGCflyPxv6GFtb
	jsX9jQmB7PQ/fEaIO3kL7/HrRNEGv+3FXB3g2OLZSxUYq3fQ1v3Lz0eBi307+T6hPnxMGeS5kyN
	C7n14Xgt3CLITSa0z3+Odjkf6QVfSXH8oLZb0ThEZClHB9YABGSobPOXLggIlGezB9ZMyqjS9qZ
	WbjsYO8uqhY/g6oMm73vp2r1sPypWG6qOMvTtD6heTCyptrC9t5H2CqDoDAEvlD3J3NYZ/0IYVu
	19ar56gbDuB6y5jHFAIv4iyD0+nqxyXXp4HaLvtuSWcphyTaln1GebOP8DehbymMzsudzaiaOd5
	tNTbK6mhskUdlFkCmsZiRDXHhDzHv1Nnz30De2Uunou7+dTPHYZHybDZSdEq57uTA0AlvZKnee3
	qscOcro3JX+c+YlfoRtIXd/N1FGJsD5//POVbSNeUUGjx/nXUW7GZkjurBMTxTMtIxxFbYkoFwo
	pK2VtqCw/ZhCTjVH7ErNJycsOajwFc1MI+2ceBSt84AUE0T
X-Received: by 2002:a05:600c:5486:b0:499:a277:e8c8 with SMTP id 5b1f17b1804b1-499b8464cb8mr119003925e9.13.1787347669140;
        Fri, 21 Aug 2026 14:27:49 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b9a89572sm30762815e9.0.2026.08.21.14.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 14:27:47 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: Keke Li <keke.li@amlogic.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: amlogic-c3: Fix out-of-bounds read of metering zone coordinates
Date: Fri, 21 Aug 2026 22:27:46 +0100
Message-ID: <20260821212746.214853-1-devnexen@gmail.com>
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

