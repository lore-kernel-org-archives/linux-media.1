Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6451476CD2
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 11:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788348172; cv=none; b=KYdakXCa71u57ITXOqTRT596h8qaN9bcKnCj7LXMQv/Ijy+HpfQIizNQUr/9nnzIaDG5h3QiBNtIjceyM5R3RnZ9CzHctkq++JCCGhbz3imh1loDvg525RLTApGl1Rk/jiZXrC3NC/QkNL5DKiV/G+jJV63cEvKa1oHeBXbOsuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788348172; c=relaxed/simple;
	bh=t4YvdNfFdDmGiz+1vB8xdWVLlz5kJXbgA2rAszgLxdY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O7Rn05h7LibEn69x0NhJ4rnOgKSJOTvw8obtEov6GWRAe5BjIxV+VanA/8uKHdbT5VZD5+4zPbjnDzdJWA9iabSUK0YgDGyW+XzKUZ2wTVUOLr2TItDwsncLQooWZD5W0CgHBbPcUu4oi8FTbTu9kakf8gfdDSbNDFMBJbFHElw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dT8l0BZz; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dT8l0BZz"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-84e84a6c4bfso963005b3a.1
        for <linux-media@vger.kernel.org>; Wed, 02 Sep 2026 04:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788348166; x=1788952966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bG2pMm0qwXP8URwYF59N+uYdVu8xUiwyKW9MTQJcAuA=;
        b=dT8l0BZzGNRRUC3/3LtLN9Xir3zTw3FFuh7iT0BXVA9KC0FTjc70+5S6JvvUXRSi5C
         Be8bdplWV8282DZmoPlIcHT+MVVBW05PkeNyi1XIzgjaUsatD+B8qSKXBIUABQxcuOk3
         wNmE1h5PUpSfpB+haBSgUbyJtA7e4zR+6Ant5/FBE7dg/8YrmgvF4iB2Giej9x20fUQk
         HB+fimW4Zy5XIXQyFKydqUSJnZkZbSsGlqXYeTtJCt0yfkWxcSYYc8UDpxcKLcKlB/kJ
         wfPEM3TG3b6xcmkGPentjOXEjdNE/oCjWZGo2wLpYAj4/JfgtQzQ4k0LH/aywZhv64OA
         H33A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788348166; x=1788952966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bG2pMm0qwXP8URwYF59N+uYdVu8xUiwyKW9MTQJcAuA=;
        b=T1KsJkr2BpxNn08XHRED3SCHMDvVK3JdIpnEJMpdIGRFlJ783+hhPfQLgWsTjhQuZm
         LrM22yxX1F1rK7iJ+sRqDBPYOHCPvvZR2zO+d4AwVglP8oEEYQWsdsXS1AR5Kh0PkHdL
         qi2nTF11h9agpHneorB0V04/K4/IzzHZ8Dx3ApaHhf5E06wWHQBxAZ7YXbH40Yxms3IG
         PqElEFZCXWF42KdUuv7axLnVUVOGg9N9qHlaiUJFeT3qH4IzFXhDNvbeBRD3A7aXOkHs
         48e6RwZgteQqlICNSb14cdb6aN57C7uqRcynAp6kkZ0yKdSSz3BSqLXHhtFX6eIsJqsI
         LqKA==
X-Forwarded-Encrypted: i=1; AKwUvBwEFsiWapkLkr5CJ7CZEXeh17L0Is3J+/2HCAzLpYrGI8K5vRw/xrdDyHAmiQs1rZUMxoifVMIJma5Qpw==@vger.kernel.org
X-Gm-Message-State: AFuF++kO/UJmecaFsc/7BNlOn2cTh53NFwaW3Yq2elD4KiUBvQHIZNiA
	/YHEU471D2HCQbdqau2f5Gry76Ip3M/IHG5ltYmfT4ydYHJuyzan4HcX
