Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540098;
	b=WDHsa4LxG5E0IDRn2cXNZqfNGVhEyoJxTb3cdWiJ9GkPufgeM06KhLTxfflhRmUFK7a1
	 nMdmd7NfPRxyy0PR1CQSfJnL2QsksOeOy4iVVBxUYAIpRok6IUb6YIGaqnUpySIMjDDl7
	 waG9M6gCEWGuVaaoKxHXlKkb0RvZSpIIf+Q/bj17x8iXd1ciKaJj9xDHcQSj8539nrTxU
	 cuTZxh84zIzcfboaFvKqjmKv3AYU2clri2OFqHUVP0NnYvqPbtpHJUmOPYIDIZxIjfQ8e
	 x4ynZEyo2mnQMuPA2thq8TYZECoq+uhN/T6CCvAFaUKo3xuP3ZtL1d99iNEflyYT+0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540098;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=WbMalliMMc03VHzWLBITU00Ot6YpvYATLzypowQsz/w=;
	b=rBYWKUz3edqPqwH2V2ilJiJq99gydGJqVLz1nbKI95jdMTH2Cfkc6SwsZPltPzsVmMl5
	 IEa7hRd7Jkty0UX2/XSmM6VidyneXjwGAgGTWnMGO21E1NGliHyOp8RCiW/vgEe89pR+i
	 sDMEcdEISk7rvQS1xdeIG5tEA51/4y1PPD63zSU4GyqOiIy7sFrliB1Z1HhttiwAW1VWR
	 mwth+aJH9Rv0YFG3C5M+4SXOPNYpizZ4skcwqak2/12C7lrTZIrp2D4QPG7LDYm3mpVlL
	 h4isUcF1jNPvHUBp9DqkzEvH4f/erJLqswNHeZRzCeSOlYEUdwDxKUUxZqTLKUm4BmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=fsFxGhqF;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 623B9606A6A2;
	Tue, 24 Nov 2026 17:08:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 623B9606A6A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=fsFxGhqF
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 14B8F16F8;
	Tue, 24 Nov 2026 09:08:15 -0800 (PST)
Received: from e126453.arm.com (e126453.arm.com [10.33.8.63])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 39E4A3F763;
	Tue, 24 Nov 2026 09:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795540097; bh=F0Ui/9CIJgHyYbeTgendvQd9UsMu45h3f9tGv/4wGZc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fsFxGhqFuO8EvUwE49p/zHx64iOTXj+v7bB5nxDoMdAEUzRi93K/nn0SKBiOmAgoc
	 mTaXCCAPZdLMJJxXXPsIeVY/yIK8iUnxBoLQqeW2QJzoGUrWnZXctFUTu9eBDMdX8f
	 qma+UNvz9acMraPmuGYkHfZwoTl2/wXu43soaSVU=
From: Anthony McGivern <anthony.mcgivern@arm.com>
Date: Tue, 24 Nov 2026 17:07:33 +0000
Subject: [PATCH 05/24] media: mali-c720: Add hardware identification
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-b4-initial-upstream-candidate-v1-5-0cb9bde1bd30@arm.com>
References: <20261124-b4-initial-upstream-candidate-v1-0-0cb9bde1bd30@arm.com>
In-Reply-To: <20261124-b4-initial-upstream-candidate-v1-0-0cb9bde1bd30@arm.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Anthony McGivern <anthony.mcgivern@arm.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Nayden Kanchev <nayden.kanchev@arm.com>, 
 Konstantin Babin <konstantin.babin@arm.com>, 
 Linus Walleij <linusw@kernel.org>, jacopo.mondi@ideasonboard.com, 
 kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com, 
 dan.scally@ideasonboard.com, Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Anthony McGivern <Anthony.McGivern@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795540078; l=10501;
 i=Anthony.McGivern@arm.com; s=20261124; h=from:subject:message-id;
 bh=MrP09vzI2+KeyeyoX9tQc9xh7vluGDweeyIb00uoKhk=;
 b=9UzIwe+m5H07p4vtQ7UUFBtp853hIzLKIEtWzNe3i2IIVCThEuNNaF9j+ZU6HZgqRHY1Ch/ZX
 268ZO+u/iOoAP1wjixqUWwRnpzZkr/o/DbD7JDJlAAiNW9oa9jlxZL2
X-Developer-Key: i=Anthony.McGivern@arm.com; a=ed25519;
 pk=cvw1HHVRuWpdkn55JpnRyCO2oGBkBWaBXcc2S3CmHTU=

