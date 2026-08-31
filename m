Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264EE4B66D4
	for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 16:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788192502; cv=none; b=kGQXCdlCR/huI+/uqXORX7vj7STPESO7YohPDoVR2QH7lEpRW1yKGBysadfDM2h5+hVZQHCh5aeFZEEVmyRLuJof2GoxlTSE7CUZzAMoaTuLpFBpDq7wdN9fYayw2N2tUbf5UOUKBk2v0ARR3nU/05W5RkQYgS363lXVJR+7BPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788192502; c=relaxed/simple;
	bh=OdlS7s1mPHGrcu0CPS8FKPyzygbRnniwzOGYOk7XL7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=asoJnIVh+aFYWv7snhkhqo8LVoqDgLC8vm03RGq552bzNZfikh9qeC2f2ah36zW6J26eKmSA4ba1R1aeQwd5NzNEPBhllAGePYhqIe/0A8wt+pomGtradHzwlzqK6aO22FPGzQM6SfGzNGmXMryO743qWCdo8uXb4SS6zjG5b9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pF2KzYB+; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pF2KzYB+"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-482e2fdf5abso1692523f8f.2
        for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 09:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788192498; x=1788797298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mcYP4t6SR+tHZM0rfR5UPQlcdnVv/54YvSAwMnKZ6SA=;
        b=pF2KzYB+DQrqDPIzaMh633WVfC+vPIqFjv0oDv0hkxt9aC/8Si7axdnlwKDr0Zo+9l
         iVU2bwCv+BoaxYA/WrRqEhJYNqKj/K5r2eOE9LkF+HVuxqEyVBZIr1ZFZKXisIB0WxHm
         KBSjrbbR2G7zfiia2iS3SMIQrvyA80YmsXtOCLfld7h2669S/m5W8MKH/mByD/bHUkbg
         +kCfwsLWCenSPCLcMZKaECmM3kwEW8azOMk1LdieIF/5XNEPsjO4Mt5h2wLmiSFXhB0R
         hSoeV1gGIy+/Uhb47y3CgLmewcUGhh5OVJ9p04UNnz9LqB3QwUDn0X+iGyEHx2z7n0y4
         IVIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788192498; x=1788797298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mcYP4t6SR+tHZM0rfR5UPQlcdnVv/54YvSAwMnKZ6SA=;
        b=g57mX/oJWxfBnhVCffULohu9N5HmYX+jC/KhT86wYWrAEJ6E1OLmwGbB4oKbny8xPr
         QOOoX+gZuYZ5jTxldot9VPxWQUo0CLN48gsA1mlRdGWB6gyW3B1aVQigMZDF21WHM+Jm
         Op643ZVqtmWuKQzVmELgbl6tQNmgNjbgCUPpxmjan/xwrVe4k5MEdjSAaNS0y57IcSQq
         HMJOhZANpoJy4hATLhkZ1oElK41JyabDWZvN+GZv41YWg37CJbgFqO+9qx/aXkX0OOZJ
         uyHEnfOfD6VSvw4lNsXFdogSd+XIpuVTzUDyeHniBfZ8v1XGoteHXv0JulTWDaJw8ZrM
         N6Dw==
X-Forwarded-Encrypted: i=1; AKwUvBzLaMC9YKl0INxV+e/O8US0iENw90ObGdEXkBcB+NLv/4pbOek03qwO7FFP5q33zQsEebwbQLOvdbxC9Q==@vger.kernel.org
X-Gm-Message-State: AFuF++kqv5cc23c7wcEtIsJjzbMAkudEAQKPRcIIBSSu9gaNRWYwYm/n
	a9w7e/cVMFaATUAtxPxf/v7Q0RlHpRrpKdjwUeWFhart5JMDN2UpoPbi
X-Gm-Gg: AYBFou0XSsJJha5ZbLFa667fTRkt7aJdAlYtGTdQ0B4UPsZU6uQtTNrWdd2nJnE2UsL
	mpnoq80XkKGQeWpI/C4sH0wfn8lY2vqZ5jvLPo1WDIhUx0eBlMnIWLnKCwT0REvLSA24rV6yxr3
	OFwMhl2/S7+qcTxgoD4DKXJEo+UZK0QpEiWFq4i0ctdVnzETOM9fScOJdOwqGs4/FYnVwnzEvpo
	6Jd4YWo/b5c6Vjfzxkp+6MQghuEoac8T03j+JO5b6Ufva/gxZDrKLxEfc5pzP6wJIUG5K3feWjJ
	XWcJkbdMjCmMriIV7QHoD84gxzHaILFmCCXTudV7XLhYo/Nbu7KPj1ziWYEMWAKf/kM5R3g9jwZ
	QXuWnTXJHVQBTc3aQZhIhqCA35WcEBKTsdr13lU9IkszYMOPlnPNmU95TgcdioGkFdFYukhy1m4
	v6ZF/0jEvoxuyHrMxwgEa5rx0rlyfsFi/asY25UvF4u9OFU8s9mIAPUc3J
