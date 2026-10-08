Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5EA49EC51
	for <linux-media@vger.kernel.org>; Thu,  8 Oct 2026 13:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791465985; cv=none; b=XT+h6NuknnDwOmNnA0d9IjpUkW9cL728vp21HZdiOi6qYSvtzFuJmplrf+mvZwBkPKmiyVGf+PgQ1s6v+r/70sT6fj9pCHUnGUSwGiLaQZARAMEhScx5AD6WlZu4O9noxDAu8rzUfAvN4GEVEtcKJNET8ZltH5QL+oDCRaA5aaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791465985; c=relaxed/simple;
	bh=M50aiJk0QfdvMMf8LSSb90HYjrMJ3YfpRD2bD0vCoSg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=epvi7opOq9NgkBummSrawmf3sE8JWCxqGp8IhN0+EvUEQlRbGUv3+ojkyViW0Vs3v/IKI05qM3xda/cOlGvyps8gEp8ocMLGHICS2uqiqZlNo2kAe/WykARzdLNsk5CNWcbCSzW691HDIq/aDOWiTf+sKH4nxTLSqjA2jOsLQvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OJ3HvUnG; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OJ3HvUnG"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48b0d19cf7eso539922f8f.1
        for <linux-media@vger.kernel.org>; Thu, 08 Oct 2026 06:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791465978; x=1792070778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uX2BH9Ac6b/pc7lUEnn9DTAZujzDmdQq+cw8SL6Z+zY=;
        b=OJ3HvUnGF8exdbXlZxeXF//7p/EHnhUjMfoZQJJ6/19myMDgllj6VCtTzYYjEjYc6l
         kTYXvUOon0xaGdkWIQkdx7EF3JB3kyJSRc1mzLPsyyLL8nzuAnng6vaUIV20uWj4ey8b
         JJPlZhqQvDW/33LPg0wry555eNmcqFOuhCVrRhBPYmkVfgPeFDAk0L6jqa4dOfapM2Up
         Q6MgEHjGPmIHD4aEwCgKy4Cvxb+NaHHg9lvaAZ6i5N/uF1NZgXyRgSd4HfznKJ2WHpkS
         qAaxfprhcIr3gsrkl50LqFhQBAGnT9UmagW/+UU9bEUSgxWOkAgvdu9Ft0sr3YuOu9cC
         ZD1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791465978; x=1792070778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uX2BH9Ac6b/pc7lUEnn9DTAZujzDmdQq+cw8SL6Z+zY=;
        b=Rhxd6pj9JM8oMjQtqj72dJ1aFUuik8KkMu76slRYsPjWvdikU7Coi2L1eplYCNZ6ou
         W9LbeNrGwGHx38Y/D3Tl4PXwqEXX0tR62g8w5jnyELWlkAXi8d/KZ4GPf52y6CYOVfc7
         h+YCf2Mf77vxwvpdxxIhfpKcNv0z90/aREuZM1DPgEiwDNW9oamGgGpMhISyb1O5FEUS
         AlWTfBEqEFiZIYtSOg9q/E4G9Ehy95BSLXKu/IqqXzkWuPPEtH8Ucx/JwZSlsVDrt0E1
         jMN2b0/JzMpDFFT5mOS8e4sQUpXXMM8h/CdCzA99SNqdXyxo5Maz5jWtfm/IUjDZtsux
         3FkA==
X-Forwarded-Encrypted: i=1; AKwUvBwAn8pNvtJdLD/rU9xI4AwJXAw+/QHzbQmz7vLaXbMdgboxMDCpIaR1ruIwvjJzvzBnECiFV1d0MqQ47Q==@vger.kernel.org
X-Gm-Message-State: AFuF++nBvzqdxqnL483lWGcMmTrXxsBFrN6BlnkoL75W1Yrv2ofa9yiT
	dK4gZWRXyhs9nO4ejVpmFKH7wOCHGthEbVMDTaQjEJeISliABGvNRxM=
