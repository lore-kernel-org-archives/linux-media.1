Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE193E1D09
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 19:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774986453; cv=none; b=p6tc977Vl1dUepVttq0cKcXhr1/ZGIoBFgIg9MB4tm77wHY66z8ISNwOqudWQ4T/CubuVM2h2gYQrf8k75ypGQK2ta1SCKkcIJhU9rk/G2dgpMGAUwaCoL1CEOeebSUkaQ452u598k2mPliZvjr0+5uG8csKstU9UU9sClG5cx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774986453; c=relaxed/simple;
	bh=4MLhWAsRPS/GMJ77cnAfXcOUDdxvrMlvNQbTdfGDqn0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=blrwCSt0D7N+0vqlREu8XiBd6uNV+UJRkXRHdl5O/8kk0/5r62skebjY1cvhHCu1EA+Zchu7bCUUFnicSWHdKFMJXbu6P9nj+6Xgh/BE1jnfrMImq3tTVMcdj0+9DVkBlLCFxP0NlAR3kmHb2Smz3kYnUHfPGTPhx5DjRl2dK6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VVj1rBoE; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VVj1rBoE"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-50b35f3e489so2474131cf.0
        for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 12:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774986451; x=1775591251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aahcRlRALmhb180/BpxyHuCk6pNr8BEHNKaLvrFYGcI=;
        b=VVj1rBoEr2sTKidZMwxBJdOHuY8+6bQyPGnrcak5ZvZlWlLBXgED/J9ExxuIWSnyPv
         b/MhD/prjDsgvUGGy5n5Cmvqp6j70vq8HzE0+dn53YRSR9RvZYS/1iJk8dPHxzeBsKla
         UBgLbgCaisDKh3p09ZPDpZFN3gxraDfkf+iB8IqRJCsglfcZeg2bhkpH+J9JroalZozl
         7Awst1QstzKRTwYMKtd+DzguLE9eyo/1zgEkMY1UpgUBEF3G4Skx2E9KiBKKLXhcJYvs
         Y7zBaLZ44rtiJHMdgJhOKa9JwYJf2lTAQnXkCdFroS9saT0sf/FJ8RepXYaymbxgCBW3
         HJLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774986451; x=1775591251;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aahcRlRALmhb180/BpxyHuCk6pNr8BEHNKaLvrFYGcI=;
        b=Up5GfdQgGugbN7n/q5i1wJs8mYWoqmglbsBtPXJLDMlI1Sr/uJIBN9iH4obxBAqNaq
         7S+lI06dRvSwKVdbxnwP7vIs96CITyaFCMXVqq9ga0u2R0pXgChQg0xRqSjmu+bCL2uM
         Pq+dMNkvGhsc1BE6drz+CYj9mCS28PmyG3KFy/RVmeQ+kRhKEnC5Ar7kpd+piqDxFojM
         2QH84m0X1Z1XyZG7I2a+HZnDb4iR1UHvSnnj0FNGUVoQfHnIUw1T6BrNHy6uGnqa/a5V
         aZbVT2NyPsNLVYEKfxVg7VSEAxV77r05gHonxArAZwEQ9TRwSZawvZS2xtvyLBkhCe3f
         5wyg==
X-Forwarded-Encrypted: i=1; AJvYcCWI+o4GO1lda/e1rfCvsvfHMdUWXtiFlkct4TSr5viIn+9H5icDq0GoRIFPeJ9V3Fbf3dQlVKupzghnyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcQotldfRsHmC8FZ6dlZTuBFa6GabQbg+pA8OcV7DI4VHyT+h0
	Aw/WDQ2lfMs+dyIBpUTWzBWMr0x1Lav6GouVGS4eeZ5KklS4aAi5MzgH
X-Gm-Gg: ATEYQzxnn/IFZWJrkhP8xZ8QNeKr043J+breVP+RLWoK8xXTfZv5yjjFD+XHjduYOUO
	v7V445vN0JzshjQ0O44ya9eCqsp1zvoEeSBg+JY56RkZnvXX0s8E0P1HBKgEP1QsnnC2HSdmv13
	Bwhz2LvgON4nJK6Sgbs9cN0eQJF5KAscfy8vZClvudsl/R/oZGz0lLsdP9oL4rCJ4eaJjN+4iHQ
	64d88HjWqjRveclTC3cw1gd361+JWrOxkMrfIQFi2DrrGbMqtMb9+k4Lc8aXrycF9ttlzd8kYgs
	hKQX5QywASvvlO8ZgrfJTIjXzDEXZvSLybar1uSqNjKjTroBRALZtNya9MrKyT1nE1X5EZMewOv
	b7JcextXU2JNXOOKK+7VXKzszT/qpZaoKHct0hZYw8xeIetbapMX8gqXGHpjF1zt4div0fCh3Gz
	dDp72Kgsv87ofARvLKW/T1R1LH8yWynVmSbDjc31553hju
X-Received: by 2002:a05:622a:8f13:b0:50b:485f:a06d with SMTP id d75a77b69052e-50d2c8aff39mr38438811cf.22.1774986451299;
        Tue, 31 Mar 2026 12:47:31 -0700 (PDT)
Received: from localhost.localdomain ([104.39.66.164])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ed02364edsm96119246d6.46.2026.03.31.12.47.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 31 Mar 2026 12:47:30 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
X-Google-Original-From: Yuho Choi <yqc5929@psu.edu>
To: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Kees Cook <kees@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Thomas Andreatta <thomas.andreatta2000@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yuho Choi <yqc5929@psu.edu>
Subject: [PATCH v2] media: atomisp: gc2235: fix UAF and memory leak
Date: Tue, 31 Mar 2026 15:47:27 -0400
Message-ID: <20260331194727.52054-1-yqc5929@psu.edu>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gc2235_probe() handles its error paths incorrectly.

If media_entity_pads_init() fails, gc2235_remove() is called, which
tears down the subdev and frees dev, but then still falls through to
atomisp_register_i2c_module(). This results in use-after-free.

If atomisp_register_i2c_module() fails, the media entity and control
handler are left initialized and dev is leaked.

Handle each failure path locally and unwind only the initialized
resources. Return success only after the full probe sequence completes.

Signed-off-by: Yuho Choi <yqc5929@psu.edu>
---

Changes since v1:
- Edited the commit message to be imperative mood
- Corrected the previous mangled patch

 .../media/atomisp/i2c/atomisp-gc2235.c        | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
index d3414312e1de2..f4eb15d307fae 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -837,13 +837,24 @@ static int gc2235_probe(struct i2c_client *client)
 	dev->sd.ctrl_handler = &dev->ctrl_handler;
 
 	ret = media_entity_pads_init(&dev->sd.entity, 1, &dev->pad);
-	if (ret)
-		gc2235_remove(client);
+	if (ret) {
+		dev_err(&client->dev, "media_entity_pads_init failed\n");
+		goto err_free_ctrl;
+	}
+
+	ret = atomisp_register_i2c_module(&dev->sd, gcpdev);
+	if (ret) {
+		dev_err(&client->dev, "atomisp_register_i2c_module failed\n");
+		goto err_entity_cleanup;
+	}
 
-	return atomisp_register_i2c_module(&dev->sd, gcpdev);
+	return 0;
 
+err_entity_cleanup:
+	media_entity_cleanup(&dev->sd.entity);
+err_free_ctrl:
+	v4l2_ctrl_handler_free(&dev->ctrl_handler);
 out_free:
-	v4l2_device_unregister_subdev(&dev->sd);
 	kfree(dev);
 
 	return ret;
-- 
2.50.1 (Apple Git-155)

