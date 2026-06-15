Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE543CAE81
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 22:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781562677; cv=none; b=h/4/oCJ+YAwm+Y5cA+BxmDH9V6Vwvcz+xSiAf7LUPl6fNKdMcSZfOQ/akEF/UU2pL4jTd57DwFtBJKswUK5hsDSqXKI2c62Yky2GfXYS57S3ksZVjozZ/7HMfAajNuyWPS/Li02WsokZjwKqHt14i1uj71g2ZeC1IhazitvGIhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781562677; c=relaxed/simple;
	bh=ZDmnb3XEMaK7O1lJQZa/cknm/48t0eGFAQ9491TWP+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cYSmjDX4MbnMXq9ycfFZJZznFzirvJO9LHvrxW3Sd3rh7PcO67oipG172vk6wqRQgYREg8LrnhfrsU3P1LYLGVa4lhaMmXdLWF0Ybwd8b/zSbz12Nd5e6+it3HDSyYaNvcV/ud2SsmLBN5fOfWBYuHeqSN6RokXBXX5XgfJGDnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HaNhYfSd; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HaNhYfSd"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2bf237e1433so47416555ad.1
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 15:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781562675; x=1782167475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rmPoQuQcRbzx+zhd+lrf/32rxKpiUevBGz/mADu/p3s=;
        b=HaNhYfSdsa2UO9jdKv4l4ZQbvqn7Px9PSryFW5+dMxj+Eukw+e0IFUuhW5KPOHQKUs
         RhX8SCs+D5KeykDA9NylNaSVhIgvrzmY52hlZHAHjLdc9Yy/0Ep0KYr/8CRFmffRXGUp
         5LAuSOlIl0IcUUPT+sBTsQJMkEWRqdWJha906SmX/nc5fuFxKbjwrP/5gKj86uTtHcK6
         wpo9ThunRFKItWR21oudQRy/ipIT1p9VmVXGSyxQ/iRkJ+K8IieXzFRJMXWZ6xsKeH3y
         3EP3WvRFD5zPCvlnrl7JuwjqsAtJG7zG0kZkeZLf4Ei3YdJ8IK63y+eEQW8W7g1yuuER
         L3qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781562675; x=1782167475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rmPoQuQcRbzx+zhd+lrf/32rxKpiUevBGz/mADu/p3s=;
        b=MN9Nb/TgRquWn759fObCdZKgVz75GnEjijVHuAGV6S9x2AhLyIC9829jePbAbxBDic
         BFQNisGk4pQBX3BGJ/przTkAkPfkyl8D7zThQ28lE3m8aPVr0HmmiuvGi+Ip1v7c+eXH
         96PbG7kC4rJ0JfH397cr4Trd/F0dJB1URHBvE4cpNyrRfQgpt2S9mU5Ub/PYCTqdqCcT
         hW+WsyNKasa7/8ahJ0unmcpNvjE+gNhW+w2HrTLfo3Bgh8W7aY5K4BKT/EcqSO43Dnd0
         Qs7bAQeXxK18/g5JcYei02O+eZ/91Rt41v7/lX1TSkLZDfpwaNu20dL0di3l0HUrbMEX
         OFOg==
X-Gm-Message-State: AOJu0YyzqioyxT5JpcVOZd/uYXbvPXOZ6ftUM4Jotfu89yeg6ZPCkbDm
	ycS7Lh+nqszNndWxZNZMuUD+T+Tjj2slaC7iKAa+wg6Q2f7PXMmWpURAuFl1hzp4
X-Gm-Gg: Acq92OGlvY381qhfPJp+IKeM2q2mjE3vA+FBFwyh1fxsTpRGcm3xnfsHyVetjLcV3V8
	Qbj9QM8se7tZChquZSYirXTxGF+9mIN5DcS7OhkqZt2q/uJpThF3vwQ2Z/T1PWfkdyn0xOE5stx
	UWrUrQNEvljlfVmKQEAiTLin+2YNz1LpSxepo0Nwp8gOghrlrOvwVU7o0nIyUTqCXpF/7cra2M6
	CDvPp+Ps++Q9CodOvrxBuLw0G1psFaTODBFNyr33XymEEr5nBK/Yx+uisZmKtp8zoIGiyb2cnl3
	jD6StzzQEyuWTQtpFgzZcA5RqphG/Wwq7M3JF/wg1kDB0/ZmWh8JwOvJAqUWvanc9JEMtf2OkLQ
	Q3kiDkuMVa+G+fY61KcY0tF29WIdjBdSwex+/SuJ5S4mAY7m9jWaZfRU5PkRuiwc7zflzFluwZE
	0NkA0HTP59OXXBMPABkDogrYfPorePCynk1KfPKlpYM9Jsx32ufgbacpjLfCwCN8o=
X-Received: by 2002:a05:6a20:9f8d:b0:3b4:79fd:cba4 with SMTP id adf61e73a8af0-3b783dc101emr19766278637.12.1781562674798;
        Mon, 15 Jun 2026 15:31:14 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c86651a0090sm9638592a12.26.2026.06.15.15.31.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 15 Jun 2026 15:31:14 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	linux-kernel@vger.kernel.org,
	Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH 3/3] media: i2c: imx219: Drop manual fwnode_handle_put() via scope-based cleanup
Date: Tue, 16 Jun 2026 04:00:55 +0530
Message-ID: <20260615223055.39953-4-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260615223055.39953-1-birenpandya@gmail.com>
References: <20260615223055.39953-1-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Utilize the __free(fwnode_handle) scoped guard macro from <linux/cleanup.h> to automate the lifecycle management of the endpoint fwnode in imx219_check_hwcfg().

This inherently guarantees that the endpoint node is released when it goes out of scope. Consequently, the manual fwnode_handle_put() call in the error_out label is no longer needed and has been removed.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/i2c/imx219.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 7da02ce5da15..14dd5acee284 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -14,6 +14,7 @@
  *
  */
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
@@ -1110,14 +1111,14 @@ static int imx219_identify_module(struct imx219 *imx219)
 
 static int imx219_check_hwcfg(struct device *dev, struct imx219 *imx219)
 {
-	struct fwnode_handle *endpoint;
 	struct v4l2_fwnode_endpoint ep_cfg = {
 		.bus_type = V4L2_MBUS_CSI2_DPHY
 	};
 	unsigned long link_freq_bitmap;
 	int ret = -EINVAL;
 
-	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
+	struct fwnode_handle *endpoint __free(fwnode_handle) =
+		fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
 	if (!endpoint)
 		return dev_err_probe(dev, -EINVAL, "endpoint node not found\n");
 
@@ -1172,7 +1173,6 @@ static int imx219_check_hwcfg(struct device *dev, struct imx219 *imx219)
 
 error_out:
 	v4l2_fwnode_endpoint_free(&ep_cfg);
-	fwnode_handle_put(endpoint);
 
 	return ret;
 }
-- 
2.50.1 (Apple Git-155)

