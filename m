Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0101E360EE2
	for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 07:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781162963; cv=none; b=CQ3CfAluIQlm3taa9uc+TQ7Qp8lUWRV2nciD7kviRUE4B3r9UCUyKARgSB5XPHRby4aZrW3ktsaIqnZcO5reZvVeQUzj+Ueo76aIG9P1Th692jApHq62SwWE1x/p3/QZqUVM3RD6IonIJZigXmaBIScntyWwdkl/LX5XbaTkZ48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781162963; c=relaxed/simple;
	bh=zTZ9Os93AQKT7+0fhNo6c0IbMZasjMPF3/fzgYRsXzs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BM20rGD6gP+6jAjia5/82xIcd+iLfedZDDo1HPgls1/XfDddN8U4g8iZcaJML2ZLXF5SdRKNcrnttlzxt6rJvoMEHZJnNe7/wcfgUuURHXg75ouxV/G4o5BvGbPrs0Jk0+dizypaVLeYJySObp0Kthu7RW1MVDIHagiSWxtZZqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LlS9gxky; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LlS9gxky"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490b64c8311so83484185e9.3
        for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 00:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781162960; x=1781767760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kLWj6In0UlvucvwDBHBjq5i6uLvtSDMxHxfyE/vi404=;
        b=LlS9gxkyeA3NPwtWwblrcKLmLNejPwMoRhzVJddVLB1FMGnDSra6gaQlZjVuxx/bwN
         6ZI1PVBIy+QcPmQsydAh6hXs5XeFj90sTMv7dFG5DFMz7OJEv0+HYsnpCehwVfTyu/c1
         DU/dO4E/MaEBZ3Aaj5RKNDYsMpezapXslzN/w4WcJiiYDH9lHTt0YKG0GBHaE2I+1gp/
         2uQm0AWOLWrGnGIxHwXuuDg9+/vWGzKKNLT6Y1Ys145vhXsXwqPySE40V2VgFMJXdprV
         rqWA58q38LCayOVSMQKjQPFLAL3F+/NZKafDQf3fB47YLzbTH4X17xCtBa3K7VnDhlc8
         aY8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781162960; x=1781767760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kLWj6In0UlvucvwDBHBjq5i6uLvtSDMxHxfyE/vi404=;
        b=QEPhV1L7/ULkv1PN88iHxZTaqiGwqK0lmgitbU5PFNwH4pkNxXeIyL5YMvlVcsLN3z
         HFU8sRnxr5RXFnEIuQBqlZwuH1qEWmvqO9iLbCyt/dB8Ye029I0JH2jeXnT64yTLiP5S
         42lttUxmqe8BCYwVJQs0wGwLDPt00pUakyqncMCPmY5Q7fnDH45fpg/zBazMyiat5/d9
         mNct2o3AEuNQLx40TSi3QzVBJVxLk2E8dET94/Si89fmHeWPjTYGIuNg37p8Ox5BbHj4
         gWUFS/aNs96agy7vb8kXBupW4F1I8HTANbvAy+AFvTRPjPJHokrYukiF4thusVFzLBX1
         jXnQ==
X-Forwarded-Encrypted: i=1; AFNElJ8OZzlcsvkey35eflln81D9tfdOfTR1U3fL+XF0qXX0wzOeVEJ3Q2mOtUQIPmEsxl3DqwE2ST0LoAP8xQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4LY8d9XfFYsOreNYcV/lWdGjarBLAzZhZ/bJ/1X0wO/Jy0EGe
	UDRValRvScqOrCf0wuWdldmVLe05MdF0LCq0y6eCiRt6Uo5GTIqa18K5
X-Gm-Gg: Acq92OEWnCl716q1/rIU6OvJgkXXg2wi0yQd2uIrYfuKArPhJuuDvAJGHMpnqv/o2pN
	o+86T4XB5Gby4BXiE4dCNm1FP6Sud3tOgqTDEzAQ3kGGdThk/WUlcg1sLza9oZsW4E8mDhgoBfM
	sCz6wNPmpO9y/srWNk5AwH30byty1BhuhZQA/R5MSmsZzn5Xd0bZP5FMn82OoMeClQCBLjGbykr
	8cuCOb+MQZCmPebZkkqcgTPSnTzIWPo5KpLmHnwOG0oS5XPCBuD16hXBAM8ICOcHQirXSFgnBoK
	PPf91Rimfu3X91JGbN5ZMJts3tiH/SDfZ84YXohUhJDFcx33QFXoiacEvLf5zFu94mlHR5lzije
	OzOAq4r/GkVYuAHpwAXRfA8C9kYF/MtvfsxSeeeXg768y2iSSyMl/ATXxvOFdXD8oO6yqy9fyyF
	pWKsw51PGxwcgvLT522op28QDT51W/LBBdJgQgsRcxkgXG50TSD/V6bFVDPSV/8WTkGalIKXgHM
	+xTXoqnLDWLQIzwPOzbiXHMI5mGD+lYFLV2JXCT
X-Received: by 2002:a05:600c:570b:b0:490:e19b:bd99 with SMTP id 5b1f17b1804b1-490e5628910mr12983235e9.30.1781162960308;
        Thu, 11 Jun 2026 00:29:20 -0700 (PDT)
Received: from workstation.speedport.ip (p200300d507395eb363324778b2a2e5aa.dip0.t-ipconnect.de. [2003:d5:739:5eb3:6332:4778:b2a2:e5aa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e5314dedsm30487825e9.9.2026.06.11.00.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 00:29:19 -0700 (PDT)
From: Mert Seftali <mertsftl@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Kees Cook <kees@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mert Seftali <mertsftl@gmail.com>
Subject: [PATCH v3] media: atomisp: gmin: Use str_on_off() helper
Date: Thu, 11 Jun 2026 09:28:52 +0200
Message-ID: <20260611072852.20777-1-mertsftl@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the open-coded "on" : "off" ternary with the standard
str_on_off() helper from <linux/string_choices.h>. This improves
readability and reuses the kernel's existing string helper instead of
duplicating the literals.

No functional change intended.

Signed-off-by: Mert Seftali <mertsftl@gmail.com>
Reviewed-by: Kees Cook <kees@kernel.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
Changes in v3:
- Collect Reviewed-by tag from Kees Cook.
- No code changes since v2.

 drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 4026e98c5845..cb60cb3fab48 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -13,6 +13,8 @@
 #include <linux/gpio/consumer.h>
 #include <linux/gpio.h>
 #include <linux/platform_device.h>
+#include <linux/string_choices.h>
+
 #include "../../include/linux/atomisp_platform.h"
 #include "../../include/linux/atomisp_gmin_platform.h"
 
@@ -916,8 +918,7 @@ static int gmin_acpi_pm_ctrl(struct v4l2_subdev *subdev, int on)
 	if (gs->clock_on == on)
 		return 0;
 
-	dev_dbg(subdev->dev, "Setting power state to %s\n",
-		on ? "on" : "off");
+	dev_dbg(subdev->dev, "Setting power state to %s\n", str_on_off(on));
 
 	if (on)
 		ret = acpi_device_set_power(adev,
@@ -930,7 +931,7 @@ static int gmin_acpi_pm_ctrl(struct v4l2_subdev *subdev, int on)
 		gs->clock_on = on;
 	else
 		dev_err(subdev->dev, "Couldn't set power state to %s\n",
-			on ? "on" : "off");
+			str_on_off(on));
 
 	return ret;
 }
-- 
2.54.0

