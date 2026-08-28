Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA953612F8
	for <linux-media@vger.kernel.org>; Fri, 28 Aug 2026 16:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787933729; cv=none; b=MsE/35v336QuROoXrJG6msPfZoSV8yhUCU8SrHIRRC5uD1kpzZJUhgdCD+6/nNyZOl3voQyrVazD1/vjDunoD/Ww/GgzAYqVlq86V6OD6VM3jFFhMs3BiSk83WMEP3b66CdFL6VmbGPpxEIX+12unGzjjzSVYNjTSpT607FUMnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787933729; c=relaxed/simple;
	bh=usTXO+ZWlW2Te+ZHWe9NdViYSu6Lko1pNutdv/H6/Z0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nPtojKReTnNGPHqMFo8w8pa9hlln8uK88BzxrqdT3P5sEuCUXX1JAVriI/89UG6SXOPOTE3J3v0BtqOFHJRinsg0HPPhCA518U0SDQixpuQeERUjgsdVP2M91HzMPXtvzC2NHeat9XfYnGjnEiJV8yfvPHE/tGgpF/aYeB7+d0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PofSWGOP; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PofSWGOP"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47fecbb7000so421612f8f.2
        for <linux-media@vger.kernel.org>; Fri, 28 Aug 2026 09:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787933726; x=1788538526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xCuY6gGTBuVO+96rY+P61STsvhiDiQP17uO+QOQgni4=;
        b=PofSWGOPYIP03OdVYpVlzvWAKHxsXWHUxZGpuJ9vbh9jhhyR6bMHmEkbSHoHWnTfCg
         c5XMhL2Yv9BxFr/02gydkzlQI+NHL6RNHO8dUZeNqtu31IwscxbP8NeILCIBl3rRzJLO
         iFo+r2gKLe80vTLmsiaZbDS/LXismpM+kblXjPUHtVx5TjozdhKaA3hOSHYAAhYOGdzO
         4DLXnSD9P984NoRRrgOZiqoEcNNgfDd0nhB3oYNGI9hNbBriDtusQFGRhFUG+7RzMIgx
         q8+x2l9PIUNvsvggOmdioHWfmEadrmvXbtERUylT3qWHXGXtj1ctHuJVtTnqLm/eyiFt
         Rwdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787933726; x=1788538526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xCuY6gGTBuVO+96rY+P61STsvhiDiQP17uO+QOQgni4=;
        b=acpnz1qsIpA6asgQCPooQkKyfnK3zh3nWFEmP7CGxBViCRi1rxUWN/FMJou6Gcw2WC
         S1V7TT3VKfqKVbmL1vFdHGXioZZgU0ZM4eFd7uJrzWh2S0pzY01IHhrVXzbaaOlSYEv1
         pQ3DKF8zrdrafowv2pFZA5E+TYmBEqBuTGEhSQXxZnfx2jflPyDKLn7rM2QQS0CdyudB
         fL2KvZHNibIbceY1nWLUd5L5pY74Rx0ywiEXktYLAhdJwQ35VtXuIhUuLZF8XqgxTgFs
         ZmgutBHbHbERpwLy66RCcktFWWX2hqX9efqQ43bz93hXtzykoADe/UMlvLt9oCIcYLte
         kdkQ==
X-Gm-Message-State: AFuF++mC/YyIob4zQ4vV8qhW3AKs4YoqbiR3z00r9P7B3bySt49w6ZeZ
	oM8Hp2XmUhylQt5txB7qT4WznIq3gOdSzpE51wXESOOcGTAiigJZDoOd3tvxe/KI
X-Gm-Gg: AR+sD12ub8AvE8fhU/ruDajZ09BVeMW5uSCpfCbh+7eOhdEn96+7XFfWl+xaRMUKxFu
	k2icvFs0Jx7CVfWgekEdZyXjjqEEwXexiO4sxRw4JkhzF+DI0u2x8a+2y8CJw86nVrEoX345B97
	M+qQvMt2JKj3wSNuXRDcTvGq8ocYoqyvHuZ3BuXJkAosgUsyL4B8QLKiNeySyqlbaR4AEaPoMhF
	BpwcsGOoDavvZrC64XeNWS++EqNZpbJ7T1avSEa0YDVF8frZrFAr33WsODk6GSY1cbjowHAm94B
	ySoR75ku1MmNK4XsnmRSqideM/PiruLi7yWIo39e3vLyLh9+DorpmXbIcFHhrTmAC53HBUjn84J
	McCUxnDQGE05fY6MktSNHHg06pW5G4MbvojDztiP03+/S6YMlYckPHuSkBvETIAP2v0ULnPblus
	mTbwucokxNpAAWBcnYgIiizPlo1fEtsV0LfbXzH9NCtyM8t+lCdBA2aVd1Ko28SF0zs5lNTRkhz
	9Wn3ehfpGLVSipjFlooq/nQL76gGcnzaAFWBLFEJQ==
