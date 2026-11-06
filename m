Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793951220;
	b=Cu/VpV8dNaT3/GZHiT8Uq0vFWPJmYsVxqf2fz5xRMi04FqLOrzvlvOUpun7rSUKNdaes
	 QZ0yBa5+uUm8aGUYKk8vHVkoPvRjMdJzM6pS18fF03UleH9w+kjy5SU3sbBjzsCiBic4S
	 7Nd5qutZ5f/59lJzSDqfUdJkfXXXD2ywkCIk4dXLzo53IC/pvLPr5yx65DsuMKC/s3A/6
	 w8vqkC1ypt/sxbBWdrPuI3gZ9edz4cFftqaZ5D0H+08oV7mSR4inl/4zvaq1ibA3TmGcq
	 I2wQDFXG02YAS4H7HTcO4cjH1lPMGpqzbqldcZC6kAJW7qj5NUgSG2c4UGiyXMd893Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793951220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=CuJmOzkn/aajdKzupwKXYaLbxRN7lmDJXXx5kcYCJHM=;
	b=rGY+tIOwa+mEOtOgfeCBH2qksdAvVrzGvnoMBT6XOoPFCdszYPAV6wg5IXExl4RJWB+t
	 7aJz+6iEj8tty9EWknWDMml3XOKwufx6aZttanBbJ3BgmrDSuEPjoOOAPWIGoLLm2uxxk
	 1iYINLQ7sQVfM6f8VWNodfJLq/2aPrddxGRjnvKNG3NbjRu1lJT3YPiZNJXcIGH4Lsmg6
	 NMF4T/xVyNSKedpm3BGhhgPmEceDT+7V5vtml+394Hfg8HUQGDCrZ9cKicwukJ4UQUMGm
	 1DToulpppIf3k52nAt0iIHCZXafU29iHY3NMLyvDsq/XiQsDbVo/03DS9/Pm3ZOgVUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x6WIGICk;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668B0606A330
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 07:47:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 668B0606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x6WIGICk
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1a2761c69fbso929298c88.0
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 23:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793951219; x=1794556019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CuJmOzkn/aajdKzupwKXYaLbxRN7lmDJXXx5kcYCJHM=;
        b=x6WIGICkrsqiieFicNlGJmFPW4aEQNGk69o+2wmMufM0fNx2hU9/SpfVwQZ/ggkb4E
         lFAGbZjwWyP57KOsh7SN8BNeBSOENVOg5RRoFIWaG3Z+KPxOAHsvi+m42Ts3lwL26oZc
         RjNooBOyLI8fXnb2xCXfKoqHM9GKC+sN+zXjSZ+UVOWIhtyhooABhiW1WdQJ8qxQZT4y
         AV4Fyndf3PSvS8AlJ+xRP9mrLOCCpW0+SX7Ou/xXevWzxSm9dDG7FUvEExEMe7YrbnZT
         6Pqq6TL80tS2mVsWLrNOZWe4RyGY0AeZvP6jKzBlP1ieoS0pVX0NigOhILu5ij0Y5ZVn
         ky8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793951219; x=1794556019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CuJmOzkn/aajdKzupwKXYaLbxRN7lmDJXXx5kcYCJHM=;
        b=uq4d5PuJlxJjTsSFklHXiRJfoaC/ce6KqpuRQ1AvaoMDSTciWQDTNTkzyoKr5taYD+
         5PwUSM6wbGyOEqvzQWRBQ6s63Damuw4OsRg4lPrP6H3RYHpDWbKcZoTPKyzELhXvLszK
         6uOA2tmwe7y6xSZxVgHtDy/HFlB3qdES5WuE/IsSDukFA6tHUPwn8XYbwY3SRrrwU6yp
         46CdnRY2q77Se3cdSlBBrhMf8E9Ch08mJRc84ktooj+lj0z9Rk9YIsOl3i0Dl9dflEVh
         3ZAGktrXuB0W3BjxNE2XUTwbTb8xKv7K0Mdt0hyKKfo+CrloHMxKqjlw6apsjunDzUk5
         goZQ==
X-Gm-Message-State: APuU4Z8YAIejwrC1ljGvztXpRg43ZwVWgjr01HAsXdprEj2xknarmEKf
	sycg8SSEhC+XIo4LfotvKtpWNHXJ/hvcmHPGNTTLtL39BhXLRkTlwV8ckbohx4rR
