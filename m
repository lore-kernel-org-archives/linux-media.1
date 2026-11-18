Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795002628;
	b=N1hxahZi1rmj2w3ceIh7TUlizz3V42vBKwIL+46S2KFBTjr8EKnu8kqgvAw6eno4eJOH
	 xSx+uBG6u5gngQKYMvx04qzo/KKWMW9Z3rBr+TCzgiGL6dEa9bt1F1djJzy/lOonA0khn
	 fN2VpPmcWP8nsHZx4mTy1Te8srrMwlZl4F4LYRCJia8GoJyVUePv4bQ8vyWfn0HEwRv8m
	 Qu0ahOxshZEJ6HjloJ+8dMX3Dqfp/LbS+A2kasciqyXJtwWwsAr5PBJ5rh+aipyzIl/IU
	 Pye0NbYXr+mXWWyM+MUEGKcTSGx3pVxetXHq1921QknH7ECwNryUIzY07f7zOkStwyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795002628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EsAdx5aDn98LgByU2/p+atQ18ynToOtTBq3shGClEFQ=;
	b=KnQs33HfGZddTKMW/QIGikVP9m/Xs1ocP4xMvBbgULoAvbLE11bqpBDTRqrjMYvC9YjI
	 rMY5W90ybVwB1p84U0tAf5gTzc8/T5ddHe8tpXjgRPFw/AE8iTeApt8Ie7Pz6bL+keb+7
	 UmH41zXg55g9Gtx17wE/yYC7rB5XOeOnNoId/jE/nDb/VFarmXr3Jz8UXd83vc/2bnRnS
	 sOcpHBcz9LPkqcp3R19MUDthnNbn7fjKJNeYL+JJgMKGJ92aS32zxZdAM1W8Lqj2pehxk
	 KJo0CWrvlVK7pAdqVAx0sNUzsEOwRbzbglbyKtkZpLAaIjsd9ME+6fZy7QSGpcn5rNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JD9Ei9Ud;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CE0606A325
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 11:50:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49CE0606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JD9Ei9Ud
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-14394530ec6so1359720c88.1
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 03:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795002626; x=1795607426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EsAdx5aDn98LgByU2/p+atQ18ynToOtTBq3shGClEFQ=;
        b=JD9Ei9UdRMfbLrIEqtw4xgrxBA57b6gCkhj010hGJpHfHnvb2Eg9aY7oCuDPc5R4gE
         zCO9/fZQg2WT3mcZ4la1U+DLmLj7mB4Wz/LVrt1E4o0xpyXWuz54VgEHw9i+mxQHiiwq
         S41q2PZuiX1xeZguiMqXQ773KLF/qA5OV1PoHxjmpeR3aBPKp1zIlNl8x4N2RZsXECFa
         AfS37sleZO9dau4O3GrojuslGyuM26xQEY8uYxWPG7RIzilBrblbpINIb+LnjB5dT5EM
         7mz9eHm6UCXUR0t07Qa4BS3UZ731P/BQGc7gzgorHHAV/ED1H1T4aEh4QKeS59ZWhxXR
         xocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795002626; x=1795607426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EsAdx5aDn98LgByU2/p+atQ18ynToOtTBq3shGClEFQ=;
        b=pVPCw9tFEZuT0R7FE7TrW5e1ZrsmXpZlnVKl9PDq4eNXL3s0sz2LgRtSBz0TwNmdpB
         4spx3/jwV0bvMBrMthLRaNA6ur4tzSKFAcj09aRTgWSKqMAMXYb0hOgT/YAVKFftLA3K
         b6v1ZCIK8I4lI2pkRdO3beTh4SKdPQtpYBFVy9yxVfanwVjD/BORXjJLdaBXTpTZoGhp
         BWoKU2cjSh2av7tYihx2al68n3WsWV2Fm6cpXZC9+lx9vhz8NyzKSPzJLMWc5gNKqjLp
         8yuPgeuxHzID5p8Q/r3u2mDUrsDc6ZVnbl81dBny0j2HPBOUrFMLkUFhSMvVVCz1L9Cd
         +RGA==
X-Forwarded-Encrypted: i=1; AL+hErH47v83xObqQdJxb0KfGODPUPwLA69reay4nXHdLYv8CeQZcvO3L30ThFW0HWiJaFAWhrlfEnGi/oVlFA==@vger.kernel.org
X-Gm-Message-State: APuU4Z86t5QIBQ2aKHTDSf+pbstv7ibtRoyURZRs7GEz4CZdSp2jkxbf
	eOvVDjpAZh/nIk7mn+Or1jMgEOOafDT50pM1h/drELbup4YYByj9c0b+
