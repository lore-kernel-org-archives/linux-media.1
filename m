Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792461048;
	b=OevBaySgAqAyl4kVLSPbo/nw8DDTRNgEnjMIAd9l3svMdYydalEC8qs+NUo8p51mkTug
	 nTokO/pnxvRJoWGvaS3HuDhKZEiRbh9YZsCpw89WuMm2DIAL7St6Z8z0ivi9saPWhn8Yh
	 KMZaMaOJziAVOX7c7nMUGUfKNZnuBsW7bjnK92SNoxvNBpi2Eu9Pl4kdCeeSj5e8UgsuS
	 fkKLgHsoiMCZw+cTGqDBS5J6udUqfbcYtxMGXR5vRv56BlEU45JhCwNBAoTLK8en3KtJO
	 fiKhwmNS8AXrB8vZQOGMLXZT+XI2GmBo9KCADsNHMSxNyfSfLJFJeFmRF03Grg8VNvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792461048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3lfY+o1OBadHsWe3VMCpcuef7XGMN+U6VqfmlmEcxRs=;
	b=LAo+bWl/KYhLcG8tfDvW/gyS+ajy8KV5BOCMAK0jiTM68m/oFOjfCn80y1WlVpz5Owtm
	 9nSED6egu7q8neCZ66B6uBWZ4Yfd3xPHbIR1dJoJdLBWZ+InvxFTnYyxbH7LQFlQHcema
	 XaN60qSlkX0QhJY5qIcSfPjJk365tLdb4e+68OyO4NgS8IdsCtiY+/Db2/Ar5ulguSBa+
	 GaLEoGEUmUdEx6bLNT+PL9Y+sQndvW4omCrqoIcVEk9AM+hTVuk39HZaibe1CJ62imDnS
	 7ScXVmPyrH6601p0pAPFLHqIgzTO9OcmsTJAyyAkLVmUR2SyW8jvfEbcgoRUWwbH7Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RyWKyHV2;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F93606A31C
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 01:50:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32F93606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RyWKyHV2
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-18cdcfc05ffso1341429c88.1
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 18:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792461047; x=1793065847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3lfY+o1OBadHsWe3VMCpcuef7XGMN+U6VqfmlmEcxRs=;
        b=RyWKyHV2ZBys68j125r1pIPPZm8v+gibOch5r6fu+UbvdXQYkC8CYLvuHkYBno5B6U
         2YdecQnuE/jFjG5Naz2okf7WMrCOSv2fNYnKg3QHndDBjGfmrR859Xq6VY7dCjD89Pak
         dlww8du4nc3nRc7EcfS0vOrqHGL+MXikrQtfRR4Y6noB4WtduFvXAWt4LwHcRrP7RrPt
         2TGV+aPQeEyPHgOZaMuqhmtrNbV0hZ57lsA1SKsIVMJRMukPrci/kt664C3sJhx6rLkU
         afhLLzHVxq/7F0T9y4ia7asDV2cqKr9TNXGt5fPAatEkcvcUg8EaakZSZvY58rkSL8Ko
         dctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792461047; x=1793065847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3lfY+o1OBadHsWe3VMCpcuef7XGMN+U6VqfmlmEcxRs=;
        b=IFKTjw3YxDoMUTpA3xJ20+ODvGmRuOta6VoT61pxfF8t/m3UpPrJY0hiwNgdJoiVeJ
         gTZ36lR5i4ODAvf4kyIDAzUrYs0XoIIuLfsoUm3ikSnv8o3nqij3aWSXVFRJlztQng/v
         cnwwMYH9puM0qVCrzi4mwJXPgmmS6ZBDY/w+gz8LYBfqFRUcOdaobC7ovXiUZMXQefB5
         1JlX6d78mIYQ5SJ+IzvD4ChV28p7m4MpTmPJVsQ7apCJ8QHI0+mvAMAI1AvMbraZUPOL
         aEFTrrv8aTXMqXJf88YGRgepr1aWW5WeZ8KCiJ7zz1VsWObOrxkfES1Kp9aIxVp+qHg4
         I+SA==
X-Forwarded-Encrypted: i=1; AKwUvBxynuEsY3PwitGRuU2U02h1kcGrr6Z8o1dC1O6TXRcahLeACGkyQljtRhgcM4adogBb74L/uak7tms1TA==@vger.kernel.org
X-Gm-Message-State: AFq9FYI4Yhsh9vYrWlJMWSp3pPkwcXvmp3e07D2AUdcDs38BMJRzdNSO
	1o0nAifhQmXEjTyMgc8labyl1hNHb/dS+eWJjlr0+RT4J2/hCVNABSiXAKkGPeEG