X-Gm-Gg: AYBFou1ZYPKlUVt2g0McAVEOWfNFvZCIyF7pjfiVSE6XSmZBur14D/l3xK1iDP1noGn
	cfj04LJu0nRUJIQG4NDrJROEylxv3rSxpAOCHmr4PIHX5Myx/fysr3cDScGnlG5mnmNkhWynCP2
	DRvhfQqheb7UFoCxsWts0S6ZGNSGmxo5ZxL1ZxbPu3mLtbm5DiGF2NIuyW7+cEl/aextg4pOX4M
	SHNpec16Jd9ZjhtBNYWd5kQgHy5q+LJzK7Vz1GRmizWDRofWvict3plFVTYuZJEpWbQD314u6g/
	WqbeUdDmH4ypD6sYVyj45sVqFXbwORaUN+PW1oAuSUU2P3RCk+tztSj+um7s85zwBj4HapvYdgm
	Mlrm/+j8YSbYtP1k6goMK2DpQoRuVPQgEK0GaOwx/RLNJ3ajBY9uBc+U7R9bxJL39qFGzS1FD/n
	UEkEvS+0qNjaLcKjxSJUUM8XOtN+y9ndCFm053hjHhrYYplT5DewL2WgztPRDCi703j6/Ml2peU
	IKSb/NPGjYjI9JJ5ZqdGpF1TE1ojvXKme19Kqp77pslglhebOkLlTS4YLAhsxtfChIypmpnKHBI
	Lr659PGn9jype4PlpbgbZKC3voOjrDR0eFOjzI27ldx+9j6vBRVBPuX1BsQ=
X-Received: by 2002:a05:7023:a86:b0:144:c127:dd1b with SMTP id a92af1059eb24-1b25d36f504mr2959762c88.39.1793951219227;
        Thu, 05 Nov 2026 23:46:59 -0800 (PST)
Received: from homik.search.charter.net ([2603:8002:ad40:56f0:d023:a7eb:667a:a3c5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4a610fsm3040853c88.11.2026.11.05.23.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 23:46:58 -0800 (PST)
From: Mariia Nikitash <nikitash.mariiaw@gmail.com>
To: hverkuil@kernel.org,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	kees@kernel.org,
	justinstitt@google.com,
	morbo@google.com,
	Mariia Nikitash <nikitash.mariiaw@gmail.com>
Subject: [PATCH] media: radio: Replace strlcat() with seq_buf in TEA drivers
Date: Thu,  5 Nov 2026 23:46:39 -0800
Message-ID: <20261106074639.452630-1-nikitash.mariiaw@gmail.com>
X-Mailer: git-send-email 2.43.0
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

In preparation for removing the deprecated strlcat() API[1],
replace the strscpy() and strlcat() calls used to construct
V4L2 card names in the TEA5777 and TEA575x radio drivers.

seq_buf tracks the current write position and remaining capacity
across appends, avoiding repeated scans of the destination buffer.
This preserves the resulting strings, including truncation behavior.

Link: https://github.com/KSPP/linux/issues/370 [1]
Signed-off-by: Mariia Nikitash <nikitash.mariiaw@gmail.com>
---
 drivers/media/radio/radio-tea5777.c | 10 ++++++++--
 drivers/media/radio/tea575x.c       | 10 ++++++++--
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/media/radio/radio-tea5777.c b/drivers/media/radio/radio-tea5777.c
index fb9de7bbcd19..2b1c7f6ddd60 100644
--- a/drivers/media/radio/radio-tea5777.c
+++ b/drivers/media/radio/radio-tea5777.c
@@ -13,6 +13,7 @@
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/sched.h>
+#include <linux/seq_buf.h>
 #include <linux/slab.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-dev.h>
@@ -255,10 +256,15 @@ static int vidioc_querycap(struct file *file, void  *priv,
 					struct v4l2_capability *v)
 {
 	struct radio_tea5777 *tea = video_drvdata(file);
+	struct seq_buf s;
 
 	strscpy(v->driver, tea->v4l2_dev->name, sizeof(v->driver));
-	strscpy(v->card, tea->card, sizeof(v->card));
-	strlcat(v->card, " TEA5777", sizeof(v->card));
+
+	seq_buf_init(&s, (char *)v->card, sizeof(v->card));
+	seq_buf_puts(&s, (const char *)tea->card);
+	seq_buf_puts(&s, " TEA5777");
+	seq_buf_terminate(&s);
+
 	strscpy(v->bus_info, tea->bus_info, sizeof(v->bus_info));
 	return 0;
 }
diff --git a/drivers/media/radio/tea575x.c b/drivers/media/radio/tea575x.c
index c37315226c42..e49228eb7c46 100644
--- a/drivers/media/radio/tea575x.c
+++ b/drivers/media/radio/tea575x.c
@@ -9,6 +9,7 @@
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/slab.h>
+#include <linux/seq_buf.h>
 #include <linux/sched.h>
 #include <asm/io.h>
 #include <media/v4l2-device.h>
@@ -221,10 +222,15 @@ static int vidioc_querycap(struct file *file, void  *priv,
 					struct v4l2_capability *v)
 {
 	struct snd_tea575x *tea = video_drvdata(file);
+	struct seq_buf s;
 
 	strscpy(v->driver, tea->v4l2_dev->name, sizeof(v->driver));
-	strscpy(v->card, tea->card, sizeof(v->card));
-	strlcat(v->card, tea->tea5759 ? " TEA5759" : " TEA5757", sizeof(v->card));
+
+	seq_buf_init(&s, (char *)v->card, sizeof(v->card));
+	seq_buf_puts(&s, (const char *)tea->card);
+	seq_buf_puts(&s, tea->tea5759 ? " TEA5759" : " TEA5757");
+	seq_buf_terminate(&s);
+
 	strscpy(v->bus_info, tea->bus_info, sizeof(v->bus_info));
 	return 0;
 }
-- 
2.43.0

