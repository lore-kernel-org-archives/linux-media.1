Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089A847DD4C
	for <linux-media@vger.kernel.org>; Fri, 14 Aug 2026 15:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786720294; cv=none; b=hMOOzJGy3qLFsoHB0quNpJU9cWB9mAcoB3LTG3QUuYRh5dtlX2S/BQohC4xyoAHu7qOQUGJNcdByq6RWqI64GLub8TI48eLB+o/zuFt3ycG3Rnrf8bRaaLnqqc0SySzebsnYAahWK6mcfbDkut7qnHBOWE/TGbjdIPCXbLtS9Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786720294; c=relaxed/simple;
	bh=Av4Txgg7GubX1fn2pw6x+d0xJpGMl6ZoRGhGWtZseLI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TDAtGsRNz6kKI19X/PiYWjUC8GdZji0Su6xd40WoPvLfb/CNsu5AthVxMWBBE5FOuZeD7kO0U2vH92GPW0UnB3OAjH52EY4e3oLb03t6BAp1WSXZipPTWZJo/rLunPhSkkr9gDV+Q7TE8pzXx98q7jC122RQ5rpyzOl3g257toY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SBC4/AfI; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SBC4/AfI"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39ca0a30148so9754461fa.3
        for <linux-media@vger.kernel.org>; Fri, 14 Aug 2026 08:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786720291; x=1787325091; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wc6Ml7BNAlh0t75KbKQHb44jExGL01omSop7wpIJVpw=;
        b=SBC4/AfIFar/va6FASmElX3CLMrxe+CFNS/SBjuZuqX4l6CivzV7NNLGW4Y6+UEmId
         Y4ihtqPRb3MvA9sxzqhSe7cPOOl+i8IH56lPLGFNxtokEjBBd9eD5G88vCHuXN3W3xsu
         eGLLbBdu21G/aPHdj8PjKubTt4PQzz7nZRq2myWong77GwE9mSVwEmNOA3tO2IL5xeqI
         fr4XaDRXVPXAViusRb3U26BmQcaAZX/kxxgGZqNXmeaP+6hQSzkMyicnun9Y6a9ARIyR
         feIRdX3PdQcKM7dDXk9Gvz0kBd4jDfx6mqzzXqsh+Bbszrkw5jqv/zG+2HgDTSvf65tH
         cg2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786720291; x=1787325091;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wc6Ml7BNAlh0t75KbKQHb44jExGL01omSop7wpIJVpw=;
        b=pj/DdXJjW4M/11uB/5MEcPwDlpuN5cUcm/7OKpDkj/vAXhOslQrgaHFa+Q2KKdaeR9
         PgcE3+DZn4qr0+aEiLZTGC28mWJSw/hgW6XioeHNjyeKFFiP9tkDA05whNXhnbzOA9AZ
         KAopl+DbAIk4f1JLMzED0uuKlM2yyHa3WNOCNBWWqe/hrG8PKT6E74x9eYihmCRR4dEH
         +xvPjnGh3pOJrkM+LkFlk/vL/RZQ8wQf61D19uT5XBwjPudYlFs5MAQ0z0mAY53xSnNX
         2Na7S3meKq40uaGveZNu5msW+0PDu3GnBf7XPx0PWVvs9lA3D9PWpy5FX/YjW53r0Pv1
         mTsA==
X-Forwarded-Encrypted: i=1; AHgh+RqdYxDYzSQHJMEqW5K6i5STVfQfEfvjyQjrA6VIOVbGadKzwqmviMtKJcKkG0oY575F7O2YatPqh4zuVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRy/SgP7DQLBYzdf6g5eTRl5iKzY8WhS4bsWmwuNxa9ARf2/5P
	ITnBww2Lt+q1H3QJgbXUO3F0UZg2xINIe9CPQkqNULjgzyjOKHqDQBKgUe2O8g==
X-Gm-Gg: AR+sD13kcC1/OqRfNJxG06c1nHDcYImKfhmw9vcabMSaliVoF3pTK8JDyyKanr5DtSO
	5nqXJlpc9eoMVjczwuD9200vsbSX+F57kZCqhndzTbOHs6OpTS+KSoErLPqKFHZuqz6+BxHfr2E
	6yt3Zm0nBUz1O9KNILX2iqbacyqXtnNEBdhhbtM3ZTUDAZ4V/llwrwVUqd+CRKYJ81MjPU8aZco
	4A18OkUcJKYZenh59vOd2p3/7wuHZHjNXmCq/3bxt56X0hC+8hpcxxZqTZBNkvLZEXoKVoD6Rq2
	noJuloGphTqZifOg147NJ9qletAsE/B923WheErXyp2eMc/ac+BU4V/utyQiao38tOwu3VLezWU
	PKIuJbFQs/IssyziU9sYo9GE2XYs7OVTns/mzj7GJg+QUMh0geTuBrqGx8haiiWI6A09SATHmY2
	ujHKOiBlELfAA8PoEpJ9cKpRN0vUPkpTblZua6ZwYHNkWIAKFh1KiNYMDUbwJS09D0s8OhjjdDa
	woODZhx
X-Received: by 2002:a05:651c:b0a:b0:39b:53f:bf64 with SMTP id 38308e7fff4ca-3a1323a68fbmr7660081fa.2.1786720290746;
        Fri, 14 Aug 2026 08:11:30 -0700 (PDT)
Received: from [192.168.243.250] ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a130d204b2sm7138251fa.41.2026.08.14.08.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 08:11:30 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
Date: Fri, 14 Aug 2026 18:10:11 +0300
Subject: [PATCH v4 4/5] staging: media: atomisp: inline the
 var_equal_return*() macros
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-atomisp_remove_hmm-v4-4-c3c954a12b51@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786720280; l=1906;
 i=nikolayof23@gmail.com; s=20260402; h=from:subject:message-id;
 bh=Av4Txgg7GubX1fn2pw6x+d0xJpGMl6ZoRGhGWtZseLI=;
 b=dE9wd7JjpTCgCPbE5Hj+FvHlcNkTySdIW9izprGGUKKEdgLxzPRdBMizV/HzFcszENHedCJVU
 FQCPt8RmfzpBWyJFa7WIWkO8mSqnnftYgzGe+Yz5iPyhygRothC/ll7
X-Developer-Key: i=nikolayof23@gmail.com; a=ed25519;
 pk=2GWUU1isl5NJpkwSCQ4OG80EinZ3EUZXlrgAg6Pz5zI=

These macros check the passed variables for equality, hiding the 'if'
and 'return' statements; replace them with a standard conditional to
simplify the code.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 .../staging/media/atomisp/include/hmm/hmm_common.h   | 20 --------------------
 drivers/staging/media/atomisp/pci/hmm/hmm_bo.c       |  6 ++++--
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
index 46ee077026b3..7d0ef0f9eec8 100644
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

