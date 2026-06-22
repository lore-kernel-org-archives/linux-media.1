Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73357175A85
	for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 17:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782149636; cv=none; b=nqPprdMkrsu7vhuWbn4MtNfe8SRGttd1nnv336BSnplwudypxs+3Hhhnl8dB0raPn2NPHuS09PzoYxozGgAGaexgIouVX6yKs50Fdmmsx+1t4C1flIXFBo/AKRsjhl2P5RUUBCzzPlGzQF14fxnuFwg8au8cMw63q2fFXPFZboE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782149636; c=relaxed/simple;
	bh=fc7u07+lcuLtI+CRLC7h9T0Fi15Z8tpXfuYWPX2izWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F/pO6BJfil3oXkh50QdZfdaM/dkdN8p6Ed8VydQn2xBHXqHqueu/KOJ2qlW72ICfm9IEksDi2pNjc/Ql+/bZbTC5WqcrziQBVQPOBlwI5yarAo7PVgxbTAh9lkyduZSBrFr3cKbeqbTvdEdA3X7XPyRyWXobXoI3f2+yPIhcI7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZFsFXUXO; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZFsFXUXO"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8454160043aso3698868b3a.3
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 10:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782149634; x=1782754434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rmuTEP0ouXc+LTtnjqut6HItOODcSSwQn0gYNTFF0hM=;
        b=ZFsFXUXOl64hMfueMbwLHQVEMHyMOpM2YO+IIYV29A0nAzE3rpTiviCdqdP/F3kEjP
         NTetWDOBWTJUih0Pi5DJpcOZFfIWKf66cfgIb8/EJCnJm2wS4EV2nNcwQNMPlN7XXgpV
         aiwm43ykpGRqndX8nXbgwEX22uqCdi47oSiVNr1oGz99L6abvbPa4FUa42vDPJD29QVN
         KV0esp4xqTN+BDBKTn4DYxD7f/694Yf3PI9blu9SLlWFCko2Mp1bqRRzmq2Xik+ALB4g
         Xap1PN382k7VNnrotZwSTIGc5moyZGLjB+7lPLys1UFYkMw+l9vgamqV1GspYo+uLa+3
         8Y0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782149634; x=1782754434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rmuTEP0ouXc+LTtnjqut6HItOODcSSwQn0gYNTFF0hM=;
        b=lI2bPAA2zQh4dO7i7ebF7pfonClw0RUQLOZ4GcW9sQlXqV9tOMpoGv4MDbk9GuSR16
         LeH9cH9MUTpR11t0TDNkFuTE5GiJGDZW0X5w1u1C6hIQh2EnSdq9fDLAe9ffDFDMn8Q3
         ZW8U6Z25tbOCfyvVRuxX0gNHjEXIZAnTD9WkJIP7htKjX0ORbzBimUJKN2DIYW8frQfB
         Gu+LMUeA2KNfgo70o5qFcg2ZJLVE0WSNzuAmCX6foPrKNNuEK0tV/6BDFtXFPF70d2uv
         8R2Ti/CLPMSbGtDdlhvx5C2fnCUk29ySFelL8hldnjqw5a8NIUotOch9D0i9218Msape
         KcGw==
X-Gm-Message-State: AOJu0Yy2HO86V7mCk1jh+1lPCODWPq7DdqqZmYK5VPqSgWJ+eJ71/fQe
	CJEeCA6lh46GpAXHLIu5iCTD4HI9TbGzohCpEgf3D9Y2VhS3N7ZsMQBxBN92FEy5
X-Gm-Gg: AfdE7clISk2reRzTA0YH+N13pP930pI2yWiU9atiWUOFFa18SmissKNB+6+v5lALRVv
	T5WlnPHSBtZUcfWMfZTt5dCMQL1c4wNKD9H+Dgj+3KSZJZzNE3IRZpJjCBodBviAX0V2JQ9UN/F
	UHVhS2GeaJtJQEG0vEx2f1xvErlB9szdO930to+s3DrYKiwiGWoHpzpSWEPuTHHZBLHDfePROrc
	rc8N3OgxVEso3pFc4PIfFPgY3zLjfnu2nT3R5o4fMTV0G+yrY1P6etdjhw63WDAUW2xrJhOds5z
	QMcn7mcy+BWrqg9DTpp2fMNwYsH6Fn5ajZT3tVVyn5tjmn/rQb9kjNXULajlKeBlbNm9K7phuSW
	xl+66MN5W8xc8hXkb9kXmh7Nq8vBQfRA/iAunG+p8MBVVe3WRZB719eb2JIo9s1KcrO7uED89KH
	e+ITKruRjYEOFLWz6UxuLa9rgyfKEly+cXB1FV0T9EtZ4V5RUh6RSz
X-Received: by 2002:a05:6a00:cc3:b0:82f:5051:f024 with SMTP id d2e1a72fcca58-84550866614mr16965833b3a.27.1782149633707;
        Mon, 22 Jun 2026 10:33:53 -0700 (PDT)
Received: from localhost.localdomain ([49.207.234.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ebd123sm7670753b3a.47.2026.06.22.10.33.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 22 Jun 2026 10:33:53 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: jacopo.mondi@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	kieran.bingham+renesas@ideasonboard.com,
	mchehab@kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biren Pandya <birenpandya@gmail.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v3 1/4] media: renesas: rcar-csi2: Add missing media_entity_cleanup()
Date: Mon, 22 Jun 2026 23:03:36 +0530
Message-ID: <20260622173334.60491-7-birenpandya@gmail.com>
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

The probe error paths and remove function are missing calls to
media_entity_cleanup(). Add them.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 7305cc4a04cb..f9c818b0faf7 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -2631,6 +2631,7 @@ static int rcsi2_probe(struct platform_device *pdev)
 	v4l2_subdev_cleanup(&priv->subdev);
 error_pm_runtime:
 	pm_runtime_disable(&pdev->dev);
+	media_entity_cleanup(&priv->subdev.entity);
 error_async:
 	v4l2_async_nf_unregister(&priv->notifier);
 	v4l2_async_nf_cleanup(&priv->notifier);
@@ -2646,6 +2647,7 @@ static void rcsi2_remove(struct platform_device *pdev)
 	v4l2_async_nf_cleanup(&priv->notifier);
 	v4l2_async_unregister_subdev(&priv->subdev);
 	v4l2_subdev_cleanup(&priv->subdev);
+	media_entity_cleanup(&priv->subdev.entity);
 
 	pm_runtime_disable(&pdev->dev);
 }
-- 
2.50.1 (Apple Git-155)

