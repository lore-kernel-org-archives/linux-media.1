Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB68A483BD6
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 18:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784832768; cv=none; b=gTcWXeilkNaIvfOTPI8z+X3B8VbPfGZ+wlX3+T2kw+w9t4Vt6qI7ysDJlKc2nwYvdEHcQ0uOlUJW1ikfi3b//FbWyh+ad5pcRRXvfE14mw1km/q4JMq11DbmOSaMq5EEZ6WB2MRWxFDHdJsu6jnrqnzZ4vp7VzRs9ZaFun5T+wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784832768; c=relaxed/simple;
	bh=417PvZV6MLha7RW5u+XT5AoGUeViXQS0dSHinR0tdNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KaedXhKeAyHK4pwAntiHnrUzcItSxZvbhqpQvvYLZgFoZ4e7JuhTv14PAH/iLYPcxO8sowFbSPcItBrZlHXrC2Fj1OB9wWeX5NZW7I/nK3ptFdyFwbV9i2Px/FjQ4C1nMvk5ryU59v/DP6afaytJP/WL+jSfjqvpBq/UQZXsUuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VLbZakFB; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VLbZakFB"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39ca300db70so9294641fa.2
        for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 11:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784832752; x=1785437552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S6YqaPjKVmdDMcCcfhFit+qzoapYrDK7L6d0hrzWx1A=;
        b=VLbZakFBQdMiSpmcqhB4dlV4eCEm6RrWzoXt7irto3FW3FJM4VjDUoN/P2lCRB3tVo
         FJhhLwwUYgX9/3fUX89G3ugS1AkqfD5mEgmHLXHuMaimOfa37xYvU+oh5N8i/nuzeV6q
         MgYZVFQxJuLGIhROEyNyw/Cp8VgG5X93mM76F3VfrbmDq6WjIdB65Lu0iyf2vpImeto9
         RtjmbeGgflbpb9l2iv1129gutx7+LIT9Qyt1puTKJsIzsLPPZ+AqREelkoxzxZ6Iuw8D
         tiSBat3PCC1tgIShmsTwhekr8gQ2Xl3bce7jtC0xmoWCTnPu+iZX1BQk5GXGcRCFxseu
         vg1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784832752; x=1785437552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S6YqaPjKVmdDMcCcfhFit+qzoapYrDK7L6d0hrzWx1A=;
        b=lgLewRwQVIM3tXH/GBO9HLw0UwMQC3WqXkjVO2Ik9Dz6jiG+ryz1iCzc7s1fk0Dwrv
         fRggyuQYuF8PmExcQQ1mknZLsibPK9jW29FvQSlQuCpUDvp7no1Ta7LQL5AU3nCIlL5B
         JafkpLJQvlzk1Mbo4G9j4bbCooRqh4fOo0ibBg9xjjHGW37xPKsbpLH2y/WiZMkrQQKB
         NJ14n4REWJ2FfKbdKFqH4ZpuxSbc2+s8RjMrcGfRtf59L1+4cn/b9dNi0Zn6bSswwf25
         ASPbnxDgG0fdQ1yH7En+5gdVvAxqouLkJ73uQwjdgo3yl8W33nlZHba/kRlZ88vDBVEV
         gIfg==
X-Gm-Message-State: AOJu0YyTibmyac0xuFQ0nK8FRaTon/nUBy9gyoDuUmu1QnwxYqg3OBsX
	pDPQYsWyPUst2Nq+6EWfjEpFofVwCi94Mbh/naUzpnTrQ/SLnUVMHz4z
X-Gm-Gg: AR+sD123iechib7bMiQImqZfS5te0JEy3/vXA8KgxQcHIg1mX0DWW/vnQLOblUzfxWa
	cdYsrII95iX7qrITaCe3Th6xAGroFUhigTFI4loXVElSoSGcTOL5ImZfNG1ymcym1xxyGTowLwE
	kFLzzFK2xgov1hou6eSnDb/6Dt9kAjTtrIh02ug+5LdS++ikb8dkcUqq2FrinJYe0hM2Uj0ACk0
	gIqJYTF9O5/L3E+qltFMO1k/EDEGiE1zdDJqgV0GyyQUKzLUQ9DgThKsFNMOAennI180GLBzcKE
	bgNV2nZeArFIWqkMUrRzZK1/B+ss6Ka2NoihyH/gTDlA+Ilxz0ji3XOIblBZI/DXRaSWS+ONaEl
	/uxEYYcQTXgDKySiw0PYi6O6cs65LV54rfhmPXp13h6CXAriQoNjk317qikH982EQY7KatyZZ7r
	Y=
X-Received: by 2002:a05:651c:881:b0:39b:2323:b700 with SMTP id 38308e7fff4ca-39f07c63c7emr8542801fa.10.1784832752086;
        Thu, 23 Jul 2026 11:52:32 -0700 (PDT)
Received: from archlinux ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef68b68ebsm11601731fa.10.2026.07.23.11.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 11:52:31 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH v2 3/4] staging: media: atomisp: inline the check_bo_status_*() macros
Date: Thu, 23 Jul 2026 21:51:20 +0300
Message-ID: <20260723185217.317981-4-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260723185217.317981-1-nikolayof23@gmail.com>
References: <20260723185217.317981-1-nikolayof23@gmail.com>
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
index b9949cc080e5..e92538ab025e 100644
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

