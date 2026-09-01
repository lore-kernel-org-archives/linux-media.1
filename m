Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034B24A0F0E
	for <linux-media@vger.kernel.org>; Tue,  1 Sep 2026 19:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788289498; cv=none; b=VUdIyeGQ7sbf9Gc6OFDhaLZautZmxeWrw44domp+Ay5Ztawh3on8KLkp7/APA7qdJWydh48O42pptDxs9r3XFn+sG7CEruiqYmTH7iC/tZYJpFsArGpMO8YMk160iKI1x9hosscKOcnI3g+ZZYZUl/M3tDwP2zU9e6D6AK+ScG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788289498; c=relaxed/simple;
	bh=zMz6YudLMNRyvt1tJOUeINHtau4Y9OLX8SPtgDvi43k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gZq8W0Wj8Uay9qf23WrKJznkz5xb13ImiSkB8tJQkXyXdeEgx3OrqCft53V8Nj9/bwTs0aTAzcR2w0fgBGfMjR0HJuPTV9JsGHI7hIlP9uxpqdEcEgKyZ5hdZXEXx7etQZQzdh1XhdZqWf+kTCWqElIXFvQTYXlW89JEiStcqwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SxkdZhLG; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SxkdZhLG"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso1494665e9.1
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 12:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788289494; x=1788894294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DBHgyyi12Pg5PI+CSb0AvNcQMuxkHJiS6M4/J+uLYMc=;
        b=SxkdZhLGVck/Bx0DRPBmvuFQJjuYlTQq+KYxQwnfK9OmCTcbcOPjKQEzwwUYfsZR+k
         BWrFtT4WL990SzjASECoV5ifwiMva8j0BWfLaYhCmeinKURF2URTKZn2CTw1NM9gWby9
         KiA0wnhA7fTSEEIA3zHcITXArZ85Fx00ejpmu4DSAX0jOykdJ72YU3sVYPDcHxw+RsUq
         JpxoDe+2c+9Q94S9xrfO40fcNgo9FayRKZ+8yVs9cLxv5dDA77jU2aQifz8h/t48muPN
         hb9wNmZmxD8dwh8Y/Jsru4tdB9ps6yp/j64zoohTHkEU0bBYHeSBtRYXq1tSxi0q1gdG
         cr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788289494; x=1788894294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DBHgyyi12Pg5PI+CSb0AvNcQMuxkHJiS6M4/J+uLYMc=;
        b=q/sXnQy/7amLzbPPf8Zb7HIII1V1bgo0N+QAgDrKzqMHerrsUCqa/OLuDMvRc0gxaR
         2zYQM61oLQd9UHOYGnAsmaF+NeX1/hsVkebzmv6Sf9N/6zcgW73B7HOWbb3eX4QQJwp/
         UJ+0d+gscdrKrUzTr9+VKd+UwFW44EYOkF5CZBF95FopkxXQFTPcu7GD2uD4Bg8+C9J0
         pkZu7KQYvLLxhbdryuWqpcXyus3U/rIFc5iy4mcpIdYw9ne465YTfPMCdv6bL/tb9+L8
         RYKS4nbqVgeuIYBjM867FFGAbT+5ViDovFVbkBBdCAk7E4q7m04/sCOhTx6J5RHFXGE9
         zd0w==
X-Forwarded-Encrypted: i=1; AHgh+Rq367MvJxmLERVrall+o9HnUtMTRBOAuFNfvYjoVQgBj5hFzkBA6mDMROlDtUpDrMlMFhIj1utiEqBZbQ==@vger.kernel.org
X-Gm-Message-State: AFuF++m3M/8ZSGMgiVWE5zDFYIOzyol0HgzfM7KH7v71BEYpKwpx0syU
	S4ybPRm7gCnjdEXAjukWYUfFVFfNQBdbqTbs6yLThbpDHbvPztaQXaw0
