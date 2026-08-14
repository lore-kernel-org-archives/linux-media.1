Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163D148095B
	for <linux-media@vger.kernel.org>; Fri, 14 Aug 2026 15:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786720293; cv=none; b=EIZmkbCfe5lYDyO5b3K56Kw6VMmo1Ci7Hss2kkqsun24c/SQ+2m7LxtNU6B21QOQYJ48J9tkUhdQlBSiyceQBLUzgam6sY78Vaj2ysE83FxDYs+okW0M2ufowcRC7QgnEvexyOppjZWPscCBsoekdZ7T2irFX9SXOjrAw+sMgtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786720293; c=relaxed/simple;
	bh=DOnPf8mbkyDpezzGvvZK9+aNOSxPc/LfJq7ezpXpACc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pClqzbMMv20eBmsVVnzuUT0g41aOmgy3ZjnHWcSbuTJpOz+WYF5gHRXq9GzoRNVUAV92HZdetlqyDIZWaFE1TGnmvRk3ax9OfyiRnCNN2kZrlAP3XHslc3sp8EGisrQo8TXua7RsQiZPyrhMm1OSWTJC9VzMhu4srZUH6+5P6gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WbQfh2j9; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WbQfh2j9"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39faf9e2c62so6603781fa.3
        for <linux-media@vger.kernel.org>; Fri, 14 Aug 2026 08:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786720289; x=1787325089; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zjjx4OZPtT3/3k2f1Byd/EarM4nIT+IrMxJaUq8W3q8=;
        b=WbQfh2j9qFVCibW3RhtKlAr3tZ6ns/45ZNAfBJ9Ki0SACo8YMjaAiTOx3b2fjbehaw
         G8caqLMZbJ2zKSv8f7SSOPOx6ZiPCdXSeVPVFijps3sCIvs3Lv1um2Vv/4gWHyqMyavb
         allg3PPlIz1XYov5KgYwII4nSuU7uP7witj3YXwuh6nY5i3ywEOcmj964CnDi33+I0JC
         PfOgn2J4y35oEyC/QD7/OOm4QNYKifPjeErFnYLNlFTHd64/OKEETZHGzhuP75iKmHUQ
         gdAgnjllPsqYPPg/XX2fQNIb465GvL4nlqBUgAsqus3JBwH0FjF4inwFHoQwC1Fd/cl2
         t2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786720289; x=1787325089;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zjjx4OZPtT3/3k2f1Byd/EarM4nIT+IrMxJaUq8W3q8=;
        b=TzH4tPoKt/NYLyQLJLDJ5n/EsQtyDOElNrPISUnU1F++iC3LxfsfWRldqsoTu6i7U+
         iY2o7W5KdZJ7gj+bavBLLSMjP7WeioskS9wx9CKrGMkP1x7GwBE1bwYqV85F9rxcdsrn
         QnBezdnl0nmaB0O2Yw8NiBrlwOoTWYvPQgmtC9K+mNu31fnq6lFtF+sWnDg88x+AlcR8
         QGMd6p21qGvhQlfH5hDsauDheDDYEEVOE7WMYa5NYpzddlgCCDVmEchDNxrXv/U3qZh/
         /MSSeI+iXtHrQFCe7v2rwrGdB+JoTxA8NNMcKAjVFmgzdg3YNI3un2KZycRmgQL/LvN+
         mhBQ==
X-Forwarded-Encrypted: i=1; AHgh+RpuHYMrEv2TXw8f6H2az5+aarNKleH/vuMiLKozd33P5jL3foEaEfOLKSZhcWyhpPr5yjgJmVXMRGwTKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxO6JtPmBbAatc5HZw4qhBzDn7L3Q5aSrV4WMon9OzAeRWiuRGC
	eRHFt17f0uuw6gtYoBeZWjeQv08xnYY7fHZn4BPBz6WbYS2cFmZcKzhy
