Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62A45172CC
	for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 14:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790692663; cv=none; b=bRoy6Mc3zZRImUPkn+5viyj7Z1Whfs47XlhXyrBz3xzazgbRA6uAA2evD94l1FfsWAJvPpi/xsD4uQJQ+A11FA69Z/wNK+UAlk1rpl6rfCGrc1C56boVBP+sQ11nwDyNeRM4LUSs/oTAhsPTlgvWtSXFR6im59e+HIik8B+6Y5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790692663; c=relaxed/simple;
	bh=d27ZelXQKR/wSde/tghjrO0nUulIuc70YQmNVyALwQc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AwN6wVKZQOhZRpMxW0deVSdKGJGuUqzpL4WdxIZXG+1qez0QeYS4MXm2/eun1wlhN+sk6S7v0nTxteWmUtess5TLfXYBCZZQa8jBszrWFW57E/NHmmbAWP2XwMgZHl9wnspzDedZdk2IVUiUNBIaB5rx+dpOvjpptBZbAAmsOgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sFh2KhFB; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sFh2KhFB"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so27319685e9.1
        for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 07:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790692657; x=1791297457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pmNAjK5szAdBHkEVJ9XXUgS7YROss1M18tgbGJczwlc=;
        b=sFh2KhFBSYP0nrtK6uSmTpyUmoWqNOUT2E3ugg8Gf2pyCOfPIWBylWhOBwcLbe/n4R
         kvLJIuVaIJG6InvFPZEKw31UfqFNMKOtnIzprFeARbxyMDfiYbZBrKLrEQVUpRYdwpdP
         WCMG+YB3G6CUH++J3LdIvJJVrnPoavOOrv2Zf8BmZOWK0jSGHto4lZL5nRE6CIY6C2oU
         IK7/0CSsrT/Sn1kNwprHg+8rIEvOvvO9zIzy0o9CLV8b7GAvLcVi25/Qd7g7G6kLsw6G
         ZgccQdrsopQTbBsLFlOMY3vpOZXCXDrz9fqXEt8Qahd37CKxGYAe6KdyAfYJ9NwgSCiN
         qa7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790692657; x=1791297457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pmNAjK5szAdBHkEVJ9XXUgS7YROss1M18tgbGJczwlc=;
        b=M6jVQdd0t0PrUFsEHD+aA8hniuGGurgEo6OA1nLx52b58WRoMTBPMZetD4OkWbxc3M
         upzufVeWGC44rpkD6yOVW1/9mQby7F+FKzBdV57eOYUE8EB0ExWSGJsCuD/o5rWldb9h
         9Hq/mRVm1hSH/7PhdqaEAHWo8vpMmC9bw3xkWRegnqZtPkaIJenEgT4dZ0T/6t1fh0Lr
         qBzyVX9+KEcYM1p7ephABmbcBq6DOMClSeQan5w1u/qIPn0G7fRb/dmCVzuldvBXi+DW
         VR3+2N7jGn7drLkhTVgyJv9Rm8vEBmisGfW93kOXaIXz2qiMJhEES9z8DCnXnx33AKy+
         ytjA==
X-Gm-Message-State: AFuF++mc9Wk8CaLeprHeqrYhKy8dDsGUJlx5a4BjWAChPeEBKXDWmGbc
	kL2zqK48K6v+Rn8ZzxePbDRfpdFh2yLfWyFA4xdyWrEqQZ9cwbdUe4IVfS3wBg==
X-Gm-Gg: AYBFou04iOQTCHda7f4T2Io6g756BpMVzvbQXL5souB6M8Jv2JtoTjbqGqlN588CPz1
	b9Y2Dg3AaT49LwL/PXjkFG4DMdyYV9aMLa2ZOw09CXuWEvnAn1+VHvBe3QTaHRWIFQRzjfEmJJu
	UV3B2UO7ZQa1AsXakxZtFErZ8r9htDQCYBItWJWvwxaJaQOJb5PE5FoG+lm90+anKW4gnP0+LWt
	4woMOuywX7yNmWmVgBb/Q2gYR3xNZnyJwIed5Bbz4ncwJnPII6zyyzcmNFeMvHt0ci2+LWcl2xD
	0hIybo7VVXEg8F63a8bFZKQqOV4pquDb3SDVpfhKh+SwfiOTJJbiKg8s4enlZImUsmE8dgyjPqF
	lFZC/ATYorKnRVIpENimNCP8YeekGDc6r0CfdAd72DA833jSK5IYO42TJ4AI13W6AK3UkaTAXsz
	kMza1PDQVR7XqvBgmdWirvXp63ZPHsGLqrrXWxupvahRprdsvCnj7/LMPEeRSaKTAenf126Dxuj
	OdSRY/4mqo7TuxJUYmDhGYCX3IcXIkaQJWmBiaOBtkBPCSOAMBurA1gxpo=
X-Received: by 2002:a05:600c:19d3:b0:49e:6777:da79 with SMTP id 5b1f17b1804b1-49fe66fb4a7mr278687585e9.26.1790692656888;
        Tue, 29 Sep 2026 07:37:36 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf8f93csm89716995e9.5.2026.09.29.07.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 07:37:36 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	Sarang Sapre <sarang.sapre@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 2/3] media: ipu6: Fix firmware config leak on stream start
