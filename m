Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B53A3BB68F
	for <linux-media@vger.kernel.org>; Sat, 10 Oct 2026 15:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791647791; cv=none; b=MxX3rLPPkzRYGDfAhH44cyrEcDlhy9nTmuy+2S00uFLXZeAVjgFRgDPIFc+k3RgouQLv/bg9S8IpSR5Ulg/sQtdgae30MCFzTb1g8B+l6kEsxCs8VAL3FVQr0BBz8wxEk5bYrnjDhrF19tBEeVp13iHIGU9NHBOAAUmHs/Ew6xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791647791; c=relaxed/simple;
	bh=WKnLYgOjHsP4cA0eTco663J9nqhRW+AAiA2GG7Nvls0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eEhpQXBi6/ODnq9K2QFgVYzIKC89XExsO3G9MErwD6x+sSiBOgqOeEEBSY0PzMwFl6Uz+o3KynES2VIAQztsskbmBJ1v+OMJPI1vgUHQ8thpdSI6VpGtwBaC80v0dLfHvjW8ccGinjbbrhzPYRUH6D8RMQIPyy9xNc/2j8vQgxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PBuZEVGj; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PBuZEVGj"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso8038485e9.3
        for <linux-media@vger.kernel.org>; Sat, 10 Oct 2026 08:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791647789; x=1792252589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yWkFAN8xiOdJ/DDEcDTiPY7n4+mNufjxnR1mpIq8leg=;
        b=PBuZEVGjTf8h15GBD3gzCktnrjiB/Fhix2eELwyX8qLxGd6c5Kd3fRpPbMgG+iz2Rk
         fJm/n+lfeqC9Z9J/s6Yq0ofoG89EEsYT8CiXZWqzpkusyiXtnbK68zjsneQUZnCDn6Xy
         FKAGepjXWKQZfyiWGD+kl58wSvVtj3mK5yo4863a7J4CNR8ZkmT2SXSf1nFHbbYMgKIr
         Jm2O1x9q9NxrzWt5EFt/aDY5CFZ5heBI8DsyB704RqBuy/UOoBgBTpkHUJqQJ13RVk41
         nSHwcoNPHHd+9+OzIcY4aSUl2XJbSLhoHdteCFMGXjPJFFPCIvrvTZ8w0gx6V+P4Yi+c
         zGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791647789; x=1792252589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yWkFAN8xiOdJ/DDEcDTiPY7n4+mNufjxnR1mpIq8leg=;
        b=OtK1Y3GxipWxfKSE1ITPF4TYZB4bzQ5DtA82FfBQlgjgqfGBCzzcRVeSgUtXPevtmL
         YtI9g790N954ufFsoEhSnMWBNZYooBQV7t+4LOmzmOnWcaNLIh1UN6Veq/KqoJdHfxHS
         dJgQwCElceeIFUIXlQoYxsv/RVJjCjQeeNwJ83UcJe/S6s7wlvHdKAb/XTsIFEj39hQW
         oOUoLVFRXBJehbdleZ+3NINThgtvNRoex4j3lFJcVfBVBQbBkqe3uTglt/Avk55kW/WR
         sPY1j/G6PYqmjHipj8lZn4dfkFXaeNw/l71lGmxRi8GEfXk9CNcHQjcSix8WGBLOaSQI
         rmWA==
X-Forwarded-Encrypted: i=1; AKwUvBwaD1a+HRlCX/71OoMVn6OgHIGnIg7GYBxAV09qfp5Uj0veOZ1qlRYjJ0XyYPbT6xHAPABNI+DtEenoiw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJuuneUlkG0NEjCIq3un68ewh06JOzSVK1u9F0bV+u2iHDVMOCI
	uEdMsW7jATCxdqXGDB7/mMKIIjJr18IRXTfFjCDsQrwBoRZRy2uGY+I=
X-Gm-Gg: AYBFou1ubURvJ8vKVvhKITgZW8phRoUOacNAw4atEYvH52WLmBZ7yW3DQVX7othAkQQ
	6XZuuuhjPRfiwf22OJF+wpZRxJiQAwl7AvpBeYAVL6yaEV7uePVOr2x+UwplmVGOdkNTDhvXAbF
	mtoN7NR5z7lrln1+PTQbeQiYZw843M6Fr10qxlPlrd1oxP1WOJAS3mM5hOJsjvNUeifb+4bUEgp
	n7fnQQEEaxHJlb+dgeqEq2QfEeHPotz08+03QCvq7fsyPS4Z3EpppJcewhL6Le4rO8P+TjE3xiQ
	oVvNNMwMZtw8L3bsDlPhFNSlErKQsJz0eg18jKZiu8sBEYnmjSFIyaj+g+JZcdCusDP2lcm53SR
	IbzaesVUYXaYhvOjoHLFqHRojuZUFC1AteXBw3zRfAgK28wEBF49rjHilIl1ZnMVOjImpS1YDkr
	sB0ausTYFXgRUu9cm622jCVGKtxeeF8ZjK1JqMd+pQPwULum2ilQeW6yAZ45lAnIlN50/Q8NUq7
	KDgaQNQNdwjy1HO5Icu7huGnXnObOmS4S5FB9plBBDK4imUdm3nKjs=