From: Anthony McGivern <Anthony.McGivern@arm.com>

Read the ISP identification registers and match the device against
the currently supported hardware revisions, rejecting unsupported
hardware.

Add register-map selection based on the identified hardware revision.

Signed-off-by: Anthony McGivern <Anthony.McGivern@arm.com>
---
 .../platform/arm/mali-c720/mali-c720-common.h      |   3 +
 .../media/platform/arm/mali-c720/mali-c720-id.c    | 165 +++++++++++++++++++++
 .../media/platform/arm/mali-c720/mali-c720-id.h    |  34 +++++
 .../platform/arm/mali-c720/mali-c720-registers.c   |  27 ++--
 .../platform/arm/mali-c720/mali-c720-registers.h   |   5 +-
 5 files changed, 223 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/arm/mali-c720/mali-c720-common.h b/drivers/media/platform/arm/mali-c720/mali-c720-common.h
index 7cf7380202a4587b844b66b45bfe76f6bac61635..0685bb7e0f5545091a022bf4ed19b3f2b249c2de 100644
--- a/drivers/media/platform/arm/mali-c720/mali-c720-common.h
+++ b/drivers/media/platform/arm/mali-c720/mali-c720-common.h
@@ -13,6 +13,7 @@
 #include <linux/refcount.h>
 #include <linux/spinlock.h>
 
+#include "mali-c720-id.h"
 #include "mali-c720-register-access.h"
 #include "mali-c720-registers.h"
 #include "mali-c720-registers-top.h"
@@ -40,6 +41,8 @@ struct mali_c720 {
 	resource_size_t mmio_size;
 
 	struct mali_c720_registers registers;
+
+	const struct mali_c720_hw_version *hw_version;
 };
 
 #endif /* MALI_C720_COMMON_H */