X-Gm-Gg: AYBFou2ncehfnHWUi2t27qA4TQJBJUY6zx1yi+v/7aPTRwnzggOtd1CkGA/KZbvntuw
	1VdoPZJguH8o3nYE+sjEc7TiEn9PfDcRtGF2cPW+IaRjqf8vTo8HcBqm5cE4SBcvVwU4sY8bGmu
	PW07YyX7lcetpo9hoKQH8DLwvZF0+MUZY345n/pRj9tavuX+nABQ3LaT5b1vNOLV9Uo4rZ8Zgdz
	qTu5f+U+eOLsdeXuCsS/T70K4fRYLHeiQyPmBdYY0hiSRlvnX9fOKFB3yp+9b5yzryjBsA8J6L+
	tEG86s7ibCsfAfwyacd2Z3uyPxnGKX0ISnEQ8lvK/kG35Dd919zcImmHwaN1Q6MBKXHYxgZFuuT
	fEPpAWr5l5kSfbT/U0sb9+2zDTNObxchWASJdvLLCsKf9+a0xj3csGL4H/ZIetgmpADa1+a8lQ0
	zZ20I7W3xHQ2RktzNXj3h/NP05lgrIcmvbm+9guZMTxtWE4CsinYsFRboKmGAwpsEB8cqJTEfSC
	+wjB1fBA8KEfigKpnAIQPTjs7fR5ZcB62cIRrVeGTuesX6nGDRc8rIq
X-Received: by 2002:a05:600c:c08a:b0:4a1:7f96:9b42 with SMTP id 5b1f17b1804b1-4a1851c0702mr37752885e9.15.1791465977953;
        Thu, 08 Oct 2026 06:26:17 -0700 (PDT)
Received: from surface.. (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1842a349bsm71479105e9.2.2026.10.08.06.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 06:26:17 -0700 (PDT)
From: "D. Manresa" <dmanresa@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Daniel Scally <dan.scally@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Fernando Rimoli <fernandorimoli11@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] media: ipu-bridge: don't reference the module image from software nodes
Date: Thu,  8 Oct 2026 15:26:13 +0200
Message-ID: <20261008132614.2456716-2-dmanresa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008132614.2456716-1-dmanresa@gmail.com>
References: <20261008132614.2456716-1-dmanresa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The software nodes registered by ipu_bridge_init() are deliberately
never unregistered: sensor drivers and the fwnode graph keep references
to them, so they are left registered when the ipu-bridge module is
unloaded and a later rebind is intended to reuse the already registered
nodes.

