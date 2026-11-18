Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795002624;
	b=q6qaSh4CONQaYYNZXVDWtp9IdsLnhLqv8qtSMBFfFr5m/QjdXRYmBXpvS9cwd8zVAAD7
	 GrCOEU/mKvMWyNLAFup7FA0z56jVBceEeMWZmTlECnDgPPImabd0qfIJeRd4+bliaKFts
	 h8remvsXldfgJOJ5ypbAkou5O+f91DjO7qHlLCAz/6g2tqic1kcDSku89SRPhqGGuMLOD
	 KYEEmKO/6l/XYbmZ7hu47NvxdSToovRHvTfJGCsG2RDJduL0FA7d3fxcg8n+p2Hr7QmQ7
	 icAfe83kTmscy/VTiie2UitPDGQDbKExi0a+hl7AapWTuQGPD7I5bgPw8/j7wrQkCOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795002624;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GwkWG/yGphkbRgx+ktD98fYpEDPc/cQysz/8UZPriO4=;
	b=D/3ZN9RKmCYCkOyntWzDPFFdkEnZjiAwqmBozIYHjKsz9cMyC9CwzUsFkn+x+f47X8MJ
	 H3PkdHZPuDqFl87401FoWe34pfGGIVPyRUNjEhnrL2Tf/Fuw0LjPH8kAj13iZaF2E1xTA
	 WtNO4gtSAwlH1lFE9qT/uJaM+58tZ7Z5skR4pHNaYDRZ+MnFkZl7499X1Cx9SwWBeQbkL
	 dnU2vvMQm3QTj6UtxF7+vyQ0AI/Y5k38ijXOPt2ZmBOI4QnOVYWqLH2t4ugSM/TxY013k
	 bfn0Q5rAVkBgS8VOJrtZZCOH7jQDiBRkjHpShM56zosiXMo22sGgnVlWfjjN8Y/R6Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ieVeJsAC;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B9D606A325
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 11:50:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4B9D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ieVeJsAC
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1aefd1bf74aso554322c88.1
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 03:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795002623; x=1795607423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GwkWG/yGphkbRgx+ktD98fYpEDPc/cQysz/8UZPriO4=;
        b=ieVeJsACuz7/5zKQz+TZssEWRPxC85HRgj5PQgMoS+5FaNkiXnt5IS92kv3qdI2/zh
         VOi/3DGKSVYmmvMC6zONVLDMBZ4tqJbinIIlBQ1eA/B1Df5gvJtEG1izy+Wy2iGTYSeE
         UOV3vLac0oYm3JYddG8aIQYFj2TgxWHvVGmv89C6dXj2At+3sWbyNLws1Ry+pTp1WtIs
         CVgYbbisdSKRPumFXQqWURnFR6Olqw/SjP5XiSHoEhdwfWLtS/MeIfYiL4fC/tr/966b
         wSFk+5n+Rh3VL154k9Ad0WkcWEx4U6CKMQ31WT99NpdwMwi30nyo/hjOMB8/3iuE95N6
         tQSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795002623; x=1795607423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GwkWG/yGphkbRgx+ktD98fYpEDPc/cQysz/8UZPriO4=;
        b=ZzVGilGiApQOt46k5bjUlLwIToqqLz+8eZp/O0ljeUsjQfGzougdhvqXfB8qsvj5we
         nTJaNWC85RVSWfOisd3SLxs7hiksySzf1mtl5O9HGOx5FZTiMUDVUDPL6xTTjRACyYrD
         CDdN5gXWEpFg8lGwiq5TaBN7Qjnp5VNFUe5sG27rJNEuEdaZmGovEpJn6Upw8S53Y+64
         Jc65Ev1tpEOwVZTi2pznfk5tp10hQ4CwCqr01XLnK0wZPS7QPsMLaf4e/HGMbEBrMaDV
         b6QIqAJFw4e3BoNsCs48EVui6HNIJUW3PEaQEr3L8cK2fToPyhC2hxLbKIPYdhjpUDdA
         tPuA==
X-Forwarded-Encrypted: i=1; AL+hErF8JPDGvvQ3iopIMQsN0Nvgl5ujqJ0s3Djljxwz1ZP+mQ/Alv1G503dLaFMbu51pEJwpQKZLzq5WfEtlQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9j1uQnsYjup6I1Wa/N7dN9cTkJ5D2Al3uRxbY9eGLw5jlmb4ke
	QNrQ0pWw8tF41ZQ/oRkfT5jFTPqRLZHvRpANercIX+1HljiOV0xS3nsc
