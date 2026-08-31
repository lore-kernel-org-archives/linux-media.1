Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF3837F001
	for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 18:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199291; cv=none; b=lxLs7ZmT/AWR+F4OCau0o+ctZEz4YUMEOaEV2ZwoThVN4R6Y14f4e/HNMkNo+wA2ZlddUoe6AudwbInEH2dUMAXLK0XQS4dgu4Yfa+VCBfKrhLVtaNN7nr+wtgAECUruPK7i02NxZnqoWeD4sPgl6kZ4btO9Jph8d7ktexZ1nhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199291; c=relaxed/simple;
	bh=8zThRUQpY5dLJkLhz/VsoaCUOQSCbp2KirpHaq7e5ts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B7lOZj4z7v6i2xUXrDrJsyimPpwaAvMV0eQbYLIWR/FsYe4+9wx4I9DKLLanEKQ3QJMWNPQ9XxoC/1y3s9fL6l3Y/sDkHnvccYsPmTq1lxK50CRr8ZVH5hu27wwgSBkC9bI0T1W2nSs/5EaT4ccIYBsvad/6pXrqfa6xn+J/gVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rbfvcOU9; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rbfvcOU9"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-482e067e908so2829953f8f.2
        for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 11:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788199288; x=1788804088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NpJ8roXvhY23ncBXqOP9UGLUTn78a3yu4lle+mqKLYc=;
        b=rbfvcOU9upCsc7DyTrkfIgnfSGCYOYOuQDKBjXZtZycAlwCMb70km1620or5kfME4K
         t5ceWuUQoXp+QSuwNnOavttweVidouHQ5ooBwABrFlvJMsp+GecwgvverbJIumX7pkq3
         nHrLCs+NrrltrTfFxChYg855vkWY/X9crg2u5idUL3eWQwWwp+TJ4IGLMrmsXgBhiyh4
         Pj05ITGNtUsX2nTGfn0PADTPpeK82TNlgBleWiC83FtN2Fjz71zDcOssY9epunc5IIZg
         KjpHhIbVWL/X7iKxQrZikDhlz6G1hYQvpgrlRswajSQjnvh2FpmbBRp2Ymi6u6Nl48Da
         2i8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199288; x=1788804088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NpJ8roXvhY23ncBXqOP9UGLUTn78a3yu4lle+mqKLYc=;
        b=Wmf5PXKOCaFuJGI14noYBwvnGPASGjV9+9xXRTHiM/OP1EMS7uPTd+CoumGwCLhatm
         CRvFsm9I/v3xDI/5orr2NawGAJaqbyuJsk7HlWR7tb6JvYVhxLlpggZvSmxTmsz7LpsQ
         G4xr7uDD61UqYGZelqbUTLRDaI9B3sleY0WWAqoqYyaKyqhdUVgra7jAk89yyOkPgEUB
         8fR3BQZ+lA3cRRar4j0qsi+/xumdY9RBjk87UN7xo94WdnAOnvsx5oTDWjW8mu5nFI1o
         mhSUXbEjjXKA90ds7emdmQG3zPLdxL6zh3jDug6/ALFp/YvOEhgu1ExJmk9JtarQY45f
         6vfg==
X-Gm-Message-State: AFuF++n2MD7rPU4BJBY8TT+JwwZNVKzTw86mk7RdmMU0dMWx9hBBr6ea
	rd+527FKrDD+l0s5GTRKTUXzyAW/apRYqzTSNiWqrgeLZz2RFVua69F1mtE/3NM0fL0=
X-Gm-Gg: AYBFou1HlT3YKZ0lkd9jV3fSwhP9LxtUL4lj9RDKZ5tKNRZdH2qBeHk/cDCTH9NX6CQ
	mznZt1Rug6mie3vZhipsW0YplFCja37nZB8X5qcuOTuJ13JAagLDKr1WIsEGTiOm9JAgxwzMjvd
	mrDx1QvzRiMh4wioiFDttidVbkW42TWCSUGlwrs6SbFk+nbTzIdLEn+TT4DzmRdcpkCzbz9mXxW
	ipa7eHqJg+yTeRzdpbTFQPCEMfHPQIoZt5l4N49xkutP+K4gAXlcgNA52MD9lXSGvJIFWLszGQn
	OiioREFTCOQBKv0KYlqAHJzcPjFGl/Xiwg28iqZI7acA+JlEn/VFI/VMam3gYjjbEB9tl9Y/jKR
	2gLcNKi6UhC+JPS4HxHh9VSc+kxKrjBVOi9Vgf92Y1Gs7GRmAi+AreMjFeBf/T8fifVubcS007z
	BNGB1E/XY1KTUh/ZUCwZFA/WO0Rgai9dOLCGoPn/dmpr+UmqwKv5piZycAafANXmqWtF3ZfFcVz
	VT1qmeMm/25lU4flQUj376k6CJmCtq1vI+t2PI6z80=
X-Received: by 2002:a5d:5f08:0:b0:482:f0dc:b4f7 with SMTP id ffacd0b85a97d-482f799dadcmr44755064f8f.4.1788199287659;
        Mon, 31 Aug 2026 11:01:27 -0700 (PDT)
Received: from 1Z10 ([78.213.92.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3fcesm22861530f8f.5.2026.08.31.11.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:01:27 -0700 (PDT)
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
Subject: [PATCH v5 11/16] media: atomisp: provide Yoga Book OV2740 link frequency
Date: Mon, 31 Aug 2026 20:00:56 +0200
Message-ID: <20260831180101.3109854-12-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
 <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
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

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
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
With Best Regards,
Maurizio Casciano