For that to work, nothing reachable from the registered nodes may point
into the ipu-bridge module image. Most of the data already lives in the
dedicated, never freed, struct ipu_bridge allocation: the property name
strings in struct ipu_property_names are character arrays copied into
the per-sensor struct, the node name strings are likewise character
arrays inside the struct, and the data-lanes array is a struct
ipu_bridge member precisely so that "it survives if the module is
unloaded along with the rest of the struct". Commit a20c843c9bc4
("media: ipu-bridge: Keep the clock-noncontinuous property name out of
rodata") moved the "clock-noncontinuous" property name there as well.

Two references into the module image remain, though:

1. The values of the "link-frequencies" endpoint property point at
   cfg->link_freqs inside the const ipu_supported_sensors[] table in
   module rodata.

2. The name of the "lens-focus" device property is a string literal in
   module rodata.

Both dangle as soon as the module is unloaded, while the properties
that carry them stay registered and readable. In practice, after
unloading and reloading the IPU modules on a Surface Pro 7+ (IPU6,
ov8865 + ov5693 + ov7251), re-probing sensor drivers read poisoned
link-frequencies from the surviving nodes and fail to probe:

  ov8865: failed to find 360000000 clk rate in endpoint link-frequencies
  ov5693: supported link freq 419200000 not found

where 419200000/360000000 are exactly the values the bridge had
originally published for those sensors, i.e. the properties no longer
return their original contents. Depending on what happens to the freed
module mapping, reading the properties can also fault. Similarly, a VCM
lookup through the "lens-focus" reference can no longer match (or
faults) once the property's name pointer is dangling.

Copy the link frequencies and the "lens-focus" property name into
struct ipu_bridge, next to the data-lanes array kept there for the same
reason, and make the registered properties point at those copies, so
the nodes survive module unload intact. These were the only remaining
references from the registered nodes into the module image (the
sensor->vcm_type pointer into ipu_vcm_types[] is only dereferenced
during ipu_bridge_init() itself and is not reachable from the nodes).

Assisted-by: LLM
Fixes: 803abec64ef9 ("media: ipu3-cio2: Add cio2-bridge to ipu3-cio2 driver")
Fixes: 68b9bcc8a534 ("media: ipu3-cio2: Add support for instantiating i2c-clients for VCMs")
Signed-off-by: D. Manresa <dmanresa@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 14 +++++++++++---
 include/media/ipu-bridge.h           |  9 +++++++++
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 3739c4a..b9779c3 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -623,7 +623,8 @@ static void ipu_bridge_create_fwnode_properties(
 		sensor->vcm_ref[0] =
 			SOFTWARE_NODE_REFERENCE(&sensor->swnodes[SWNODE_VCM]);
 		sensor->dev_properties[3] =
-			PROPERTY_ENTRY_REF_ARRAY("lens-focus", sensor->vcm_ref);
+			PROPERTY_ENTRY_REF_ARRAY(bridge->lens_focus,
+						 sensor->vcm_ref);
 	}
 
 	sensor->ep_properties[IPU_BRIDGE_NEXT_PROPERTY(i, EP_BUS_TYPE)] =
@@ -636,11 +637,17 @@ static void ipu_bridge_create_fwnode_properties(
 		PROPERTY_ENTRY_REF_ARRAY(names->remote_endpoint,
 					 sensor->local_ref);
 
-	if (cfg->nr_link_freqs > 0)
+	if (cfg->nr_link_freqs > 0) {
+		u64 *link_freqs = bridge->link_freqs[sensor - bridge->sensors];
+
+		memcpy(link_freqs, cfg->link_freqs,
+		       cfg->nr_link_freqs * sizeof(*link_freqs));
+
 		sensor->ep_properties[IPU_BRIDGE_NEXT_PROPERTY(i, EP_LINK_FREQUENCIES)] =
 			PROPERTY_ENTRY_U64_ARRAY_LEN(names->link_frequencies,
-						     cfg->link_freqs,
+						     link_freqs,
 						     cfg->nr_link_freqs);
+	}
 
 	if (cfg->flags & IPU_BR_FL_CSI2_CLK_NONCONTINUOUS)
 		sensor->ep_properties[IPU_BRIDGE_NEXT_PROPERTY(i, EP_CLOCK_NONCONTINUOUS)] =
@@ -1112,6 +1119,7 @@ int ipu_bridge_init(struct device *dev,
 
 	strscpy(bridge->ipu_node_name, IPU_HID,
 		sizeof(bridge->ipu_node_name));
+	strscpy(bridge->lens_focus, "lens-focus", sizeof(bridge->lens_focus));
 	bridge->ipu_hid_node.name = bridge->ipu_node_name;
 	bridge->dev = dev;
 	bridge->pci_id = dev_is_pci(dev) ? to_pci_dev(dev)->device : 0;
diff --git a/include/media/ipu-bridge.h b/include/media/ipu-bridge.h
index 3ef94c2..a49f37f 100644
--- a/include/media/ipu-bridge.h
+++ b/include/media/ipu-bridge.h
@@ -203,6 +203,15 @@ struct ipu_bridge {
 	char ipu_node_name[ACPI_ID_LEN];
 	struct software_node ipu_hid_node;
 	u32 data_lanes[4];
+	/*
+	 * The software nodes registered by the bridge are deliberately never
+	 * unregistered (see ipu_bridge_init()), so every string and array
+	 * they reference must live in this never freed struct rather than in
+	 * the module image, so that the nodes stay intact if the module is
+	 * unloaded.
+	 */
+	char lens_focus[sizeof("lens-focus")];
+	u64 link_freqs[IPU_MAX_PORTS][MAX_NUM_LINK_FREQS];
 	unsigned int n_sensors;
 	struct ipu_sensor sensors[IPU_MAX_PORTS];
 };
-- 
2.43.0