X-Gm-Gg: AYBFou3TUkJDmqHW68rR/Q8OG0g2GsVcaRiTNXOqxc7cZz390Qyg3l/LyPqwDmwgb8x
	wAaAdD1Q0SB7lJ7HyLrHPJyGQR4BynEaCiiE/FR2oliod6zTuq7HX31Umo+nBQovj4iycg9RRQn
	PiH1RcXZmH8a3FhBegP8Q/GJ/EwblHgwbGQ8erM8a0rKy7ae6mIDQ/3AOqW0dbdUnrP5Cky00BF
	iCu5C4YNB8M+fRPPu8an60XMoA+zLTHO7k8/wVbKo53Ta8AqNIlXIfik6hCasnnp8STDtbPjRm9
	VVTCGjlnbbCv3Rl+27ofWuKZ2iUMM4wnp8NPIrhPGo2ps5U+iE1Dkh4ERoEGfqcllndBdt7KsVf
	a0KTPsEJMhQ/9U8Q5KsL6e8KAy4MRts3rTpnSdBTCJyDVVF4vpzbabUvap5GKYdyZP4lE+jJijJ
	707jHrm8Dwp7Ac1zXoFszO07CRMsQR5z4cmzg22aAuryBMBu7/hiifTCybGCe8IfPoO0aHI8dlP
	toicL/qRlLSfMK0F48rWUdvcIuK63bFMS6+60qi3pFnqrIr39Z3hB0d
X-Received: by 2002:a05:701b:454b:20b0:144:f096:4dda with SMTP id a92af1059eb24-1851434bc5cmr12888966c88.43.1792461047064;
        Mon, 19 Oct 2026 18:50:47 -0700 (PDT)
Received: from duo.lan ([2001:fd8:f0db:3ee7:799b:69c2:e95b:f04e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831919fdfesm32684879c88.7.2026.10.19.18.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:50:44 -0700 (PDT)
From: Alexander Patrakov <patrakov@gmail.com>
To: johannes.goede@oss.qualcomm.com
Cc: adee.sahan@gmail.com,
	andy@kernel.org,
	antti.laakso@linux.intel.com,
	dan.scally@ideasonboard.com,
	diamondback@cohunt.app,
	ilpo.jarvinen@linux.intel.com,
	linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	Alexander Patrakov <patrakov@gmail.com>
Subject: [PATCH 1/3] media: ipu-bridge: Add sensor configuration for OV5675 (OVTI5678)
Date: Tue, 20 Oct 2026 09:49:59 +0800
Message-ID: <20261020015001.15672-1-patrakov@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <CAN_LGv3QH4oupSv6KzopjHRXO7tWhY4wvBuCHBzNhJoDW4ZL4g@mail.gmail.com>
References: <CAN_LGv3QH4oupSv6KzopjHRXO7tWhY4wvBuCHBzNhJoDW4ZL4g@mail.gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sahan Nissanka <adee.sahan@gmail.com>

The front camera of the Dell Latitude 7320 Detachable is an OV5675
described in ACPI as OVTI5678. Without an entry here ipu-bridge creates
no software node for it, so no fwnode endpoint exists and the sensor
cannot be connected to the IPU6 even once a driver binds it:

  intel-ipu6 0000:00:05.0: Found supported sensor OVTI8856:00
  intel-ipu6 0000:00:05.0: Connected 1 cameras

450 MHz is OV5675_LINK_FREQ_450MHZ, the only link frequency ov5675.c
supports, and matches the two data lanes the machine's SSDB reports.

With this entry both cameras are found and the front sensor appears in
the media graph:

  intel-ipu6 0000:00:05.0: Found supported sensor OVTI5678:00
  intel-ipu6 0000:00:05.0: Found supported sensor OVTI8856:00
  intel-ipu6 0000:00:05.0: Connected 2 cameras

[Rebased onto next-20261016 and adjusted the comment]

Signed-off-by: Sahan Nissanka <adee.sahan@gmail.com>
Signed-off-by: Alexander Patrakov <patrakov@gmail.com>
Link: https://lore.kernel.org/linux-media/20260809042540.15849-4-adee.sahan@gmail.com/
---
 drivers/media/pci/intel/ipu-bridge.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 3739c4a2a8c4..0b6272c4d826 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -111,8 +111,9 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("OVTIDB10", 1, 560000000),
 	/* Omnivision OV2680 */
 	IPU_SENSOR_CONFIG("OVTI2680", 1, 331200000),
-	/* Omnivision OV5675 */
+	/* Omnivision OV5675 and its RGB-IR variant OV5678 */
 	IPU_SENSOR_CONFIG("OVTI5675", 1, 450000000),
+	IPU_SENSOR_CONFIG("OVTI5678", 1, 450000000),
 	/* Omnivision OV5693 */
 	IPU_SENSOR_CONFIG_MATCH_FL("OVTI5693", ipu6_ov5693_ncont_clk,
 				   IPU_BR_FL_CSI2_CLK_NONCONTINUOUS,
-- 
2.56.0