X-Received: by 2002:a05:600c:4e41:b0:49f:c1a1:5222 with SMTP id 5b1f17b1804b1-4a18e4d80bdmr93705125e9.33.1791647788532;
        Sat, 10 Oct 2026 08:56:28 -0700 (PDT)
Received: from surface.. (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf3e044sm138023065e9.14.2026.10.10.08.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 08:56:28 -0700 (PDT)
From: "D. Manresa" <dmanresa@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Daniel Scally <dan.scally@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Fernando Rimoli <fernandorimoli11@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] media: ipu-bridge: don't reference the module image from software nodes
Date: Sat, 10 Oct 2026 17:56:25 +0200
Message-ID: <20261010155626.2766298-2-dmanresa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261010155626.2766298-1-dmanresa@gmail.com>
References: <20261010155626.2766298-1-dmanresa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The software nodes the bridge registers are deliberately never
unregistered, so that a later rebind can reuse them. Nothing reachable
from them may therefore point into the module image, but two properties
still do: the "link-frequencies" values point at cfg->link_freqs in
ipu_supported_sensors[], and the "lens-focus" property name is a string
literal.

Both dangle once the module is unloaded. Re-probing sensor drivers then
read poisoned link frequencies from the surviving nodes and fail:

  ov5693: supported link freq 419200000 not found

Copy both into struct ipu_sensor, where the other property names and
values already live.

Assisted-by: LLM
Fixes: 803abec64ef9 ("media: ipu3-cio2: Add cio2-bridge to ipu3-cio2 driver")
Fixes: 68b9bcc8a534 ("media: ipu3-cio2: Add support for instantiating i2c-clients for VCMs")
Signed-off-by: D. Manresa <dmanresa@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 12 +++++++++---
 include/media/ipu-bridge.h           |  6 ++++++
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 3739c4a..aea4699 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -290,6 +290,7 @@ static const struct ipu_property_names prop_names = {
 	.remote_endpoint = "remote-endpoint",
 	.link_frequencies = "link-frequencies",
 	.clock_noncontinuous = "clock-noncontinuous",
+	.lens_focus = "lens-focus",
 };
 
 static const char * const ipu_vcm_types[] = {
@@ -623,7 +624,8 @@ static void ipu_bridge_create_fwnode_properties(
 		sensor->vcm_ref[0] =
 			SOFTWARE_NODE_REFERENCE(&sensor->swnodes[SWNODE_VCM]);
 		sensor->dev_properties[3] =
-			PROPERTY_ENTRY_REF_ARRAY("lens-focus", sensor->vcm_ref);
+			PROPERTY_ENTRY_REF_ARRAY(names->lens_focus,
+						 sensor->vcm_ref);
 	}
 
 	sensor->ep_properties[IPU_BRIDGE_NEXT_PROPERTY(i, EP_BUS_TYPE)] =
@@ -636,11 +638,15 @@ static void ipu_bridge_create_fwnode_properties(
 		PROPERTY_ENTRY_REF_ARRAY(names->remote_endpoint,
 					 sensor->local_ref);
 
-	if (cfg->nr_link_freqs > 0)
+	if (cfg->nr_link_freqs > 0) {
+		memcpy(sensor->link_freqs, cfg->link_freqs,
+		       cfg->nr_link_freqs * sizeof(*sensor->link_freqs));
+
 		sensor->ep_properties[IPU_BRIDGE_NEXT_PROPERTY(i, EP_LINK_FREQUENCIES)] =
 			PROPERTY_ENTRY_U64_ARRAY_LEN(names->link_frequencies,
-						     cfg->link_freqs,
+						     sensor->link_freqs,
 						     cfg->nr_link_freqs);
+	}
 
 	if (cfg->flags & IPU_BR_FL_CSI2_CLK_NONCONTINUOUS)
 		sensor->ep_properties[IPU_BRIDGE_NEXT_PROPERTY(i, EP_CLOCK_NONCONTINUOUS)] =
diff --git a/include/media/ipu-bridge.h b/include/media/ipu-bridge.h
index 3ef94c2..7c89fb6 100644
--- a/include/media/ipu-bridge.h
+++ b/include/media/ipu-bridge.h
@@ -136,6 +136,7 @@ struct ipu_property_names {
 	char remote_endpoint[16];
 	char link_frequencies[17];
 	char clock_noncontinuous[20];
+	char lens_focus[11];
 };
 
 struct ipu_node_names {
@@ -178,6 +179,11 @@ struct ipu_sensor {
 	const char *vcm_type;
 
 	struct ipu_property_names prop_names;
+	/*
+	 * The registered software nodes outlive the module, so the property
+	 * values they point at must not live in it.
+	 */
+	u64 link_freqs[MAX_NUM_LINK_FREQS];
 	struct property_entry ep_properties[IPU_BRIDGE_EP_NUM_ENTRIES];
 	struct property_entry dev_properties[5];
 	struct property_entry ipu_properties[3];
-- 
2.43.0

