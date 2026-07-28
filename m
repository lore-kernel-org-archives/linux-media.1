Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398F847127D
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 19:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785265702; cv=none; b=tA4B3rVAUyQ4Mj2L1jWtmqaISsnytvwHb3i20Ro21h03Wslcve+e6/vk77j1RMQADLfMN4CLsKon0i7B6fN7oYuktT1RRlSJFTN4a8aJbWPhv6EChHlgQ7ixkEPBkX/plsbOLViZxm2hnJQacxrue8QWuZcFvOZo5hNhDLmKVP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785265702; c=relaxed/simple;
	bh=smzarBw8hIXsOkcyD63/FxPZ8x4SkIwRndC9J2JSFsg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rQ8xuN8gizt5ckLHyZAzWSPcH/MyUxVulsKQrEkTweaccwOMJpjP4Fl2/taYVfmjjbkVtIigZbW30qnPMgaLMRUQpWmHoSpuDgP0eASecWO7S8GdqPKPksZQcY196rCc67K+M5e8P+NC3peuyWLzNC8i8qRbaI4eZoaBgiCD1lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NdndjI9/; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NdndjI9/"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8f1a8e914a9so1408556d6.1
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 12:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785265700; x=1785870500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RDLZZq1JNAih3SrfuWlz8fYPYEmLTTGnMNftSwGkOyk=;
        b=NdndjI9/sF4KueZhuSoMbPVcA9n6pTn3cRgG96Mha+08BX/XZxYmUVFt09MPZlAI2f
         UjNySYXdwtZKRjMGodSgt4nyXTgJIjAVPkoFs2z4F1s+iqNFZynHcEHCpRB09mvW8qdS
         0Y4Wyeu4vS5ZZxS0pElWf+7Y/WliIkjKT2m+H81eTH3uRJKPI21a/W23s4ZS313cvj6k
         fZUPQhlKM/fSCEUb/qg+M+fxANuU6j/kM1g0NUk/qUAKP4W6kIor5SKe9k3Kb1XEyimS
         W2FTqyPAeOGuE3js5qjRNNQZS78McMchkdbIWKo7e8rPLzj/YXNGz7RXDTI2xaPqrJS8
         Lvwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785265700; x=1785870500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RDLZZq1JNAih3SrfuWlz8fYPYEmLTTGnMNftSwGkOyk=;
        b=aGCrXsW13RpIZyuyvgkOxjrZTttDaMQxenLEGFGKH9fRTRtfBrk8k2sC57jKtXsMWG
         wcmIM9pjZxSKsON+HMTvVqS9f/tu0ELQcPLD1Jwucn++AERZnbrEGXwkEdT6hrYdBMnA
         3uLfXbxQUUmD7ocN+ja0x122WhIYMCMdBY2JdQvVFV6MdXaTrZYKM9jPEkYL9wf0ue0o
         zN5iv616Rqjnc2PXPy1e8U8Xk8SNz/4jT1Sb0ph8q9wUaVJ6tl5f3pauJcAORUI05Mot
         CByoQtqhaXtcHwcI3myBOt6UlIQov0LbwqRoDIC9YFGrKWDbSAwmvbIiLQOPatyJ/ml3
         /t3g==
X-Forwarded-Encrypted: i=1; AHgh+RqP7Fkep8g5alnqZzImaDIIVXY1sJzH/W7/hhCRO37ZPDYCDMAvhWFZLPARPWlappiMXbtCUE/a2ZlaOg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgu6zabSa8bXbOKB/MWWvDhs/fnJLQAz1esT8YUHM7cDyGt/0b
	N5jwY20dkNm25q4BzMDXM2DudGgpABNZg2GqmkRpyD9NX8IlIhGtIHjA
X-Gm-Gg: AR+sD10aFPnKoy4ZE5bYx5MB8DzZ1N83wNc0zLLuXc8tWgPEJluGpCUMQTitTTH0D/5
	4bw+sBN/7HgBF1JUGFgyeBS32G/3gJVoHOh6HtqCXguhGYrdnGUioX9Mv3Db/2q9VNg5l0BumcS
	HIA3t57mSki235YNqDsvjWB/a7egBMNNdPSST4Oe4PFH74ObxiYYWKbbKnBWupg7F8nJkpCUkAK
	y/KijsG0n5S4XDSNRc35eyNPHXW5+qUl8U5SJf6YFQJn6/0VEIzcgwcxwdq6bXa+gI/mQkIa0r7
	JjiHvlu6pPhrCwSiB3NQUWONfmjzJvZETl7Z1kJ6sjNLTWo5/QgXsMwuGyfVrZFQB3JFMdL+HH6
	qoDu+KEH/A5HoDpoYS+W9INx0+9JPmoRjp46zw4nme/5KOOIePJLwSK1XiFX9320AoL4MGxYNhM
	U0oMnFmNJ6YkKr2HN1gycREVRHLF5jycp/ZlQYo+t5vj2mVOocjJjIISgYs6dHHR7QdlgG7v6xN
	TFwnTkMWwNmMqeC4SQPV6LUVGw6RWbCYD0nBxJqKQs=
X-Received: by 2002:ad4:5c47:0:b0:8ef:1fc9:9361 with SMTP id 6a1803df08f44-908173eff7fmr42591076d6.48.1785265699853;
        Tue, 28 Jul 2026 12:08:19 -0700 (PDT)
Received: from LAPTOP-DPAKMOI4.it.purdue.edu (pal-210-106-74.itap.purdue.edu. [128.210.106.74])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9081dd68434sm5556936d6.38.2026.07.28.12.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 12:08:19 -0700 (PDT)
From: Yifei Gao <gyf161023@gmail.com>
To: Bin Du <bin.du@amd.com>,
	Nirujogi Pratap <pratap.nirujogi@amd.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Sultan Alsawaf <sultan@kerneltoast.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yifei Gao <gyf161023@gmail.com>
Subject: [PATCH v4 1/2] media: amd: isp4: release partial allocations in isp4if_alloc_fw_gpumem()
Date: Tue, 28 Jul 2026 19:07:39 +0000
Message-ID: <20260728190754.363464-2-gyf161023@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728190754.363464-1-gyf161023@gmail.com>
References: <20260728141659.62310-1-gyf161023@gmail.com>
 <20260728190754.363464-1-gyf161023@gmail.com>
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

Fixes: 4c5feef6a62c ("media: platform: amd: Add isp4 fw and hw interface")
Signed-off-by: Yifei Gao <gyf161023@gmail.com>
---
 drivers/media/platform/amd/isp4/isp4_interface.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/amd/isp4/isp4_interface.c b/drivers/media/platform/amd/isp4/isp4_interface.c
index 8d73f66bb42c..8e3616cce479 100644
--- a/drivers/media/platform/amd/isp4/isp4_interface.c
+++ b/drivers/media/platform/amd/isp4/isp4_interface.c
@@ -201,6 +201,7 @@ static int isp4if_alloc_fw_gpumem(struct isp4_interface *ispif)
 
 error_no_memory:
 	dev_err(dev, "failed to allocate gpu memory\n");
+	isp4if_dealloc_fw_gpumem(ispif);
 	return -ENOMEM;
 }
 
-- 
2.43.0

