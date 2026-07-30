Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5A04398FA
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 14:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785420875; cv=none; b=L2wiprPxrtq4n23qg1XoMV/r6BUmBPSHL9CpPXonzx+F1DTU0BhFB7g8cG54MlBvytlBhuukkhep/60o9yqnEZnkLg3wKypwDsSbm17N9wvMla01Utyj6rvcJiVxZ2lWxWZXreZ1LScvNkianxVoHnTeaY524FZI06TE/y2wJAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785420875; c=relaxed/simple;
	bh=KOuwClRVZ5Bl/NE/sdiPHlZAlokq7n2y3Cr1dOXvSbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CTsbSQ3snkxIHWdsPtwVcSA74lo7Ax2GVkiXBaQrpvi6ZO9wW23OaRtff2ShXzbhPpNJwYwTI32HMYGJTsDjqwxgZ/H1ib4v+/DJGSlwbQH3XaP8EjZJBuxlNoSUYWISWUyVW+mjo/JgPnFKtFCTyz7056AJ5gejnihD3W6ITO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sVoRR+5C; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sVoRR+5C"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-92f03daaa97so141764085a.2
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 07:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785420873; x=1786025673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6qoXct0ykStC9WcqAtRJVPK/Dlc4I71JW5PBBEd2PSY=;
        b=sVoRR+5CWtiGjxFaC2/OS6jNtACD2JheImfwf9Ff666hIaHtVN+vUwxcafUVkcAlt7
         RN9VEVqQO2rOIdZWbUaUZtE0MJzga6LoPBPWBWxfVeCoVi/run9FsLAanY5P4+ZPKuBY
         0yub9BVG/eVGT/v6y68pnrtUUJyRziENdKLV1Pfim8TbKxezcEbSsNtXNY+fNNF32S3k
         WwFxlcQtkF8dd8cyxSx5s1YEzFrSiBnl2oYVOF34xjvM6bzklzhtRXEHfya95Oki8gA3
         ujjU728ywXjv9MgVBYGtIzzBnasFOU3TPNwnEpNHPWRDwid3L0eJ33M4Y+xeMi0f3vcG
         2XFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785420873; x=1786025673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6qoXct0ykStC9WcqAtRJVPK/Dlc4I71JW5PBBEd2PSY=;
        b=H/BamC1L0sZVWHFL3NUHgoDdOQtZh9B0zvs/TV+dIDCqa0+v6Jau6zOHUu3u0JqSih
         b9+riH3W3/jWrk6NPdmXJ7dxiuoWMrijNEy5GrznRUS2N+zvEgHkLmPATFWUt+kk3EPX
         1voWZ0NxVBACp2MVKt8q7wLPFOwDLXQ2ZEFdBpIsG4DFvgohFtEL5ys5RJ2ncrC9h41J
         6/1rFCr3fxVDvYiNsF/x40pZ326le19qfGRB/2IK0LE6F9RwLOPmLuVIqMp1te983p5K
         vMdBzgnIhQbyjNG8MfMV3HIiyMCqZ5967aMRcvJbP/7FM5KvujShYlDd1D5ymI32rIJx
         Vgeg==
X-Forwarded-Encrypted: i=1; AHgh+RrfQ4nHs8PiCsq3ie1ulGyDuGuxx8YZOmX1QF/zwP/ka3ArjCPOYvPsBwL3uVMoH1UUAwd1RpSCEagy6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMffC8jo2Gx59yerVyHzJFgbspLzv6fAov8k9+AmIJVk9Klobw
	KAnZawZQsnFALyHULOhhE9Y3trpwSVGZSZ/L83rBdKGQnq4APnvTpCWPGKdzgLHT