Date: Tue, 29 Sep 2026 15:37:30 +0100
Message-ID: <20260929143731.43358-3-devnexen@gmail.com>
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

ipu6_isys_fwcom_cfg_init() runs on every first stream start and allocates
the firmware config and queue configs with devm, so each STREAMON/STREAMOFF
cycle leaks them. They are only needed until ipu6_fw_com_prepare() has
copied them, so free them right after. Also check the return value, an
allocation failure would otherwise make ipu6_fw_com_prepare() dereference
a NULL queue config.

Fixes: f625e8d7ffc1 ("media: intel/ipu6: input system ABI between firmware and driver")
Cc: stable@vger.kernel.org
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c | 34 +++++++++++++++------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
index 3cad7d8f9ca9..22452f3916ba 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
@@ -212,7 +212,6 @@ static int ipu6_isys_fwcom_cfg_init(struct ipu6_isys *isys,
 	unsigned int max_send_queues, max_sram_blocks, max_devq_size;
 	struct ipu6_fw_syscom_queue_config *input_queue_cfg;
 	struct ipu6_fw_syscom_queue_config *output_queue_cfg;
-	struct device *dev = &isys->adev->auxdev.dev;
 	int type_proxy = IPU6_FW_ISYS_QUEUE_TYPE_PROXY;
 	int type_dev = IPU6_FW_ISYS_QUEUE_TYPE_DEV;
 	int type_msg = IPU6_FW_ISYS_QUEUE_TYPE_MSG;
@@ -222,7 +221,6 @@ static int ipu6_isys_fwcom_cfg_init(struct ipu6_isys *isys,
 	struct ipu6_fw_isys_fw_config *isys_fw_cfg;
 	u32 num_in_message_queues;
 	unsigned int max_streams;
-	unsigned int size;
 	unsigned int i;
 
 	max_streams = isys->pdata->ipdata->max_streams;
@@ -230,7 +228,7 @@ static int ipu6_isys_fwcom_cfg_init(struct ipu6_isys *isys,
 	max_sram_blocks = isys->pdata->ipdata->max_sram_blocks;
 	max_devq_size = isys->pdata->ipdata->max_devq_size;
 	num_in_message_queues = clamp(num_streams, 1U, max_streams);
-	isys_fw_cfg = devm_kzalloc(dev, sizeof(*isys_fw_cfg), GFP_KERNEL);
+	isys_fw_cfg = kzalloc_obj(*isys_fw_cfg);
 	if (!isys_fw_cfg)
 		return -ENOMEM;
 
@@ -242,15 +240,14 @@ static int ipu6_isys_fwcom_cfg_init(struct ipu6_isys *isys,
 	isys_fw_cfg->num_recv_queues[type_dev] = 0;
 	isys_fw_cfg->num_recv_queues[type_msg] = 1;
 
-	size = sizeof(*input_queue_cfg) * max_send_queues;
-	input_queue_cfg = devm_kzalloc(dev, size, GFP_KERNEL);
+	input_queue_cfg = kzalloc_objs(*input_queue_cfg, max_send_queues);
 	if (!input_queue_cfg)
-		return -ENOMEM;
+		goto err_free_fw_cfg;
 
-	size = sizeof(*output_queue_cfg) * IPU6_N_MAX_RECV_QUEUES;
-	output_queue_cfg = devm_kzalloc(dev, size, GFP_KERNEL);
+	output_queue_cfg = kzalloc_objs(*output_queue_cfg,
+					IPU6_N_MAX_RECV_QUEUES);
 	if (!output_queue_cfg)
-		return -ENOMEM;
+		goto err_free_input_queue_cfg;
 
 	fwcom_cfg->input = input_queue_cfg;
 	fwcom_cfg->output = output_queue_cfg;
@@ -315,6 +312,20 @@ static int ipu6_isys_fwcom_cfg_init(struct ipu6_isys *isys,
 	fwcom_cfg->specific_size = sizeof(*isys_fw_cfg);
 
 	return 0;
+
+err_free_input_queue_cfg:
+	kfree(input_queue_cfg);
+err_free_fw_cfg:
+	kfree(isys_fw_cfg);
+
+	return -ENOMEM;
+}
+
+static void ipu6_isys_fwcom_cfg_free(struct ipu6_fw_com_cfg *fwcom_cfg)
+{
+	kfree(fwcom_cfg->specific_addr);
+	kfree(fwcom_cfg->output);
+	kfree(fwcom_cfg->input);
 }
 
 static int ipu6_fw_isys_init(struct ipu6_isys *isys, unsigned int num_streams)
@@ -328,10 +339,13 @@ static int ipu6_fw_isys_init(struct ipu6_isys *isys, unsigned int num_streams)
 	};
 	int ret;
 
-	ipu6_isys_fwcom_cfg_init(isys, &fwcom_cfg, num_streams);
+	ret = ipu6_isys_fwcom_cfg_init(isys, &fwcom_cfg, num_streams);
+	if (ret)
+		return ret;
 
 	isys->fwctx = ipu6_fw_com_prepare(&fwcom_cfg, isys->adev,
 					  isys->pdata->base);
+	ipu6_isys_fwcom_cfg_free(&fwcom_cfg);
 	if (!isys->fwctx) {
 		dev_err(dev, "isys fw com prepare failed\n");
 		return -EIO;
-- 
2.55.0

