Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793186525;
	b=gCPMC1t+ygxQ6arSrDm9izlcq7rF+a7+RHT9fI7KGJC2tIhmorHrH6wxD8uxD6qn82Ph
	 4v/e1tVZnyYFoVKZ+Z9VheQcsZFCWPwCAmiUBu7PCuWTWhEUCOMM9LqNtc9fZoHX9BYLB
	 A26MtPrne9BIqyDDoXcnWldw2iqNhV/f+MY0XJGoi3Fq9mDOYxkp4DBNNP8Bd1hA0l1FL
	 xApOziRoVqGmATTrGqJICT+5wSY8Uw40hUFBLU1xeKX5dVvwNmOYg3wWini8Bq+QBussi
	 nosRkZrHmwnJ4ReTCP0VZgyOyCZBdwKTnop2R0xOdtimbBYLmUTmwTgNLdPo46iXdVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793186525;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1umUU6E6aYyeT1k/Gpsp+FhAOaMvQ+4/dxDpS4M7kSE=;
	b=u2UT7C/DtkNCrWYdPI700eERRhW0672hXFvRt+QCvILu8m41WpN0oybhSsznm384YiVM
	 dG1w50FOfv5kYGEK21Y9f1wbOFcrTUpqM4kk8fYf1srhIwfRiOCqfRDyKI2r3ez6Hl9Vr
	 XTOzh6Hj/Zk9K9Pgr/xKxqiAevD+DGHaGGeDjoTRaGrmyFiIELdDALOMREvOMyPlbEAmx
	 n+vIdoDw+zT6ic370ich9YSZEJwpsuE3aWzr55tBfXBe1Q2H0S/2u8G6lvfuuN90BwV2C
	 Y6x8ig13AxTeQDf7XkYqU0uot0jvxHX5+idct3a0Hb6lAyu7DZperRx5TnRPsTbfIiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GFE7gnnk;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331E960A2607
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 11:22:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 331E960A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GFE7gnnk
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2eaab3502caso470805ad.1
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 04:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793186524; x=1793791324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1umUU6E6aYyeT1k/Gpsp+FhAOaMvQ+4/dxDpS4M7kSE=;
        b=GFE7gnnk+aBcA/fY+gjb1rhv6bm5tQcGawDxJLAQDvyPZguCQUnJCA427/FEmgdDvN
         ytjIDVnc3oDX9ZXpiEKvfuHYdiwcvhnjRsX//WWbhiBJh9THbFTgklSW2U3pAjuZ0Dqx
         04YMUw0dYaFyLrzsr08V8/cMcuvS0mpnXDOoJrxAipGyqaWVfHMKaE2erbfuRc3f/1Hz
         DSwa8YQNUZ7pJ/gDgZ9vGhCISJh95iGv193gO5kihWAVvQYk/ZbclW7kpdVZpRieXCV0
         5MejiaTvIKa5PwgyW1ODXS0hG6iZzhSC/IomVRB44oDKG8Ng2dTwPys/2Q+ntPIybWU+
         dnQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793186524; x=1793791324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1umUU6E6aYyeT1k/Gpsp+FhAOaMvQ+4/dxDpS4M7kSE=;
        b=TYRb2csV8k426EO7eHquXjcJZJUH+8Owun8qPuuN4/pYkyWFy4R+YGWkFMjemCns6C
         yenAHAPwnauXmCdQww+urURbpJAUj9tcsDXQljt/75rjJIkh5wAkokq4oC+iVTe0dWd+
         H6/a/wBRQOOe+f1/JA3axGqwzCI25BxzSnxCK65NxxaOmiw+toDCKiPE0iXGwEzNyddn
         yYautzAofVPlC1crPJ9hHYa+gxDgWLWVfupABEapJO26+ZKwOb4yJ2hm1exCAG3c7pxv
         K5mvwWzYPC3sIOMgfWJbgDUVtaA03nBd+bHV82aQsUNV3JlqTQFnlZB3C6yPzcvLfJQB
         K1eA==
X-Gm-Message-State: AFq9FYJN/xNBVQFklVYfy7c5Ynoquf1K5NYQohXWVOWOw8n1BYluaD+8
	wIJ2/mPMmuclzgW23ZqA38TFSgpJrpMGNzdqGD6Vf82TBwifpAD8EfpDhTFlgnKjhUg=
