Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41B23939A5
	for <linux-media@vger.kernel.org>; Sun,  6 Sep 2026 09:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788686676; cv=none; b=KbxPIaDeEjy8OG8HZbLAkXFeVNPjHCSv7OKM4XFSl7yDdREMlbwF7NO6EYpCovFpBECPOrXdFtcIYSKuYxyGZkHdAojlG1mvpGnoWs22bFRzvig9CnjF/4ZcNdoddx/oJumrodo8kEW6qlmdokads2AwbVFZTxCjiJ123w1hgr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788686676; c=relaxed/simple;
	bh=sDvMApKRKg+lqlm98orB5wnP1nojcFweyk45ZzecYfM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T2qjFqaEZ3+PY4TrOPBdwUPwFIRPrl5rHeAY8l5HSP9QeQQCNuWfcNMs+88HWYLpALcWKySk0sCJCoNJuFRe1x8GmPjkiSIz/PBvemC86aqAVIQaZfQsfDh/hbFGeK0ChcyiIttemAyh8giPa8Oh6KRN7Yc0K5NxGKNldUYNeUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dtKX1uVG; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dtKX1uVG"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso26019085e9.3
        for <linux-media@vger.kernel.org>; Sun, 06 Sep 2026 02:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788686673; x=1789291473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vMJobEqGp+VWt8ryxcGp2CAzSroh7TVYBuRu9vWc0Ss=;
        b=dtKX1uVGsHRT2VsExbcbku5nNrRuAEEfqpYTRT4WyVRvWboSWfEybamKuGcUCHFx9D
         IoSmfsms/4n7SQyvpWU7gnaePi6iWCZXUfSA9pgurxqfCh61A4rcButSxWAb9IY9paeU
         BFrlMunFcqJJo09Lb03vfylJWOelH6Byc3t3zbSPKMM/x6DdHYc4gdOtJxgPolr3HBRr
         LUnuzGvb5DIyK13sQfWtAz6uUN01p0BSmz1K4ytOJPpDaXohtvzb80BmpucFRw9Ln22L
         /0DLS7CNhvHKumy5IKr1Mq9BLNDi9WLE5pdPl2L2vK1W0pm6EOODZJDbq6x6xqWShTIe
         PJPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788686673; x=1789291473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vMJobEqGp+VWt8ryxcGp2CAzSroh7TVYBuRu9vWc0Ss=;
        b=Vwe5q7yXdGm3ctR3Yq/nRZ2jEe32KXUrmI18BWcMd7zfRq43wSlN4WcgSeXkFtfuR8
         5s3HM4ES/u0cKcsO48tYvwB+nkae7eXo7x6+/rsQTn4Ui00Bom1qTWRgpw//Mo4o5vQB
         31y0te+0MGLRmUtzSYzcyU80qmf6okFRapvpffqTd3SzlRqVjUp1HGwfBS1saScmTNtN
         /yjKG1Dw3b72P2WNZH+TdWv+yFN8DhbP+dzfGK+Reu86ttcTIfBULhwDKJOerWGjWj88
         sHeQdIMStjE68ASDXF0bCMePeNfx91mLfvXQD3zd94QtE6k2wqcrKvK4nwwwCnFQS9Cy
         dF3w==
X-Gm-Message-State: AFuF++lGFgI4hVAO1qhSCTGHpwlM8QuO1ykbdJIcxQkDbSAdSOifHXyu
	97lfACOeMyqt5goqf5bBhZF9LRoE3Jf6pn7C1bLER6sT9uWsBe8oSYvaigkV1w==
X-Gm-Gg: AYBFou3hd2HHwEzSCeDd6jwSZpzC46bO+LAJ9HEClJz76sPjaOahoUhp0nHnK0v5Mjb
	AoJVpcb8q2nF4w6VrMC86hCDFhXJ5Zb9gkWXJC8kKpt0lfYWkuXlH8HjfEbQYSa7H6Ft258IVRy
	LvpHTGb9oT6TNrhxoqsv6GyDTe+KvVhTTINtfalskD7Ssl6Mdv26vJtQ6hT3hUDC0VzZuxKZLeP
	9qfG96eJYq7YP58RQaVGbeoOc7or3Rq6VqSLtUgwpm6CLYYdGBTzaRQp+Mn4Ky4mb/JJNlo4vH7
	IFEBj6Vk5LomGMIjkVFZ8U+ybGJuJfqbxDbKb1qUuQV8vCyNojyq0lVvLr8zOxEd9q1bydwJ9q2
	Ek3ErEPpXHrY4KDen1wJfzeQSWCKg3DUt2GwQUub+ZHHBaf3a99nnNdnKMiSTaRoyFdO5+iNc4U
	7LR/KEw+sgiYxAS0s+8cdSkTvReDBZPW7lu1LRU9GSUI1sM2fVlaXau8pe30WObTsEXr2LsltF8
	MN0hPwHy+kmu5ycOq4vRCcGHVUK1vtsWbfKpEhdL5ZtE6/n
X-Received: by 2002:a05:600c:6306:b0:49c:f5c0:aa76 with SMTP id 5b1f17b1804b1-49cf81e366amr389316715e9.5.1788686672750;
        Sun, 06 Sep 2026 02:24:32 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf755c22esm216768265e9.0.2026.09.06.02.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 02:24:32 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: linux-media@vger.kernel.org
Cc: dan.scally@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	mchehab@kernel.org,
	nayden.kanchev@arm.com,
	hverkuil+cisco@kernel.org,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH 1/2] media: mali-c55: Check the parameters buffer address before copying
Date: Sun,  6 Sep 2026 10:24:24 +0100
Message-ID: <20260906092429.50046-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mali_c55_params_buf_prepare() copies the parameters buffer supplied by
userspace into the driver's scratch buffer, using the result of
vb2_plane_vaddr() as the source without checking it. The queue accepts
VB2_DMABUF, and vb2_dc_vaddr() returns NULL for an exporter that cannot
be vmapped, so the memcpy() dereferences NULL.

Reject the buffer at prepare time instead.

Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
Cc: stable@vger.kernel.org
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/media/platform/arm/mali-c55/mali-c55-params.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
index 70106276b7e4..16e895e3488e 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
@@ -710,6 +710,9 @@ static int mali_c55_params_buf_prepare(struct vb2_buffer *vb)
 	struct mali_c55 *mali_c55 = params->mali_c55;
 	int ret;
 
+	if (!config)
+		return -EFAULT;
+
 	ret = v4l2_isp_params_validate_buffer_size(mali_c55->dev, vb,
 			v4l2_isp_buffer_size(MALI_C55_PARAMS_MAX_SIZE));
 	if (ret)
-- 
2.55.0

