Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841E24A64CD
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 14:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788361025; cv=none; b=J3i1x4MLHgZIIkuH2dA1/EMqzkkrQteZbsAL9H9mye4mgnV/f6FTGJ8ka6Tawiv0ZIA+mlm9s2/5zMNHlA3PazmpymMDIuhCbRGrWfAczT9KPTH+Zk5uHIfZJSmocBkaeO5/aLM7QAZ1DI/2dKUOA8MMBnrJUGDH1bEPJUqDopc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788361025; c=relaxed/simple;
	bh=YXYiQ6MlkwSY9s0/iRzorG5wwX8F6Ons+fpr1FTHCdA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f6lk3vtk8D7oBm3z/lYRH1/mqPXC89iBqiG4EUewve4cQksy7ZlNiOXZCx5FYUDdH9nACFHrf3kGZDnM6U9+UVTmwL16Ec+KKVpj3mNoADFe2Q6bzZJYY/bIN1EKPqZHbk6EUvJGrNABEURs5rNvy8luECe+jJPcdguzAlYfeXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ng05+O7v; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ng05+O7v"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49b965570d7so9539815e9.0
        for <linux-media@vger.kernel.org>; Wed, 02 Sep 2026 07:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788361019; x=1788965819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZKBfOg4ndfWf72OBMR4MzaBGR2UKb0LfrmxRQ5wr5p4=;
        b=ng05+O7vLEqirf+5pwkWz4sEc77tcKJTALKYq4rwr0kUqEI309d5lpke6vQF4rhdgH
         0edv06cHEY4TtsLK7+UVjCYjDYqTZgAIFl+UaWaMD/BKzavwRNFlyzTteTRbrek+Pu25
         lW/Kqq5SROXhiWH+XgfV3rwuOoc3R/3QxkKNwpmpB0eCtf+eOTheFTUnS60O5T8oLRuM
         pnFpiqYCvF1IC5BppWIpcNdg5c6os3UB3ZCM8HnWgGeuOgpmISzAD/2wM/fkpV7pa2Tc
         OgPhAURYyx0633GZ1OxDEvE2i5mYYYy4rM/TwVuKcsb362ENV+akpuW0UfBL4MN3JKR0
         qKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788361019; x=1788965819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZKBfOg4ndfWf72OBMR4MzaBGR2UKb0LfrmxRQ5wr5p4=;
        b=lOSji/inTBLaNkiwlzEFytmmRdR9pKPqeVeQ3A/ELIXSF3HfZt4wQmUUthZtu258AY
         Q7UdpTBnSLs5DitAcRbUHzvBUH+hNgV8Md8mHNe8dQjpcKP/w/EQR+RxyO4cIjYXODki
         MQfil9fS/TIw2ouNpq8hKVT+MgCPWpAmCehVj2/osKtwE9dnTSp0XSlovyPdR39d1QTX
         5gVpcMKwrXFTjsc8tBvcf8TsweaRlU2gtlcC0qD/bGSRYp75KOXZy05yl9UOC7cTX0GG
         aDdBspYdpeVQKRA6GqDRvmlz3MAkP9bN2w/11Q/IiI857/tqd2Xco3x7bR8pF88uGOAo
         zBBg==
X-Gm-Message-State: AFuF++nv2dm34bjjSf4IhqeKdy0jF7bYdamYINGIlaMfaA9ztk1395PU
	7JqgVro+vbdI6zQ9U5oPiT57gWd/VgtfzXOB2TQqY+3wcKAiE9XNbE8=