X-Gm-Gg: AYBFou3iIkvtt8RSztmkVh9az8iLeIbTQxyd/hW28GqM2vZY7F4UqXfAbi3TcPWCnou
	/fxyXB/NVg8WhAWcxgUUxnwdESfTCt8BxMTBQOEF8VOqjSerQFdDxt1xbEWtDXU8a0Dkg0Xt4A8
	+abteNUaWeOCycFOXoC4urnm7zPNofcD8OTSj8lT2g3v2C5ppZPjSk85hVzzUVrB90cHqmP3TUA
	kDm2IBsSRQjeh9uwZ/Bu+VCgyV1Gy8q22626mO8M2iGnP/21VGf0bIkPj4zgom8QIUl+GVEkCBT
	9yndMWhLLn3mAwB3magaYERmMIFjl44tBbrS/HjnuTmNsvkftSz2en/T6rrXVINpxzSYs5e54fd
	eCy2UNX2TLvOBQNmy7X9uG7p/Spusjzt1sc1yLvMWyfZ57NinSZq2stYddlAgEROzWQiq4ad3VI
	BWzAXYl38gzlnNtsSxuR2NOk381sbWEUvIoz3cNBrpNcAj0sB4yhVBb5lFgmGAPPkJfHMaXQ==
X-Received: by 2002:a05:6a00:178e:b0:84a:2b96:5986 with SMTP id d2e1a72fcca58-85f42e35709mr1863167b3a.8.1788348165513;
        Wed, 02 Sep 2026 04:22:45 -0700 (PDT)
Received: from hnkz-ubuntu-server ([2404:7a80:860:3300:f22f:74ff:feda:3295])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85dc11f8471sm1167571b3a.58.2026.09.02.04.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 04:22:45 -0700 (PDT)
From: Kazuki Hanai <hnkz.64@gmail.com>
To: Bin Liu <bin.liu@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Kazuki Hanai <hnkz.64@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Tomasz Figa <tfiga@chromium.org>,
	Xia Jiang <xia.jiang@mediatek.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH] media: mediatek: jpeg: Avoid context access after job finish
Date: Wed,  2 Sep 2026 20:22:28 +0900
Message-ID: <20260902112230.452176-1-hnkz.64@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v4l2_m2m_job_finish() publishes job completion and wakes waiters
before it returns. A concurrent file release can therefore finish
v4l2_m2m_ctx_release() and free the context while the single-core IRQ
handler continues with its tail.

Both handlers only need the device for the matching runtime PM put.
Use the IRQ-owned jpeg pointer instead of dereferencing ctx after
completion has been published. This preserves the get/put pairing and
removes the post-completion context access.

Fixes: 45f13a57d813 ("media: platform: Add jpeg enc feature")
Fixes: 5827e4b14ee7 ("media: platform: Improve power on and power off flow")
Cc: stable@vger.kernel.org
Assisted-by: Codex:gpt-5
Signed-off-by: Kazuki Hanai <hnkz.64@gmail.com>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index d147ec4830811..9010e7b1108fa 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1574,7 +1574,7 @@ static irqreturn_t mtk_jpeg_enc_done(struct mtk_jpeg_dev *jpeg)
 	v4l2_m2m_buf_done(src_buf, buf_state);
 	v4l2_m2m_buf_done(dst_buf, buf_state);
 	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
-	pm_runtime_put(ctx->jpeg->dev);
+	pm_runtime_put(jpeg->dev);
 	return IRQ_HANDLED;
 }
 
@@ -1855,7 +1855,7 @@ static irqreturn_t mtk_jpeg_dec_irq(int irq, void *priv)
 	v4l2_m2m_buf_done(src_buf, buf_state);
 	v4l2_m2m_buf_done(dst_buf, buf_state);
 	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
-	pm_runtime_put(ctx->jpeg->dev);
+	pm_runtime_put(jpeg->dev);
 	return IRQ_HANDLED;
 }
 
-- 
2.53.0