X-Gm-Gg: AR+sD10pdCEWqtmXr9mNxvp8TKOKKhooH42g8X2QnAnORcyg45cCsqk5BmR3DwrWZXw
	6Ura3ojLP+A1nAspb0Ku+VNgr/64epxwrOHo1JQTwcEq30/B3qxtP5BDDPOfL1D5Nu2TjyyYtIc
	o5VICLUMNI2sbN4dpuIWmkfBxz4LaVjQnwSdNy+KygnLhwZDqLsS3ZJgR3v26M+8gF79ZZqb6aw
	f2ykkP+tEBBogN303Y1TKJymyM33llQwyV60IGEliYnwGBK8SEXuNHirN9RPjDNxIDWWLYzS1q4
	yoRcPOAMjVDHp3TRCsvi91uuzSYgiRRBwxEnhF7QkPnrEUdwmazF4r5AXEs20ZHrv5X7S296yjI
	SqVqDqveYuPJGAK09al3xDemQ42FNIutlVsWwKEGQwOt7wyQcZ9fc5YK7JREXGzV/YXczhsGPlz
	JZzZywa3vscyy6R9T8maWwNfW9+YIgmiesJY5mTmuuX2XcA0byeUrZ5+jWRXoppcgFMJFvdQ==
X-Received: by 2002:a05:651c:54e:b0:39a:fc8e:84e2 with SMTP id 38308e7fff4ca-3a132400ebemr7614641fa.7.1786720288952;
        Fri, 14 Aug 2026 08:11:28 -0700 (PDT)
Received: from [192.168.243.250] ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a130d204b2sm7138251fa.41.2026.08.14.08.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 08:11:28 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
Date: Fri, 14 Aug 2026 18:10:10 +0300
Subject: [PATCH v4 3/5] staging: media: atomisp: inline the
 check_bo_status_*() macros
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-atomisp_remove_hmm-v4-3-c3c954a12b51@gmail.com>
References: <20260814-atomisp_remove_hmm-v4-0-c3c954a12b51@gmail.com>
In-Reply-To: <20260814-atomisp_remove_hmm-v4-0-c3c954a12b51@gmail.com>
To: Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-staging@lists.linux.dev, Nikolay Kulikov <nikolayof23@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786720280; l=4285;
 i=nikolayof23@gmail.com; s=20260402; h=from:subject:message-id;
 bh=DOnPf8mbkyDpezzGvvZK9+aNOSxPc/LfJq7ezpXpACc=;
 b=RlSiFB3sQfxO1qseXHX0zJ0Y/1QZuVJ0b3dKk4O/FhFvRxE+JcScDlvY+NmNXcuyxJsFTEXli
 7N5fM3sFtZfCHPdWqniuC+xuqwgbR1wgUK5CzEqXMKuT2M42LlXxyjW
X-Developer-Key: i=nikolayof23@gmail.com; a=ed25519;
 pk=2GWUU1isl5NJpkwSCQ4OG80EinZ3EUZXlrgAg6Pz5zI=

These macros check a bit in the bo->status field. Replace them with
conditional expressions to make the code clearer.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/staging/media/atomisp/include/hmm/hmm_bo.h | 12 ---------
 .../staging/media/atomisp/include/hmm/hmm_common.h | 18 -------------
 drivers/staging/media/atomisp/pci/hmm/hmm_bo.c     | 30 ++++++++++++++--------
 3 files changed, 20 insertions(+), 40 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
index e974ab5ca2fc..69cf490bd88c 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
@@ -19,18 +19,6 @@
 #include "hmm/hmm_common.h"
 #include "ia_css_types.h"
 
-#define	check_bo_status_yes_goto(bo, _status, label) \
-	var_not_equal_goto((bo->status & (_status)), (_status), \
-			label, \
-			"HMM buffer status not contain %s.\n", \
-			#_status)
-
-#define	check_bo_status_no_goto(bo, _status, label) \
-	var_equal_goto((bo->status & (_status)), (_status), \
-			label, \
-			"HMM buffer status contains %s.\n", \
-			#_status)
-
 #define rbtree_node_to_hmm_bo(root_node)	\
 	container_of((root_node), struct hmm_buffer_object, node)
 
diff --git a/drivers/staging/media/atomisp/include/hmm/hmm_common.h b/drivers/staging/media/atomisp/include/hmm/hmm_common.h
index f215130e5e17..c406fe8b1345 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm_common.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm_common.h
@@ -33,22 +33,4 @@
 		} \
 	} while (0)
 