X-Gm-Gg: AR+sD10grf6aIoywpLD0ATDnfqnrLIJ+Q54GuaE2Jom3DlgjR9nRitmGGzXjn5VI0iv
	AZSOvAsVJkVFx2Vm07jJsUUl7xWKbQ5TN2U1WrTRgLyUQMwAmd6uiw+hcCoUXbRQN6ZI1zDOVT8
	328nTH1h3oetLcA2f5oRAN1xF406bIgjCE22Vdzys6fz+fTPjT26XfgDAgjNp/WfpokPN3OyGMg
	fyESWpmu/kLhhl5glIJysyuBqppp4JuLGoD732y6H4VMAWQmQLyyB0NBAFweQlOL1llsiJ4Kj9u
	BPjVDM+slux7ScsQrjUx3DPtVxUy4P1rW7ED4PjV3n9TZXl1jC68m6YQPTjo3FEk+9xO2TtYkcO
	U+NpsEZ5M1gsdNwoXbCxVFkCQySHRAs2LdNiF/T32OPhHuIHh+JFoXCvPzpMOwnVbbIbbGyPEgl
	PZO/p5Rzg1fEHsgMtYT2+KzDbh8ILbw7Kp1ym2nY97Pv8J5i2stuIk40yrFntleQsX9SW/gG/oG
	TayjhpbPNjzX1lwXLTCArcc6qv1InVSnXzdywIKfZ5C6voz8Jn3FsI7rOlv4YyuIhBNPgc/
X-Received: by 2002:a05:600c:3494:b0:49b:9202:6f80 with SMTP id 5b1f17b1804b1-49ce57ee273mr106063775e9.6.1788361018773;
        Wed, 02 Sep 2026 07:56:58 -0700 (PDT)
