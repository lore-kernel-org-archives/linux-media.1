Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794447893;
	b=hSiUkENUAEx2ZfLEKKbW6RSubr5FMiWWPsbdf35mgboSJzCKA0AJhku+rqT7b+MII6Fl
	 Neho2ojIWENy/H4LJan4p9vy10spNgmB2k+QFb21338sA3JS07iVFBV2cdRttGYjHx6/B
	 FZJUj1Yi2OMe6TqMm2H2l1t0h7ff1FLD7sUAP9BCMLbLfX01kxoMXTRRges2DFr98b4EM
	 rAcp38nfto/dE3yN4BIS/aWzQiHTNjNoAkJq4TAs3yPtSm+jfvgWs2rSsJgBIfe6KhoS+
	 pEr/aw/VY8gG2Jlje5hlfbM5JCBEHrhhnbeWsQB+GWsD66LFQ+CdHMf96yQ/eDZqqRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794447893;
	h=DMARC-Filter:DKIM-Signature:Received:From:Subject:Date:Message-ID:
	 In-Reply-To:References:To:Cc:Content-Type:Content-Transfer-Encoding:
	 MIME-Version:X-Debian-User;
	bh=xwNnK2LWoXJDwo6LhXEG3qjbIAa1l7hUKLSn5yhHD6g=;
	b=rsXeRTxCo0dD2JXLs+YkZl57jwgkMTOL4d1/nMOq6h5M85M7PtmFv3fiexfzEPqSyOds
	 fyoFtyAmJPjXiqy2RpzzUtv7ZpUSmfvOVzBPyaB8K07HwFKAPSyq5bmhgp2AE2PdBLf7i
	 eFzeb9GPbU5OqsVOUXNQ+kbI9Bokn9sj6GSiU8V9phOdab/8mcDJR2OtHFc00apyfsEyj
	 0dCScTAJ33QEDmVH/UsZgCiys/qsuI888iuMem+veucvDRVDW+zpmSfBuVEFfQaAhn4W9
	 tOsKBeDixw+TsxSIPTZHG1tIKtu8HxZBgQOuWAXy8Zehu3m4VhxMLIaAgsGiWBA4yGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=ucTn74JG;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8DB606A31C
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 01:44:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C8DB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=ucTn74JG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:MIME-Version:Content-Transfer-Encoding
	:Content-Type:Cc:To:References:In-Reply-To:Message-ID:Date:Subject:From:
	Reply-To:Content-ID:Content-Description;
	bh=xwNnK2LWoXJDwo6LhXEG3qjbIAa1l7hUKLSn5yhHD6g=; b=ucTn74JGbC9MtX5Sip25Y3LBKb
	g1gLtmmryx219HzCA5j39HEG1Bsw+nGzwiP1QlonFIw3Pis5/r/NGP8hA3DpcuTZT/owF7ulraof2
	0r4nPt2vz3B08iLuiZfjh9g8uaBjSh794nwr8xC0Toz8tV7KnMPZHt+rmoKQDkQx7hE9eyaerQzKU
	yR8EaFJLHOil1CHtjI1wzkCozGmF9fn8GlZQBRyz7WBdMyOeJcLbUc5VhHZ6og81c2GPPXvt/xQYB
	x9wwFEBlHaRFCL9gbucuGrK2YNgJ0vpVvww5CVrdmudzrHNwhrSR0WH6Id/D1ZvMPOwpbK4OcwOk8
	sKHL0RAQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <emfox@debian.org>)
	id 1xRJrr-00DcBC-0D;
	Thu, 12 Nov 2026 01:44:47 +0000
From: Emfox Zhou <emfox@debian.org>
Subject:
 [PATCH v2] media: ipu-bridge: Mark the Surface Pro 8 sensors as upside down
Date: Thu, 12 Nov 2026 09:44:43 +0800
Message-ID: <179444788333.52615.13387476304977602101@debian.org>
In-Reply-To: <179441296841.24445.13457212017391431902@debian.org>
References: <179441296841.24445.13457212017391431902@debian.org>
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

Both camera sensors of the Surface Pro 8 are mounted upside down, but the
machine does not report that: neither the SSDB nor the _PLD carries a
rotation, so both are advertised with a rotation of 0 and every
application receives an image rotated by 180 degrees.

The front sensor has the ACPI HID INT33BE, not OVTI5693 as on the Surface
Pro 9, and the rear one is OVTID858. Add one entry for each, the same way
the two Surface Pro 9 sensors are already handled.

On the machine both read-only camera_sensor_rotation controls now report
180, and libcamera turns the reported rotation into a transform for the
default image orientation, so captures that used to come out rotated by
180 degrees are now upright. Checked with a 2592x1944 capture from the
front sensor and a 1056x784 one from the rear.

v2: cover the rear sensor too. v1 only added the front one, which was the
    only sensor that could stream at the time.

Signed-off-by: Emfox Zhou <emfox@debian.org>
---
 drivers/media/pci/intel/ipu-bridge.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 78ff2560a..220f450e9 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -280,6 +280,22 @@ static const struct dmi_system_id upside_down_sensor_dmi_ids[] = {
 		},
 		.driver_data = "OVTID858",
 	},
+	{
+		/* Microsoft Surface Pro 8, front sensor */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Microsoft Corporation"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Surface Pro 8"),
+		},
+		.driver_data = "INT33BE",
+	},
+	{
+		/* Microsoft Surface Pro 8, rear sensor */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Microsoft Corporation"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Surface Pro 8"),
+		},
+		.driver_data = "OVTID858",
+	},
 	{} /* Terminating entry */
 };
 