X-Received: by 2002:a5d:5e87:0:b0:481:51ce:542f with SMTP id ffacd0b85a97d-4844175c9cdmr973669f8f.21.1788192487128;
        Mon, 31 Aug 2026 09:08:07 -0700 (PDT)
Received: from TC-LAPTOP ([2a01:e0a:b8a:2610:ccbd:b529:37d3:c1b8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3f3asm23849760f8f.3.2026.08.31.09.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 09:08:06 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: hansg@kernel.org,
	lee@kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andriy.shevchenko@intel.com,
	v.vitovt@gmail.com,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v10 4/8] platform/x86: int3472: tps68470: add static clock consumer support
Date: Mon, 31 Aug 2026 18:07:50 +0200
Message-ID: <20260831160754.9857-5-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831160754.9857-1-tchatard@gmail.com>
References: <20260831160754.9857-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On some platforms a sensor's ACPI _DEP does not list the INT3472 device,
so for_each_acpi_consumer_dev() misses that sensor and never registers its
tps68470-clk consumer entry, leaving the sensor without its MCLK.

Add optional n_clk_consumers/clk_consumers fields to the board data. When
set, probe builds the tps68470-clk platform data from that static list
instead of walking the ACPI consumers. Boards that leave the fields unset
keep using the existing ACPI traversal.

Assisted-by: Claude Code:claude-opus-4-8
Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/platform/x86/intel/int3472/tps68470.c | 19 ++++++++++++++++---
 drivers/platform/x86/intel/int3472/tps68470.h |  8 ++++++++
 2 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
index 35fa77eb3..df0f5f962 100644
--- a/drivers/platform/x86/intel/int3472/tps68470.c
+++ b/drivers/platform/x86/intel/int3472/tps68470.c
@@ -190,9 +190,22 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
 		return dev_err_probe(dev, -ENODATA,
 				     "No board-data found for this model\n");
 
-	n_consumers = skl_int3472_fill_clk_pdata(dev, &clk_pdata);
-	if (n_consumers < 0)
-		return n_consumers;
+	if (board_data->n_clk_consumers) {
+		clk_pdata = devm_kzalloc(dev,
+					 struct_size(clk_pdata, consumers,
+						     board_data->n_clk_consumers),
+					 GFP_KERNEL);
+		if (!clk_pdata)
+			return -ENOMEM;
+		clk_pdata->n_consumers = board_data->n_clk_consumers;
+		for (i = 0; i < board_data->n_clk_consumers; i++)
+			clk_pdata->consumers[i] = board_data->clk_consumers[i];
+		n_consumers = board_data->n_clk_consumers;
+	} else {
+		n_consumers = skl_int3472_fill_clk_pdata(dev, &clk_pdata);
+		if (n_consumers < 0)
+			return n_consumers;
+	}
 
 	cells = kzalloc_objs(*cells, TPS68470_WIN_MFD_CELL_COUNT);
 	if (!cells)
diff --git a/drivers/platform/x86/intel/int3472/tps68470.h b/drivers/platform/x86/intel/int3472/tps68470.h
index 3bbaade96..68303e6fa 100644
--- a/drivers/platform/x86/intel/int3472/tps68470.h
+++ b/drivers/platform/x86/intel/int3472/tps68470.h
@@ -12,12 +12,20 @@
 #define _INTEL_SKL_INT3472_TPS68470_H
 
 struct gpiod_lookup_table;
+
+struct tps68470_clk_consumer;
 struct tps68470_regulator_platform_data;
 
 struct int3472_tps68470_board_data {
 	const char *dev_name;
 	const struct tps68470_regulator_platform_data *tps68470_regulator_pdata;
 	const struct software_node *tps68470_gpio_swnode;
+	/*
+	 * Optional static clock consumers, used in place of the ACPI _DEP
+	 * traversal on platforms where a sensor's _DEP omits the INT3472.
+	 */
+	unsigned int n_clk_consumers;
+	const struct tps68470_clk_consumer *clk_consumers;
 	unsigned int n_gpiod_lookups;
 	struct gpiod_lookup_table *tps68470_gpio_lookup_tables[];
 };
-- 
2.53.0