Received: from chateau ([194.65.85.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5927b68sm61084215e9.1.2026.09.02.07.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:56:57 -0700 (PDT)
From: Sergey Zagursky <gvozdoder@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Miguel Vadillo <miguel.vadillo@intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	Sergey Zagursky <gvozdoder@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] media: ipu-bridge: do not use the CVS device lookup for IVSC
Date: Wed,  2 Sep 2026 15:54:39 +0100
Message-ID: <20260902145440.1786297-1-gvozdoder@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit c6b1b34b5090 ("media: pci: intel: Add CVS support for IPU
bridge driver") the internal camera no longer works on laptops where the
sensor sits behind an IVSC, for example a Dell XPS 16 9640 (IPU6,
INTC10CF, ov02c10):

  intel-ipu6 0000:00:05.0: Found supported sensor OVTI02C1:00
  intel-ipu6 0000:00:05.0: Connected 1 cameras
  ivsc_csi intel_vsc-92335fcf-3203-4472-af93-7b4453ac29da: mei-csi probed
      without device fwnode!

No sensor subdevice is registered, the media graph has no sensor entity
and userspace finds no camera at all.

ipu_bridge_get_ivsc_csi_dev() first looks for the platform device named
"intel_vsc" and returns its mei-csi child. That device is created by
mei_vsc, which on this machine only appears once the LJCA USB bridge and
its SPI controller have probed, about a second after the IPU6 probe that
runs the bridge:

  07:59:29.297  platform INTC10CF:00 created (ACPI scan)
  07:59:41      intel-ipu6 probe -> ipu_bridge_init()
  07:59:42.391  platform intel_vsc created (mei_vsc)

The commit above added two fallbacks for CVS which match on the ACPI
companion alone. They are reached for every entry of ivsc_acpi_ids[],
IVSC IDs included. The IVSC ACPI device has two physical nodes:

  INTC10CF:00/physical_node  -> platform/INTC10CF:00  (no driver bound)
  INTC10CF:00/physical_node1 -> platform/intel_vsc    (mei_vsc)

so bus_find_device_by_acpi_dev(&platform_bus_type, adev) returns the bare
platform device. ipu_bridge_instantiate_ivsc() then attaches the IVSC
software node to that device instead of to the mei-csi client, the bridge
reports success, and the probe is never retried. mei_csi later probes
without a fwnode, the CSI-2 link is never described, and the sensor ACPI
device, which has an honoured _DEP on the IVSC device, is never
enumerated.

Before those fallbacks existed the lookup returned NULL here, the bridge
failed with -ENODEV and the probe was retried once the IVSC device had
shown up.

Restrict the two fallbacks to the CVS IDs. CVS binds a driver to the ACPI
device itself, so matching on the companion is unambiguous there.

Fixes: c6b1b34b5090 ("media: pci: intel: Add CVS support for IPU bridge driver")
Link: https://lore.kernel.org/linux-media/20260901194526.6369-1-gvozdoder@gmail.com/
Cc: stable@vger.kernel.org
Assisted-by: Claude Code:claude-opus-5
Signed-off-by: Sergey Zagursky <gvozdoder@gmail.com>
---
Changes since v1:
- Wrap the ACPI ID match in a named helper, ipu_bridge_is_cvs_dev(), so the
  polarity is readable at the call site. acpi_match_device_ids() returns 0
  on a match, which made the v1 condition easy to misread. No functional
  change.

v1: https://lore.kernel.org/linux-media/20260901195036.7648-1-gvozdoder@gmail.com/

The functional testing below was done with v1 on the affected machine (Dell
XPS 16 9640, IPU6 + IVSC + ov02c10) on top of 7.2.2, where
drivers/media/pci/intel/ipu-bridge.c is byte-identical to v7.2. v2 changes
only how the same condition is spelled, so I rebuilt it but did not boot it
again. Without the patch libcamera finds no camera at all; with it:

  $ cam -l
  1: Internal front camera (\_SB_.PC00.LNK1)

  $ cam -c1 --capture=5
  202.794954 (30.05 fps) cam0-stream0 seq: 000003 bytesused: 8386560
  202.828224 (30.06 fps) cam0-stream0 seq: 000004 bytesused: 8386560

The media graph gains the entities that were missing:

  - entity 349: Intel IVSC CSI (2 pads, 2 links, 0 routes)
  - entity 368: ov02c10 21-0036 (1 pad, 1 link, 0 routes)

and the restored retry is visible in dmesg:

  pci 0000:00:05.0: deferred probe pending: intel-ipu6: IPU6 bridge init failed
  intel-ipu6 0000:00:05.0: Found supported sensor OVTI02C1:00
  intel-ipu6 0000:00:05.0: Connected 1 cameras

"mei-csi probed without device fwnode!" is gone, ov02c10 binds to
i2c-OVTI02C1:00, and eight v4l-subdev nodes appear.

This patch is against v7.3-rc1. The version tested on 7.2.2 is the same
change without the INTC10FA entry, which 7.2.x does not have. Building
drivers/media/pci/intel/ipu-bridge.c with W=1 produces no new warnings.

Not covered: v2 itself is only compile-tested (no new warnings with W=1);
I have no CVS hardware, so the CVS path is only reasoned about, not tested;
and I have not booted v7.3-rc1 itself.

This patch was produced with the help of an AI coding assistant; see the
Assisted-by tag above and Documentation/process/generated-content.rst.

 drivers/media/pci/intel/ipu-bridge.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 1bb3a3e98d6b..a29d4bdb8f02 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -232,6 +232,20 @@ static const struct acpi_device_id ivsc_acpi_ids[] = {
 	{ "INTC10FA" }, /* NVL */
 };
 
+/* The subset of ivsc_acpi_ids[] which are CVS, rather than IVSC, devices. */
+static const struct acpi_device_id cvs_acpi_ids[] = {
+	{ "INTC10DE" }, /* LNL */
+	{ "INTC10E0" }, /* ARL */
+	{ "INTC10E1" }, /* PTL */
+	{ "INTC10FA" }, /* NVL */
+	{ }
+};
+
+static bool ipu_bridge_is_cvs_dev(struct acpi_device *adev)
+{
+	return !acpi_match_device_ids(adev, cvs_acpi_ids);
+}
+
 static struct acpi_device *ipu_bridge_get_ivsc_acpi_dev(struct acpi_device *adev)
 {
 	unsigned int i;
@@ -283,6 +297,17 @@ static struct device *ipu_bridge_get_ivsc_csi_dev(struct acpi_device *adev)
 		return csi_dev;
 	}
 
+	/*
+	 * The lookups below match on the ACPI companion alone. That is fine for
+	 * CVS, which binds a driver to that very device, but not for IVSC: there
+	 * the ACPI device also has a driverless platform device, which would be
+	 * returned instead of the mei-csi client. Return NULL for IVSC so that
+	 * the caller fails and the probe is retried once the IVSC device shows
+	 * up.
+	 */
+	if (!ipu_bridge_is_cvs_dev(adev))
+		return NULL;
+
 	/* Try to locate CVS device on the I2C bus */
 	csi_dev = bus_find_device_by_acpi_dev(&i2c_bus_type, adev);
 	if (csi_dev)
-- 
2.55.0