diff --git a/drivers/media/platform/arm/mali-c720/mali-c720-id.c b/drivers/media/platform/arm/mali-c720/mali-c720-id.c
new file mode 100644
index 0000000000000000000000000000000000000000..5d8dc9319e74a6e8bc96673e317a880f1fcf2b61
--- /dev/null
+++ b/drivers/media/platform/arm/mali-c720/mali-c720-id.c
@@ -0,0 +1,165 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * ARM Mali-C720 ISP Driver - Image signal processor
+ *
+ * Copyright (C) 2026 Arm Ltd
+ */
+
+#include <linux/array_size.h>
+#include <linux/bitfield.h>
+#include <linux/device.h>
+
+#include "mali-c720-common.h"
+
+#define MALI_C720_ID_PART 0x560
+#define MALI_C720_ID_DESIGNER_ARM 0x43b
+#define MALI_C720_ID_PREAMBLE 0xb105000d
+#define MALI_C720_ID_CLASS 0xe
+
+struct mali_c720_id_registers {
+	u32 pid0;
+	u32 pid1;
+	u32 pid2;
+	u32 pid3;
+	u32 pid4;
+	u32 preamble;
+	u32 class;
+};
+
+static const struct mali_c720_hw_version
+mali_c720_supported_hw_versions[MALI_C720_VERSION_ID_MAX] = {
+	[MALI_C720_VERSION_ID_R0_P0] = {
+		.name = "Mali-C720 r0p0",
+		.id = MALI_C720_VERSION_ID_R0_P0,
+		.part = MALI_C720_ID_PART,
+		.revision = 0x0,
+		.revand = 0x0,
+		.cmod = 0x0,
+	},
+	[MALI_C720_VERSION_ID_R0_P1] = {
+		.name = "Mali-C720 r0p1",
+		.id = MALI_C720_VERSION_ID_R0_P1,
+		.part = MALI_C720_ID_PART,
+		.revision = 0x1,
+		.revand = 0x0,
+		.cmod = 0x0,
+	},
+};
+
+static void mali_c720_read_id_registers(struct mali_c720 *mali_c720,
+					struct mali_c720_id_registers *id)
+{
+	const struct mali_c720_id_regs *id_regs = mali_c720->registers.id;
+
+	id->pid0 = mali_c720_read(mali_c720, &id_regs->pid0);
+	id->pid1 = mali_c720_read(mali_c720, &id_regs->pid1);
+	id->pid2 = mali_c720_read(mali_c720, &id_regs->pid2);
+	id->pid3 = mali_c720_read(mali_c720, &id_regs->pid3);
+	id->pid4 = mali_c720_read(mali_c720, &id_regs->pid4);
+
+	/* Assemble the component preamble, keeping the class separate. */
+	id->preamble = mali_c720_read(mali_c720, &id_regs->cid0_prmbl_0);
+	id->preamble |= mali_c720_read(mali_c720, &id_regs->cid1_prmbl_1) << 8;
+	id->preamble |= mali_c720_read(mali_c720, &id_regs->cid2_prmbl_2) << 16;
+	id->preamble |= mali_c720_read(mali_c720, &id_regs->cid3_prmbl_3) << 24;
+	id->class = mali_c720_read(mali_c720, &id_regs->cid1_class);
+}
+
+static u16 mali_c720_id_designer(const struct mali_c720_id_regs *id_regs,
+				 const struct mali_c720_id_registers *id)
+{
+	return (u16)(field_get(mali_c720_reg_mask(&id_regs->pid1_des_0), id->pid1) |
+		     (field_get(mali_c720_reg_mask(&id_regs->pid2_des_1), id->pid2) << 4) |
+		     (field_get(mali_c720_reg_mask(&id_regs->pid4_des_2), id->pid4) << 8));
+}
+
+static u16 mali_c720_id_part(const struct mali_c720_id_regs *id_regs,
+			     const struct mali_c720_id_registers *id)
+{
+	return (u16)(field_get(mali_c720_reg_mask(&id_regs->pid0_part_0), id->pid0) |
+		     (field_get(mali_c720_reg_mask(&id_regs->pid1_part_1), id->pid1) << 8));
+}
+
+static u8 mali_c720_id_revision(const struct mali_c720_id_regs *id_regs,
+				const struct mali_c720_id_registers *id)
+{
+	return (u8)field_get(mali_c720_reg_mask(&id_regs->pid2_revision), id->pid2);
+}
+
+static u8 mali_c720_id_revand(const struct mali_c720_id_regs *id_regs,
+			      const struct mali_c720_id_registers *id)
+{
+	return (u8)field_get(mali_c720_reg_mask(&id_regs->pid3_revand), id->pid3);
+}
+
+static u8 mali_c720_id_cmod(const struct mali_c720_id_regs *id_regs,
+			    const struct mali_c720_id_registers *id)
+{
+	return (u8)field_get(mali_c720_reg_mask(&id_regs->pid3_cmod), id->pid3);
+}
+
+static const struct mali_c720_hw_version *
+mali_c720_find_hw_version(const struct mali_c720_id_regs *id_regs,
+			  const struct mali_c720_id_registers *id)
+{
+	u16 part = mali_c720_id_part(id_regs, id);
+	u8 revision = mali_c720_id_revision(id_regs, id);
+	u8 revand = mali_c720_id_revand(id_regs, id);
+	u8 cmod = mali_c720_id_cmod(id_regs, id);
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(mali_c720_supported_hw_versions); i++) {
+		const struct mali_c720_hw_version *version =
+			&mali_c720_supported_hw_versions[i];
+
+		if (version->part == part &&
+		    version->revision == revision &&
+		    version->revand == revand &&
+		    version->cmod == cmod)
+			return version;
+	}
+
+	return NULL;
+}
+
+int mali_c720_identify_hw(struct mali_c720 *mali_c720)
+{
+	const struct mali_c720_id_regs *id_regs = mali_c720->registers.id;
+	struct mali_c720_id_registers id;
+	const struct mali_c720_hw_version *version;
+	u16 part, designer;
+	u8 revision, revand, cmod;
+
+	mali_c720_read_id_registers(mali_c720, &id);
+
+	designer = mali_c720_id_designer(id_regs, &id);
+	if (designer != MALI_C720_ID_DESIGNER_ARM)
+		return dev_err_probe(mali_c720->dev, -ENODEV,
+				     "unsupported ISP designer ID: %#x\n", designer);
+
+	if (id.preamble != MALI_C720_ID_PREAMBLE)
+		return dev_err_probe(mali_c720->dev, -ENODEV,
+				     "unsupported ISP component preamble: %#x\n", id.preamble);
+
+	if (id.class != MALI_C720_ID_CLASS)
+		return dev_err_probe(mali_c720->dev, -ENODEV,
+				     "unsupported ISP component class: %#x\n", id.class);
+
+	version = mali_c720_find_hw_version(id_regs, &id);
+	if (!version) {
+		part = mali_c720_id_part(id_regs, &id);
+		revision = mali_c720_id_revision(id_regs, &id);
+		revand = mali_c720_id_revand(id_regs, &id);
+		cmod = mali_c720_id_cmod(id_regs, &id);
+
+		return dev_err_probe(mali_c720->dev, -ENODEV,
+				     "unsupported ISP version: part=%#x revision=%u revand=%u cmod=%u\n",
+				     part, revision, revand, cmod);
+	}
+
+	mali_c720->hw_version = version;
+
+	dev_info(mali_c720->dev, "detected %s\n", version->name);
+
+	return 0;
+}
diff --git a/drivers/media/platform/arm/mali-c720/mali-c720-id.h b/drivers/media/platform/arm/mali-c720/mali-c720-id.h
new file mode 100644
index 0000000000000000000000000000000000000000..2253672a9a46ee65045a1a0c3bc08662b5309b02
--- /dev/null
+++ b/drivers/media/platform/arm/mali-c720/mali-c720-id.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * ARM Mali-C720 ISP Driver - Hardware identification
+ *
+ * Copyright (C) 2026 Arm Ltd
+ */
+
+#ifndef MALI_C720_ID_H
+#define MALI_C720_ID_H
+
+#include <linux/types.h>
+
+#define MALI_C720_ID_SIZE 0x1000
+
+struct mali_c720;
+
+enum mali_c720_version_id {
+	MALI_C720_VERSION_ID_R0_P0,
+	MALI_C720_VERSION_ID_R0_P1,
+	MALI_C720_VERSION_ID_MAX,
+};
+
+struct mali_c720_hw_version {
+	const char *name;
+	enum mali_c720_version_id id;
+	u16 part;
+	u8 revision;
+	u8 revand;
+	u8 cmod;
+};
+
+int mali_c720_identify_hw(struct mali_c720 *mali_c720);
+
+#endif /* MALI_C720_ID_H */
diff --git a/drivers/media/platform/arm/mali-c720/mali-c720-registers.c b/drivers/media/platform/arm/mali-c720/mali-c720-registers.c
index d6a731e9c1fa6e9b1579fd53a14c2eb45894f070..1c2d0ad7948d41ebc7d9666effb881f72ce0ed43 100644
--- a/drivers/media/platform/arm/mali-c720/mali-c720-registers.c
+++ b/drivers/media/platform/arm/mali-c720/mali-c720-registers.c
@@ -36,15 +36,22 @@ const struct mali_c720_id_regs *mali_c720_get_id_regs(void)
 	return &id_regs;
 }
 
