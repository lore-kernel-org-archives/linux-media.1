Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AF752ED39
	for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 14:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790692661; cv=none; b=btdUK80hbHPwPznYhXvHSaQqb9y89GlSRki2ImoiGTtbIYGh+JZctRJvbaDAUSJ5aStqCFhpoNqKt6y4nMVdYnFnSJVcFLjd0GA48Cxp0yyvOvKmAYSnIA9wIfDZDjmvr1480XTQysk2qh8yY2NLecgSowfKHsHcDmipCuJTHYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790692661; c=relaxed/simple;
	bh=RNYVs1b2MfUS3C5igwUlM1MYoRVC16+Xnu5/VdpynTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NYntqNoGPtXdaZiOJ3AQdox0EN2PFDMxTffOKOktD9AA8Isi+0BgpOM/AswJmF/JCGKsfFennyZCNHyR8P3gb3ZvWKRNMogbCe8p3CJlmYfaaENCsqx5OckOKmbw8J0QT8XT+f3E/mFE5hvH/OgVuu8vlYzmBHhwi4TsXCvYtoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AAVcNd2E; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AAVcNd2E"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so32167875e9.2
        for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 07:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790692656; x=1791297456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u4gDb/OXaflwzpAJhKZ5ukG9Fa/2I6AjoWfAGtPX1sk=;
        b=AAVcNd2E4z6PPyBX8qC9NEaF0NrbCQwqNG4P+q488OCDf/LWpWtXSf3JYt91MPN/z7
         C/+cT6x8jHNeo7amuudgJdW7HVdEJwjVwtRJ0KLtfP0wUZmh8y0bKt4OWGRXfJJgK4qS
         RUjnqBNZ1b+WBPmyLGVvIomXObilyOyW7n3Tym20vganwcvzMJKTxOGUQW0b/5kXhdRw
         iF5GCfc7XreSxX5y7A18CQ3Zs5g11/DMO0jXKTdftY8vnrUvgjbtsScO7+NbpXP7DFBn
         sBBEhJSHZ8DccHVxIA0IBZu/1MMqm/BMcBm7vr7MkVKC2Ch7VR1aMHt6Y5gG18VhnfpN
         LGXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790692656; x=1791297456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u4gDb/OXaflwzpAJhKZ5ukG9Fa/2I6AjoWfAGtPX1sk=;
        b=YW6YiuwUDpnOooaZxJv5srAIjdcAKw1IE+0jHHVg7Sa/RjFUCF92IRsV+LpoFlnbaO
         fPTMCZ0GCLPZh5kz3RVN8ZaRZ7yYxKkqCoQ03Y7Kk7D1KsXYm9m6lsBIlyUNi1GMDOys
         UG4cUrDrD5S1ZkTpfGA5k4N4L6EChe8JP+WyzOfw/1ECBFUK5v8gt5B/kfrR2582IELE
         35CyIIWXlb6IyXDyds/2jZ0sv8OTRqGI1ce0oKDuQAX3okMuoluVPWRqMakU1G3TDgiT
         jqVHvRdM/D74gMuy5ttN40eQeW0kXhctYXrigaL3elAK/z5rqEYtU5pZAim+F6BGGAea
         Fbsg==
X-Gm-Message-State: AFuF++m2YvQ6904BH4qfUp37dmN+VFC4Pfpx+p05LA1tb3cO23rMFFjD
	BXdl4Tqxs6EULX2NVJX3Q2vrI7i5P0utssGXt2/S54Ku8DxjoKcjI/P0dI6cWA==
X-Gm-Gg: AYBFou3Gr+J3jvKdEpW+b9/H2Q0Ob4ZIyopKGFVLcYpg4Vo0wlXpgRcpUov9TcE0jLG
	hEWjNriatoscGDL4lvTLkJDpYrokNNoANxZgLHcCWDYN2nEnoh6OIp4+sC5grLRjo6APUX8FPaV
	s28wiUndzz2vjXjacv6685dwg3bNxcbPDqTeyo8YgkoWBjxCvXyuUmVAzFXld0G9X6LUuX8ZpXq
	UqjZuqaP6192xcfD6S/FUsu5hHlvE+WZ/+65Cea/Bq4a19RV0b+vFrwkCPoVlVTAMVWt1fM8hOd
	BWVUE2sW3mDfJ7zlxdr4SnK7UBMGC1OPNSJF6lDuU99nt8Af0RcAfLByu98ktQnhH1KmdQ7/aMl
	2qz4N7aHMkjiHhtV9x0/YG14q2HNuUZYDR5Wp1vrbnxMeRwcgXVbJUP3ZaL/BzpjnzEBPsHFb30
	i8bc8Q/Eom9q2nmfJIu14bbpVUTe+qAUmCZ6fGCncIfAtUrzH6UXXSXjQkhTSWTaundqJnvDBZY
	G3c2UkBq5HqAso4BEqab7j158+qUTzOsn/RENlfaEs6+B9bnF1KWZjsOmw=