X-Gm-Gg: AYBFou2K3JYm3y2/i1aUU3GaAxEVxMlfMTxVa7v03QST9wzxcsHGfHNhpSYRSD0NucH
	I7muRE8pXWPfkMKTU2998brsbvG5YuZxYsweuzmrgS1XzCs5+hlR9vqZXo/axjD8Aj7wkss+3/3
	y+ueq9/bR43IyIaoonipdldoOg9cYdsnxZmkDEtNku2NgQTXA1XJEHVPo0X1lmnIcIe2pWoxqi7
	2QergWwB4wvlZC+wc2siJW1KcfPSwUjyo9SqW8CZZYqyvV8i4+NKz5yD7fln/rrdTPJF8UP8PwQ
	Pt/tiPai8SLl5Hf9KJkHEVJmlT1ssmkhSS/kBg2SOYtuKVng6EPpNe97G5tZZ2qSnjiwV9y0I7x
	ZFqv6U/PMlxhC8j4O3lBfbIcoZqiFopng92M3wfoNy37y2gLagzytqkQ8XRL4BR9AmKY5zM5nrY
	z7uMWYAEeJ2VPYrTcFAqqKz1RUyRbtBBoHzrhYcyf3pU6d37WANTGICmNwqqbC+OMFdxT5SmjKw
	Z80jJ/eFkYeP1iy/5AknI4FqAJFgTffNhKYuQvhpxRjdl0FbaKLNeKeXGhkWNJ05xwLX/dBENnK
	a06LQAqzVyM/wWEtusCsenvBTtCnY7Xc/CH4siNjK/iRwEtCeHMcqoA4/WY=
X-Received: by 2002:a05:7022:e801:b0:1b5:514:6a23 with SMTP id a92af1059eb24-1b543bb56fdmr2602689c88.13.1795002626396;
        Wed, 18 Nov 2026 03:50:26 -0800 (PST)
Received: from cachyos ([2804:214:64:aaf:eb0:6704:6a19:ed25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447811efsm6120431c88.3.2026.11.18.03.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 03:50:25 -0800 (PST)
From: Paulo Ravazzano <paulo.ravazzano@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Biren Pandya <birenpandya@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paulo Ravazzano <paulo.ravazzano@gmail.com>
Subject: [PATCH v3 2/2] media: i2c: saa7115: Guard media_entity_cleanup() calls
Date: Wed, 18 Nov 2026 08:48:35 -0300
Message-ID: <20261118114835.42431-2-paulo.ravazzano@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118114835.42431-1-paulo.ravazzano@gmail.com>
References: <20261118114835.42431-1-paulo.ravazzano@gmail.com>
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
media_entity_cleanup(&sd->entity) calls added by commit 6787d5189e32
("media: i2c: saa7115: Add missing media_entity_cleanup()") break the
build when CONFIG_MEDIA_CONTROLLER is disabled.

Guard both calls with #if defined(CONFIG_MEDIA_CONTROLLER).

An AI agent was used to find the bug. The correction was done manually.

Fixes: 6787d5189e32 ("media: i2c: saa7115: Add missing media_entity_cleanup()")
Signed-off-by: Paulo Ravazzano <paulo.ravazzano@gmail.com>
---
 drivers/media/i2c/saa7115.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/i2c/saa7115.c b/drivers/media/i2c/saa7115.c
index f4015f113..32c526df1 100644
--- a/drivers/media/i2c/saa7115.c
+++ b/drivers/media/i2c/saa7115.c
@@ -1868,7 +1868,9 @@ static int saa711x_probe(struct i2c_client *client)
 		int err = hdl->error;
 
 		v4l2_ctrl_handler_free(hdl);
+#if defined(CONFIG_MEDIA_CONTROLLER)
 		media_entity_cleanup(&sd->entity);
+#endif
 		return err;
 	}
 	v4l2_ctrl_auto_cluster(2, &state->agc, 0, true);
@@ -1927,7 +1929,9 @@ static void saa711x_remove(struct i2c_client *client)
 
 	v4l2_device_unregister_subdev(sd);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
+#if defined(CONFIG_MEDIA_CONTROLLER)
 	media_entity_cleanup(&sd->entity);
+#endif
 }
 
 static const struct i2c_device_id saa711x_id[] = {
-- 
2.56.1