X-Gm-Gg: AYBFou0rMvjGABKaD52PHZ+SAiSxvho88hCEzzyssPvsiaW7mbbXWYDO4gAIE5Og7X4
	s5lpHJZ6bcBtLgAI1HL83SU+jOhTel466wwEJtqZkQ5G43Dlkft4Rt8vPO5Oi5OgojxA8AZ6htL
	u/cMycp++cImTT5bwFWL7Qm4ydRTkB7fpKqxVF4rETc3tRTmRH9NU+vrhIT22fhG+CTODHQCxMc
	ZoCO6bXPHlxxDMhOPiS2NsN7Zu+8TpcBbQrbKpQmSmvX+H3DMY1T69CzGazopacxtIevg01Z8SV
	VGu1EJvgF/TqbL4cJwyu9SRzPbj8K7eIxsL2Zbh1jpR5jOdbJAmTMArnYqTTxFB7twCW4gaRHm7
	WeC+dHcNV/++QcY5Q/986ckT8ErxP1Ry5eK+QVZIW6bURSaNRdUQZ3X1SWBD0BsBGwdeGYOqSOa
	Pgo3pfPV4+VqpxxmEpV47/0FGqpQ2/KgY+1WqGS7/d64JvU8o7Vxa6eA2lSxROPu202G31Gq5Th
	sX9nvVSKFq2EWuE4BOJpFyLkmYQu4GqVuaf2jm5K9CHBti2NmYbqrGESP16PfUx2ICipTmIgJvD
	m3IRMA2wCLlWHIOWnG27dxUBdT+bxN4v5UwCUVGBbfW7XYhbp+wJBW5+Z5U=
X-Received: by 2002:a05:701b:42cb:10b0:1b2:de00:9bc2 with SMTP id a92af1059eb24-1b53a44bcc4mr4661767c88.12.1795002622612;
        Wed, 18 Nov 2026 03:50:22 -0800 (PST)
Received: from cachyos ([2804:214:64:aaf:eb0:6704:6a19:ed25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447811efsm6120431c88.3.2026.11.18.03.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 03:50:22 -0800 (PST)
From: Paulo Ravazzano <paulo.ravazzano@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Biren Pandya <birenpandya@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paulo Ravazzano <paulo.ravazzano@gmail.com>
Subject: [PATCH v3 1/2] media: i2c: msp3400-driver: Guard media_entity_cleanup() calls
Date: Wed, 18 Nov 2026 08:48:34 -0300
Message-ID: <20261118114835.42431-1-paulo.ravazzano@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The entity member of struct v4l2_subdev is only defined when
CONFIG_MEDIA_CONTROLLER is enabled, so the unconditional
media_entity_cleanup(&sd->entity) calls added by commit 87d1307b6791
("media: i2c: msp3400-driver: Add missing media_entity_cleanup()")
break the build when CONFIG_MEDIA_CONTROLLER is disabled.

Guard the calls with #if defined(CONFIG_MEDIA_CONTROLLER).

An AI agent was used to find the bug. The correction was done manually.

Fixes: 87d1307b6791 ("media: i2c: msp3400-driver: Add missing media_entity_cleanup()")
Signed-off-by: Paulo Ravazzano <paulo.ravazzano@gmail.com>
---
 drivers/media/i2c/msp3400-driver.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/i2c/msp3400-driver.c b/drivers/media/i2c/msp3400-driver.c
index 8c2edd462..8f0b385fa 100644
--- a/drivers/media/i2c/msp3400-driver.c
+++ b/drivers/media/i2c/msp3400-driver.c
@@ -717,7 +717,9 @@ static int msp_probe(struct i2c_client *client)
 	if (state->rev1 == -1 || (state->rev1 == 0 && state->rev2 == 0)) {
 		dev_dbg_lvl(&client->dev, 1, msp_debug,
 				"not an msp3400 (cannot read chip version)\n");
+#if defined(CONFIG_MEDIA_CONTROLLER)
 		media_entity_cleanup(&sd->entity);
+#endif
 		return -ENODEV;
 	}
 
@@ -813,7 +815,9 @@ static int msp_probe(struct i2c_client *client)
 		int err = hdl->error;
 
 		v4l2_ctrl_handler_free(hdl);
+#if defined(CONFIG_MEDIA_CONTROLLER)
 		media_entity_cleanup(&sd->entity);
+#endif
 		return err;
 	}
 
@@ -867,7 +871,9 @@ static void msp_remove(struct i2c_client *client)
 	msp_reset(client);
 
 	v4l2_ctrl_handler_free(&state->hdl);
+#if defined(CONFIG_MEDIA_CONTROLLER)
 	media_entity_cleanup(&state->sd.entity);
+#endif
 }
 
 /* ----------------------------------------------------------------------- */
-- 
2.56.1

