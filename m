Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13932472AF
	for <linux-media@vger.kernel.org>; Sat,  5 Sep 2026 03:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788577673; cv=none; b=jrcHjTbKT4fQPtSXj9AizYNyc/jj3XbUlEi+xU3qeCbWEkyqdEgYOfTPzAdvv7kv/7szGrPy768aMOTWriTEkW7xCsJqwdYRIGnwbq7Dj1fUW+HZmttCHnDIPJ+l6kMtHo9wbWQG2mScPklp9O0W+QZAlxL7X2OF6oxfPrTFmM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788577673; c=relaxed/simple;
	bh=KtT5m4r4TXXxrmuudh3sl5ESBo3/BpcnMRgfe6/V4OI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aeuf80RCMpxk2fBkPh/+gqUeFSJNGUqDvg96Jg4dhutkKnK/HcCH7zagYWlgyaJHmg4xQBlYAKjR9og9bId5JSBRnNaT5etqAsGrPIWPg33OhNKDN4AwDqvzYzOq8tBWUAFU63CIwxRu5jPO1xCLB5iBzrs17Q7NNCXdaAElwLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IIREVHVy; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IIREVHVy"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38e58034d05so1457344a91.2
        for <linux-media@vger.kernel.org>; Fri, 04 Sep 2026 20:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788577671; x=1789182471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Up8+c7t8FLhOpjtV9V7ggHhViPAp8JRhaSYfeghZNx4=;
        b=IIREVHVy1+K2iIZ9NG4FTgbsmDhoA5xeP2obycTbC4UX1AGCEpDwgMNQuf4cnmXJzf
         DFbFJaXe+5xMRFIt6SrzOh8X8YZzzc7niE6mC/lb2nFxl7Dr78vHVTtu+dwuAplsyb4B
         UUuaP9MoY8Lt/3stSJDFYPx6GdPs/vNxH6tGlCj3jkaYJlLhQBNxR9nm+YoUd9d+w5Tq
         fuZtqgwRhHOTHTdWdwiFItaHu2EleH4RZPArtkcEXW/bRLMx2DrQ8DRtjWlmFmYJVnQg
         p8ITUP6uMJk9AVJPnqGmWw/yiuks0/ISAspTjA4qWsUZIKXYPSqKolvb8zmPhs1Y2a/m
         RaJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788577671; x=1789182471;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Up8+c7t8FLhOpjtV9V7ggHhViPAp8JRhaSYfeghZNx4=;
        b=clZ7rXDYOQx7MHGAULyWR2/Zim796ga/Xh5VdOOjbA9VQ/cfF8T17vQZ/Q54ME1YNU
         fLnJrlJi9YcNmbQ2WgbTHhbhQdJpXhnd4CwT0SJvbfGB/OeQSg3LtkKNFRfPzp0HoHmZ
         t+TSUiJ9aM/BQfwA4x8wFNoaTWUYomTFVMCFbl5lKWdP8K0NnMG0VR/21SdadXsy0NUA
         nKfrtiQyuKowPbP6WGYBhipNLJPbJk1f9oa57qNHpQBv8ii1G20n56SZUja8ydBdAnpW
         /EgyhhBTcV4N+WJKjSOAJvcIwIlkxgPmtLMHAYCKTwFwVfzGeJYZWjO+FuuNtIhsc5AI
         31Pw==
X-Gm-Message-State: AFuF++kIzJIDayir8ON54MpwAa6p9fuLqQeIKH7noMnsxfnNGEXlGSMY
	3eBM2p60x79xNFujRdOVUfUGyzeUzrSt0Tl2MLeTi8d2/UQUbetdacyORP+jqH7MZBY=
X-Gm-Gg: AYBFou3NVzoUFGYuixgtdse4JfZXYFF4l26l+j9KCLBNaOEd+5/DrZ9IWsp4NVhXhDH
	+5Bg20EN+G5fO5VdsIZ/Ih5zyrPWWR8H/AyyHJSOK/8oTsguULkEIAdZXpnAODtlflaKhiLaww8
	lbJOuuWoOdyGWnjnBNPS47DC/70zmZWeRSZ8zWojHdHpOAUyg7ma8rvTBtL0VBq7NQPWS9uThC0
	xE19kN2TNP4uw1w2vM+OGrxUvq45ttzS/y9cmrZKqpUkvzl1TpvVVydVQYXvVisfYjgNBpQxuqO
	bFbakvlIEmXYCYzQi1UEQIHXc+1urppcf08xJ7tqPzERLBp8GtxP/BZ/5wWNEkJbxhbAPniOCb2
	3hPmu/ac14CJ0m6l8Mk4aMAgfOVa4gTEVRM6r4QxqkijdQD7hF/Q+31ngj1EG/E+/YFvxTaxncn
	lgySXykoGcskjx9WgMZGfTJZlxh1qrk+fGAZ6W5XBv+eAzT/4nbJkIMPETAK7aXaRLzfRBY2ewf
	fpR2bwhP1ACkliHW3JjPvvTBg==
X-Received: by 2002:a17:90b:2b8c:b0:398:9be6:f995 with SMTP id 98e67ed59e1d1-39b262aaf48mr17356406a91.20.1788577671347;
        Fri, 04 Sep 2026 20:07:51 -0700 (PDT)
Received: from archsung (186-244-17-112.user3p.vtal.net.br. [186.244.17.112])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa31b24sm10344142eec.13.2026.09.04.20.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 20:07:50 -0700 (PDT)
From: Felipe Calliari <calliarifelipe@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	Felipe Calliari <calliarifelipe@gmail.com>
Subject: [PATCH 1/3] media: ov02c10: Drop duplicate register write
Date: Sat,  5 Sep 2026 00:07:30 -0300
Message-ID: <20260905030732.39196-1-calliarifelipe@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sensor_1928x1092_30fps_setting[] writes {0x395f, 0x00} twice in a row.
The second write is redundant; drop it. No functional change.

Signed-off-by: Felipe Calliari <calliarifelipe@gmail.com>
---
 drivers/media/i2c/ov02c10.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index cf93d3603..6220461fd 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -209,7 +209,6 @@ static const struct reg_sequence sensor_1928x1092_30fps_setting[] = {
 	{0x395d, 0x05},
 	{0x395e, 0x02},
 	{0x395f, 0x00},
-	{0x395f, 0x00},
 	{0x3960, 0x00},
 	{0x3961, 0x00},
 	{0x3962, 0x00},
-- 
2.55.0