-int mali_c720_get_registers(struct mali_c720_registers *regs)
+int mali_c720_get_registers(enum mali_c720_version_id version,
+			    struct mali_c720_registers *regs)
 {
-	*regs = (struct mali_c720_registers) {
-		.id = &id_regs,
-		.top = mali_c720_get_top_regs(),
-		.cm = mali_c720_get_ctx_mgr_regs(),
-		.modules = mali_c720_get_modules_regs(),
-		.context_offset = 0x80000,
-		.context_size = 0x100000,
-	};
-	return 0;
+	switch (version) {
+	case MALI_C720_VERSION_ID_R0_P0:
+	case MALI_C720_VERSION_ID_R0_P1:
+		*regs = (struct mali_c720_registers) {
+			.id = &id_regs,
+			.top = mali_c720_get_top_regs(),
+			.cm = mali_c720_get_ctx_mgr_regs(),
+			.modules = mali_c720_get_modules_regs(),
+			.context_offset = 0x80000,
+			.context_size = 0x100000,
+		};
+		return 0;
+	default:
+		return -ENODEV;
+	}
 }
diff --git a/drivers/media/platform/arm/mali-c720/mali-c720-registers.h b/drivers/media/platform/arm/mali-c720/mali-c720-registers.h
index 288bd168be41c8569f79ff147c919c7daceaa039..c1697d19b22907a24396b6f295287919c528c72b 100644
--- a/drivers/media/platform/arm/mali-c720/mali-c720-registers.h
+++ b/drivers/media/platform/arm/mali-c720/mali-c720-registers.h
@@ -10,6 +10,8 @@
 
 #include <linux/types.h>
 
+enum mali_c720_version_id;
+
 struct mali_c720_top_regs;
 struct mali_c720_ctx_mgr_regs;
 struct mali_c720_modules_regs;
@@ -56,7 +58,8 @@ struct mali_c720_registers {
 };
 
 const struct mali_c720_id_regs *mali_c720_get_id_regs(void);
-int mali_c720_get_registers(struct mali_c720_registers *regs);
+int mali_c720_get_registers(enum mali_c720_version_id version,
+			    struct mali_c720_registers *regs);
 
 static inline u32 mali_c720_reg_addr(u32 base, const struct mali_c720_reg_field *field)
 {

-- 
2.55.0

