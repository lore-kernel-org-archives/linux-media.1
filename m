Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69983B6C01
	for <linux-media@vger.kernel.org>; Sun, 27 Sep 2026 20:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790540198; cv=none; b=Bki4wWaK9QTz3QSqI1US6YfbIjTquiRosQCUHYj9WmGjS8ZVTkvNcH6LQMIsKj3/Y2d1Ip8XylETUy0WtGtaCbuEobpkKHLDXQJSzA3/J6Q0bsdcOlY6Zz9wf1p5yhYU9EDGtkZjs2Eex9z3kqqc+6CTo6EjV41DTsbMze2vvis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790540198; c=relaxed/simple;
	bh=pASQnnah6qpEkll7hASjhVPduYNJH3VS2SghHlNMldc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uUG8s/9w+KDGlAZ/gwAcjo7tbfaYtv5Cxkzm1PBiHLxfh6HnhJ0CaRxx7QLQxbu3j6jZJDxfhf6QZVhqXw3XmBmn5p6FD1r0WS8xVDKWEDJoNKMz3EAaG+U6KYrmrykjCT16lw+7r8f1ehRf6ncWzNUyopK1BQD/Sw0HsEC3mHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o8DOe8BY; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o8DOe8BY"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887635e952so1010213f8f.1
        for <linux-media@vger.kernel.org>; Sun, 27 Sep 2026 13:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790540195; x=1791144995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oTKQmNoTgBMDEzYMx5qmHNQJ06sX9XG0dAtMeqIwPbE=;
        b=o8DOe8BY9uBt2gl0Dntq5uNOuThOjqP47wkuBRi1E0QdfZuwTDhisPp+2g6M2ISlSn
         zXxlWiObT2PZxRtrwvGaff5ZP/8GnhGqK8Hy348ziKJXNJJ9DH0wW4LuWEKmfj4UYzpL
         tY6idbNvAHNMGNjoZN6NAEmy4rUQHIfltzsBVkoKBALEVyMZrgps8wurIekV5BsKLuXC
         X/vwbwfiFnm8pUeeT3jqwEvHzr2hHDlpP+Z56EeCuh+V+apfTzlAuBRYcIfKX3NI1roc
         zxZrvRj0VxkgbbnBn/0MbBPvEF4R0wNmhnM+64g4dblMCw8O7p34bySI0B8Sg3kedTPV
         Bgmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790540195; x=1791144995;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oTKQmNoTgBMDEzYMx5qmHNQJ06sX9XG0dAtMeqIwPbE=;
        b=PMXAZFi/ewNGtF14681anEZGc5peATJD+1wNLnu0ecMsDXwTbNwkogTide3VuwZJR/
         fhm9Cchql3FhCvSVuPs8vYSBt1lwoqYcM/huulqRconUBCEy8XvOwTGdZ7hA1U59FrEq
         VGcX3Y78DpazoC/UL6q6+1CJ/4FgyysBFOlesID+M1Hsry7BOIQ3mD3b64oQ4jxINwUF
         wBDF3X/J5ZaOaJjgXOFQFMr4Cr295KJuZvbFvryrwVWxxJ7BPC45NyYKj0D/J3XuFK2X
         HacEkkvPzWRtO1HCjDadpEOGg76KZR807HBMYb9NmolA3R15QjP9G0h/P4o0abB2+4O4
         SrSg==
X-Gm-Message-State: AFq9FYI+31f17XQH0wKgAkKo+alot8va4R5juOU3hpSVZb5jTxuAPXf1
	cDxdlR5jYIG+QqhFsIExGRol+xM6Vw5SbE6u//g1CXHszsHutqqYNe29qlK5EdE1
X-Gm-Gg: AYBFou018PiPeTsw4mT/4jmMX6m1XoJhBkNikFxDrcG8q5oDEbU+IkFlRrMBSP+K0y3
	UGAY/KT0Gn4SH5B8GFhlxNpez3pDBW7k+4q8Mjkkp8PfyYHRultMKQU8e4p2x1XR9r41Kdw0s8A
	J07EHaszvz99wdN7T0i72FEx5PoSeAWL9utU9SVRnO4HsQeAFrTXQ2l+lpCAr5x45wYa64WCva+
	oE7RPPx/iikCMz24Ge4SyoLTVU/QDvBu9JrsXebsEp3p1Z/S6AblvFTPDVMq76RYFYoRp5boFIh
	a3TaMpiqFxdTLph8iJ4WjY5eF0RzJi+go0N3VaIg9cjyA2bhRSdjjDNskkzrh7MTjVleKvfEkU1
	x8fo3SWgdP7Que4tjtzHW+qtaJzLCrJW3CHr3KSH7ePkNSiiiICmXvPZN8EjzGSUqchQkL9u85v
	WDuzwlZT0H/Nds6kHIwMOXCJQ/4HDcJIEHddrgDSbEbcmHsFfI4/6SMdMLlW6TrQvaGCU++HuT7
	PibKaA4kYt+HPlAG3wyOPcFYkQ9BFnHRnv5iYZkQ7Ikzt6OFTBeGn9bGlsjGYhk0h+9RQ==
X-Received: by 2002:a05:6000:41f2:b0:488:8023:6e0d with SMTP id ffacd0b85a97d-48880236fbbmr15002623f8f.2.1790540194615;
        Sun, 27 Sep 2026 13:16:34 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a64ed6esm24576000f8f.29.2026.09.27.13.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 13:16:34 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	Sarang Sapre <sarang.sapre@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH 1/2] media: ipu6: Fix ipu7 firmware context leak on stream start
Date: Sun, 27 Sep 2026 21:16:30 +0100
Message-ID: <20260927201631.153126-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
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
 drivers/media/pci/intel/ipu6/ipu7-fw-isys.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c b/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
index aee9227fd66c..19e063b22a15 100644
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
 
@@ -76,10 +77,9 @@ static int ipu7_fw_isys_init(struct ipu6_isys *isys, unsigned int num_streams)
 	fwctx->num_output_queues = IPU7_INSYS_MAX_OUTPUT_QUEUES;
 	num_queues = fwctx->num_input_queues + fwctx->num_output_queues;
 
-	queue_configs = devm_kcalloc(dev, num_queues, sizeof(*queue_configs),
-				     GFP_KERNEL);
+	queue_configs = kzalloc_objs(*queue_configs, num_queues);
 	if (!queue_configs) {
-		ipu7_fw_isys_cleanup(isys);
+		kfree(fwctx);
 		return -ENOMEM;
 	}
 	fwctx->fw_entry = adev->fw_entry;
@@ -111,7 +111,8 @@ static int ipu7_fw_isys_init(struct ipu6_isys *isys, unsigned int num_streams)
 				   &fw_config_dma_addr, GFP_KERNEL, 0);
 	if (!fw_config) {
 		dev_err(dev, "Failed to allocate isys subsys config.\n");
-		ipu7_fw_isys_cleanup(isys);
+		kfree(queue_configs);
+		kfree(fwctx);
 		return -ENOMEM;
 	}
 	fwctx->fw_config = fw_config;
-- 
2.55.0

