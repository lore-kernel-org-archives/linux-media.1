Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DA1175A85
	for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 17:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782149653; cv=none; b=QwYOeh0UCAPI0I8p0F4CRAstd5OEWL4k/bvzxTO09DyrTxisWDmX/Nc3vIJSDlPRH4JC999wI1p+fDv4LYCR/qRsKSGdzIYW2utM0G/qkzKZ2VFvE0eD8NYwBwGNwUVy3MpbIcXbaNkXHnaiktfWo+6qmgtB+QPByXhkwkagO7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782149653; c=relaxed/simple;
	bh=lwFdU43dZ53s2v9ayhYIqbIXwV8sj8ytOjiLYK2MyuI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b6b/tqvUony3wmQ7rPfx4FBAdcAWiaZkKOUnRJmVdGd23jvBXn7Js+s5zyZkQHCfrWBkcZeeLpaisEv5hBSY2DFAl9uG7rQ0pkRsrhznscUqQmHSlzMfr0poiTAlrrm5U19EP4ZzZKg6ANfysy3Kmsk0FSKjPAZeUz9I1vcaWC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BrUHCg1K; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BrUHCg1K"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84540eb70b2so2553854b3a.2
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 10:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782149651; x=1782754451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hmvF3IgqnHx2JaIejrSdvjpAyG7yRfqwXqfL7qF+zJ4=;
        b=BrUHCg1K0HliGvCKGi4ygIDC2cA8biziTlVaNezysjN5ZIY70AIEDSPUl5juLDEu/a
         DcaDnq1SoTGZUJavXxeUdY/kHW/KNfqgDbNNxTcFiwak8iCAS9Ou1v+flbdEajxu9ktE
         qGnuJWggRTW1lcI1DgHmQmVye+mqo9NckwaSwHf6hoqoxjGa3VR7UgRacWA8KoUtnIYx
         CtfMU+ONegNUQKpWzxsD5KNLMj2xMESs/NjFWqh7QmuEQmVO9dzoKbnwvuZbWXyce8lS
         4dLaIMciDzIRu9wKwGcUFWwmxTa1sMLzzkRq9PAfuc4ml4LzR+CDSfS3F5kqvNyXuhTC
         oD1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782149651; x=1782754451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hmvF3IgqnHx2JaIejrSdvjpAyG7yRfqwXqfL7qF+zJ4=;
        b=qm/NbDRX4EohMV0XH88djslitB2ow+SxDmKt2/qElIpbLRSMTdifkska1SbEtLMVvI
         rDZLHzoS2Or9w8+slKPVjdvrmC8g3xSHrY8wVN2loRX0JPYTJ86Yj6pvFiR2GcgIyMWl
         xfYxK96Ce7UZMJFR+mCB+3QLLh+20ieWKYIOIsxvD80FFpIkbcoVYF2bWlIodiB3dI1Z
         MpAgncHxdTf/SvkkaG2UonCUAvc9GKn3TeYSTNrEu8IcLy39aAuiC2fVG04YBplvmKlj
         0MdeXIWzABYENhOohZ+wBjj0qZWcA27riDMK8Y/rckLXUlhRZvB+Q899iyyUOkIyIKGq
         Bc6w==
X-Gm-Message-State: AOJu0YzpWDHJYqUYuKx+WGtytdAXm+v2Pd/YfWiNYN5ZdL3guomaVrbM
	7pQZdQyfb0r2+PFHkMSh6b7cy3wfpV3IyodDbpK64x5g2FXDGN0DdO0paBBCZfOO
X-Gm-Gg: AfdE7ckyYr6S3aDtrkQbbO05dB0u+7o94AF6Fa+P8qwPfJh4jgWXA2WAZsROkE6NWrw
	ZtzaPjkQtZfMHh61f0uhTZ5AfpJKv7BttW6aRjxMssoSUPA+Uv+jLYLHoksuvVqQZ6KA7ihgGtn
	8mSAA9l8AD8Lriciw5Fr2XVwnegklCPyIlc4x0U6sl3WWcx8bpFslo+lGirZFPC8Lsqp5S6y8g6
	CwZ+rzd9VZ/g44ZPIa9qbdbMGHolINkg6TXJLKceDKVsuBZP2VyzGoY7EZQO1IjLmpVGiYNJenx
	v0c2k7MaY82Ls+oEzhUGHvhpugVkrRPI+jyls8RQW49lxfZr4I+Mpo54VkzM9WiYxQroty8VYfD
	t61980ZgoPHhNvr0gqpIC74CooMgvzKtCEjgCmGDFCKP0M6OO6EumX3LyG/qT1aXS5UU2naDlUM
	BtllOu6dIPlUdzL2SJQRoa3BupSyKvgbmz+Q+WXyksn7R3iPNCx1uD
X-Received: by 2002:a05:6a00:3d56:b0:842:7476:2376 with SMTP id d2e1a72fcca58-845625b56fcmr11469854b3a.41.1782149651255;
        Mon, 22 Jun 2026 10:34:11 -0700 (PDT)
Received: from localhost.localdomain ([49.207.234.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ebd123sm7670753b3a.47.2026.06.22.10.34.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 22 Jun 2026 10:34:10 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: jacopo.mondi@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	kieran.bingham+renesas@ideasonboard.com,
	mchehab@kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biren Pandya <birenpandya@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH v3 4/4] media: renesas: rzg2l-core: Add missing media_entity_cleanup()
Date: Mon, 22 Jun 2026 23:03:39 +0530
Message-ID: <20260622173334.60491-10-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260622173334.60491-6-birenpandya@gmail.com>
References: <20260622173334.60491-6-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The remove function is missing a call to media_entity_cleanup(). Add it.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 3c5fbd857371..84d4883e2fe7 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -312,6 +312,7 @@ static void rzg2l_cru_remove(struct platform_device *pdev)
 	v4l2_async_nf_cleanup(&cru->notifier);
 
 	rzg2l_cru_video_unregister(cru);
+	media_entity_cleanup(&cru->vdev.entity);
 	media_device_cleanup(&cru->mdev);
 	mutex_destroy(&cru->mdev_lock);
 
-- 
2.50.1 (Apple Git-155)

