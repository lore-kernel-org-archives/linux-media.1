Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C247F21A459
	for <linux-media@vger.kernel.org>; Thu,  3 Sep 2026 08:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788424866; cv=none; b=VFIrkZY3FpzLS6XMOGZ4X1tfQfgC/i2LwzgARQSxpfSf/3KKHgEGVq2dOG8o4Qo5Ott7fIyYpSUpnKKWOuWOLVjehR/hna6PTp8mhugfOeFmVCqJDW9fVXH3SM7iecNlwWzMb+vPDj27+att97BAoHNLbO9ddxTDltMlPxilWHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788424866; c=relaxed/simple;
	bh=k9NSdHkYD3mA/ekaSgvjpymXLJrXmYQDUIHo0Ys+iFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nhlCCBFLocgn/yR73G8449Vd/XhdrkcYuqJa+5eDoD5yLvdaiAyQf0lDOV7/PL8WJ+Fb2Uex5v2A71Ed3YjbZgNjxMtgnrzZpTZ5J26i3Zeb+HD777vaiITcPKRNIJONeT6OymVz365o7TdjVivjl2tOgen8ZX0pnswo5TJVoV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cf4F8sFm; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cf4F8sFm"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47fe89fb333so1335614f8f.3
        for <linux-media@vger.kernel.org>; Thu, 03 Sep 2026 01:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788424863; x=1789029663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+uGqcIdb4d7UTNEjW0AkmlnbUGmWRF71JwuwmlbdHuM=;
        b=Cf4F8sFmc3vU2/po/KV92ekMWQA0+KvH4CuJS7rtLv70c4myAhM4Q9SHQDNLBpuRu2
         Y3LTiuksjUzseufGDYO+yl0JzJClMf26pkfbKDzgUJtkTuwtCVLkZ6mdVvMjnd5T5X42
         Yfk8G4Rszbtv9eHk2D26fum5Yp5p9GIvGafkq1zWMmHKMNmcaT4Rl4Ra8wDlTtyHig6q
         6G1JmN0CFtK58nhpW+IAe/NNGKnovgXBY90obhrpLvQ1Cok/p3IcDOrfbn5AvEnbXgly
         J3v63PAo2ib7jCyiynyHGoVAndVOQ85zVwAReSKFtkEmUX3zC5wUKMAkK9wYTjs9ocJp
         oxiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788424863; x=1789029663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+uGqcIdb4d7UTNEjW0AkmlnbUGmWRF71JwuwmlbdHuM=;
        b=p8uot50aMEGpRA9ScJ16hqpqmyBkeENvJIrcFo7xyLgEX8GUkgTIgMaldM5TjGZX+4
         mUY3d0h7Gfmz9d2S8cKl5uIUx6cPSMkPqtWQNUi6P4MNkUM2cGim5spNCUTes4DAIdEf
         iJjsRaDTULALwJ7FUC8zSqdEPn1WEvHljfs6FNnaTPSBL41jVUHiURVmjSYLPOrBz9S6
         tUQTVZ2kStXxxBM0BO79lh4B+2cEwBe9NqbjtMgE2CtfvDOrOiigcqzm6kLwq+NAWvw0
         KOnFbZpJk4Aeg9yFKRZnh/aDLdIre9uxkEGUpF89P+jubOsZoBGcSV63AzQm0IxDJmJ3
         Tm3Q==
X-Gm-Message-State: AFuF++knBRKwBw3dTLl3ODmdgjmDD6CjASYCTylStvOBPXLCo0S/LAt/
	OyP1w4y/su3c4iexOCnGRg56By2BSuackj6X1v9bJI8mfw11STOTUn88eQynX0rn
