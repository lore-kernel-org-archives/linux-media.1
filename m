Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794412983;
	b=aAuM9WYk8T06FGp6SgA4YbvRSGy1luUba8HjvCVzvVKB8oKcV0r44EZHvQBUwSQfcuQp
	 RjAgWgkA5nofu5XKoschnRT716I4qrm1pPAhs1omjq1h1yfZEKDapu33H5TNFcjxOrq4C
	 xOTb+GDwSaGOOMbILhWrHnP6uYdEcDrQCOm0IXws5D3hA2wdTOeioRSBdnuEaCAXRDpqO
	 TRXvIXDT5YMn1IyEFzpyHwAdxSrMzxX600f1zLsZWAdshxZxnWTBoRjnDc3bAVOfLZOAi
	 rX2kWvujkeZGHq6VsBgbtzUe/1YFzKH8xCB6kRkuAQaRU4pPA1sP8E6DaZtrOhUQ0/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412983;
	h=DMARC-Filter:DKIM-Signature:Received:From:Subject:Date:Message-ID:To:
	 Cc:Content-Type:Content-Transfer-Encoding:MIME-Version:X-Debian-User;
	bh=/uDowM3DweP/0mAa/IBszi82QU1liTcoWFYL6xZxGaw=;
	b=5JXDDiC9tCz56cCCbi55hfidP/TD27wQsEsNW6kkF7V0HVvL7Nz9m47hgiXhbxl0WqFl
	 Lb0NFs1ceZFhxaKH68J1DeH1c1QgM1WSX2x9RglhCGivfY1XRbuky/N4974DKrcevNrsP
	 SHDyQBMtKicnwDkUZiRimG9EqP84fx8YUOiv9VfCyHEEciCY2d1GTMEIpEz8/iVmS/P4H
	 /yQ/dcZgd6fUj8lWA2ssKPp7/HC9tlAX2fcrf1KF/P3Kg5m4dgTJYAaj9hs0z35cXoAyC
	 5bSGngkzh94symLiGUxpOdXa/z+HNlmsrNu21D6UBzq3z7DMcFwdmEDK2YfvT1ESXZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=kYlI3SBg;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1A9606A33B
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 16:03:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA1A9606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=kYlI3SBg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:MIME-Version:Content-Transfer-Encoding
	:Content-Type:Cc:To:Message-ID:Date:Subject:From:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=/uDowM3DweP/0mAa/IBszi82QU1liTcoWFYL6xZxGaw=; b=kYlI3SBglgSETzozZEoppqet1s
	MHefkjfu2ekoC+lGU0h5cHH8uR4Wm4Ci7TlgxdCjyjx3cFWFkoi77vbCEvFTr1NpwykwNFpwRShZP
	hiwNmR2Ur5vEF8FNeJQ9S/CX+7dPuo94tpGy13+wa4iIGdvRoOQooFAEeUxwJLreNNyq/jrKGV+Oy
	tCW9XJAEF2jAHgGmofgncW/IgC41vXQUwvuUmfH7c+SA02G6p/C3KA+V6Mmtzcx5OQRjgsqP6EwnA
	5bAtewkzxNRBO4Dhf+c1GKDscpCaLvVhbEQkOYWfmos5I0pslWvgj9+AuP9aRQaKowISCYnXb5Yyj
	65H88o8Q==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <emfox@debian.org>)
	id 1xRAmo-00DIX8-0m;
	Wed, 11 Nov 2026 16:02:58 +0000
From: Emfox Zhou <emfox@debian.org>
Subject:
 [PATCH] media: ipu-bridge: Mark the Surface Pro 8 front sensor as upside down
Date: Thu, 12 Nov 2026 00:02:48 +0800
Message-ID: <179441296841.24445.13457212017391431902@debian.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Dan Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Hans de Goede <hansg@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Debian-User: emfox


The OV5693 front sensor of the Surface Pro 8 is mounted upside down, but
the machine does not report that: neither the SSDB nor the _PLD carries a
rotation, so the sensor is advertised with a rotation of 0 and every
application receives an image rotated by 180 degrees.

The ACPI HID of this sensor is INT33BE, not OVTI5693 as on the Surface
Pro 9, so add an entry matching that one.

On the machine the read-only camera_sensor_rotation control now reports
180, and libcamera turns the reported rotation into a transform for the
default image orientation, so a capture that used to come out rotated by
180 degrees is now upright.

Signed-off-by: Emfox Zhou <emfox@debian.org>
---
 drivers/media/pci/intel/ipu-bridge.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -265,6 +265,14 @@
 		.driver_data = "OVTI02C1",
 	},
 	{
+		/* Microsoft Surface Pro 8, front sensor */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Microsoft Corporation"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Surface Pro 8"),
+		},
+		.driver_data = "INT33BE",
+	},
+	{
 		/* Microsoft Surface Pro 9, front sensor */
 		.matches = {
 			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Microsoft Corporation"),
