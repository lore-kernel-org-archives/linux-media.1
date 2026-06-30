Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1EA1FC8
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 20:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782852035; cv=none; b=GTwJOUodNH6MbNb09cM6PcGj81L48CDKiX9DVmt1l0omxEThW0MISl7MYMXg802FR4nMprvM7VCCE8qL5SPfErpo7okWRvDu8xNugOzKY3i7s+FoRMmtu+DEG9XcLpPzb3ycGH9GV11rWl2eCnRA6YkNgbA7PBgdkIK4IIO/7mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782852035; c=relaxed/simple;
	bh=oriBQBTr8a84UNvvlqyIlm+Y51jwPevhvSu/jb7ARSA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K9KMtkLsf/2rhDIt+zb/eR9KPWhMBmRAfdkhSSFtP2lYR6COJO7qj6JUPCkYGYZK02VY+u89SN5OB7/19esnfZvYIFFxch81XvADJkVueD/pKkk5m+L4VurX+F6Hyzhow017dKIpy5sgRW/0ExXN/BZhxBcUKQbud/dSINLoPng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q08m/iCp; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q08m/iCp"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493a54b80a5so43193115e9.2
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 13:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782852032; x=1783456832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VPH+EH1c5Z0xhuA1AJ4Duehk87nYx84oJqkH/JzJzYY=;
        b=Q08m/iCpxnPvLydUlRAr7PdjERvkRAKhVEalntyTSVOI70Mj1ybT4Te4QRpAhIEDXJ
         Pntu+0lYKGy6mwQQqVC0ysd16Lq8XIraWWHrkiFSpEQUFtcEiAvsYVyipF4hhMJtTMrn
         /GGaNDRkUUaNfWk/cGthmY3GnEGld1GAL9a7vPFk1o0IYdEkSNLvE5/RizzhIw8Aokq7
         cRPtPSEPz2tE4nYZ7gxbkUqyRIOFX0jbq0k/QPho6zhNJA22N40SafwSc+ivgPlKp/Fl
         YJtl36PLHg4hCtHZxyKSB/dcg/dCUzNzmsD+v8qD/kqEQ4cVECz4Z6cTXuoYxLv87KSq
         EDTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782852032; x=1783456832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VPH+EH1c5Z0xhuA1AJ4Duehk87nYx84oJqkH/JzJzYY=;
        b=o0BSL32BVDLNp6MPvpNOdOn2tXTZD2hCh+Ra8z+7GNlE5MXYhVSxQEJTDgnkoMnhaU
         Mbcb91i/UpMI3h8U4I7O9Yr4iN1z5uJWXy5mPEkyxDjOSphalejc8yKR4U2aisud75po
         A5uJHZhfX2DR3CvvZZrTyuYGlPcC59RFapGfk2RdPrEASRrHvhECYlMz/aXz+COc+1h9
         SsQtMgBChB8UAhKgclitfDWyQRiu5TzDXt8gQW2rvrWnpCKLLsfCI30vWgVqcTCMJp7p
         UzaedzWCz2TqI5JTNtpKaJvVL3l+Jc+5dM5iSH68bKgkh1WEItijBGJ8s+5IbKO20xfv
         HlTg==
X-Forwarded-Encrypted: i=1; AFNElJ8La3Gic/dxW/TNLp/5jzWGxMvg03afHBF+F0gSC9oMmFniT9+Z8tyl3j/MgRv+LyFXvEbw4ZG59luwTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxGlbaycQx8HljxO6T5hOj2PeIEtHlpbnxL33E/VNXnvOUr7QG
	P5cU/UQwBY/OdFXD1poYB80M+SBddOpiIws4I5W6IsSRigaj+Yi4BnDU
X-Gm-Gg: AfdE7ckbI/Mx0PNFPlac5vWTyaqxQ3RvC8+AUBqJeEpufNEUlXWIDOrVWLuyxyftiAy
	hB8cVqtfs8iIRAXShJwJTdNeTe4bj/qwDLEbkHUX8OfrcTOBhidswZ6sdmxSO63FHlLegmoFvzy
	TeOy9xKurFneMXlEfkWBZprp0St/9/WMJ3zJ3Qn6nWNK4bQKpWXkgWvRDsb2bJWne52f+8iUuKX
	HqZx9SBgPVIKvqF2rfNI5JSmlmByNN3N+Bl43IfNTMpqHYRsC2LAgzSCpLRKeUPxwgXr+Q5hXhF
	91YFZ2CHTGWzTjH894Jel1EXA0CDqZnGHRKCjjjSy0ZIwWxGQTpVtFlNHUVFmg97pYiTG+sqdf3
	uqVMtu2aNN/gH7JM7LPHBk/ey/Ifb5RtvIX86qu7PGgpQTTivvnTL5+WIwN5hrXRc3MehiBP27H
	Od/HDh3FQB5yBPyIUPw7WbKrh/8PFMIW/0lV1aD+AoNcFzGu2/cnlxxQ0pHMLxDkCgCOedqxJ8
X-Received: by 2002:a05:600c:8b30:b0:493:bc4a:e7d3 with SMTP id 5b1f17b1804b1-493bc4aeaa4mr46876825e9.39.1782852031843;
        Tue, 30 Jun 2026 13:40:31 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bef1807asm8722295e9.1.2026.06.30.13.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 13:40:31 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH v2] media: mali-c55: Drop redundant mutex_destroy in capture register error path
Date: Tue, 30 Jun 2026 21:40:28 +0100
Message-ID: <20260630204028.378136-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <akIhCZqfi6o7tYqJ@zed>
References: <akIhCZqfi6o7tYqJ@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In mali_c55_register_cap_dev(), a failure of media_entity_pads_init()
destroys cap_dev->lock inline and then jumps to err_destroy_mutex, which
destroys the same mutex a second time. Calling mutex_destroy() twice is
harmless, so this is not a bugfix, but the inline call is redundant: the
err_destroy_mutex label already covers this path, just like the switch
default case immediately above.

Drop the inline mutex_destroy() and rely solely on the err_destroy_mutex
label, so the mutex is destroyed exactly once on every error path.

Signed-off-by: David Carlier <devnexen@gmail.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/arm/mali-c55/mali-c55-capture.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-capture.c b/drivers/media/platform/arm/mali-c55/mali-c55-capture.c
index 7aaa5c3f7..ff0155302 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-capture.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-capture.c
@@ -857,10 +857,8 @@ static int mali_c55_register_cap_dev(struct mali_c55 *mali_c55,
 
 	cap_dev->pad.flags = MEDIA_PAD_FL_SINK;
 	ret = media_entity_pads_init(&cap_dev->vdev.entity, 1, &cap_dev->pad);
-	if (ret) {
-		mutex_destroy(&cap_dev->lock);
+	if (ret)
 		goto err_destroy_mutex;
-	}
 
 	vb2q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 	vb2q->io_modes = VB2_MMAP | VB2_DMABUF;
-- 
2.53.0

