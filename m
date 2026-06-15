Received: from mail-dl1-f66.google.com (mail-dl1-f66.google.com [74.125.82.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FE13B9D9A
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 22:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781563908; cv=none; b=SBKUNYJUD5m/ng796maytPqC1kUOfOKmoUcfOHMaAYwhDy1NfVaBg95qLtson/G3gq1wDrWvYuvzelzMCBixugtpF+aUsPIn7khTJ0bwYcCFeqDD8tRVKwNtcNc6kPPdvu8NtDT0fhjvIv9ixPsEv5ZN5M+MlCFw9J7VpQjCdAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781563908; c=relaxed/simple;
	bh=M+hj2Nqf3LDzJviaVJGd3Tcs5Kwr2bGut9vv8RQTNxs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hCwJJDofagurOmcIlP7sdY1q9w9KOxEb017WOllM55YA8iPWfOW4NWTMfOqANjN82s0v1HXs/XOfVJmeKJZD7BSP7sbDZp2dg6yyEY6u+LQNpGKsVsFUgFevt0/wHlZ5/tShD3HK4RzFlrZIqudot14ewn7fD05DY0pzLTvAuXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o4pH2X+a; arc=none smtp.client-ip=74.125.82.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o4pH2X+a"
Received: by mail-dl1-f66.google.com with SMTP id a92af1059eb24-137ec563a95so4241137c88.0
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 15:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781563906; x=1782168706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s5WyPCLi5ugfNhEA0SdDo47TvueXj+VvzxXVf6WgRg8=;
        b=o4pH2X+a4GUlA6DBNO6XLf1SsnPCEdkVHjEB2yrG5h9M1LqOTztMFDP50umRWloLza
         5hl/UqodykBn6HNgEA9hyI1HxJc/DUa7FaEZ/D3QCraq1knT3DFW3rgmzk0Y/z8e4WcL
         yU21vQ4XIDTUGe+BanZT3GFqb2qml71wy8OOOoKzNSgzssQLK3ha6F4gSowE3CQBY2sM
         +CSXNRfp/JZfavLkRLipHFO+JPWx9uTslcEloc9+po9wUEwCiVhmOURUK9c0hk+4fBTr
         xypS+wNWHvGdpwLJNh4BVZp7X9HrlW6f/YFbBDedFCf3ql0G6JjmxX6P3aHGJ1WE9g/v
         palQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781563906; x=1782168706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s5WyPCLi5ugfNhEA0SdDo47TvueXj+VvzxXVf6WgRg8=;
        b=Jlc/MQHLc7Y5eiFGMo4clyJ+jwRJjUmvTmkqnzLpprasPWMe7B8wpSslPVkvlhWY0l
         Avxn0tnbKSSZhB+FCzYtCR7ZvZqqQRdJx4trGjgKbp3P7wKfntNfLipMB+/GVV6zOqpO
         HeilvcfPzPPuyWlNGapBBGkNqFzN3orZD+vKJmv5CRGQRV4Tyy8dVobqMvKZFub66nHB
         vvbcfZ475XdPGkzOeOJLvjtG0BJ9nEZ158wtpsWmUy4YVUf31oa/9jWs0emj+dc95Vdj
         BYUKS5IoJsJW2u09Vlgnnhuy44Tokc7vKt9IJolKep+Pixek4uJTNUB9iwtRsQPj66DM
         EktA==
X-Forwarded-Encrypted: i=1; AFNElJ/WNDgqvql31HsuXL+4w96wrKoiydnxr87zfWmT6ma+JVT3/W2el+29eE8OlU7hpRZ6gnAUp1b6flhaJw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2efsBRAXHA3J0dZupBWL6RYZfJunn4+2R9hDOivHxa72eYNCq
	wi34B6wO/spClDlp9cDvRxMEXEvjetYkHDuRM2O+t04xfCVl1hcaxV3j
X-Gm-Gg: Acq92OEQ7+kxoP4Mc8XPZxXDnE0f4wxGuj/Xu73tmSdDgFDC4X3sM88nKAvuRtLupT1
	Nblylo0Rip8Mlv/QqeaR9NBsFkyMCitPJEH7C7Why9o0CAhn8o+JzLUS/Ru1e/eOErYXZOjoUDW
	QNmbYUrI8hmkuz17nEusokm8cqvAcjkkHf1XbP1+KPssf43VZN7oaeB/KVjn66fWNVM2K5MSztC
	3++09KNzKFP8cXRp8ibkraI/MyzoD4fLXfwsiDfMTMfnkK/8PTSI279WOMBeSkuf7xwnYI6CNee
	kN+2hDGt/k8qdxnYWK+M1cwSGBVet7xKeUZ3j2RAFaI3larXMIBcmltA+IY1OwhnyNQc8KmXuJL
	Jzq46Bh53YcmkmBfxwAyRQT9OjoFemUxMWSndmkXadlT9jAL/b6nrhW6qpeCWXFZc9OxskYQGsc
	Id05yWjqzELkkgKW120AgrM7SJ7KVEi+4V4uLKLfdZEhJE1azgilEb8VlG2bX2tDw6OGNydOy7j
	6WpfFRpmjBH8ZFNakktYq7NjHrbRtpOFk9BONVH6EXqdpWCfB2wecFb3E/yUnvBugPTrPKpXdXd
	xwb+t9fRs86JFV9D+w==
X-Received: by 2002:a05:7022:e11:b0:132:fac:2fb2 with SMTP id a92af1059eb24-1386f24acccmr5824218c88.8.1781563906364;
        Mon, 15 Jun 2026 15:51:46 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b8f9927sm11226511c88.1.2026.06.15.15.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 15:51:46 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: "GitAuthor: Ethan Nelson-Moore" <enelsonmoore@gmail.com>,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v2] media: dvb: correct CONFIG_DVB_S5H1432 macro name in #endif comment
Date: Mon, 15 Jun 2026 15:51:40 -0700
Message-ID: <20260615225143.22075-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A comment in drivers/media/dvb-frontends/s5h1432.h incorrectly refers
to CONFIG_DVB_s5h1432 (lowercase) instead of CONFIG_DVB_S5H1432.
Correct it.

Discovered while searching for CONFIG_* symbols referenced in code but
not defined in any Kconfig file.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
Changes in v2: Add Signed-off-by

 drivers/media/dvb-frontends/s5h1432.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/s5h1432.h b/drivers/media/dvb-frontends/s5h1432.h
index f031c0654e47..d61ccbf07910 100644
--- a/drivers/media/dvb-frontends/s5h1432.h
+++ b/drivers/media/dvb-frontends/s5h1432.h
@@ -71,6 +71,6 @@ static inline struct dvb_frontend *s5h1432_attach(const struct s5h1432_config
 	printk(KERN_WARNING "%s: driver disabled by Kconfig\n", __func__);
 	return NULL;
 }
-#endif /* CONFIG_DVB_s5h1432 */
+#endif /* CONFIG_DVB_S5H1432 */
 
 #endif /* __s5h1432_H__ */
-- 
2.43.0