X-Gm-Gg: AR+sD1095Vb4eTG0DIbsotNWuJB2PcbK2cSL8LhOmt9mkmo0wVhdkAPHoxPzj4//Yde
	c2VuQWmGqfJ3yrgZCefU0HDge5YG25bA1RdD5mD4/sOJ61YZCVJNGuXeeA9PAkatVzeYxYZbVD1
	7r630qDB8yGGhH9uWQWobhom7TEZGBHjKT2PDoP+cNwoC6ADZpZCnoK13d5KruO2XUaMIjtjYZj
	C6cR6UC2EUBnJ6q35EwoiSoHtoYTeAjKNRaKtmKSN9YOxmVB4Rb9wY9+2J3+XN1o0+rIPV9OxtI
	JqveErmjVia27yugJtVELvqLVA9GUpmSd/u3EimLo8tbbLY7Gc1G/5IXZVcw/+jJNrfnZyLokcJ
	6vUfAnBsOQ3sywlVKJIDYTdj/2cSxVxqzXaZ28xFyX9kjdb2cQrmUG6goU5Sw1hYHjopHQ8U9sq
	fSuRt/KODzxolzu48jjI0icSKC2mjKcLvm4t1W1V+DdZjlbgHx4F8NlaJoSsQYW1+tA1my90y9F
	opvzj03IsqG+VAxrJUUvgSGUYqVdGixzAneC69Myg==
X-Received: by 2002:a05:600c:6096:b0:49c:cfad:90c1 with SMTP id 5b1f17b1804b1-49ccfad9180mr442961605e9.14.1788289493664;
        Tue, 01 Sep 2026 12:04:53 -0700 (PDT)
Received: from 1Z10 ([78.213.73.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10148sm85481985e9.5.2026.09.01.12.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:04:53 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 07/16] media: atomisp: Add Yoga Book camera configuration
Date: Tue,  1 Sep 2026 21:04:29 +0200
Message-ID: <00930098d6083229724d95fbd14275ad36b75f5e.1788286339.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788286339.git.mauriziocasciano7@gmail.com>
References: <cover.1788286339.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Yoga Book YB1-X91 firmware lacks usable AtomISP configuration for
both cameras. Rear INT3477 OV8858 uses four CSI-2 lanes and a WV517S
actuator, while the front OVTI2740 firmware reports the wrong lane
count.

Add the rear sensor configuration and a DMI-scoped two-lane override
for OVTI2740:00. Add the front sensor configuration separately once
its link frequency can be supplied at the same time.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 .../media/atomisp/pci/atomisp_csi2_bridge.c   | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
index cca91c6d71a5..56da454f0d9e 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
@@ -74,6 +74,12 @@ static struct gmin_cfg_var lenovo_ideapad_miix_310_vars[] = {
 	{}
 };
 
+static struct gmin_cfg_var lenovo_yogabook_x91_vars[] = {
+	/* The vendor driver and sensor modes use two CSI data lanes. */
+	{ "OVTI2740:00", "CsiLanes", "2" },
+	{}
+};
+
 static struct gmin_cfg_var xiaomi_mipad2_vars[] = {
 	/* _DSM contains the wrong CsiPort for the front facing OV5693 sensor */
 	{ "INT33BE:00", "CsiPort", "0" },
@@ -83,6 +89,14 @@ static struct gmin_cfg_var xiaomi_mipad2_vars[] = {
 };
 
 static const struct dmi_system_id gmin_cfg_dmi_overrides[] = {
+	{
+		/* Lenovo Yoga Book X91L */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Lenovo YB1-X91L"),
+		},
+		.driver_data = lenovo_yogabook_x91_vars,
+	},
 	{
 		/* Lenovo Ideapad Miix 310 */
 		.matches = {
@@ -359,7 +373,10 @@ static const struct acpi_device_id atomisp_sensor_configs[] = {
 	 * the sensor fails to start streaming when instantiating
 	 * an i2c-client for the VCM, so it is disabled for now.
 	 */
-	ATOMISP_SENSOR_CONFIG("INT33BE", 2, false),	/* OV5693 */
+	/* OV5693 */
+	ATOMISP_SENSOR_CONFIG("INT33BE", 2, false),
+	/* OV8858 */
+	ATOMISP_SENSOR_CONFIG("INT3477", 4, true),
 	{}
 };
 
-- 
2.53.0