X-Gm-Gg: AR+sD10trOounp0dUNsrvC2B6DtHscVv0b/t9/HlR0RQXCSJXCYQqnhzQaqjs7s1iop
	RceQnJ5g4sLeWlrVGXiMSs8Ot2x7E/ToVX0zo2f5KFLd0k8vJNmFYt99lDQjaUX6M+VNC8yM+WH
	Gpr4Z5oq1IY4PCcVgPmYaGQEqI884v/p0RGgjPe+IUEAHURP+Hf4qFGcXXnzzPqyQXD7rFxYfUa
	fG2xKvv96fhl7GxouELanJCsluzk9CwOXdL9pxdctOK5cKqwrCQUFcXWWs+wnYqLfKQqXtv5VPw
	KdR2keBk4TWMarwf5fdpBh5jGgK9R66mHfzyjU5SCwfZ3RGfEf0mu9aglhJh4IJYvt2pMml55RO
	7YPGFvETr9aRgKYr21zdK6JSnLatLsmH/j7MJuvnm/3MZ6A8UdZ5mwdStaWcflxM/gwJ9OoCCth
	mO1VfUKaw5NTcREfjhNZLclPgtbyiUZsOk9bjDKMm3vJTDOrvHFy19iNd2CUu+Xf/6lzEAUG60T
	3aVQDlFQcs+EE47432Lk8VVPgyBiOGaiXkKbKbIP4yNiJqFLqjvzA==
X-Received: by 2002:a05:622a:190b:b0:51a:8c97:9383 with SMTP id d75a77b69052e-52b386a74fcmr32541761cf.58.1785420872661;
        Thu, 30 Jul 2026 07:14:32 -0700 (PDT)
Received: from LAPTOP-DPAKMOI4.it.purdue.edu (pal-210-106-74.itap.purdue.edu. [128.210.106.74])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-529e2ff6f31sm41998101cf.27.2026.07.30.07.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 07:14:32 -0700 (PDT)
From: Yifei Gao <gyf161023@gmail.com>
To: Bin Du <bin.du@amd.com>,
	Nirujogi Pratap <pratap.nirujogi@amd.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Sultan Alsawaf <sultan@kerneltoast.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yifei Gao <gyf161023@gmail.com>
Subject: [PATCH v5 1/2] media: amd: isp4: release partial allocations in isp4if_alloc_fw_gpumem()
Date: Thu, 30 Jul 2026 14:14:03 +0000
Message-ID: <20260730141413.4136502-2-gyf161023@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730141413.4136502-1-gyf161023@gmail.com>
References: <20260728190754.363464-1-gyf161023@gmail.com>
 <20260730141413.4136502-1-gyf161023@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

isp4if_alloc_fw_gpumem() allocates several GPU memory pools in sequence.
If one of them fails, it jumps to error_no_memory and returns -ENOMEM
without releasing the pools that were already allocated, leaking them.

Release the already-allocated pools before returning. isp4if_gpu_mem_free()
is a no-op on pools that were not allocated, so calling
isp4if_dealloc_fw_gpumem() here safely frees exactly the pools that
succeeded.

isp4if_gpu_mem_free() previously logged an error for a NULL entry, which
is a normal case during partial-allocation cleanup, so make it silent.

Fixes: 4c5feef6a62c ("media: platform: amd: Add isp4 fw and hw interface")
Signed-off-by: Yifei Gao <gyf161023@gmail.com>
---
 drivers/media/platform/amd/isp4/isp4_interface.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/amd/isp4/isp4_interface.c b/drivers/media/platform/amd/isp4/isp4_interface.c
index 8d73f66bb42c..4fefd0f7fbab 100644
--- a/drivers/media/platform/amd/isp4/isp4_interface.c
+++ b/drivers/media/platform/amd/isp4/isp4_interface.c
@@ -148,12 +148,9 @@ static void isp4if_gpu_mem_free(struct isp4_interface *ispif,
 				struct isp4if_gpu_mem_info **mem_info_ptr)
 {
 	struct isp4if_gpu_mem_info *mem_info = *mem_info_ptr;
-	struct device *dev = ispif->dev;
 
-	if (!mem_info) {
-		dev_err(dev, "invalid mem_info\n");
+	if (!mem_info)
 		return;
-	}
 
 	*mem_info_ptr = NULL;
 	isp_kernel_buffer_free(&mem_info->mem_handle, &mem_info->gpu_mc_addr,
@@ -201,6 +198,7 @@ static int isp4if_alloc_fw_gpumem(struct isp4_interface *ispif)
 
 error_no_memory:
 	dev_err(dev, "failed to allocate gpu memory\n");
+	isp4if_dealloc_fw_gpumem(ispif);
 	return -ENOMEM;
 }
 
-- 
2.43.0

