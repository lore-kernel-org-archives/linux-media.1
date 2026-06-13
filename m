Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591DF3A7D91
	for <linux-media@vger.kernel.org>; Sat, 13 Jun 2026 22:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781389807; cv=none; b=obNExfTKJqsrsjBotI0CAN+psUwAyvPwTe6oYTQrs1va7wX8JKUqnRUIWzwn1qPNHMKbX5hrO3y0k6EbjNklfnZpGsHY37DEMkr3iT6+WZ9HtHYYbC3ynSCGbQ4GcNaYIWan80mvqQ5EhWaBx/fMIgAHHb+RSELT8qyg3gMK/rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781389807; c=relaxed/simple;
	bh=vPpyTvxxBqRmcep2oaSdGTqOmbhWNzbPl26++DrIg0s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KvcBQaEY+XC0r/0486MUIrAmk7zjDuVVU1rAE5NObgyVdt69jkvGq5HWPVdk1XDKFY1u7GVlFaKvihbdAK7T8sscRi8+ZPfLZp3UM9guXJ8VmbEIkMUkbPWOEbzWbiia3VkInTzDdi/rwR9tY/HfAhe+E2C7zYqbaWVU6jMby1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gb4qQrrl; arc=none smtp.client-ip=74.125.82.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gb4qQrrl"
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-137ec563a95so2203597c88.0
        for <linux-media@vger.kernel.org>; Sat, 13 Jun 2026 15:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781389805; x=1781994605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m7447G0vIwoZdSsMrz9uhPx4TSZ+Zq3wt2PwEuJ7Epg=;
        b=Gb4qQrrlnATY9y2pLrrg9cTB5Eev/vCt5Wd9uib5VOXcp3mCi4Aajcwnmhj4JEvcUH
         XI25hafbv14jlxBZ4uWSlzPwiQnrDvJi2SWmFrJ21p0+40JOWTr4rQ6tNxdxuOgKP2hu
         tM3Cvd3HOW2b+f66+ZJnUmzl+w703SBWmk3YtE85MOgZbJQaKAh7eTsy0JCJ1cclkQFP
         Hj+cSHnTL0UWPJFJbFcLdn5mI+dCqB8/78sYb5KNs+Q/gM7P60Rdr2WxSIFhOTFx6YIU
         9317v7K2PNlC5Wkcsx39N/Rr+ifqQzKRyxDQnaKgeBg6kYU4iK8/xhrswBOVAHuy3G/L
         3ocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781389805; x=1781994605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m7447G0vIwoZdSsMrz9uhPx4TSZ+Zq3wt2PwEuJ7Epg=;
        b=PSXD6MOuKQhSvGaT1ptMaL4S0U9Awz8+0aBSxZ4LHZqJgcjzalLU6D9llIXNStRLKp
         vD4nEhWz1/uc92S32gAOkuGMcuu4fDISn6PDMYxeRSHJqj680Li3Gf8AN7FjGxCE/+jV
         p7GwGAuSNxKZFa722n0MP4zgTAzKCzewzj4wBBzirFFYEfxWBG4EebWwSIlMwFEEAQn8
         o0RqJrrj9D7RFf/bz1wOd3sWHd8phsPhMqMuVHBmmCG/F69sT39c1gub3h3v2y1bqC5s
         ZkAZ2UIO6VIIUXN24SqkoXY3Ibrb+K1rk81NZUAXi2dCvf4r8OPDuQQEsQVM6nn88032
         phPQ==
X-Forwarded-Encrypted: i=1; AFNElJ/fvq0C3Mm8UiQaJhrmdNesVeYGL2gvLdUc9sBKTl+QW7l+1fXoBtFxGiD98bgTybNJDIWCxcoyG1gKTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpWN3+/+2n+3QJAQ7dMvAKGKL8IoP+DukBR/6zPBggCN+2mRua
	LbWOBUC7AjTIekTz1aCGHSxxgUcAy9fHPt5koOhwdS2Zk7OGQfleCzgICbOrIT+W
X-Gm-Gg: Acq92OGKA2ZQZw1EvJesoOc5Xv+r8Ok3hQgQ1oKvcTVc8H6eXeX16gxzFqkGY33M5hf
	iBwiZ/kGAWCG9HvG2B+9aNsiAsJN/TMh4KnJfASYKCZsrOUdm71QdwhJINW6Y2v7b1G2FdSoEn6
	a3oXW6lDmcuujPESRVX6YwZBuuP4P5Pmin3UpUQsv+lwbGDjUDcf9vwDcy4E+75rNQujNwjOLgS
	6fSJqBAnnG/K97YcLmpzpefit/Yq9ig/cS9GTvVGbT6S5LUQLXB4ROnKp3Je3itIgc2a/tnyz6X
	X/UkAjfNrUDEoNlB82CkjVmM95pg/3ABMG9/URjfQcB46rGPm3nLtjMRC913SkvU0DgeOTNoaVf
	HamZlZ02jxbY6T99v0w4JUjq1FBlTsJzmWBum9Nillr56yxcHmvc/UGwCtuzD609f5T0WyvPHGP
	Ws5NRXeKFduiQnOLvgXugFcWI4EiJrml1GCIp5HE0JUtVYDqxuSk11C46Q1V7kJX+t5F5lPOfXf
	vdrq8uw/tSfre+vn+/f7Mw8h/Ijf0km6JGuA1yc9O/XV5RMVj2mV5CRtJ3Gjh0DwauRqGqu9sEv
	9stIotEtQIFFXygsQw==
X-Received: by 2002:a05:7022:6712:b0:137:e6a1:c4b3 with SMTP id a92af1059eb24-1386860936bmr2006083c88.0.1781389805295;
        Sat, 13 Jun 2026 15:30:05 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b8f9889sm5901094c88.3.2026.06.13.15.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 15:30:04 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: "GitAuthor: Ethan Nelson-Moore" <enelsonmoore@gmail.com>,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH] media: mxl5005s: correct CONFIG_MEDIA_TUNER_MXL5005S macro name in comment
Date: Sat, 13 Jun 2026 15:29:54 -0700
Message-ID: <20260613222958.103826-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A comment in drivers/media/tuners/mxl5005s.h incorrectly refers to
CONFIG_DVB_TUNER_MXL5005S instead of CONFIG_MEDIA_TUNER_MXL5005S.
Correct it.

Discovered while searching for CONFIG_* symbols referenced in code but
not defined in any Kconfig file.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 drivers/media/tuners/mxl5005s.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/tuners/mxl5005s.h b/drivers/media/tuners/mxl5005s.h
index cb7395fc4b70..b057fa102792 100644
--- a/drivers/media/tuners/mxl5005s.h
+++ b/drivers/media/tuners/mxl5005s.h
@@ -116,7 +116,7 @@ static inline struct dvb_frontend *mxl5005s_attach(struct dvb_frontend *fe,
 	printk(KERN_WARNING "%s: driver disabled by Kconfig\n", __func__);
 	return NULL;
 }
-#endif /* CONFIG_DVB_TUNER_MXL5005S */
+#endif /* IS_REACHABLE(CONFIG_MEDIA_TUNER_MXL5005S) */
 
 #endif /* __MXL5005S_H */
 
-- 
2.43.0

