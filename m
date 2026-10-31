Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.103
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793450359;
	b=1eDcMCJ9zHFioC2ltLeOOMhhUYiiwKj9IfQ1fkm2YhpWc3KpORcdCUtY24KimB3M/5zp
	 24ALSh0ohJTf+ui9jGG7XxeQlCiXsU5mhi5x1/SoygH1TaM1oy7Oh79P3OGE0YN4HIHIW
	 oImg5YDrrUwJH1R56b2UTIBTLO4Om2KUloIr2VCRD6zsU8Au+JzEYp6FpVaRo6OAxvMM0
	 ZPibFlVFqr34Kvl6WvV3td7ON/umikh4Vat6+vGylnHwdsRqDkcFoMSOGnV8T76CFIIRl
	 xigKIQboqFxR4PAtQ777AAZ2iwXl/ZiIyfKmJ3AAoHm16x5PYE6b8jfA/eaU/dqlHWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793450359;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=xEKrMB2czomuH4Gk7NWpJgGd8zKDp4dkSnl6SXzMQb8=;
	b=aQObePCmDBpb4ZL7wTrr4hmsDPhAAsr7boA7cAkKGyU8yf7MA32LcXCa7Sa8uI2ubyYr
	 PPnEwgea7SwhHBAgU4AzS70xfsbUqYNxEyDlw73xOAUyefKFApTnXQRG3KjGSWvRPtHGr
	 /oFuK3bjbC38JFi0G/5MUg5k4OIsiwjcqZPA1n82Rd9jkzYhH68SBZEg9QdWVYWbXc4vV
	 pCv6Y94NyL8F+Fcwrun7L/Qn4W4fxMtWjbsUypNdwyObvhCLk+185qE7WZReSVR/kUhac
	 vNNo4dC4p+VIAENQjskYNrEnRz5vdJpLuir/GP84gUjuuzlqeRlIC6gfRDVUm4gGP9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=wpup8LzB;
	arc=none smtp.remote-ip=79.135.106.103
Received: from mail-106103.protonmail.ch (mail-106103.protonmail.ch [79.135.106.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C7C606A31A
	for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 12:39:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20C7C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=wpup8LzB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1793450355; x=1793709555;
	bh=xEKrMB2czomuH4Gk7NWpJgGd8zKDp4dkSnl6SXzMQb8=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=wpup8LzBC1iDFjzV1fBdHB8iGmie2al5bR8kIK39iAhjmCIV42Rz1XSQcCrA7ojgf
	 SVnVBY7gWCck4aeRpGYPVegIPxIAE8YxmakVu4f7p9Kh+BG+YDexhteT6t1jQsd+ZG
	 YZ10sVS7FxF3aFNC+GwuHlPsxgvrziUqgQ08qDW2gdcIGmAYaSvGHsvVF8Gs3PJK3k
	 FOz52bqNJINRl06bg6YmITgRQVds3/ktcQucaVzAZ9fZhaaxnc9n8MwCQYzD8wY2Bm
	 AmaGovnvca/xEollUxFPZTL4OoTKJVfmJLbCswJZ2tDU5KClAgUWI/GrRHfXIDJc01
	 fumlxn6Te7R3A==
Date: Sat, 31 Oct 2026 12:39:09 +0000
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From: Ruslan Bay <ruslanbey@proton.me>
Cc: Antti Laakso <antti.laakso@linux.intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Ricardo Ribalda <ribalda@chromium.org>, Andreas Helbech Kleist <andreaskleist@gmail.com>, "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, "tfiga@chromium.org" <tfiga@chromium.org>, "senozhatsky@chromium.org" <senozhatsky@chromium.org>, "claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>, "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>
Subject: [RFC PATCH v2 12/12] media: ipu6: Enable IPU4P PCI device
Message-ID: <-VmuiglzUKRQZr-LsGrxgUOui_lD6A5MFZSUaqydvel67SrRKztah31JBIbpXna3-DHv20o_UoRPGoRRaM8JylV21MwjO-VMYJk-TuSCD34=@proton.me>
Feedback-ID: 183606634:user:proton
X-Pm-Message-ID: 4cd3f62693cb33e2d91e231f62ff2fc68fc4e85f
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add IPU4P to the PCI device ID table now that the required MMU,
buttress, firmware, ISYS and CSI PHY support is in place.

Signed-off-by: Ruslan Bay <ruslanbey@proton.me>
---
 drivers/media/pci/intel/ipu6/Kconfig | 8 ++++----
 include/media/ipu6-pci-table.h       | 1 +
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/Kconfig b/drivers/media/pci/intel=
/ipu6/Kconfig
index 3d3c7778be3..e901cce5cde 100644
--- a/drivers/media/pci/intel/ipu6/Kconfig
+++ b/drivers/media/pci/intel/ipu6/Kconfig
@@ -1,5 +1,5 @@
 config VIDEO_INTEL_IPU6
-=09tristate "Intel IPU 6/7/8 driver"
+=09tristate "Intel IPU 4P/6/7/8 driver"
 =09depends on ACPI || COMPILE_TEST
 =09depends on VIDEO_DEV
 =09depends on X86 && HAS_DMA
@@ -11,9 +11,9 @@ config VIDEO_INTEL_IPU6
 =09select VIDEOBUF2_DMA_SG
 =09select V4L2_FWNODE
 =09help
-=09  This is the driver for 6th, 7th and 8th Gen Intel Image
-=09  Processing Units, found in Intel SoCs since Tiger lake and used
-=09  for capturing images and video from camera sensors.
+=09  This is the driver for Intel IPU4P, IPU6, IPU7 and IPU8 image
+=09  processing units, used for capturing images and video from camera
+=09  sensors.
=20
 =09  To compile this driver, say Y here! The two modules will be
 =09  called intel_ipu6 and intel_ipu6_isys.
diff --git a/include/media/ipu6-pci-table.h b/include/media/ipu6-pci-table.=
h
index e04ff2a8b2a..233365f2172 100644
--- a/include/media/ipu6-pci-table.h
+++ b/include/media/ipu6-pci-table.h
@@ -20,6 +20,7 @@
 #define PCI_DEVICE_ID_INTEL_IPU8=09=090xd719
=20
 static const struct pci_device_id ipu6_pci_tbl[] =3D {
+=09{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU4P) },
 =09{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6) },
 =09{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6SE) },
 =09{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6EP_ADLP) },
--=20
2.56.0


