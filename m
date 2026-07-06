Received: from imap.inspect.it (unknown [217.61.62.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652C13E8C44;
	Mon,  6 Jul 2026 08:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.61.62.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783325273; cv=none; b=JFM+1u2NVdgTTHtmv+++MNK+XiR8wnW8CBwd+8/BYjgqcsfbAgNI8Rm9DWWpSAJTdETz+JcXSK96ABDMLiI94a1XT9/x/SKvSNYi/amqCmahR3tj2+67Pg9aDZtX1MdZmkNssS5ZS+A3khtjt2U1Qcd3fw5WARY2LAzLIgJZ0iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783325273; c=relaxed/simple;
	bh=NnROPNoisibJ6JlFSMFWkhqPL9qpz+TJuiToSOYg4Vc=;
	h=From:To:Cc:Subject:Date:Message-ID:Mime-Version; b=BHoShlP/027yr+PN7HH74v1azdSVs9O9HpVDcRskosi35dXQ0zVbF8aL+zgbXNogKsi4i/VwYKRb1tNFWDmKuURnmgpV4hbyCnhiWeo4BsMaxPQow0u50NdQk1GOYZtuMH4CILhB85ZbbZClLHx/O/T68u8wl8N6YZeMhDm9BjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspect.it; spf=pass smtp.mailfrom=inspect.it; dkim=pass (2048-bit key) header.d=inspect.it header.i=@inspect.it header.b=PRo/MQbK; arc=none smtp.client-ip=217.61.62.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspect.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inspect.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inspect.it header.i=@inspect.it header.b="PRo/MQbK"
From: Samuele Angioli <samuele.angioli@inspect.it>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=inspect.it; s=mail;
	t=1783324837; bh=NnROPNoisibJ6JlFSMFWkhqPL9qpz+TJuiToSOYg4Vc=;
	h=From:To:Cc:Subject;
	b=PRo/MQbKWA1HlFICS4/zD5sFzY8QKhyMxFNu2aETR99xdSSTnPocm/YbNrldjpi7P
	 lJy7Fwr5Tk83238mI0tCge3+aKlZPCAMiag97txziY/bWoNr2vFms0VdnKej19ROXR
	 KcrVx4fVfLjw/udp/qK9rYGyhu2R0g5cCCq/hddJ/xt//HPAoI4V2gaU55hlMMjUJP
	 +L2ioGF0v56rFF52D2jlVsfCBtRCxkY6soYRlcBLihEwKG3HmgULVHuFU639XTJ4KF
	 /95jDU8VIB4sgHXYPSDIsEtflc5vq8U04zIdugve29dC5z6ltnhYoBDu4aI0uUufR0
	 EMNjhZK5ox3BQ==
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Samuele Angioli <samuele.angioli@inspect.it>
Subject: [PATCH] media: ipu-bridge: Add DMI quirk for Dell 16 Premium DA16250
Date: Mon,  6 Jul 2026 10:00:02 +0200
Message-ID: <20260706080002.16812-1-samuele.angioli@inspect.it>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit

The Dell 16 Premium DA16250 (marketed as XPS 16) has its OV02C10 front
sensor mounted upside down, like the other Dell XPS models already present
in upside_down_sensor_dmi_ids[]. The rotation is reported as 0 in both the
SSDB and the _PLD, so without a DMI quirk the image is presented upside
down.

Add a DMI quirk entry for this model so that a rotation of 180 degrees is
reported for its OVTI02C1 sensor.

Signed-off-by: Samuele Angioli <samuele.angioli@inspect.it>
---
 drivers/media/pci/intel/ipu-bridge.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index fc6608e33..3c38981c3 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -134,6 +134,13 @@ static const struct dmi_system_id upside_down_sensor_dmi_ids[] = {
 		},
 		.driver_data = "OVTI02C1",
 	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "XPS 16 (Dell 16 Premium) DA16250"),
+		},
+		.driver_data = "OVTI02C1",
+	},
 	{} /* Terminating entry */
 };
 
-- 
2.54.0