X-Received: by 2002:a05:600c:8b34:b0:4a0:b6:4619 with SMTP id 5b1f17b1804b1-4a000b647f1mr130365475e9.0.1790692655838;
        Tue, 29 Sep 2026 07:37:35 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf8f93csm89716995e9.5.2026.09.29.07.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 07:37:35 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	Sarang Sapre <sarang.sapre@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH v2 1/3] media: ipu6: Fix ipu7 firmware context leak on stream start
Date: Tue, 29 Sep 2026 15:37:29 +0100
Message-ID: <20260929143731.43358-2-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929143731.43358-1-devnexen@gmail.com>
References: <20260929143731.43358-1-devnexen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ipu7_fw_isys_init() runs on every first stream start, but allocates the
firmware context and queue configs with devm and never frees them, so
each STREAMON/STREAMOFF cycle leaks them. Use kzalloc and free them in
ipu7_fw_isys_cleanup().

Fixes: 9ab793dbc176 ("media: ipu6: Add ipu7 fw isys ops")
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/media/pci/intel/ipu6/ipu7-fw-isys.c | 23 ++++++++++++++-------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c b/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
index aee9227fd66c..379a84b595fd 100644
--- a/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
@@ -34,6 +34,8 @@ static void ipu7_fw_isys_cleanup(struct ipu6_isys *isys)
 	}
 
 	isys->fwctx = NULL;
+	kfree(fwctx->queue_configs);
+	kfree(fwctx);
 }
 
 static int ipu7_fw_isys_open(struct ipu6_isys *isys)
@@ -67,8 +69,7 @@ static int ipu7_fw_isys_init(struct ipu6_isys *isys, unsigned int num_streams)
 	int ret;
 
 	/* Allocate and init firmware context. */
-	fwctx = devm_kzalloc(dev, sizeof(struct ipu7_fw_com_context),
-			     GFP_KERNEL);
+	fwctx = kzalloc_obj(*fwctx);
 	if (!fwctx)
 		return -ENOMEM;
 
@@ -76,11 +77,10 @@ static int ipu7_fw_isys_init(struct ipu6_isys *isys, unsigned int num_streams)
 	fwctx->num_output_queues = IPU7_INSYS_MAX_OUTPUT_QUEUES;
 	num_queues = fwctx->num_input_queues + fwctx->num_output_queues;
 
-	queue_configs = devm_kcalloc(dev, num_queues, sizeof(*queue_configs),
-				     GFP_KERNEL);
+	queue_configs = kzalloc_objs(*queue_configs, num_queues);
 	if (!queue_configs) {
-		ipu7_fw_isys_cleanup(isys);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto err_free_fwctx;
 	}
 	fwctx->fw_entry = adev->fw_entry;
 	fwctx->queue_configs = queue_configs;
@@ -111,8 +111,8 @@ static int ipu7_fw_isys_init(struct ipu6_isys *isys, unsigned int num_streams)
 				   &fw_config_dma_addr, GFP_KERNEL, 0);
 	if (!fw_config) {
 		dev_err(dev, "Failed to allocate isys subsys config.\n");
-		ipu7_fw_isys_cleanup(isys);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto err_free_queue_configs;
 	}
 	fwctx->fw_config = fw_config;
 	fwctx->fw_config_dma_addr = fw_config_dma_addr;
@@ -144,6 +144,13 @@ static int ipu7_fw_isys_init(struct ipu6_isys *isys, unsigned int num_streams)
 		ipu7_fw_isys_cleanup(isys);
 
 	return ret;
+
+err_free_queue_configs:
+	kfree(queue_configs);
+err_free_fwctx:
+	kfree(fwctx);
+
+	return ret;
 }
 
 static struct ipu7_insys_resp *ipu7_fw_isys_get_resp(struct ipu6_isys *isys)
-- 
2.55.0

