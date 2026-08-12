Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C2D3B52FB
	for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 20:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786568133; cv=none; b=W1hE/JWUeRgzLy3zPCODnlJmKPajqe5GJL3MkEVPt4tgBaDEwBcH8nvx64cYBMx33dknIspI1Eh6sPbUrZlgmVpIhgbGEbJvPRgSnnf5ScocZPOwe1al8snz/dcGuglNikO7KQ02PcOdgsau19cVGcR9tMsB9tr2KT+pwGKAugs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786568133; c=relaxed/simple;
	bh=N7YavMIxn189yOCIt8BdETPEDeHw4RDxuO0Znx6qmho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LJlHw7xOR6eN2C/FedOgFcnyH074KzNZmEayG8/3Ayo+tkf5NnEVDMAj1oy3w9QzmHOFeT24MN42cfJeqijwrWRWFjJjEABibE825D9RtI5BbFcm8jJBOQ1BjJo6Gsd7N1ApwY2nw6a2YJIf2weSqnQQSx/jiX/wV9nAy7Bs+ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZDJZ5eOG; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZDJZ5eOG"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aeba09900bso1063741e87.2
        for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 13:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786568126; x=1787172926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=id+z5c34tokzsRgaGzBKaJJ/gVoWUF0wZyeg82CjYJg=;
        b=ZDJZ5eOG0YGhZAy9L3nzUtLrcINZKIvprA+DlcvTOu3vNA/izhBXmTotxaAAL5Weyv
         FA4MIlLIRkL8W/KtWlugW05WNSlyviHjzjp+R8aJq76KINvk4m+MYWirD71liPrHhYjX
         VTm9ET8zQuqO4R3OG9oa0xG8Dx7dVMaAG6raJTCXWIoVjeA+vVGKUIIcwEQHg1JZOKxT
         HiZL7h1RIjWhA7e0PNieMmvxxMjASTOJR2oZre2+4gypCWdieToEpQDxXVggQMZ98+IW
         p1079ryIHKwHrt1wywBkUAcgH6oU7zS8DCrSRVG9G5DVTpoX5bL8LisLATC9WejvThrS
         HuCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786568126; x=1787172926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=id+z5c34tokzsRgaGzBKaJJ/gVoWUF0wZyeg82CjYJg=;
        b=aRJjnW1zHT8vSOEU1rk7nOQXP9jkG93VTtIFAC+S9v1w139xls3vLbNluJYHDOa3aw
         K+ObdLgeS5zIL1bOLapapPSqiyYcSNsIM5EMRW3o8RH+Dc10959n7VJkhi1SCIGcsmkB
         ze5cOyYt2r9IILAUdOEroPyd7FqZZn7JQsbHhHL2U+BAX4TCd0aGQKHC/STHhc+ldlcz
         TmddiPxLnE64tAKXe//bL3Ssi02EDtc8U6m5sZgAGQOJa8VNImRSJiINA6sjXzxOzrPT
         Bx/gzz2AEr1lVm6g8jWKxhBt4BgNRvkBwnwKoGlqC4HBqSwzoUswLPjEiqaQA2F8dRHE
         kAfA==
X-Gm-Message-State: AOJu0YyO05qy68Jr73nyhRNA5JC5yFqA2n6FgRQU8QfDXihCw3Mbcprx
	msQn4cjYYy6U8DvrxzO7gEzawPiA1cB7anY9nxwJOpvMXYbGeBv/5Ukw
X-Gm-Gg: AR+sD12SxuBxRc6QtNyrlt6Pl7WT5WFYtoCF8/XnVEDXYE0V9QmpCAVnqcI/9QOhpcy
	XhGbqJgb+ZiQk2IdlNStIv2dIFW/MN+V6uJC3DmtZMV6vnSbsIeGHHG/DqeoP+uQBPUvTQUgNBH
	oahEbUXaPcipT2VLeFe9gmNIPT8eXIjkBtDbDxfKsS8ZFvf0j8/EWLssDNJZAB4iEovL1nae8E6
	K3ySjF7BqYsCz744YiD0oKHem8mDNRqryUeGSwGaCIzqbjraqJacLKID4X4UqZJznbrpSDbycWu
	C3PPxgJO38JvQXeBWoluw22bzp+hzttVfRXQPMb+DSM6tP8nXBxBpNrCR/GaQu3qPGruYy24Ywz
	iQdMnpT+c3ixdhxXzvbpsnsABeRlGpp1TORjS6K7cSmXpsHuqzGw/dHfJ6TSayG9PRSCof2DsJJ
	Tb7TaFrgTctPmHwt1IIQ6auMn8CVcw+1VcawaCi8eH+PlbluhUxUd+MBgmteg=
X-Received: by 2002:a05:6512:805b:b0:5ae:b86b:71f0 with SMTP id 2adb3069b0e04-5b453f830e2mr30498e87.37.1786568125682;
        Wed, 12 Aug 2026 13:55:25 -0700 (PDT)
Received: from archlinux ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b4539e9605sm60999e87.22.2026.08.12.13.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 13:55:25 -0700 (PDT)
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
Subject: [PATCH v3 3/5] staging: media: atomisp: inline the check_bo_status_*() macros
Date: Wed, 12 Aug 2026 23:51:36 +0300
Message-ID: <20260812205429.39181-4-nikolayof23@gmail.com>
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

These macros check a bit in the bo->status field. Replace them with
conditional expressions to make the code clearer.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 .../media/atomisp/include/hmm/hmm_bo.h        | 12 --------
 .../media/atomisp/include/hmm/hmm_common.h    | 18 -----------
 .../staging/media/atomisp/pci/hmm/hmm_bo.c    | 30 ++++++++++++-------
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
index ecd920e49488..dbda4394a239 100644
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

