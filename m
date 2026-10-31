Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793449592;
	b=vJ9QLmipbOlcfvsYCpnNG1aqIOFkTx191pIJ3azeLezyRcPjY+ORKuVFzUBZCQt17UsV
	 L8jTu284GtxPVg0WKJDivtbTCiEr5QIIJpJiNEBo+4TidgKlFWmgnwaRu+5B1WjkXz+JQ
	 MmzKuurht9RwqVY1IusXwubb2ORXPIEMDHTg7DC4GZc9hOcwRVuKctsVVqJyfpD7VA0W5
	 CBPmvW1Z9+Vbh14W8Sb24/Ouv7Wx8g4jEDqR2O0JiEXlIclAj4BwxBu1JpSEFcpONhvjb
	 UABzKQc7s00SCXa7rmXEkhsEAwZUT5FdgibX5f1bcR+Fy3111JoE4QuKL7Vr3y7Ka1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793449592;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ZtLhgCsOAz7TfkjZj+djqQ3aReyxwa//lMHelGfziU0=;
	b=MOURT7XuQQJVON8/xFMq2QTNVOq7u5UvVGyGEqOSPoLLFGnZFu3IZtUtyJCvbBREP3nl
	 1UEf3Hh8+yadvP2rkdR3nCi5JUQBDdCgkMIkJyfoe5OmdWs8XuxcUcTvvrplRJfu7XpgI
	 eVoYU21fwJpKEzV5u0vO/O3/RyXh03ZFQFgLrIQMXy+ubPytcsJ3JBIJTMzjIeb+q4gN6
	 pyIoc0gVvdEVO+RRUrmZ0lADG6imrkrtNRYyi2FCFNJXa2gs9wWQuY7o5ARhhJo5GGbEZ
	 V56YvJdoVOZjHCAqGyszdjgMcx7G+F3DgFF9ADSG5jcFoxPpK+VH5D8X7mpRxsEI9BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=jbeI1OBt;
	arc=none smtp.remote-ip=109.224.244.25
Received: from mail-24425.protonmail.ch (mail-24425.protonmail.ch [109.224.244.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FD5606A31A
	for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 12:26:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70FD5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=jbeI1OBt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1793449588; x=1793708788;
	bh=ZtLhgCsOAz7TfkjZj+djqQ3aReyxwa//lMHelGfziU0=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=jbeI1OBtCB++rt730UM7V1JZUpFNOgUTA8EnPmxAPdZAwzcAyRviDb7GS+CDIRYkj
	 tOBU++N/rDn+JGNs/jlzf8zyOhqUJQmN6GlN7xZ/16bHjZQJGBR33583gOwUAMZzNe
	 SXLwyBhBPpbavDYUXD96p1gN/tazDh+XfpvZMZB4M2V99yutgrpyY/QGws5J+6qFH2
	 WRuIIjn7atTclxo6BuAY7VqfBDZ4w2ghl8iFQ5qtXHcHjUq5lcTIFcyL6bbdTQZcEy
	 G6v1uj9cYMYIyQhs2RlAchc2cBtuUfKaEsHUFl5roQQegTVsDEW80HBevt2L4tIgOH
	 1sbCzanB0kZ8A==
Date: Sat, 31 Oct 2026 12:26:23 +0000
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From: Ruslan Bay <ruslanbey@proton.me>
Cc: Antti Laakso <antti.laakso@linux.intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Ricardo Ribalda <ribalda@chromium.org>, Andreas Helbech Kleist <andreaskleist@gmail.com>, "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, "tfiga@chromium.org" <tfiga@chromium.org>, "senozhatsky@chromium.org" <senozhatsky@chromium.org>, "claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>, "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>
Subject: [RFC PATCH v2 01/12] media: ipu6: Add IPU4P hardware identification
Message-ID: <gq0RPklnWwh54C8bfSPed_4KhUyWsFte_HBmLeiQM49u4LWoUOGyWTNqEQc9WDnHekSmgDrVtHXOJ12brO7eZdIXH7yUJzjGR1V2axZumGY=@proton.me>
Feedback-ID: 183606634:user:proton
X-Pm-Message-ID: 238196975d8fc8f1b5ceb6c817b70e6227617fad
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

Add IPU_VERSION_4P and IS_IPU4P() to identify IPU4P hardware.
Place IPU4P at BIT(0), shifting the existing version flags up one bit.

Signed-off-by: Ruslan Bay <ruslanbey@proton.me>
---
 drivers/media/pci/intel/ipu6/ipu6.h | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6.h b/drivers/media/pci/intel/=
ipu6/ipu6.h
index 00fb78a1ec1..4db9f3d85d8 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.h
+++ b/drivers/media/pci/intel/ipu6/ipu6.h
@@ -29,14 +29,16 @@ struct ipu6_bus_device;
 #define IPU7P5_FIRMWARE_NAME=09=09"intel/ipu/ipu7ptl_fw.bin"
 #define IPU8_FIRMWARE_NAME=09=09"intel/ipu/ipu8_fw.bin"
=20
-#define IPU_VERSION_6=09=09BIT(0) /* TGL */
-#define IPU_VERSION_6SE=09=09BIT(1) /* JSL */
-#define IPU_VERSION_6EP=09=09BIT(2) /* ADL/RPL */
-#define IPU_VERSION_6EP_MTL=09BIT(3) /* MTL */
-#define IPU_VERSION_7=09=09BIT(4) /* LNL */
-#define IPU_VERSION_7P5=09=09BIT(5) /* PTL */
-#define IPU_VERSION_8=09=09BIT(6) /* NVL */
-
+#define IPU_VERSION_4P=09=09BIT(0) /* ICL */
+#define IPU_VERSION_6=09=09BIT(1) /* TGL */
+#define IPU_VERSION_6SE=09=09BIT(2) /* JSL */
+#define IPU_VERSION_6EP=09=09BIT(3) /* ADL/RPL */
+#define IPU_VERSION_6EP_MTL=09BIT(4) /* MTL */
+#define IPU_VERSION_7=09=09BIT(5) /* LNL */
+#define IPU_VERSION_7P5=09=09BIT(6) /* PTL */
+#define IPU_VERSION_8=09=09BIT(7) /* NVL */
+
+#define IS_IPU4P(isp)=09=09((isp)->hw_ver & IPU_VERSION_4P)
 #define IS_IPU6_TGL(isp)=09((isp)->hw_ver & IPU_VERSION_6)
 #define IS_IPU6SE(isp)=09=09((isp)->hw_ver & IPU_VERSION_6SE)
 #define IS_IPU6EP(isp)=09=09((isp)->hw_ver & IPU_VERSION_6EP)
--=20
2.56.0