X-Gm-Gg: AYBFou3t1323sgXUXa8T57Ii6h1FayXAfy1vgU0dVFdDKdXtzti4eSO1YH22ntDGpia
	/meXqwu/TyKRRUqtJBmWQt7xZFpmaO1Ca7Lb7Cfco5ItcfRwiEkNZ2YqeAiDvjApxIGn46zzIo8
	KW9KeEysKM9c2TRCN9G1ZlLZajVKBTaylBDxoak4uW3j+xX7GGCI/mxFvVECper7PtOH79NPeEs
	Z8b0vq3zy5znWu4Lks2IvdMrASLR1Y4vz2YrxBqHAcX2H9Jh6RNQ7X3p/dpJAOSfJTEtwQp0lgO
	gpC4EO8jEmazIBfDgjH3sKrmJ7K6qLtVL0FrRDaFCiPSdtdLl6pIGezcjdxr0Yrw0TrqigvbwPY
	zr4Ek+BCk9/0fci+98hbpK/CABzliH6Sw1mxjvx6YhNrsIAQgbHbA7xD3JjRfUqhMuOOXEz1OFP
	FHS2YlvS1X6Z2mKlI+ZB6zylr4ljHRbLehVWvmwZuftFCaTJZI55yOlkoujxQo8ozIownFJsRZt
	tjhddPYaDVlU5ighsnXGTNRxYF332eo71clFAbaHCBUGRJRtodQHA==
X-Received: by 2002:a05:6000:25ca:b0:484:3732:c261 with SMTP id ffacd0b85a97d-484913b9837mr16406642f8f.17.1788424862793;
        Thu, 03 Sep 2026 01:41:02 -0700 (PDT)
Received: from localhost.localdomain (159.red-83-38-226.dynamicip.rima-tde.net. [83.38.226.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448eeae34sm13092172f8f.32.2026.09.03.01.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 01:41:02 -0700 (PDT)
From: German <germanpapulindez@gmail.com>
To: linux-media@vger.kernel.org
Cc: German <germanpapulindez@gmail.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH] media: staging: ipu7: declare firmware files with MODULE_FIRMWARE
Date: Thu,  3 Sep 2026 10:40:51 +0200
Message-ID: <20260903084052.17893-1-germanpapulindez@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

drivers/staging/media/ipu7/ipu7.h already defines the three firmware
blob names the driver can request at runtime depending on the SoC
generation:

    IPU7_FIRMWARE_NAME    "intel/ipu/ipu7_fw.bin"
    IPU7P5_FIRMWARE_NAME  "intel/ipu/ipu7ptl_fw.bin"
    IPU8_FIRMWARE_NAME    "intel/ipu/ipu8_fw.bin"

but ipu7.c never declares them via MODULE_FIRMWARE(), so tools that
rely on modinfo to discover firmware dependencies (most initramfs/
initrd generators, e.g. mkinitcpio, dracut) can't automatically
include the right blob for this driver.

  $ modinfo -k $(uname -r) intel_ipu7 | grep -iE "firmware|filename"
  filename:       /lib/modules/7.2.2-arch1-1/kernel/drivers/staging/media/ipu7/intel-ipu7.ko.zst

No "firmware:" line is printed at all, even though the driver does
load one of the three blobs above at probe time (confirmed separately
via dmesg on real Lunar Lake/IPU7 hardware - "firmware cpd file:
intel/ipu/ipu7_fw.bin" - so the dependency is real, just not declared
to modinfo).

This is low priority/cosmetic on distros that ship the full
linux-firmware package unconditionally (as Arch does), but matters
for anyone building a minimal initramfs, or packaging this driver
for a distro that only pulls in firmware modinfo declares.

Signed-off-by: German <germanpapulindez@gmail.com>
---
 drivers/staging/media/ipu7/ipu7.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/media/ipu7/ipu7.c b/drivers/staging/media/ipu7/ipu7.c
index ee6b63717ed3..77c474f8a5c0 100644
--- a/drivers/staging/media/ipu7/ipu7.c
+++ b/drivers/staging/media/ipu7/ipu7.c
@@ -2774,3 +2774,7 @@ MODULE_AUTHOR("Qingwu Zhang <qingwu.zhang@intel.com>");
 MODULE_AUTHOR("Intel");
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Intel ipu7 pci driver");
+
+MODULE_FIRMWARE(IPU7_FIRMWARE_NAME);
+MODULE_FIRMWARE(IPU7P5_FIRMWARE_NAME);
+MODULE_FIRMWARE(IPU8_FIRMWARE_NAME);
-- 
2.51.0
