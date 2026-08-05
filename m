Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DED1425873;
	Wed,  5 Aug 2026 19:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785959704; cv=none; b=P89EnUQwdA5ZCj3EHTfbUWzWpIuyTc/E8hrGoXPVY/fl/MbPAfC+3B6f8KVeeD/Y8Rym5NiEfXzR84YId2EYP7RlKhYd5Fo/HMM8w+7wteDLVbXMIVzJuajpTWvI5GMEcWLuftW2JcTRXF78Ujr1nwukgqu47ozoDqwlFNknoPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785959704; c=relaxed/simple;
	bh=Jd3/EbGuqRh+RD9PAD10RCqjFBUpr7AoUJ5RGMp8Jr0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SRMN3GGLcsFlaYZVW8CVNFZ67mij7hZLh6/t/J/wiQVl4eZUvuc2+nhPHUL5uhmC54hrcNKNPUskvMXuBh5pZSZkDLXnOvwUE6kZW9eF+L1UwaA23iBT+Zu1133iQ1hmKJYcFcHwwPn6GHlXcXV/KO9i9ib6LycR9m6mG9FBnpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=p4vBgHvD; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=9+jY3FS6; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="p4vBgHvD";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="9+jY3FS6"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1785959690; bh=FP0gg95JwRcBgKS2IRQzZF1
	sTs+hyAwsazPaF6BJYRc=; b=p4vBgHvDaEMDvIAtfCkDGPmDewy5OhhaOFIBMh9kpRMl+tJwgR
	cARtD8jmr0eD9Bys360ZeBwsChbH7etxiSx5FHHX8dvxckFmeHl71aFafRmf0Fq+41law+yqRef
	e81GHh9dJX1e6jgv9mgnxzN54v9ygIZiENifuOu+1RRs1V5MSiHe7gFB0StmI5gkcoLDXvI7BQm
	UScTbj0LP6pnbESD9nAtrjtizK6XuMhj1TERdmdrvL6XdazkAA6zdv3hB5ot8XWbgAtfsDgjiAR
	8JbvaK7uTWzYDw7QJ4/NalY7Ils0Yk7LF3/BZKGKGU2hV/Dw5E/X+S5iBp4KbrjExgQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1785959690; bh=FP0gg95JwRcBgKS2IRQzZF1
	sTs+hyAwsazPaF6BJYRc=; b=9+jY3FS6Mjb/jk5BdA/8+WVTA5S0uCQySdDWNCCWJqcYRylf00
	aNrbmT0FNSl1Ckga3Qoem1kYQVfebFr4S4Dg==;
From: Danila Tikhonov <danila@mainlining.org>
Date: Wed, 05 Aug 2026 22:54:26 +0300
Subject: [PATCH 3/4] drivers: media: i2c: imx471: Add Device Tree matching
 support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-imx471-v1-3-7be79f539ed8@mainlining.org>
References: <20260805-imx471-v1-0-7be79f539ed8@mainlining.org>
In-Reply-To: <20260805-imx471-v1-0-7be79f539ed8@mainlining.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kate Hsuan <hpa@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Eugene Lepshy <fekz115@gmail.com>, 
 Vasiliy Doylov <neko@altlinux.org>, Achill Gilgenast <achill@achill.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Danila Tikhonov <danila@mainlining.org>
X-Mailer: b4 0.15.2

The IMX471 driver currently only supports probing via ACPI. Add OF
device ID table with "sony,imx471" compatible string and <linux/of.h>
header to allow probing on Device Tree based platforms.

Signed-off-by: Danila Tikhonov <danila@mainlining.org>
---
 drivers/media/i2c/imx471.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/i2c/imx471.c b/drivers/media/i2c/imx471.c
index 3ad123699f14..cc75664f1af4 100644
--- a/drivers/media/i2c/imx471.c
+++ b/drivers/media/i2c/imx471.c
@@ -10,6 +10,7 @@
 #include <linux/delay.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <media/v4l2-cci.h>
@@ -941,10 +942,17 @@ static const struct acpi_device_id imx471_acpi_ids[] __maybe_unused = {
 };
 MODULE_DEVICE_TABLE(acpi, imx471_acpi_ids);
 
+static const struct of_device_id imx471_of_match[] = {
+	{ .compatible = "sony,imx471" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, imx471_of_match);
+
 static struct i2c_driver imx471_i2c_driver = {
 	.driver = {
 		.name = "imx471",
 		.acpi_match_table = ACPI_PTR(imx471_acpi_ids),
+		.of_match_table = imx471_of_match,
 		.pm = pm_sleep_ptr(&imx471_pm_ops),
 	},
 	.probe = imx471_probe,

-- 
2.55.0

