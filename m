Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A68390231
	for <linux-media@vger.kernel.org>; Fri, 28 Aug 2026 16:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787933718; cv=none; b=Uhlz4oHsPg5WapLxXZyezZHOfb5eCquNSPWfySGYXRLIy9jz0d8tQrhNkXYv7+5bkQFkgiYTDBNn0sBvFvUCD159if/7lkZCne55yweZzoi25zCe+moYtPOyx2e1ZqKUA3H4Roe5WtS118QKbq+9x2BK6hoFn2qGcrnmPNbjBDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787933718; c=relaxed/simple;
	bh=s55Ii6QEsvGG1AvHe17eNCXjO9Ihg5gS51wo2byNVTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XvMBryYXWPZ0/DzzzOndOYhISVioCJmfaKEUZaLbli4vNLKXhfXkZNP0+rfogO5iDzdIyu7BaExEMN6ehZMKCFW+8QsiZxtj3I7/2da6EbI+jDHB9+0JXdQ4SifmA3A4sCX/TPBxJzyMESE+Oh5dsWcF85oLKAxyL66lq0or0r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aedxISqV; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aedxISqV"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47fe2d179e2so682294f8f.1
        for <linux-media@vger.kernel.org>; Fri, 28 Aug 2026 09:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787933715; x=1788538515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+2BPxcfXD6mUVU6jhTybUN7wv/xdZ8rSO2UHVcgmlHg=;
        b=aedxISqVpS+pC57LZB7dmiXtGX/IIah4W7huwcelL0msHfNLgoNCXtDYNavgfXVROc
         WdsL+nhgifb2CMafViZ4SUc71ijtj+iY1yXrvXtephnTKpnF+D92Ahm3UujYXtVb3STT
         HUrDMl/JmG2kUCImbscT9j/mBIzngTNlR4xyCpNknAlTX2LviGlIfNHDdiwPy7lwBRZV
         F1Nz1Y7KbTjpbrGXWDeo0eREs2I32FrX8EaugW8KR2GDKua5/YITzCLQacwivgjwqy89
         5GaCVsQYgBfrCKS95jClpQJX4dCCNQnCOHooWZZ5BgA2TlklV6qGXN5Oymt93FvomdGs
         iEBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787933715; x=1788538515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+2BPxcfXD6mUVU6jhTybUN7wv/xdZ8rSO2UHVcgmlHg=;
        b=KOQtJqqSgHtndg0JpdiaebiYe2sVRf05jzNKtX4wl1Qnlqt2alyNcMRAHJMjbm68CK
         avCfhfEQouZhO7JH3tkQVYqOaL8a7zl4UXPaxgsuF6+tw5DU2a+BbC39L05leINhofrq
         wooR2JpszDsN0eDx6RhAw+/HqnF7hLBKreCnpJ5b9CdAjcak9P5LPn3wRJhqDguVkgzp
         Fdq9dQWg5pcVd1Zt9XMxpnOLoELlnUW32Z4AALcpTBQFkqToZ5G2pwGYZgkmxntHi603
         o2Eq2eE9m5p2f/bz7xKz5VA3V9K8TJgSlb0L5Gpl4CyrAYCMNz/k5ITL6anwTxC91epg
         drrw==
X-Gm-Message-State: AFuF++lsezlfUr/aiQknAhC+ML+oxkm/bM1HwKXfRc5DndQS98qJH5Cs
	iftcoBuFueE45PYwyMn4zT8H5RANbSvoxNlD8GwkVlEzKT3wgxRemIZ+ogiJuSu6
X-Gm-Gg: AR+sD11RmBifyJLD/hJGrDvPHhI7zDfUlsl0aWKh4lbvNnyIUqexnqQNzgBvYLF4w/Q
	8MMHG7k3hNN18973583/oPPFf6SxfnanJr8HIWSKujg9uv70UJ8mT4NxloMEZm0O3d0OBMxCJw7
	OGRrmFzMcTnGt2pWxQ/0fzCf7+k6y8P3vBtIPWrL0ML7Vr2MwfmnrF5wBgExIwaFkX/kvqvkhMW
	z/5qcYBocwl271QQINHmGjBxzlVJiJQBvZEbv7KkZok1WC56RrsKRk28iq/Wuh432YpZ7U9NgRZ
	nldY0q1nfPjLhEwbOIZMO/tadfvJBWHvpaUP65pIW5mvFlhEfEhJrgLkhyMuuufDydr7599BvMf
	i3vfScUJu4aRorxG5erNy0TMb5Jcn8CrBkAcKUW5ruHUgW3TxfeycaOmQ11xVfUcYkHDeJxyX+S
	4nc+Jn4rmbkEcZa+O0mXv3EF/5ahn3q/wOlsJEPee8bp1gb2/TENfwZ4XPyabsbDi989QGpU3aD
	J1ZgJa2/ALTX1w6TVZYlMnh06secyuvPltF9llNzw==
X-Received: by 2002:a05:6000:653:b0:482:eadd:174a with SMTP id ffacd0b85a97d-482f79c941cmr12152664f8f.17.1787933714909;
        Fri, 28 Aug 2026 09:15:14 -0700 (PDT)
Received: from 1Z10 ([78.213.5.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3f45sm7629739f8f.7.2026.08.28.09.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 09:15:14 -0700 (PDT)
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
Subject: [PATCH v4 06/15] media: intel: ipu-bridge: Add Yoga Book camera sensors
Date: Fri, 28 Aug 2026 18:14:48 +0200
Message-ID: <9b618d8076337f8129e235313cce90d86f95fc4c.1787933456.git.mauriziocasciano7@gmail.com>
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

The Yoga Book YB1-X91 uses INT3477 for its OV8858 rear sensor and
OVTI2740 for its OV2740 front sensor. Add link frequencies consumed by
the sensor drivers when the IPU bridge constructs software endpoints.

This supplies endpoint data only; it does not establish that either
sensor can stream on the Yoga Book hardware.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: Codex:gpt-5.6-sol sparse
---
 drivers/media/pci/intel/ipu-bridge.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 1bb3a3e98d6b..47317c423fad 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -65,6 +65,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("INT33F0", 1, 384000000),
 	/* Omnivision OV2740 */
 	IPU_SENSOR_CONFIG("INT3474", 1, 180000000),
+	/* Omnivision OV8858 */
+	IPU_SENSOR_CONFIG("INT3477", 1, 360000000),
 	/* Omnivision OV5670 */
 	IPU_SENSOR_CONFIG("INT3479", 1, 422400000),
 	/* Omnivision OV8865 */
@@ -93,6 +95,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("OVTIDB10", 1, 560000000),
 	/* Omnivision OV2680 */
 	IPU_SENSOR_CONFIG("OVTI2680", 1, 331200000),
+	/* Omnivision OV2740 */
+	IPU_SENSOR_CONFIG("OVTI2740", 1, 360000000),
 	/* Omnivision OV5675 */
 	IPU_SENSOR_CONFIG("OVTI5675", 1, 450000000),
 	/* Omnivision OV8856 */
-- 
2.53.0

