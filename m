Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3743B0AE7
	for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 20:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786568136; cv=none; b=UnHy60r1CrsLccqrYDqtMkBR36oqXZaheoKgpxRWbLVLDsL7bdfXajKQo636LvJiT/IRW9pYRcfAkf3i3ff+S9BtQjh7DEyq288+vbDI6A2qA6QyPrXlrbFiGjxsAZ1mpSK94JW0+ZhbWMN044zU+NMQo55C92P54LSA8w+FwoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786568136; c=relaxed/simple;
	bh=yJUCgUb4KFcxXLpPv/Qf1WbDX5e+fr80HZIWVnsFP3A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KdHco0u1ZfuN/gWc9v9u+6rF0aRqsQ9eMqxmU0mZ9cfaJ3r9h+AuPyFSfuhYD8OndXWK9SP0775qvamCqQQSr8BXtWw2B+Q6H2+V++7KL92UxDvXXLxuwxOmrejSYn41r/XvM9WHzvJV1fhneVyQsuJyd9LlSC8ltOG+8DggwO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NG3/SLru; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NG3/SLru"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b0148201fbso1159351e87.3
        for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 13:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786568129; x=1787172929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gjB2fBDmkMwtaR91YZkC47S7tI/AMH5A7bYroiu6yaY=;
        b=NG3/SLruuNcjdR5iOHPh9FkWxwO8p32Yd+KvyVdxhkLIL69rRVg3jLcNhpFTfBSPkb
         J1N2qKr6jtr0XbKzVkYq2MUOqv6GFF18m4vasjw6xyxpDZpSTB1dyUkIrYig7LsiypP+
         Dv0LBwicDxOsiLL2DwrOXavzl+IE/kpr0HHCtajGrn7DrG7gbD7ByUrOGPnRVj5jlTWB
         bqBbnPjTbkR5213GD2FUpZLbsLPCGbDuO9bimIfll+JU56UAVzb3me+AtzVe1DfA3V1X
         OisyJUyKNU2hug/ZzR2D9IzBP9FxUttYR1K90pPWXL1A6tW//cLpX7AxODerRnVp/bd8
         /KKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786568129; x=1787172929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gjB2fBDmkMwtaR91YZkC47S7tI/AMH5A7bYroiu6yaY=;
        b=ZMPG9QNAHVW+4GTGfM3DoXcksuCfmVgv+DuSpN/Pltv1UIowh66R8L+nNMGfiTPUkx
         ksHlDR3Ip55BKidRg2AL0tl6raObQClVoyH+cKX7aRRxOFbFj3CtX/HhUGnoh4E5wpRE
         Lmlru70QpabbCkj3p6PU2aNn9BIxIgIPsy3Og2Kks1Z1BD9PiTJaJzrslx4+B93Ir7dl
         aSrJyq61o0aVegHH9vG343ssx9EKhbhwEwNdZcqda+6wmTvLLr65vSxs/80aeIlzEdLh
         jhtszGWSPyWXuL5QQL6p4dpnF5+Pgf1L6iLi7yyIRIJwCjvECG4JMloVwsr0zMlZH78i
         FRpA==
X-Gm-Message-State: AOJu0Yy5v+Q5p7c7NqJYrwGdLhZjChJcisBeLFAqqlC8++eWNsNTHoQv
	ELhRfJdtwZ+dBU56hZhTOKnbaAy8vSdeDOobWo7JJS09Q/HkjRsBtvCS
X-Gm-Gg: AR+sD13ynMsX30dxoI9Vn6LqRU825rA6cqm9GAYM4WI7ql03VW1WVSGkc+xDLHlc1uU
	/2kwE++LgU8xYd7nSXxAHnPuLHGydm25jhyaipwJOBAzUbVFge9rP+4tigLYvtwcdVB631KZG8L
	wePexf21v5Mtik1wzEctW8ExxMMLisQeCH9wY0VS8Loogske40/GMj1fhn+XNOAl2duL1b+hqv3
	5mCpw9p2ZBrGDTS4CD/UsAE2WPfoXfbtxELsUYeyzlWa+a1ag2QgJ2kNnI05Cc3gPQJrAvGMzkt
	FZeUDnaYWjLm4JgWobN3fiCGVADWDtWhjzboJMrYS2wiVc0ZVgK+nK+Qw2qG+uoiEdvPKZQ5Avc
	e4nFlCxmwr3cXNDk5JU7app/JqfoZE2zIQfEFQJMyuj6lPB2oa/nEJ37bZb85Bm7RhO+i8CxxE5
	CTIzJsbM2TKcYZDKCfUkJxfkreBAaRJMpj11nvJsIWNfrYNjdH0SOHVL8FCYA=
X-Received: by 2002:a05:6512:33d0:b0:5b0:137f:9476 with SMTP id 2adb3069b0e04-5b453f464b2mr52173e87.16.1786568128897;
        Wed, 12 Aug 2026 13:55:28 -0700 (PDT)
Received: from archlinux ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b4539e9605sm60999e87.22.2026.08.12.13.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 13:55:28 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH v3 4/5] staging: media: atomisp: inline the var_equal_return*() macros
Date: Wed, 12 Aug 2026 23:51:37 +0300
Message-ID: <20260812205429.39181-5-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260812205429.39181-1-nikolayof23@gmail.com>
References: <20260812205429.39181-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These macros check the passed variables for equality, hiding the 'if'
and 'return' statements; replace them with a standard conditional to
simplify the code.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 .../media/atomisp/include/hmm/hmm_common.h    | 20 -------------------
 .../staging/media/atomisp/pci/hmm/hmm_bo.c    |  6 ++++--
 2 files changed, 4 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/hmm/hmm_common.h b/drivers/staging/media/atomisp/include/hmm/hmm_common.h
index c406fe8b1345..029620347302 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm_common.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm_common.h
@@ -12,25 +12,5 @@
 
 #define	HMM_BO_NAME	"HMM"
 
-/*
- * some common use micros
- */
-#define	var_equal_return(var1, var2, exp, fmt, arg ...)	\
-	do { \
-		if ((var1) == (var2)) { \
-			dev_err(atomisp_dev, \
-			fmt, ## arg); \
-			return exp;\
-		} \
-	} while (0)
-
-#define	var_equal_return_void(var1, var2, fmt, arg ...)	\
-	do { \
-		if ((var1) == (var2)) { \
-			dev_err(atomisp_dev, \
-			fmt, ## arg); \
-			return;\
-		} \
-	} while (0)
 
 #endif
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index dbda4394a239..89e56ce07444 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -396,8 +396,10 @@ struct hmm_buffer_object *hmm_bo_alloc(struct hmm_bo_device *bdev,
 	}
 
 	root = &bdev->free_rbtree;
-	var_equal_return(hmm_bo_device_inited(bdev), 0, NULL,
-			 "hmm_bo_device not inited yet.\n");
+	if (!hmm_bo_device_inited(bdev)) {
+		dev_err(atomisp_dev, "hmm_bo_device not inited yet.\n");
+		return NULL;
+	}
 
 	if (pgnr == 0) {
 		dev_err(atomisp_dev, "0 size buffer is not allowed.\n");
-- 
2.55.0