X-Received: by 2002:a05:6000:2c12:b0:47f:80d1:be0a with SMTP id ffacd0b85a97d-482f79c7697mr12240100f8f.14.1787933726470;
        Fri, 28 Aug 2026 09:15:26 -0700 (PDT)
Received: from 1Z10 ([78.213.5.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3f45sm7629739f8f.7.2026.08.28.09.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 09:15:26 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v4 11/15] media: atomisp: provide Yoga Book OV2740 link frequency
Date: Fri, 28 Aug 2026 18:14:53 +0200
Message-ID: <286ec3ad5ea72a769b5a30a086a4ca8b35268700.1787933456.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1787933456.git.mauriziocasciano7@gmail.com>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Yoga Book YB1-X91 firmware does not describe the front
OV2740 link frequency. Extend the AtomISP sensor configuration with an
optional frequency and assign the 288 MHz Yoga Book value while adding
its ACPI ID.

Pass the value through the IPU bridge per-sensor endpoint data so the
OV2740 driver selects its matching mode and the AtomISP CSI-2 receiver
derives the correct D-PHY timing.

Link: https://lore.kernel.org/linux-media/apFzAc5XfV9gQpXS@kekkonen.localdomain/
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: Codex:gpt-5.6-sol sparse
---
 .../media/atomisp/pci/atomisp_csi2_bridge.c       | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
index 56da454f0d9e..226c81409848 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
@@ -15,6 +15,7 @@
 #include <linux/dmi.h>
 #include <linux/platform_data/x86/int3472.h>
 #include <linux/property.h>
+#include <linux/units.h>
 
 #include <media/ipu-bridge.h>
 #include <media/v4l2-fwnode.h>
@@ -43,14 +44,16 @@ static const guid_t vcm_dsm_guid =
 		  0x9f, 0x48, 0xa9, 0xc3, 0xb5, 0xda, 0x78, 0x9f);
 
 struct atomisp_sensor_config {
+	u64 link_freq;
 	int lanes;
 	bool vcm;
 };
 
-#define ATOMISP_SENSOR_CONFIG(_HID, _LANES, _VCM)			\
+#define ATOMISP_SENSOR_CONFIG(_HID, _LANES, _VCM, _LINK_FREQ)	\
 {									\
 	.id = _HID,							\
 	.driver_data = (long)&((const struct atomisp_sensor_config) {	\
+		.link_freq = _LINK_FREQ,				\
 		.lanes = _LANES,					\
 		.vcm = _VCM,						\
 	})								\
@@ -374,9 +377,11 @@ static const struct acpi_device_id atomisp_sensor_configs[] = {
 	 * an i2c-client for the VCM, so it is disabled for now.
 	 */
 	/* OV5693 */
-	ATOMISP_SENSOR_CONFIG("INT33BE", 2, false),
+	ATOMISP_SENSOR_CONFIG("INT33BE", 2, false, 0),
 	/* OV8858 */
-	ATOMISP_SENSOR_CONFIG("INT3477", 4, true),
+	ATOMISP_SENSOR_CONFIG("INT3477", 4, true, 0),
+	/* OV2740 */
+	ATOMISP_SENSOR_CONFIG("OVTI2740", 2, false, 288 * HZ_PER_MHZ),
 	{}
 };
 
@@ -395,6 +400,10 @@ static int atomisp_csi2_parse_sensor_fwnode(struct acpi_device *adev,
 
 		lanes = cfg->lanes;
 		vcm = cfg->vcm;
+		if (cfg->link_freq) {
+			sensor->link_freqs[0] = cfg->link_freq;
+			sensor->nr_link_freqs = 1;
+		}
 	}
 
 	/*
-- 
2.53.0

