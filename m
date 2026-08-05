Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E0339B49D
	for <linux-media@vger.kernel.org>; Wed,  5 Aug 2026 02:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785895954; cv=none; b=jn9aD9dIzdi1uVRGhFSfgOjYizjcC1j0LddbRcTU9YGYxqjip3oI/T94Bt8L+oG2xbtK2CA9EIh9CBmsobBW8rSiX/XD8qhN3Z4vhJ0AfAvRM91KrGgFRqU1LoOVmakEbHRVKWHYi5/C0ifLqswNf6LKBV5fAe3VK1p8mmNYABU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785895954; c=relaxed/simple;
	bh=bV+EqZW+GoCNdEHIZoSiYSJvYwaAbPTtbPlSNSZlrIA=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=tjFlQlzukQhCqxh4aIPrg7D6hHSlUKS7RWosgdILENPXYi5hSYZdoa4kOoPxkUA2cVIdSGmBiArXq3iJreQBz3uSbkySd26lqxKNpz9hTebZdH7XVbGXQVuucFVVCFjwawgANPoKPnIW8Adb4Mo9z7v4mib2aXB2CKDWDgdToLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=QOfsRAz2; arc=none smtp.client-ip=79.135.106.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="QOfsRAz2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1785895942; x=1786155142;
	bh=bV+EqZW+GoCNdEHIZoSiYSJvYwaAbPTtbPlSNSZlrIA=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=QOfsRAz2u2luyVZC/8DeX8BJ+xYzFRjnQ6XSMOKqVUuYMBfBBtolAJGr29WDbcgeC
	 Q/GrCQRA/ONYFDsd6Z+aG6g5exnS0eqP8qDQYnzGKalKVKFuoLtLaK9i/Whg5Z03jb
	 G6hWlQAesxEl3em4qxP4zhYAkj1EfSTuOcZrvuiIsY+vClW/BHgAI8SrX3hJUZKr+t
	 yA4K375h72U58BQ6djD105vFTU4fRZHIKQXdcAgI3jW0XBil0Zwzc7/xm4/WSAPeTq
	 MiylVlkRrAK7/zdLs4NZDxa1rH32QXllw5ysJDNnXfOEwwkS0YG42jKWUPaClH6B7w
	 zWKQQQTMWsdig==
Date: Wed, 05 Aug 2026 02:12:15 +0000
To: linux-media@vger.kernel.org
From: Steve Kaznak <skaznak@protonmail.com>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com, johannes.goede@oss.qualcomm.com, hverkuil+cisco@kernel.org, mehdi.djait@linux.intel.com, linux-kernel@vger.kernel.org
Subject: [PATCH] media: ipu-bridge: Add OV01A1B sensor config
Message-ID: <20260805021154.51404-1-skaznak@protonmail.com>
Feedback-ID: 24244511:user:proton
X-Pm-Message-ID: f28fa633a5aaffc4ac15c48ec94facd3b8d5182f
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add the Omnivision OV01A1B (ACPI HID OVTI01AB) to the
ipu_supported_sensors[] table, with the same single 400 MHz link
frequency as the OV01A10 and OV01A1S entries it shares a comment with.

The sensor is the IR camera in the Dell XPS 13 Plus 9320, behind an
Intel Vision Sensing Controller (IVSC). Commit 36eab90d3f4f ("media:
i2c: ov01a10: Add ov01a1b support") added driver support for it, but
without a bridge entry no fwnode graph endpoint is created, so the
driver never binds and the camera is not enumerated.

Tested on an XPS 13 Plus 9320: the sensor binds and streams 1296x816
Y10 at 30 fps.

Signed-off-by: Steve Kaznak <skaznak@protonmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel=
/ipu-bridge.c
index 88581a4c081d..7a1e3cb30721 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -73,9 +73,10 @@ static const struct ipu_sensor_config ipu_supported_sens=
ors[] =3D {
 =09IPU_SENSOR_CONFIG("INT3537", 1, 437000000),
 =09/* Lontium lt6911uxe */
 =09IPU_SENSOR_CONFIG("INTC10C5", 0),
-=09/* Omnivision OV01A10 / OV01A1S */
+=09/* Omnivision OV01A10 / OV01A1S / OV01A1B */
 =09IPU_SENSOR_CONFIG("OVTI01A0", 1, 400000000),
 =09IPU_SENSOR_CONFIG("OVTI01AS", 1, 400000000),
+=09IPU_SENSOR_CONFIG("OVTI01AB", 1, 400000000),
 =09/* Omnivision OV02C10 */
 =09IPU_SENSOR_CONFIG("OVTI02C1", 1, 400000000),
 =09/* Omnivision OV02E10 */
--=20
2.55.0