X-Gm-Gg: AYBFou0Z1XH0nPicwwrtixmAz4aSppA1mfdE/NOJZfj7dBSf0WhDdL1F2rCZzRk6Ydh
	AtY8A/A+jy8XZTEde1UkOPFeqMXcdRe01unNaNdY/vEr0yQsH3MonE0vUbAATPzisq9OKd903Jl
	rRmmTnC2Gy6DFiqY6kr01rM0ztprXAFO0IPBwZvlqdbDRrcj1271nn3HN5T1gFh4s8UTw40KbqV
	4ft77ancyafuLxBOYVU/z94XUbok8PHUN0o1VVXulFsJK1zZtU71I8ZT7WtkiryYBNDUMlpwJ0s
	A5FIUDosQA8lcdwJc9k57Tj6J6FMUh67CxznLcc4sjeivCqA8SKAb7RuhQnIWS3A+1qUF0lt+3B
	TSxxtv3660rtZjnaRG9ZHN6XA2C1tDxlHUsIBlo0ZK/LJ1vsupYLGEOV8WP09owKtJRpYPPk4+D
	5xbcGwCRVMT97xPbE5kjz58XQZR6M7PUGUzKJBVruNsrq2Pbf/UXX5gW+TGg9k6Idp2qeq9TtGU
	egmyt1nhDzXkjT1k5kFigtzJl+NWmiMBYklCS7sjw5vR7ewDAHQPq6m+6HnW8UgmQSXbQ+DktPM
	JtCxpcHBP+t+B/FnAri+xqDtc1PsodzEcQAOcRGUE4HeHbDIsIQvYccZifKdIYd17lrBgpGW3W6
	ifEjxOW2oFj6Z1LqP1oYw/S8TQqWPTS9vwNTpfrd4sK+I5ohiCrKxyyn+Au2FC9XGOzc/onrBrw
	44QPLADol4fNhUwr3UNtU=
X-Received: by 2002:a17:903:2c6:b0:2e2:d09f:d772 with SMTP id d9443c01a7336-2eaffca66e4mr32450105ad.0.1793186524518;
        Wed, 28 Oct 2026 04:22:04 -0700 (PDT)
Received: from esteban.tail1178e6.ts.net (132.20.31.150.dy.iij4u.or.jp. [150.31.20.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eafcdb52e6sm10157945ad.74.2026.10.28.04.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:22:03 -0700 (PDT)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	hansg@kernel.org,
	andriy.shevchenko@linux.intel.com,
	dan.scally@ideasonboard.com,
	djrscally@gmail.com,
	dmanresa@gmail.com,
	dave.stevenson@raspberrypi.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 2/9] media: i2c: ov7251: Fix link frequency index
Date: Wed, 28 Oct 2026 20:21:47 +0900
Message-ID: <20261028112154.855185-3-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028112154.855185-1-antoine.pichot@gmail.com>
References: <20261028112154.855185-1-antoine.pichot@gmail.com>
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

ov7251_check_hwcfg() stores i, the index into the firmware's
link_frequencies array, in link_freq_idx, which the driver then uses to
index its own link_freq[], pixel_rates[] and pll1[] tables. The matching
driver entry is j. Store j.

Observed on a Surface Book 2, where ipu-bridge lists one link frequency,
319.2 MHz, which is link_freq[1]: V4L2_CID_LINK_FREQ reads 240000000,
and the pixel rate and PLL registers are off the same way.

The 319.2 MHz table this selects ran its PLL outside the datasheet
range until the previous patch, so do not apply this fix without it.

Fixes: cc125aaa5a78 ("media: i2c: Provide ov7251_check_hwcfg()")
Cc: stable@vger.kernel.org
Signed-off-by: Antoine Pichot <antoine.pichot@gmail.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/media/i2c/ov7251.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index f429de5f1f7c..1f30a01c85b3 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -1523,7 +1523,7 @@ static int ov7251_check_hwcfg(struct ov7251 *ov7251)
 		goto out_free_bus_cfg;
 	}
 
-	ov7251->link_freq_idx = i;
+	ov7251->link_freq_idx = j;
 
 out_free_bus_cfg:
 	v4l2_fwnode_endpoint_free(&bus_cfg);
-- 
2.56.0