-#define	var_equal_goto(var1, var2, label, fmt, arg ...)	\
-	do { \
-		if ((var1) == (var2)) { \
-			dev_err(atomisp_dev, \
-			fmt, ## arg); \
-			goto label;\
-		} \
-	} while (0)
-
-#define	var_not_equal_goto(var1, var2, label, fmt, arg ...)	\
-	do { \
-		if ((var1) != (var2)) { \
-			dev_err(atomisp_dev, \
-			fmt, ## arg); \
-			goto label;\
-		} \
-	} while (0)
-
 #endif
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index 9b29b6381abf..46ee077026b3 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -687,7 +687,10 @@ int hmm_bo_alloc_pages(struct hmm_buffer_object *bo,
 	}
 
 	mutex_lock(&bo->mutex);
-	check_bo_status_no_goto(bo, HMM_BO_PAGE_ALLOCED, status_err);
+	if (bo->status & HMM_BO_PAGE_ALLOCED) {
+		dev_err(atomisp_dev, "HMM buffer status contains HMM_BO_PAGE_ALLOCED.\n");
+		goto status_err;
+	}
 
 	bo->pages = kzalloc_objs(struct page *, bo->pgnr);
 	if (unlikely(!bo->pages)) {
@@ -738,7 +741,10 @@ void hmm_bo_free_pages(struct hmm_buffer_object *bo)
 
 	mutex_lock(&bo->mutex);
 
-	check_bo_status_yes_goto(bo, HMM_BO_PAGE_ALLOCED, status_err2);
+	if (!(bo->status & HMM_BO_PAGE_ALLOCED)) {
+		dev_err(atomisp_dev, "HMM buffer status not contain HMM_BO_PAGE_ALLOCED.\n");
+		goto status_err2;
+	}
 
 	/* clear the flag anyway. */
 	bo->status &= (~HMM_BO_PAGE_ALLOCED);
@@ -788,11 +794,15 @@ int hmm_bo_bind(struct hmm_buffer_object *bo)
 
 	mutex_lock(&bo->mutex);
 
-	check_bo_status_yes_goto(bo,
-				 HMM_BO_PAGE_ALLOCED | HMM_BO_ALLOCED,
-				 status_err1);
+	if (!(bo->status & (HMM_BO_PAGE_ALLOCED | HMM_BO_ALLOCED))) {
+		dev_err(atomisp_dev, "HMM buffer status not contain HMM_BO_PAGE_ALLOCED | HMM_BO_ALLOCED.\n");
+		goto status_err1;
+	}
 
-	check_bo_status_no_goto(bo, HMM_BO_BINDED, status_err2);
+	if (bo->status & HMM_BO_BINDED) {
+		dev_err(atomisp_dev, "HMM buffer status contains HMM_BO_BINDED.\n");
+		goto status_err2;
+	}
 
 	bdev = bo->bdev;
 
@@ -868,10 +878,10 @@ void hmm_bo_unbind(struct hmm_buffer_object *bo)
 
 	mutex_lock(&bo->mutex);
 
-	check_bo_status_yes_goto(bo,
-				 HMM_BO_PAGE_ALLOCED |
-				 HMM_BO_ALLOCED |
-				 HMM_BO_BINDED, status_err);
+	if (!(bo->status & (HMM_BO_PAGE_ALLOCED | HMM_BO_ALLOCED | HMM_BO_BINDED))) {
+		dev_err(atomisp_dev, "HMM buffer status not contain HMM_BO_PAGE_ALLOCED | HMM_BO_ALLOCED | HMM_BO_BINDED.\n");
+		goto status_err;
+	}
 
 	bdev = bo->bdev;
 

-- 
2.55.0

