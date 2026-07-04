Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC69D31AAAF
	for <linux-media@vger.kernel.org>; Sat,  4 Jul 2026 08:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783153897; cv=none; b=HlxESohPK9e5tA83JJCeIIENFC//V8iUtOlEzPcO3veZ7jWdF2jo1D3TSrx9rdv/v2Ll4pLkAtgMsfdDwuUXE/YWSn6SZSZuD/gwv+EO73TYQYcBTelq36oIFBkLEShTI/Z1lSsGsrxp3+JlispaIUftZmOGpEzs0G9KvBdKvFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783153897; c=relaxed/simple;
	bh=IDcWe0Sc23uefwW1HiMKBM3xmZ8nWcKhwHtBhX1Ea6o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XOIRvHmRRR57QR/N2k3C2HbRdNzDgWJXzngFQg4iKnHkwwHO+VvtBLcl69nu4Z7hCLFdTPwhyawlRGCJk99SU1QjE3wIZYMMlNyONqGmmq9URuAGiIq9cUILxHDwa2Yc9/Xs/g+96BwJ1dKMNo0AOBEf3PaEFCHpq0hUDLiF03M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BcJO/U3I; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BcJO/U3I"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3811f512167so1133182a91.3
        for <linux-media@vger.kernel.org>; Sat, 04 Jul 2026 01:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783153885; x=1783758685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KudER35PZQPKqHPhc4tPwVxdReZyP68MavvqUny2wC8=;
        b=BcJO/U3IyP0BLzHvrZt0bP4v2ahs+gxBk5vhywRDZMgWXS1eAjiMPqRIaJUtf3IY07
         mWbrziRNqnascNTIi67nSXtuHlU28kT/esRGWTU1cgLuGJ5tfyvtV5GXRlE5vVMhzKNZ
         +yhK2Dcfacah1wQ/P5tT1BXt4AtzjscSdh1Y+55wZoQ3tgwzswn9bqsFkIuCIjn5cyXn
         748g/syywvEJWM7qye52t9W/HYOGWYs1zw1HMTCGnXeDmCz+1C8GnV3fCVkgy0XyJXlm
         9w9LoZWKruX1O+znR0OA3iwRSctUg5tRM54jw8t/C7WPeTIdUomk2L4XOHz6NzFp51Vi
         gYMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783153885; x=1783758685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KudER35PZQPKqHPhc4tPwVxdReZyP68MavvqUny2wC8=;
        b=COX4AfXgbUn3WBcicS6uUnrdufyf8sYv8pvua+sMWLe+sFM21KCYfD5pSO3CDUc+lV
         uHO7BCegEesHrgvN7oSUrORlozcSjtVcmgTeoEUzeoLfEn8FKxsjiunZYtszopdgoKAP
         ALShoAvi9MD/1CQ3DmHJx9SQs+sqntv+LjIWGtIvehBH+3Kt5YoNEFidrgvOAE4zxb8i
         ShIHyCeFtiR9vdWh9bPwJmJZ6n/bJAmh6YKN+hnKngE/SPw7+1R2U+rHfNRBpe04qF01
         39D+DKjJPrPQ/SfEUTm5CjLCb9Im3VcoDjtetiya7f2uAqer8m9dsteZ9d48FHt4L9HF
         LMWw==
X-Forwarded-Encrypted: i=1; AHgh+RqgAcw5Vg6CX/VJSOFhodYkY5n/uq14QzBRvvhYmoGHlNkdPeoEA0/YBRzH9gb2VQSXy6jC2yvZp+LErA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkxlTNVvHzjhkilxJ6jNQKOl2XJSEtfXN1g9rRF5iVbJKxlj0d
	mYbdYwjgAGP9OA+nHmFdA9EKMvYKICPaRzP6YekbnDZ2AGcq7ssWd1M0
X-Gm-Gg: AfdE7clNOQFQI8RovhYeEVgrPIxlxzL0oq5RuHC2LGE92y9gytx0ilgRJWox7mFh1Qb
	hpGg/GdX7ijq3+uAOhIY8zQBB9WArvApjgMB7sWshW59Lbnp3xGem8IEtNF5dV7jCnRCwXXUPKe
	yTvMbLeyzr5uVFZPt+aZ2Dp8nZiD6TKaO7mkwOT+JrltJcj8K+cEGL3A3PqEm+0kscuf5zAXIhU
	yHKLq6i1nMjNSa9+5lZ7aWFa2mE/7ELDHxAU5zTCwZE6qQzWPVD0XmjT91XOM9DUDw0iCurhiVr
	Yd1dpMf6NjO53WBzumM3GwcXa2SVY3BdyTd5ljTfayEOZN4Ba2L4bZ6YwumH/xWtbpQqQyGf40r
	SGqWjNHUAWCYPNf+nSAdYTJXFAUueBvsy064hWe13ruyuxu5neL9jUw1lh2XMjPVGY876nEpPPK
	8mVcncBaSS7FBTFSlUdg8ZkU6uEYTz6x8JnZWrFazCm6+Or2F1JGh2
X-Received: by 2002:a17:90b:4a46:b0:37f:f89a:a1e6 with SMTP id 98e67ed59e1d1-3825c50b0aamr3180063a91.0.1783153884951;
        Sat, 04 Jul 2026 01:31:24 -0700 (PDT)
Received: from primary ([223.181.23.202])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f376bf710sm10074745eec.6.2026.07.04.01.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 01:31:24 -0700 (PDT)
From: Vidhu Sarwal <vidhu.linux@gmail.com>
To: sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org
Cc: bingbu.cao@intel.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	kernel-mentees@lists.linuxfoundation.org,
	Vidhu Sarwal <vidhu.linux@gmail.com>
Subject: [PATCH 1/2] staging: media: ipu7: fix pm_runtime refcount leak in ipu7_init_fw_code_region_by_sys()
Date: Sat,  4 Jul 2026 14:00:30 +0530
Message-ID: <20260704083031.8524-2-vidhu.linux@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260704083031.8524-1-vidhu.linux@gmail.com>
References: <20260704083031.8524-1-vidhu.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ipu7_init_fw_code_region_by_sys() calls pm_runtime_get_sync() before
accessing the firmware code region. If resuming the device fails,
pm_runtime_get_sync() leaves the runtime PM usage count incremented,
but the error path returns without dropping the reference.

Use pm_runtime_resume_and_get() instead, which balances the usage count
automatically on failure and avoids the leak.

The ipu6 driver uses pm_runtime_resume_and_get() in the equivalent
location.

Fixes: b7fe4c0019b1 ("media: staging/ipu7: add Intel IPU7 PCI device driver")
Signed-off-by: Vidhu Sarwal <vidhu.linux@gmail.com>
---
 drivers/staging/media/ipu7/ipu7.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu7/ipu7.c b/drivers/staging/media/ipu7/ipu7.c
index 310e3f24e571..056af3a07507 100644
--- a/drivers/staging/media/ipu7/ipu7.c
+++ b/drivers/staging/media/ipu7/ipu7.c
@@ -2343,7 +2343,7 @@ static int ipu7_init_fw_code_region_by_sys(struct ipu7_bus_device *sys,
 		return ret;
 	}
 
-	ret = pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0) {
 		dev_err(dev, "Failed to get runtime PM\n");
 		return ret;
-- 
2.53.0

