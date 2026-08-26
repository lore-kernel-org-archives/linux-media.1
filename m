Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90AA7423A85
	for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 13:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750592; cv=none; b=ls8LWD854UqC5pHDnI5h4MKyGzW5NHdgaL7ak2gGMYW95GmC1rGtjJasVf+0W6IyI3hQZagQdgluEZUTq1bNGiuBeuIkxzzF+vvDP5S9rK/RQVh6/V4B9PFCJ3yRmZ2Zk2mMWrdX9n+DyHebJlKdRIcE/Hx+0G6vZx/gNMCX3Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750592; c=relaxed/simple;
	bh=Oi/dCIRA/+pshEFx53wMZKN+XEMFr0GqM+M0K4ABDm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j5+M1uypdTS0i3Bh27qqtuU5YpBtXt7gwJHH8ASAIqnNEYcK9PTCD2BmtDKztZ6Drtwy3c3pPmNUtirpEaS1JigyoHOkQAeeNK2cWubeiQcGKF5egCzrgEu99PCN4xACIL/BM6BSDw4Z9ot/Ql+7C7Nvce6uaa/8+85CS7MsDsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EKgtHnh0; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EKgtHnh0"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a0a4a28cbdso1713240a12.3
        for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 06:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787750588; x=1788355388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VMc5Fvp4Rfyxekd9+9mnrTAhpeQULh9Pwl9GwGfns1I=;
        b=EKgtHnh0BVhJ+oMPaqbtHQzAmzK1O8H7bvBh1TdU4ttKkr74v0zRxQ3RZ8hSEhEByE
         6O3EK1uSa9K3n/r7+cYfOrcAcgxw2/N7URAZdWz5UJiTlUf/8kjzm6KpUPd40R0gOl3v
         q0Ig1jtvUHvGqoEB38c57S5LaOEcG6MwSWXJB6XTtPNCbZVLbkbbY9+uLyTEtnsw1JK3
         7Fgpu9La3m0GE2i5ip+FbVJFdh58TzuDEJIq8mv06OOAgy6nrnm2RoyM5uKESvyapFy2
         GYvZbHM0wzbh9Ok52CYoqOTO1fzajVtfKX9M7/pSDospMGxacZV1IpRcjlQKs5pekZuS
         u1LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750588; x=1788355388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VMc5Fvp4Rfyxekd9+9mnrTAhpeQULh9Pwl9GwGfns1I=;
        b=T3N9B2kCcYjDdtZX/l3FzxRUJuoFm/XkxfzlflHzpcziki3kRVqEKOcEXPuxZvtLNl
         CIPNor8JOPfG+U6IUsOpVQfZGUmn8MHXcKJ8wG4otfDt2hKoYxWkEqAEkpiNmF/1MHoK
         3kqyCqZvruoikSlROLUeoCTbTBzKwNXSSZgC8bJGfM/mqYqBsE8yiLR0iirG8YKFM6ll
         6+u5dIscopaxljaVe7oa+JkQN552meO3JLh93Zto5zcKJpP2V/heWtrFY7VWkEIPa2Fr
         YBc06RakySiUFaSUB/ZuLVfdV+xIkXZ/rHnlGuTcQcWi5IRA2GsXn06OXml/I4h/RVNW
         aejA==
X-Gm-Message-State: AFuF++muH6OScrlcgV+Cu34qBFX9Sj3EykskUunpVzWh1ragLoW2dGyt
	Ikoe7/5EDz7w2uYDinmJOtJfKA9V93QM4ps2n/5r2OAPyCXK24tYu6inMcpHI1id
X-Gm-Gg: AR+sD10M+AC441EETBBdv+oaOMf3bT3xM0i9gF/IYqbc906h2/olTka5rlVrmQ+weEu
	rlY9DTT3/fubSg7161GkDrgAai+LptSjU6McC6p7ONw82RmnsGhcF7wmDTHCpOPA60OcT8/2Yw3
	TPyigFNdF4mbkIntcR1i+Tuv9nugP1rmGeK/TY6gzlYHaG+9e6RWexLPfTQHv+A6qPDXzkaK/M+
	87jCh5zcanl6zordSozxNi+ZyempxF6PmSaAv/gVc1uEgVVXIuWItP+sOoOQTguX06EcSfGiHJs
	DivmHwptODbSxJ7/Nl0Tb4ojhEXMoS2EDGNbcCuugxzjJ1Sj6NfFVOBNPjZw/bwPyirOjIWT48+
	9Du88eFD3QIIHJQZHYiiZbZ+BA+6PVbMMQ3l8aUfYsuGDI1ApHDLyV71aFMjqsuhQEX6JUzVRsH
	6zn8C4sBIs7jZEHSSugY3Bz/ioo5bhFEUw1UrWBctfDJajQC4xdeBVM80LFowYZ8pwQ0T9V5O41
	03J6gILl0a8/VLq9NB/0cKUN08TNvpOuRcVUVWQii8=
X-Received: by 2002:a17:907:6088:b0:c21:35d0:f435 with SMTP id a640c23a62f3a-c250bc0f8f0mr856005166b.10.1787750588312;
        Wed, 26 Aug 2026 06:23:08 -0700 (PDT)
Received: from 1Z10 ([37.163.238.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5dea83a30sm3633147a12.15.2026.08.26.06.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:23:07 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH 2/8] media: i2c: Add Yoga Book camera ACPI IDs
Date: Wed, 26 Aug 2026 15:22:50 +0200
Message-ID: <20260826132256.3343451-3-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Yoga Book YB1-X91 firmware enumerates the front OV2740 as
OVTI2740 and the rear OV8858 as INT3477. Neither ID currently matches
its sensor driver, so both I2C devices remain unbound.

Add the IDs to the corresponding ACPI match tables. Sensor
configuration and CSI lane quirks are kept in later patches.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: Codex:gpt-5.6-sol sparse
---
 drivers/media/i2c/ov2740.c | 1 +
 drivers/media/i2c/ov8858.c | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 39003c1632ad..d85d83bdd203 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1462,6 +1462,7 @@ static DEFINE_RUNTIME_DEV_PM_OPS(ov2740_pm_ops, ov2740_suspend, ov2740_resume,
 
 static const struct acpi_device_id ov2740_acpi_ids[] = {
 	{"INT3474"},
+	{"OVTI2740"},
 	{}
 };
 
diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index f2bed3e88382..5a97f21ab89d 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -6,6 +6,7 @@
  * Copyright (c) 2017 Intel Corporation.
  */
 
+#include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -2061,10 +2062,17 @@ static const struct of_device_id ov8858_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, ov8858_of_match);
 
+static const struct acpi_device_id ov8858_acpi_match[] = {
+	{ "INT3477" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(acpi, ov8858_acpi_match);
+
 static struct i2c_driver ov8858_i2c_driver = {
 	.driver = {
 		.name = "ov8858",
 		.pm = &ov8858_pm_ops,
+		.acpi_match_table = ACPI_PTR(ov8858_acpi_match),
 		.of_match_table = ov8858_of_match,
 	},
 	.probe		= ov8858_probe,
-- 
2.53.0

