Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540097;
	b=W7Ayj2A3+7mvTLltv/ghy5STjxn/goF3PIrtXcLko8RjAJsm41uqN3wPE52/DPLmeurV
	 V0Bobql3krwfYAnXzpWXnhQKhRkq0H+IUmqvRzg4k/2+v/VnvrtfOrCcz+nqEi4LvqiX1
	 EH1EHef2kcJQSE5lUNr/pUX8KWTThe9NMCyX87f9cKVsZEU6CVMbAQEveZPPE1wyK9Gow
	 0l/6A1qOHRrwnLTDWUk1iYtgdRFIN6Bru6dGcousQlSsXo9yWuWy4ZT1Wgj3Zq+5UmrfX
	 rZeY5uoFDdurY80pwML7FV2UzzFJ6vvhgmt0iBBS9L8LvUoPPQ2LxS1MEX5CnBHpBwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540097;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=tBla6lpFBRR8eWX35jKqur8ZTpHwKTI4jcYXu805/6I=;
	b=AmX96p2dCoxDTQz+arPcZqF8mY6wXOliODRyLu/SbT3dAMSYnA4Z2Gz2WIJQlqs+x9wn
	 kefKvo891gxkiqB8bqKKXIZtmNO7zwUfSo03hpNuk8U3f38d6LJD1Hu+9Jr7Bsa/ZpONh
	 q9sEKLACnN/LqX00QM8sQ9dQ3WB2v5yqwMwxpl/SEWJmFOqY71zjLNwN4hExdSwVdtOi0
	 W8lH0yuu8bNkNpXvL3A9+TPjhi/PiVBds0jh7G4ikSQirw8SY0hxnogrotF/tVFL3hB1i
	 26LNBZQgi4uAkzDo4Bass+KJYVeOJEQLayRypT8MwPzIDBbFmOmoiLvKHv7GCjNkPUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=JHNsUfQ6;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1164606A329;
	Tue, 24 Nov 2026 17:08:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1164606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=JHNsUfQ6
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 05B2C175A;
	Tue, 24 Nov 2026 09:08:12 -0800 (PST)
Received: from e126453.arm.com (e126453.arm.com [10.33.8.63])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0C9263F763;
	Tue, 24 Nov 2026 09:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795540094; bh=N4hlUqnI2C7CsAfFCk0KGYYrywn9QuIjtiiJWtJniyc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JHNsUfQ6EYI4cKiOea6YfHdMpvN3cTx9hpOV/VE39qka6lJva5my6JJQ7eblwTAcu
	 3F08avu5YOz8LBLHY+xZsmPj5Jt7bPI0VcjUFmUue9IxZOiwNSZOqVGgrzdPEhYfZ9
	 RWfmBZ/CmPx5qQYseSmop26TcdrLf+Eb2JCamrik=
From: Anthony McGivern <anthony.mcgivern@arm.com>
Date: Tue, 24 Nov 2026 17:07:32 +0000
Subject: [PATCH 04/24] media: mali-c720: Add register access helpers
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
Message-Id: <20261124-b4-initial-upstream-candidate-v1-4-0cb9bde1bd30@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795540078; l=72028;
 i=Anthony.McGivern@arm.com; s=20261124; h=from:subject:message-id;
 bh=7C/eVwGg8F3hHEpiY+tJXoToS9XmnbM/3mtzAGwk51U=;
 b=sShPNnpgqMhxD3I+LMMljHREgXjz+JFyW7NFbNobS72Kf5By7on4Wj5O3CwhaJW3B4RcaUgsp
 3e2NtsU6AmwClxY4IviqaqPg53lOb5bzYrcmDNuTlndA7Kw9VD5nvn9
X-Developer-Key: i=Anthony.McGivern@arm.com; a=ed25519;
 pk=cvw1HHVRuWpdkn55JpnRyCO2oGBkBWaBXcc2S3CmHTU=

From: Anthony McGivern <Anthony.McGivern@arm.com>

Add register-field and indexed-group definitions for the ISP registers.
Represent register layouts using structures to accommodate future
hardware revisions.

Provide access helpers for the memory-mapped global registers and the
in-memory context register image used by the ISP's configuration DMA
engine (CDMA).

Signed-off-by: Anthony McGivern <Anthony.McGivern@arm.com>
---
 .../platform/arm/mali-c720/mali-c720-common.h      |  45 ++++
 .../arm/mali-c720/mali-c720-register-access.c      | 205 ++++++++++++++++++
 .../arm/mali-c720/mali-c720-register-access.h      |  55 +++++
 .../arm/mali-c720/mali-c720-registers-ctx-mgr.c    | 226 ++++++++++++++++++++
 .../arm/mali-c720/mali-c720-registers-ctx-mgr.h    | 207 +++++++++++++++++++
 .../arm/mali-c720/mali-c720-registers-modules.c    | 148 +++++++++++++
 .../arm/mali-c720/mali-c720-registers-modules.h    | 136 ++++++++++++
 .../arm/mali-c720/mali-c720-registers-top.c        | 173 ++++++++++++++++
 .../arm/mali-c720/mali-c720-registers-top.h        | 228 +++++++++++++++++++++
 .../platform/arm/mali-c720/mali-c720-registers.c   |  50 +++++
 .../platform/arm/mali-c720/mali-c720-registers.h   |  81 ++++++++
 11 files changed, 1554 insertions(+)

diff --git a/drivers/media/platform/arm/mali-c720/mali-c720-common.h b/drivers/media/platform/arm/mali-c720/mali-c720-common.h
new file mode 100644
index 0000000000000000000000000000000000000000..7cf7380202a4587b844b66b45bfe76f6bac61635
--- /dev/null
+++ b/drivers/media/platform/arm/mali-c720/mali-c720-common.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * ARM Mali-C720 ISP Driver - Image signal processor
+ *
+ * Copyright (C) 2026 Arm Ltd
+ */
+
+#ifndef MALI_C720_COMMON_H
+#define MALI_C720_COMMON_H
+
+#include <linux/io.h>
+#include <linux/mutex.h>
+#include <linux/refcount.h>
+#include <linux/spinlock.h>
+
+#include "mali-c720-register-access.h"
+#include "mali-c720-registers.h"
+#include "mali-c720-registers-top.h"
+#include "mali-c720-registers-ctx-mgr.h"
+#include "mali-c720-registers-modules.h"
+
+struct mali_c720_context_regs {
+	dma_addr_t dma_handle;
+	u8 *base;
+	size_t size;
+
+	/* Serializes allocation, initialization and final release. */
+	struct mutex allocation_lock;
+	refcount_t users;
+};
+
+struct mali_c720_context {
+	struct mali_c720 *mali_c720;
+	struct mali_c720_context_regs regs;
+};
+
+struct mali_c720 {
+	struct device *dev;
+	u8 __iomem *base;
+	resource_size_t mmio_size;
+
+	struct mali_c720_registers registers;
+};
+
+#endif /* MALI_C720_COMMON_H */
diff --git a/drivers/media/platform/arm/mali-c720/mali-c720-register-access.c b/drivers/media/platform/arm/mali-c720/mali-c720-register-access.c
new file mode 100644
index 0000000000000000000000000000000000000000..a7df7761be8cd5371f651fbb1753a60dd5255af3
--- /dev/null
+++ b/drivers/media/platform/arm/mali-c720/mali-c720-register-access.c
@@ -0,0 +1,205 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * ARM Mali-C720 ISP Driver - Image signal processor
+ *
+ * Copyright (C) 2026 Arm Ltd
+ */
+
+#include <linux/align.h>
+
+#include "mali-c720-common.h"
+
+static __le32 *mali_c720_ctx_reg_addr(struct mali_c720_context *ctx,
+				      unsigned int addr)
+{
+	return (__le32 *)(ctx->regs.base + addr);
+}
+
+/*
+ * System IO
+ *
+ * The Mali-C720 has a shared global register space for settings such as
+ * context manager, faults, interrupts, etc. Each context then has a DMA
+ * allocated configuration space for pipeline registers. The ISP has a
+ * configuration DMA (CDMA) engine that will automatically load the context
+ * configuration space upon frame start. In both cases we can write to these
+ * normally, though care should be taken with the context space to ensure any
+ * access does not coincide with a frame start, causing CDMA to read a
+ * partially-applied configuration.
+ */
+
+static int mali_c720_mmio_check_addr(struct mali_c720 *mali_c720, u32 addr)
+{
+	int ret;
+
+	ret = WARN_ON_ONCE(!IS_ALIGNED(addr, sizeof(u32)));
+	if (ret)
+		return ret;
+
+	ret = WARN_ON_ONCE((u64)addr + sizeof(u32) > mali_c720->mmio_size);
+	if (ret)
+		return ret;
+
+	ret = WARN_ON_ONCE(mali_c720->registers.context_offset &&
+			   (u64)addr + sizeof(u32) > mali_c720->registers.context_offset);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+u32 mali_c720_read_raw(struct mali_c720 *mali_c720, u32 addr)
+{
+	if (mali_c720_mmio_check_addr(mali_c720, addr))
+		return 0;
+
+	return readl(mali_c720->base + addr);
+}
+
+static void mali_c720_write_reg_raw(struct mali_c720 *mali_c720, u32 addr, u32 val)
+{
+	if (mali_c720_mmio_check_addr(mali_c720, addr))
+		return;
+
+	writel(val, mali_c720->base + addr);
+}
+
+u32 mali_c720_group_read(struct mali_c720 *mali_c720, u32 base,
+			 const struct mali_c720_reg_field *field)
+{
+	if (WARN_ON_ONCE(field->shift > MALI_C720_REG_MAX_SHIFT))
+		return 0;
+
+	return (mali_c720_read_raw(mali_c720, base + field->offset) & field->mask) >>
+	       field->shift;
+}
+
+void mali_c720_group_write(struct mali_c720 *mali_c720, u32 base,
+			   const struct mali_c720_reg_field *field, u32 val)
+{
+	u32 addr = base + field->offset;
+	u32 reg;
+
+	if (WARN_ON_ONCE(field->shift > MALI_C720_REG_MAX_SHIFT))
+		return;
+	if (mali_c720_mmio_check_addr(mali_c720, addr))
+		return;
+
+	reg = readl(mali_c720->base + addr) & ~field->mask;
+	reg |= (val << field->shift) & field->mask;
+	writel(reg, mali_c720->base + addr);
+}
+
+u32 mali_c720_read(struct mali_c720 *mali_c720, const struct mali_c720_reg_field *field)
+{
+	return mali_c720_group_read(mali_c720, 0, field);
+}
+
+void mali_c720_write(struct mali_c720 *mali_c720, const struct mali_c720_reg_field *field, u32 val)
+{
+	mali_c720_group_write(mali_c720, 0, field, val);
+}
+
+void mali_c720_write_raw(struct mali_c720 *mali_c720, const struct mali_c720_reg_field *field,
+			 u32 val)
+{
+	mali_c720_write_reg_raw(mali_c720, field->offset, val);
+}
+
+u32 mali_c720_irq_read(struct mali_c720 *mali_c720, const struct mali_c720_reg_field *field,
+		       enum mali_c720_irq_type type)
+{
+	return mali_c720_group_read(mali_c720, type, field);
+}
+
+void mali_c720_irq_write(struct mali_c720 *mali_c720, const struct mali_c720_reg_field *field,
+			 enum mali_c720_irq_type type, u32 val)
+{
+	if (WARN_ON_ONCE(field->shift > MALI_C720_REG_MAX_SHIFT))
+		return;
+
+	/* RAWSTAT is write-one-to-clear: acknowledge only the selected bits. */
+	if (type == MALI_C720_IRQ_RAWSTAT)
+		mali_c720_write_reg_raw(mali_c720, field->offset + type,
+					(val << field->shift) & field->mask);
+	else
+		mali_c720_group_write(mali_c720, type, field, val);
+}
+
+static int mali_c720_ctx_check_addr(struct mali_c720_context *ctx, u32 addr)
+{
+	int ret;
+
+	ret = WARN_ON_ONCE(!IS_ALIGNED(addr, sizeof(__le32)));
+	if (ret)
+		return ret;
+
+	ret = WARN_ON_ONCE(addr < ctx->mali_c720->registers.context_offset ||
+			   (u64)addr + sizeof(__le32) > ctx->regs.size);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+u32 mali_c720_ctx_read_raw(struct mali_c720_context *ctx, u32 addr)
+{
+	__le32 *ptr;
+
+	if (mali_c720_ctx_check_addr(ctx, addr))
+		return 0;
+
+	ptr = mali_c720_ctx_reg_addr(ctx, addr);
+	return le32_to_cpu(*ptr);
+}
+
+void mali_c720_ctx_write_raw(struct mali_c720_context *ctx, u32 addr, u32 val)
+{
+	__le32 *ptr;
+
+	if (mali_c720_ctx_check_addr(ctx, addr))
+		return;
+
+	ptr = mali_c720_ctx_reg_addr(ctx, addr);
+
+	*ptr = cpu_to_le32(val);
+}
+
+u32 mali_c720_ctx_group_read(struct mali_c720_context *ctx, u32 base,
+			     const struct mali_c720_reg_field *field)
+{
+	if (WARN_ON_ONCE(field->shift > MALI_C720_REG_MAX_SHIFT))
+		return 0;
+
+	return (mali_c720_ctx_read_raw(ctx, base + field->offset) & field->mask) >> field->shift;
+}
+
+void mali_c720_ctx_group_write(struct mali_c720_context *ctx, u32 base,
+			       const struct mali_c720_reg_field *field, u32 val)
+{
+	u32 addr = base + field->offset;
+	__le32 *ptr;
+	u32 reg;
+
+	if (WARN_ON_ONCE(field->shift > MALI_C720_REG_MAX_SHIFT))
+		return;
+	if (mali_c720_ctx_check_addr(ctx, addr))
+		return;
+
+	ptr = mali_c720_ctx_reg_addr(ctx, addr);
+
+	reg = le32_to_cpu(*ptr) & ~field->mask;
+	reg |= (val << field->shift) & field->mask;
+	*ptr = cpu_to_le32(reg);
+}
+
+u32 mali_c720_ctx_read(struct mali_c720_context *ctx, const struct mali_c720_reg_field *field)
+{
+	return mali_c720_ctx_group_read(ctx, 0, field);
+}
+
+void mali_c720_ctx_write(struct mali_c720_context *ctx, const struct mali_c720_reg_field *field,
+			 u32 val)
+{
+	mali_c720_ctx_group_write(ctx, 0, field, val);
+}
diff --git a/drivers/media/platform/arm/mali-c720/mali-c720-register-access.h b/drivers/media/platform/arm/mali-c720/mali-c720-register-access.h
new file mode 100644
index 0000000000000000000000000000000000000000..b96d404d594290d0d61b835eede071b2d86dca4f
--- /dev/null
+++ b/drivers/media/platform/arm/mali-c720/mali-c720-register-access.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * ARM Mali-C720 ISP Driver - Image signal processor
+ *
+ * Copyright (C) 2026 Arm Ltd
+ */
+
+#ifndef MALI_C720_REGISTER_ACCESS_H
+#define MALI_C720_REGISTER_ACCESS_H
+
+#include <linux/types.h>
+
+struct mali_c720;
+struct mali_c720_context;
+struct mali_c720_reg_field;
+
+#define MALI_C720_REG_MAX_SHIFT		31
+
+enum mali_c720_irq_type {
+	MALI_C720_IRQ_RAWSTAT = 0x4,
+	MALI_C720_IRQ_MASK = 0x8,
+	MALI_C720_IRQ_STATUS = 0xc,
+};
+
+/* HW register access */
+u32 mali_c720_read_raw(struct mali_c720 *mali_c720, u32 addr);
+u32 mali_c720_read(struct mali_c720 *mali_c720, const struct mali_c720_reg_field *field);
+void mali_c720_write(struct mali_c720 *mali_c720, const struct mali_c720_reg_field *field, u32 val);
+void mali_c720_write_raw(struct mali_c720 *mali_c720, const struct mali_c720_reg_field *field,
+			 u32 val);
+
+/* Group register access */
+u32 mali_c720_group_read(struct mali_c720 *mali_c720, u32 base,
+			 const struct mali_c720_reg_field *field);
+void mali_c720_group_write(struct mali_c720 *mali_c720, u32 base,
+			   const struct mali_c720_reg_field *field, u32 val);
+
+/* IRQ register access */
+u32 mali_c720_irq_read(struct mali_c720 *mali_c720, const struct mali_c720_reg_field *field,
+		       enum mali_c720_irq_type type);
+void mali_c720_irq_write(struct mali_c720 *mali_c720, const struct mali_c720_reg_field *field,
+			 enum mali_c720_irq_type type, u32 val);
+
+/* SW register access */
+u32 mali_c720_ctx_read(struct mali_c720_context *ctx, const struct mali_c720_reg_field *field);
+void mali_c720_ctx_write(struct mali_c720_context *ctx, const struct mali_c720_reg_field *field,
+			 u32 val);
+u32 mali_c720_ctx_group_read(struct mali_c720_context *ctx, u32 base,
+			     const struct mali_c720_reg_field *field);
+void mali_c720_ctx_group_write(struct mali_c720_context *ctx, u32 base,
+			       const struct mali_c720_reg_field *field, u32 val);
+u32 mali_c720_ctx_read_raw(struct mali_c720_context *ctx, u32 addr);
+void mali_c720_ctx_write_raw(struct mali_c720_context *ctx, u32 addr, u32 val);
+
+#endif /* MALI_C720_REGISTER_ACCESS_H */
diff --git a/drivers/media/platform/arm/mali-c720/mali-c720-registers-ctx-mgr.c b/drivers/media/platform/arm/mali-c720/mali-c720-registers-ctx-mgr.c
new file mode 100644
index 0000000000000000000000000000000000000000..79e7bf949f1c7ac35968cdcd26f2e21f8ba8f9ab
--- /dev/null
+++ b/drivers/media/platform/arm/mali-c720/mali-c720-registers-ctx-mgr.c
@@ -0,0 +1,226 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * ARM Mali-C720 ISP Driver - Image signal processor
+ *
+ * Copyright (C) 2026 Arm Ltd
+ */
+
+#include <linux/bits.h>
+
+#include "mali-c720-registers-ctx-mgr.h"
+
+static const struct mali_c720_cm_capabilities caps_r0 = {
+	.num_inputs = 4,
+	.num_input_streams = 4,
+	.cdma_sg_size = 32,
+	.num_raw_buffers = 64,
+	.num_slots = 20,
+	.num_out_buffers = 208,
+	.input_fifo_size = 4096,
+	.output_fifo_size = 2048,
+};
+
+static const struct mali_c720_cm_fifo_regs input_fifo_r0 = {
+	.group = { .offset = 0x6020, .size = 0x10 },
+	.base_address = { .offset = 0x0, .mask = GENMASK(15, 0), .shift = 0 },
+	.size = { .offset = 0x0, .mask = GENMASK(31, 16), .shift = 16 },
+};
+
+static const struct mali_c720_cm_temper_fifo_regs temper_fifo_r0 = {
+	.w_fifo_base_address = { .offset = 0x6140, .mask = GENMASK(15, 0), .shift = 0 },
+	.w_fifo_size = { .offset = 0x6140, .mask = GENMASK(31, 16), .shift = 16 },
+	.r_fifo_base_address = { .offset = 0x6150, .mask = GENMASK(15, 0), .shift = 0 },
+	.r_fifo_size = { .offset = 0x6150, .mask = GENMASK(31, 16), .shift = 16 },
+};
+
+static const struct mali_c720_cm_job_control_regs job_control_r0 = {
+	.sch_command = { .offset = 0x6160, .mask = GENMASK(7, 0), .shift = 0 },
+	.sch_command_slot = { .offset = 0x6160, .mask = GENMASK(15, 8), .shift = 8 },
+	.sch_status_arch = { .offset = 0x6164, .mask = GENMASK(2, 0), .shift = 0 },
+	.m2m_queue_command = { .offset = 0x616c, .mask = GENMASK(1, 0), .shift = 0 },
+	.m2m_queue_command_slot_no = { .offset = 0x616c, .mask = GENMASK(15, 8), .shift = 8 },
+};
+
+static const struct mali_c720_cm_input_regs input_r0 = {
+	.group = { .offset = 0x62fc, .size = 0x20 },
+	.command = { .offset = 0x0, .mask = GENMASK(7, 0), .shift = 0 },
+	.status_arch = { .offset = 0x4, .mask = GENMASK(2, 0), .shift = 0 },
+	.pixel_size = { .offset = 0xc, .mask = GENMASK(5, 0), .shift = 0 },
+	.data_format = { .offset = 0xc, .mask = GENMASK(9, 7), .shift = 7 },
+	.nonsecure = { .offset = 0xc, .mask = BIT(10), .shift = 10 },
+	.stream_id = { .offset = 0xc, .mask = GENMASK(15, 11), .shift = 11 },
+	.data_type1_enable = { .offset = 0xc, .mask = BIT(16), .shift = 16 },
+	.data_type2_enable = { .offset = 0xc, .mask = BIT(17), .shift = 17 },
+	.crop_enable = { .offset = 0xc, .mask = BIT(19), .shift = 19 },
+	.drop_oldest = { .offset = 0xc, .mask = BIT(20), .shift = 20 },
+	.flow_control = { .offset = 0xc, .mask = BIT(21), .shift = 21 },
+	.drop_if_error = { .offset = 0xc, .mask = BIT(22), .shift = 22 },
+	.check_parity = { .offset = 0xc, .mask = BIT(23), .shift = 23 },
+	.buffer_pool = { .offset = 0xc, .mask = GENMASK(31, 24), .shift = 24 },
+	.data_type1 = { .offset = 0x10, .mask = GENMASK(7, 0), .shift = 0 },
+	.data_type2 = { .offset = 0x10, .mask = GENMASK(15, 8), .shift = 8 },
+	.start_x = { .offset = 0x14, .mask = GENMASK(15, 0), .shift = 0 },
+	.start_y = { .offset = 0x14, .mask = GENMASK(31, 16), .shift = 16 },
+	.size_x = { .offset = 0x18, .mask = GENMASK(15, 0), .shift = 0 },
+	.size_y = { .offset = 0x18, .mask = GENMASK(31, 16), .shift = 16 },
+	.write_threshold = { .offset = 0x1c, .mask = GENMASK(15, 0), .shift = 0 },
+	.write_threshold_sec = { .offset = 0x1c, .mask = GENMASK(31, 16), .shift = 16 },
+};
+
+static const struct mali_c720_cm_slot_regs slot_r0 = {
+	.group = { .offset = 0x6500, .size = 0x40 },
+	.mode = { .offset = 0x0, .mask = GENMASK(2, 0), .shift = 0 },
+	.timeout_enable = { .offset = 0x0, .mask = BIT(3), .shift = 3 },
+	.schedule_priority = { .offset = 0x0, .mask = BIT(8), .shift = 8 },
+	.nonsecure = { .offset = 0x0, .mask = BIT(10), .shift = 10 },
+	.stream_id = { .offset = 0x0, .mask = GENMASK(15, 11), .shift = 11 },
+	.status = { .offset = 0x0, .mask = GENMASK(26, 24), .shift = 24 },
+	.delay_mant = { .offset = 0x4, .mask = GENMASK(11, 0), .shift = 0 },
+	.delay_exp = { .offset = 0x4, .mask = GENMASK(15, 12), .shift = 12 },
+	.slot_event = { .offset = 0x4, .mask = GENMASK(19, 16), .shift = 16 },
+	.slot_input_0 = { .offset = 0x8, .mask = GENMASK(7, 0), .shift = 0 },
+	.slot_input_1 = { .offset = 0x8, .mask = GENMASK(15, 8), .shift = 8 },
+	.timeout_mant = { .offset = 0xc, .mask = GENMASK(11, 0), .shift = 0 },
+	.timeout_exp = { .offset = 0xc, .mask = GENMASK(15, 12), .shift = 12 },
+	.pool_roi0 = { .offset = 0x10, .mask = GENMASK(7, 0), .shift = 0 },
+	.pool_roi1 = { .offset = 0x10, .mask = GENMASK(15, 8), .shift = 8 },
+	.pool_roi2 = { .offset = 0x10, .mask = GENMASK(23, 16), .shift = 16 },
+	.pool_raw = { .offset = 0x10, .mask = GENMASK(31, 24), .shift = 24 },
+	.pool_scaler0_rgb = { .offset = 0x14, .mask = GENMASK(7, 0), .shift = 0 },
+	.pool_scaler0_yuv = { .offset = 0x14, .mask = GENMASK(15, 8), .shift = 8 },
+	.pool_scaler1_rgb = { .offset = 0x14, .mask = GENMASK(23, 16), .shift = 16 },
+	.pool_scaler1_yuv = { .offset = 0x14, .mask = GENMASK(31, 24), .shift = 24 },
+	.pool_scaler2_rgb = { .offset = 0x18, .mask = GENMASK(7, 0), .shift = 0 },
+	.pool_scaler2_yuv = { .offset = 0x18, .mask = GENMASK(15, 8), .shift = 8 },
+	.pool_scaler3_rgb = { .offset = 0x18, .mask = GENMASK(23, 16), .shift = 16 },
+	.pool_scaler3_yuv = { .offset = 0x18, .mask = GENMASK(31, 24), .shift = 24 },
+	.pool_gdc_main = { .offset = 0x1c, .mask = GENMASK(7, 0), .shift = 0 },
+	.pool_gdc_roi0 = { .offset = 0x1c, .mask = GENMASK(15, 8), .shift = 8 },
+	.pool_gdc_roi1 = { .offset = 0x1c, .mask = GENMASK(23, 16), .shift = 16 },
+	.pool_gdc_roi2 = { .offset = 0x1c, .mask = GENMASK(31, 24), .shift = 24 },
+	.pool_pyramid = { .offset = 0x20, .mask = GENMASK(7, 0), .shift = 0 },
+	.pool_consistency = { .offset = 0x20, .mask = GENMASK(15, 8), .shift = 8 },
+	.crc = { .offset = 0x24, .mask = GENMASK(31, 0), .shift = 0 },
+};
+
+static const struct mali_c720_cm_buffer_regs buffer_r0 = {
+	.out_group = { .offset = 0x12000, .size = 0x80 },
+	.raw_group = { .offset = 0x10000, .size = 0x80 },
+	.temper_group = { .offset = 0x18800, .size = 0x80 },
+	.state = { .offset = 0x0, .mask = GENMASK(3, 0), .shift = 0 },
+	.state_request = { .offset = 0x0, .mask = GENMASK(7, 4), .shift = 4 },
+	.data_format = { .offset = 0x4, .mask = GENMASK(7, 0), .shift = 0 },
+	.data_align = { .offset = 0x4, .mask = GENMASK(9, 8), .shift = 8 },
+	.nonsecure = { .offset = 0x4, .mask = BIT(10), .shift = 10 },
+	.stream_id = { .offset = 0x4, .mask = GENMASK(15, 11), .shift = 11 },
+	.data_layout = { .offset = 0x4, .mask = BIT(16), .shift = 16 },
+	.crc_check = { .offset = 0x4, .mask = BIT(17), .shift = 17 },
+	.pool = { .offset = 0x4, .mask = BIT(18), .shift = 18 },
+	.mode = { .offset = 0x4, .mask = GENMASK(21, 19), .shift = 19 },
+	.block_size = { .offset = 0x4, .mask = GENMASK(23, 22), .shift = 22 },
+	.base_address_low = { .offset = 0x8, .mask = GENMASK(31, 0), .shift = 0 },
+	.base_address_high = { .offset = 0xc, .mask = GENMASK(31, 0), .shift = 0 },
+	.size = { .offset = 0x10, .mask = GENMASK(31, 0), .shift = 0 },
+	.plane2_offset = { .offset = 0x14, .mask = GENMASK(31, 0), .shift = 0 },
+	.plane3_offset = { .offset = 0x18, .mask = GENMASK(31, 0), .shift = 0 },
+	.plane4_offset = { .offset = 0x1c, .mask = GENMASK(31, 0), .shift = 0 },
+	.line1_offset = { .offset = 0x20, .mask = GENMASK(31, 0), .shift = 0 },
+	.line2_offset = { .offset = 0x24, .mask = GENMASK(31, 0), .shift = 0 },
+	.line3_offset = { .offset = 0x28, .mask = GENMASK(31, 0), .shift = 0 },
+	.line4_offset = { .offset = 0x2c, .mask = GENMASK(31, 0), .shift = 0 },
+	.width = { .offset = 0x30, .mask = GENMASK(15, 0), .shift = 0 },
+	.height = { .offset = 0x30, .mask = GENMASK(31, 16), .shift = 16 },
+	.colorspace = { .offset = 0x34, .mask = GENMASK(3, 0), .shift = 0 },
+	.subsampling = { .offset = 0x34, .mask = GENMASK(5, 4), .shift = 4 },
+	.component_width = { .offset = 0x34, .mask = GENMASK(10, 8), .shift = 8 },
+	.msb_align = { .offset = 0x34, .mask = BIT(11), .shift = 11 },
+	.phase = { .offset = 0x34, .mask = GENMASK(14, 12), .shift = 12 },
+	.height_modulo = { .offset = 0x34, .mask = GENMASK(31, 16), .shift = 16 },
+	.compression = { .offset = 0x38, .mask = GENMASK(31, 0), .shift = 0 },
+	.compression23 = { .offset = 0x3c, .mask = GENMASK(31, 0), .shift = 0 },
+	.descriptor_crc = { .offset = 0x40, .mask = GENMASK(15, 0), .shift = 0 },
+	.frame_no = { .offset = 0x4c, .mask = GENMASK(31, 0), .shift = 0 },
+};
+
+static const struct mali_c720_cm_cdma_slot_regs cdma_slot_r0 = {
+	.group = { .offset = 0x19200, .size = 0x40 },
+	.cdma_state = { .offset = 0x0, .mask = GENMASK(1, 0), .shift = 0 },
+	.cdma_state_request = { .offset = 0x0, .mask = GENMASK(5, 4), .shift = 4 },
+	.infinite = { .offset = 0x0, .mask = BIT(8), .shift = 8 },
+	.nonsecure = { .offset = 0x0, .mask = BIT(10), .shift = 10 },
+	.stream_id = { .offset = 0x0, .mask = GENMASK(15, 11), .shift = 11 },
+	.transfer_size = { .offset = 0x4, .mask = GENMASK(31, 0), .shift = 0 },
+	.units_low = { .offset = 0x8, .mask = GENMASK(31, 0), .shift = 0 },
+	.units_high = { .offset = 0xc, .mask = GENMASK(31, 0), .shift = 0 },
+	.base_address_low = { .offset = 0x10, .mask = GENMASK(31, 0), .shift = 0 },
+	.base_address_high = { .offset = 0x14, .mask = GENMASK(31, 0), .shift = 0 },
+	.ld_sg_count = { .offset = 0x18, .mask = GENMASK(5, 0), .shift = 0 },
+	.st_sg_count = { .offset = 0x18, .mask = GENMASK(13, 8), .shift = 8 },
+	.alt_transfer_size = { .offset = 0x1c, .mask = GENMASK(31, 0), .shift = 0 },
+	.alt_base_address_low = { .offset = 0x20, .mask = GENMASK(31, 0), .shift = 0 },
+	.alt_base_address_high = { .offset = 0x24, .mask = GENMASK(31, 0), .shift = 0 },
+	.crc = { .offset = 0x28, .mask = GENMASK(15, 0), .shift = 0 },
+};
+
+static const struct mali_c720_cm_load_out_fifo_regs load_out_fifo_r0 = {
+	.scaler_group = { .offset = 0x808a0, .size = 0x10 },
+	.roi_group = { .offset = 0x80810, .size = 0x10 },
+	.pyramid_group = { .offset = 0x80a20, .size = 0x10 },
+	.raw_group = { .offset = 0x80a60, .size = 0x10 },
+	.base_address = { .offset = 0x0, .mask = GENMASK(15, 0), .shift = 0 },
+	.size = { .offset = 0x0, .mask = GENMASK(31, 16), .shift = 16 },
+};
+
+static const struct mali_c720_cm_sg_regs load_cdma_sg_load_r0 = {
+	.group = { .offset = 0x80a80, .size = 0x8 },
+	.isp_address = { .offset = 0x0, .mask = GENMASK(19, 0), .shift = 0 },
+	.length_low = { .offset = 0x0, .mask = GENMASK(31, 20), .shift = 20 },
+	.length_high = { .offset = 0x4, .mask = GENMASK(3, 0), .shift = 0 },
+	.axi_address = { .offset = 0x4, .mask = GENMASK(23, 4), .shift = 4 },
+	.alt_address = { .offset = 0x4, .mask = BIT(31), .shift = 31 },
+};
+
+static const struct mali_c720_cm_sg_crc_regs load_cdma_sg_load_crc_r0 = {
+	.cdma_sg_crc = { .offset = 0x80b80, .mask = GENMASK(15, 0), .shift = 0 },
+};
+
+static const struct mali_c720_cm_sg_regs load_cdma_sg_store_r0 = {
+	.group = { .offset = 0x80ba0, .size = 0x8 },
+	.isp_address = { .offset = 0x0, .mask = GENMASK(19, 0), .shift = 0 },
+	.length_low = { .offset = 0x0, .mask = GENMASK(31, 20), .shift = 20 },
+	.length_high = { .offset = 0x4, .mask = GENMASK(3, 0), .shift = 0 },
+	.axi_address = { .offset = 0x4, .mask = GENMASK(23, 4), .shift = 4 },
+	.alt_address = { .offset = 0x4, .mask = BIT(31), .shift = 31 },
+};
+
+static const struct mali_c720_cm_sg_crc_regs load_cdma_sg_store_crc_r0 = {
+	.cdma_sg_crc = { .offset = 0x80ca0, .mask = GENMASK(15, 0), .shift = 0 },
+};
+
+static const struct mali_c720_cm_fifo_regs reader_fifo_r0 = {
+	.base_address = { .offset = 0x0, .mask = GENMASK(15, 0), .shift = 0 },
+	.size = { .offset = 0x0, .mask = GENMASK(31, 16), .shift = 16 },
+	.group = { .offset = 0x6120, .size = 0x10 },
+};
+
+static const struct mali_c720_ctx_mgr_regs mali_c720_ctx_mgr_regs_r0 = {
+	.caps = &caps_r0,
+	.input_fifo = &input_fifo_r0,
+	.temper_fifo = &temper_fifo_r0,
+	.job_control = &job_control_r0,
+	.input = &input_r0,
+	.slot = &slot_r0,
+	.buffer = &buffer_r0,
+	.cdma_slot = &cdma_slot_r0,
+	.load_out_fifo = &load_out_fifo_r0,
+	.load_cdma_sg_load = &load_cdma_sg_load_r0,
+	.load_cdma_sg_load_crc = &load_cdma_sg_load_crc_r0,
+	.load_cdma_sg_store = &load_cdma_sg_store_r0,
+	.load_cdma_sg_store_crc = &load_cdma_sg_store_crc_r0,
+	.reader_fifo = &reader_fifo_r0,
+};
+
+const struct mali_c720_ctx_mgr_regs *mali_c720_get_ctx_mgr_regs(void)
+{
+	return &mali_c720_ctx_mgr_regs_r0;
+}
diff --git a/drivers/media/platform/arm/mali-c720/mali-c720-registers-ctx-mgr.h b/drivers/media/platform/arm/mali-c720/mali-c720-registers-ctx-mgr.h
new file mode 100644
index 0000000000000000000000000000000000000000..7a8100915cc9fa8666b90baf207e672867c59e5a
--- /dev/null
+++ b/drivers/media/platform/arm/mali-c720/mali-c720-registers-ctx-mgr.h
@@ -0,0 +1,207 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * ARM Mali-C720 ISP Driver - Image signal processor
+ *
+ * Copyright (C) 2026 Arm Ltd
+ */
+
+#ifndef MALI_C720_REGISTERS_CTX_MGR_H
+#define MALI_C720_REGISTERS_CTX_MGR_H
+
+#include "mali-c720-registers.h"
+
+struct mali_c720_cm_capabilities {
+	u32 num_inputs;
+	u32 num_input_streams;
+	u32 cdma_sg_size;
+	u32 num_raw_buffers;
+	u32 num_slots;
+	u32 num_out_buffers;
+	u32 input_fifo_size;
+	u32 output_fifo_size;
+};
+
+struct mali_c720_cm_fifo_regs {
+	struct mali_c720_group_regs group;
+	struct mali_c720_reg_field base_address;
+	struct mali_c720_reg_field size;
+};
+
+struct mali_c720_cm_temper_fifo_regs {
+	struct mali_c720_reg_field w_fifo_base_address;
+	struct mali_c720_reg_field w_fifo_size;
+	struct mali_c720_reg_field r_fifo_base_address;
+	struct mali_c720_reg_field r_fifo_size;
+};
+
+struct mali_c720_cm_job_control_regs {
+	struct mali_c720_reg_field sch_command;
+	struct mali_c720_reg_field sch_command_slot;
+	struct mali_c720_reg_field sch_status_arch;
+	struct mali_c720_reg_field m2m_queue_command;
+	struct mali_c720_reg_field m2m_queue_command_slot_no;
+};
+
+struct mali_c720_cm_input_regs {
+	struct mali_c720_group_regs group;
+	struct mali_c720_reg_field command;
+	struct mali_c720_reg_field status_arch;
+	struct mali_c720_reg_field pixel_size;
+	struct mali_c720_reg_field data_format;
+	struct mali_c720_reg_field nonsecure;
+	struct mali_c720_reg_field stream_id;
+	struct mali_c720_reg_field data_type1_enable;
+	struct mali_c720_reg_field data_type2_enable;
+	struct mali_c720_reg_field crop_enable;
+	struct mali_c720_reg_field drop_oldest;
+	struct mali_c720_reg_field flow_control;
+	struct mali_c720_reg_field drop_if_error;
+	struct mali_c720_reg_field check_parity;
+	struct mali_c720_reg_field buffer_pool;
+	struct mali_c720_reg_field data_type1;
+	struct mali_c720_reg_field data_type2;
+	struct mali_c720_reg_field start_x;
+	struct mali_c720_reg_field start_y;
+	struct mali_c720_reg_field size_x;
+	struct mali_c720_reg_field size_y;
+	struct mali_c720_reg_field write_threshold;
+	struct mali_c720_reg_field write_threshold_sec;
+};
+
+struct mali_c720_cm_slot_regs {
+	struct mali_c720_group_regs group;
+	struct mali_c720_reg_field mode;
+	struct mali_c720_reg_field timeout_enable;
+	struct mali_c720_reg_field schedule_priority;
+	struct mali_c720_reg_field nonsecure;
+	struct mali_c720_reg_field stream_id;
+	struct mali_c720_reg_field status;
+	struct mali_c720_reg_field delay_mant;
+	struct mali_c720_reg_field delay_exp;
+	struct mali_c720_reg_field slot_event;
+	struct mali_c720_reg_field slot_input_0;
+	struct mali_c720_reg_field slot_input_1;
+	struct mali_c720_reg_field timeout_mant;
+	struct mali_c720_reg_field timeout_exp;
+	struct mali_c720_reg_field pool_roi0;
+	struct mali_c720_reg_field pool_roi1;
+	struct mali_c720_reg_field pool_roi2;
+	struct mali_c720_reg_field pool_raw;
+	struct mali_c720_reg_field pool_scaler0_rgb;
+	struct mali_c720_reg_field pool_scaler0_yuv;
+	struct mali_c720_reg_field pool_scaler1_rgb;
+	struct mali_c720_reg_field pool_scaler1_yuv;
+	struct mali_c720_reg_field pool_scaler2_rgb;
+	struct mali_c720_reg_field pool_scaler2_yuv;
+	struct mali_c720_reg_field pool_scaler3_rgb;
+	struct mali_c720_reg_field pool_scaler3_yuv;
+	struct mali_c720_reg_field pool_gdc_main;
+	struct mali_c720_reg_field pool_gdc_roi0;
+	struct mali_c720_reg_field pool_gdc_roi1;
+	struct mali_c720_reg_field pool_gdc_roi2;
+	struct mali_c720_reg_field pool_pyramid;
+	struct mali_c720_reg_field pool_consistency;
+	struct mali_c720_reg_field crc;
+};
+
+struct mali_c720_cm_buffer_regs {
+	struct mali_c720_group_regs out_group;
+	struct mali_c720_group_regs raw_group;
+	struct mali_c720_group_regs temper_group;
+	struct mali_c720_reg_field state;
+	struct mali_c720_reg_field state_request;
+	struct mali_c720_reg_field data_format;
+	struct mali_c720_reg_field data_align;
+	struct mali_c720_reg_field nonsecure;
+	struct mali_c720_reg_field stream_id;
+	struct mali_c720_reg_field data_layout;
+	struct mali_c720_reg_field crc_check;
+	struct mali_c720_reg_field pool;
+	struct mali_c720_reg_field mode;
+	struct mali_c720_reg_field block_size;
+	struct mali_c720_reg_field base_address_low;
+	struct mali_c720_reg_field base_address_high;
+	struct mali_c720_reg_field size;
+	struct mali_c720_reg_field plane2_offset;
+	struct mali_c720_reg_field plane3_offset;
+	struct mali_c720_reg_field plane4_offset;
+	struct mali_c720_reg_field line1_offset;
+	struct mali_c720_reg_field line2_offset;
+	struct mali_c720_reg_field line3_offset;
+	struct mali_c720_reg_field line4_offset;
+	struct mali_c720_reg_field width;
+	struct mali_c720_reg_field height;
+	struct mali_c720_reg_field colorspace;
+	struct mali_c720_reg_field subsampling;
+	struct mali_c720_reg_field component_width;
+	struct mali_c720_reg_field msb_align;
+	struct mali_c720_reg_field phase;
+	struct mali_c720_reg_field height_modulo;
+	struct mali_c720_reg_field compression;
+	struct mali_c720_reg_field compression23;
+	struct mali_c720_reg_field descriptor_crc;
+	struct mali_c720_reg_field frame_no;
+};
+
+struct mali_c720_cm_cdma_slot_regs {
+	struct mali_c720_group_regs group;
+	struct mali_c720_reg_field cdma_state;
+	struct mali_c720_reg_field cdma_state_request;
+	struct mali_c720_reg_field infinite;
+	struct mali_c720_reg_field nonsecure;
+	struct mali_c720_reg_field stream_id;
+	struct mali_c720_reg_field transfer_size;
+	struct mali_c720_reg_field units_low;
+	struct mali_c720_reg_field units_high;
+	struct mali_c720_reg_field base_address_low;
+	struct mali_c720_reg_field base_address_high;
+	struct mali_c720_reg_field ld_sg_count;
+	struct mali_c720_reg_field st_sg_count;
+	struct mali_c720_reg_field alt_transfer_size;
+	struct mali_c720_reg_field alt_base_address_low;
+	struct mali_c720_reg_field alt_base_address_high;
+	struct mali_c720_reg_field crc;
+};
+
+struct mali_c720_cm_load_out_fifo_regs {
+	struct mali_c720_group_regs scaler_group;
+	struct mali_c720_group_regs roi_group;
+	struct mali_c720_group_regs pyramid_group;
+	struct mali_c720_group_regs raw_group;
+	struct mali_c720_reg_field base_address;
+	struct mali_c720_reg_field size;
+};
+
+struct mali_c720_cm_sg_regs {
+	struct mali_c720_group_regs group;
+	struct mali_c720_reg_field isp_address;
+	struct mali_c720_reg_field length_low;
+	struct mali_c720_reg_field length_high;
+	struct mali_c720_reg_field axi_address;
+	struct mali_c720_reg_field alt_address;
+};
+
+struct mali_c720_cm_sg_crc_regs {
+	struct mali_c720_reg_field cdma_sg_crc;
+};
+
+struct mali_c720_ctx_mgr_regs {
+	const struct mali_c720_cm_capabilities *caps;
+	const struct mali_c720_cm_fifo_regs *input_fifo;
+	const struct mali_c720_cm_temper_fifo_regs *temper_fifo;
+	const struct mali_c720_cm_job_control_regs *job_control;
+	const struct mali_c720_cm_input_regs *input;
+	const struct mali_c720_cm_slot_regs *slot;
+	const struct mali_c720_cm_buffer_regs *buffer;
+	const struct mali_c720_cm_cdma_slot_regs *cdma_slot;
+	const struct mali_c720_cm_load_out_fifo_regs *load_out_fifo;
+	const struct mali_c720_cm_sg_regs *load_cdma_sg_load;
+	const struct mali_c720_cm_sg_crc_regs *load_cdma_sg_load_crc;
+	const struct mali_c720_cm_sg_regs *load_cdma_sg_store;
+	const struct mali_c720_cm_sg_crc_regs *load_cdma_sg_store_crc;
+	const struct mali_c720_cm_fifo_regs *reader_fifo;
+};
+
+const struct mali_c720_ctx_mgr_regs *mali_c720_get_ctx_mgr_regs(void);
+
+#endif /* MALI_C720_REGISTERS_CTX_MGR_H */
diff --git a/drivers/media/platform/arm/mali-c720/mali-c720-registers-modules.c b/drivers/media/platform/arm/mali-c720/mali-c720-registers-modules.c
new file mode 100644
index 0000000000000000000000000000000000000000..a33716de72f6250fe5488eb4d0ccb6ccc23ee071
--- /dev/null
+++ b/drivers/media/platform/arm/mali-c720/mali-c720-registers-modules.c
@@ -0,0 +1,148 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * ARM Mali-C720 ISP Driver - Image signal processor
+ *
+ * Copyright (C) 2026 Arm Ltd
+ */
+
+#include <linux/bits.h>
+
+#include "mali-c720-registers-modules.h"
+
+static const struct mali_c720_decompander_regs decompander = {
+	.enable = { .offset = 0x0, .mask = BIT(0), .shift = 0 },
+	.lut_x = { .offset = 0x4, .mask = GENMASK(23, 0), .shift = 0 },
+	.lut_y = { .offset = 0x88, .mask = GENMASK(24, 0), .shift = 0 },
+};
+
+static const struct mali_c720_digital_gain_regs inp_dgain = {
+	.gain = { .offset = 0x0, .mask = GENMASK(19, 0), .shift = 0 },
+	.offset = { .offset = 0x4, .mask = GENMASK(23, 0), .shift = 0 },
+};
+
+static const struct mali_c720_square_root_regs square_root_a = {
+	.black_level_out = { .offset = 0x0, .mask = GENMASK(11, 0), .shift = 0 },
+	.black_level_in = { .offset = 0x4, .mask = GENMASK(23, 0), .shift = 0 },
+	.normalization = { .offset = 0x8, .mask = GENMASK(16, 0), .shift = 0 },
+};
+
+static const struct mali_c720_black_level_regs black_level = {
+	.black_00 = { .offset = 0x0, .mask = GENMASK(15, 0), .shift = 0 },
+	.black_01 = { .offset = 0x0, .mask = GENMASK(31, 16), .shift = 16 },
+	.black_10 = { .offset = 0x4, .mask = GENMASK(15, 0), .shift = 0 },
+	.black_11 = { .offset = 0x4, .mask = GENMASK(31, 16), .shift = 16 },
+};
+
+static const struct mali_c720_wb_gain_regs wb_gain = {
+	.gain_00 = { .offset = 0x0, .mask = GENMASK(11, 0), .shift = 0 },
+	.gain_01 = { .offset = 0x4, .mask = GENMASK(11, 0), .shift = 0 },
+	.gain_10 = { .offset = 0x8, .mask = GENMASK(11, 0), .shift = 0 },
+	.gain_11 = { .offset = 0xc, .mask = GENMASK(11, 0), .shift = 0 },
+};
+
+static const struct mali_c720_square_regs square_a = {
+	.black_level_in = { .offset = 0x0, .mask = GENMASK(23, 0), .shift = 0 },
+	.black_level_out = { .offset = 0x4, .mask = GENMASK(11, 0), .shift = 0 },
+	.normalization = { .offset = 0x8, .mask = GENMASK(16, 0), .shift = 0 },
+};
+
+static const struct mali_c720_square_regs square_b = {
+	.black_level_in = { .offset = 0x0, .mask = GENMASK(11, 0), .shift = 0 },
+	.black_level_out = { .offset = 0x4, .mask = GENMASK(23, 0), .shift = 0 },
+	.normalization = { .offset = 0x8, .mask = GENMASK(16, 0), .shift = 0 },
+};
+
+static const struct mali_c720_square_root_regs square_root_b = {
+	.black_level_out = { .offset = 0x0, .mask = GENMASK(11, 0), .shift = 0 },
+	.black_level_in = { .offset = 0x4, .mask = GENMASK(23, 0), .shift = 0 },
+	.normalization = { .offset = 0x8, .mask = GENMASK(16, 0), .shift = 0 },
+};
+
+static const struct mali_c720_rgb_scaler_regs rgb_scaler = {
+	.hfilt_enable = { .offset = 0x0, .mask = BIT(0), .shift = 0 },
+	.vfilt_enable = { .offset = 0x0, .mask = BIT(1), .shift = 1 },
+	.hfilt_tincr = { .offset = 0x4, .mask = GENMASK(23, 0), .shift = 0 },
+	.hfilt_start_phase = { .offset = 0x8, .mask = GENMASK(23, 0), .shift = 0 },
+	.vfilt_tincr = { .offset = 0xc, .mask = GENMASK(23, 0), .shift = 0 },
+	.vfilt_start_phase = { .offset = 0x10, .mask = GENMASK(23, 0), .shift = 0 },
+	.hmem = { .offset = 0x0, .mask = GENMASK(31, 0), .shift = 0 },
+	.vmem = { .offset = 0x0, .mask = GENMASK(31, 0), .shift = 0 },
+};
+
+static const struct mali_c720_crop_regs crop = {
+	.enable_crop = { .offset = 0x0, .mask = BIT(0), .shift = 0 },
+	.start_x = { .offset = 0x4, .mask = GENMASK(15, 0), .shift = 0 },
+	.start_y = { .offset = 0x4, .mask = GENMASK(31, 16), .shift = 16 },
+	.size_x = { .offset = 0x8, .mask = GENMASK(15, 0), .shift = 0 },
+	.size_y = { .offset = 0x8, .mask = GENMASK(31, 16), .shift = 16 },
+};
+
+static const struct mali_c720_out_format_regs out_format = {
+	.coefft_11 = { .offset = 0x0, .mask = GENMASK(15, 0), .shift = 0 },
+	.coefft_12 = { .offset = 0x0, .mask = GENMASK(31, 16), .shift = 16 },
+	.coefft_13 = { .offset = 0x4, .mask = GENMASK(15, 0), .shift = 0 },
+	.coefft_21 = { .offset = 0x4, .mask = GENMASK(31, 16), .shift = 16 },
+	.coefft_22 = { .offset = 0x8, .mask = GENMASK(15, 0), .shift = 0 },
+	.coefft_23 = { .offset = 0x8, .mask = GENMASK(31, 16), .shift = 16 },
+	.coefft_31 = { .offset = 0xc, .mask = GENMASK(15, 0), .shift = 0 },
+	.coefft_32 = { .offset = 0xc, .mask = GENMASK(31, 16), .shift = 16 },
+	.coefft_33 = { .offset = 0x10, .mask = GENMASK(15, 0), .shift = 0 },
+	.coefft_o1 = { .offset = 0x14, .mask = GENMASK(16, 0), .shift = 0 },
+	.coefft_o2 = { .offset = 0x18, .mask = GENMASK(16, 0), .shift = 0 },
+	.coefft_o3 = { .offset = 0x1c, .mask = GENMASK(16, 0), .shift = 0 },
+	.clip_min_y = { .offset = 0x20, .mask = GENMASK(15, 0), .shift = 0 },
+	.clip_max_y = { .offset = 0x20, .mask = GENMASK(31, 16), .shift = 16 },
+	.clip_min_uv = { .offset = 0x24, .mask = GENMASK(15, 0), .shift = 0 },
+	.clip_max_uv = { .offset = 0x24, .mask = GENMASK(31, 16), .shift = 16 },
+};
+
+static const struct mali_c720_stat_color_stats_regs stat_color_stats = {
+	.awb_stats_mode = { .offset = 0xc, .mask = BIT(0), .shift = 0 },
+	.white_level_awb = { .offset = 0x10, .mask = GENMASK(13, 0), .shift = 0 },
+	.black_level_awb = { .offset = 0x14, .mask = GENMASK(13, 0), .shift = 0 },
+	.cr_ref_max_awb = { .offset = 0x18, .mask = GENMASK(11, 0), .shift = 0 },
+	.cr_ref_min_awb = { .offset = 0x1c, .mask = GENMASK(11, 0), .shift = 0 },
+	.cb_ref_max_awb = { .offset = 0x20, .mask = GENMASK(11, 0), .shift = 0 },
+	.cb_ref_min_awb = { .offset = 0x24, .mask = GENMASK(11, 0), .shift = 0 },
+	.awb_nodes_used_horiz = { .offset = 0x28, .mask = GENMASK(7, 0), .shift = 0 },
+	.awb_nodes_used_vert = { .offset = 0x28, .mask = GENMASK(15, 8), .shift = 8 },
+	.cr_ref_high_awb = { .offset = 0x2c, .mask = GENMASK(11, 0), .shift = 0 },
+	.cr_ref_low_awb = { .offset = 0x30, .mask = GENMASK(11, 0), .shift = 0 },
+	.cb_ref_high_awb = { .offset = 0x34, .mask = GENMASK(11, 0), .shift = 0 },
+	.cb_ref_low_awb = { .offset = 0x38, .mask = GENMASK(11, 0), .shift = 0 },
+	.awb_weight = { .offset = 0x40, .mask = GENMASK(3, 0), .shift = 0 },
+};
+
+static const struct mali_c720_stat_histogram_regs stat_histogram = {
+	.skip_x = { .offset = 0x28, .mask = GENMASK(2, 0), .shift = 0 },
+	.skip_y = { .offset = 0x28, .mask = GENMASK(6, 4), .shift = 4 },
+	.offset_x = { .offset = 0x28, .mask = BIT(3), .shift = 3 },
+	.offset_y = { .offset = 0x28, .mask = BIT(7), .shift = 7 },
+	.scale_bottom = { .offset = 0x2c, .mask = GENMASK(3, 0), .shift = 0 },
+	.scale_top = { .offset = 0x2c, .mask = GENMASK(7, 4), .shift = 4 },
+	.plane_mode = { .offset = 0x30, .mask = GENMASK(2, 0), .shift = 0 },
+	.nodes_used_horiz = { .offset = 0x34, .mask = GENMASK(7, 0), .shift = 0 },
+	.nodes_used_vert = { .offset = 0x34, .mask = GENMASK(15, 8), .shift = 8 },
+	.weight = { .offset = 0x38, .mask = GENMASK(3, 0), .shift = 0 },
+};
+
+static const struct mali_c720_modules_regs mali_c720_modules_regs = {
+	.decompander = &decompander,
+	.inp_dgain = &inp_dgain,
+	.square_root_a = &square_root_a,
+	.black_level = &black_level,
+	.wb_gain = &wb_gain,
+	.square_a = &square_a,
+	.square_b = &square_b,
+	.square_root_b = &square_root_b,
+	.rgb_scaler = &rgb_scaler,
+	.crop = &crop,
+	.out_format = &out_format,
+	.stat_color_stats = &stat_color_stats,
+	.stat_histogram = &stat_histogram,
+};
+
+const struct mali_c720_modules_regs *mali_c720_get_modules_regs(void)
+{
+	return &mali_c720_modules_regs;
+}
diff --git a/drivers/media/platform/arm/mali-c720/mali-c720-registers-modules.h b/drivers/media/platform/arm/mali-c720/mali-c720-registers-modules.h
new file mode 100644
index 0000000000000000000000000000000000000000..500059b1bfa299f4e15f423650826409135504a9
--- /dev/null
+++ b/drivers/media/platform/arm/mali-c720/mali-c720-registers-modules.h
@@ -0,0 +1,136 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * ARM Mali-C720 ISP Driver - Image signal processor
+ *
+ * Copyright (C) 2026 Arm Ltd
+ */
+
+#ifndef MALI_C720_REGISTERS_MODULES_H
+#define MALI_C720_REGISTERS_MODULES_H
+
+#include "mali-c720-registers.h"
+
+struct mali_c720_decompander_regs {
+	struct mali_c720_reg_field enable;
+	struct mali_c720_reg_field lut_x;
+	struct mali_c720_reg_field lut_y;
+};
+
+struct mali_c720_digital_gain_regs {
+	struct mali_c720_reg_field gain;
+	struct mali_c720_reg_field offset;
+};
+
+struct mali_c720_square_root_regs {
+	struct mali_c720_reg_field black_level_out;
+	struct mali_c720_reg_field black_level_in;
+	struct mali_c720_reg_field normalization;
+};
+
+struct mali_c720_black_level_regs {
+	struct mali_c720_reg_field black_00;
+	struct mali_c720_reg_field black_01;
+	struct mali_c720_reg_field black_10;
+	struct mali_c720_reg_field black_11;
+};
+
+struct mali_c720_wb_gain_regs {
+	struct mali_c720_reg_field gain_00;
+	struct mali_c720_reg_field gain_01;
+	struct mali_c720_reg_field gain_10;
+	struct mali_c720_reg_field gain_11;
+};
+
+struct mali_c720_square_regs {
+	struct mali_c720_reg_field black_level_in;
+	struct mali_c720_reg_field black_level_out;
+	struct mali_c720_reg_field normalization;
+};
+
+struct mali_c720_rgb_scaler_regs {
+	struct mali_c720_reg_field hfilt_enable;
+	struct mali_c720_reg_field vfilt_enable;
+	struct mali_c720_reg_field hfilt_tincr;
+	struct mali_c720_reg_field hfilt_start_phase;
+	struct mali_c720_reg_field vfilt_tincr;
+	struct mali_c720_reg_field vfilt_start_phase;
+	struct mali_c720_reg_field hmem;
+	struct mali_c720_reg_field vmem;
+};
+
+struct mali_c720_crop_regs {
+	struct mali_c720_reg_field enable_crop;
+	struct mali_c720_reg_field start_x;
+	struct mali_c720_reg_field start_y;
+	struct mali_c720_reg_field size_x;
+	struct mali_c720_reg_field size_y;
+};
+
+struct mali_c720_out_format_regs {
+	struct mali_c720_reg_field coefft_11;
+	struct mali_c720_reg_field coefft_12;
+	struct mali_c720_reg_field coefft_13;
+	struct mali_c720_reg_field coefft_21;
+	struct mali_c720_reg_field coefft_22;
+	struct mali_c720_reg_field coefft_23;
+	struct mali_c720_reg_field coefft_31;
+	struct mali_c720_reg_field coefft_32;
+	struct mali_c720_reg_field coefft_33;
+	struct mali_c720_reg_field coefft_o1;
+	struct mali_c720_reg_field coefft_o2;
+	struct mali_c720_reg_field coefft_o3;
+	struct mali_c720_reg_field clip_min_y;
+	struct mali_c720_reg_field clip_max_y;
+	struct mali_c720_reg_field clip_min_uv;
+	struct mali_c720_reg_field clip_max_uv;
+};
+
+struct mali_c720_stat_color_stats_regs {
+	struct mali_c720_reg_field awb_stats_mode;
+	struct mali_c720_reg_field white_level_awb;
+	struct mali_c720_reg_field black_level_awb;
+	struct mali_c720_reg_field cr_ref_max_awb;
+	struct mali_c720_reg_field cr_ref_min_awb;
+	struct mali_c720_reg_field cb_ref_max_awb;
+	struct mali_c720_reg_field cb_ref_min_awb;
+	struct mali_c720_reg_field awb_nodes_used_horiz;
+	struct mali_c720_reg_field awb_nodes_used_vert;
+	struct mali_c720_reg_field cr_ref_high_awb;
+	struct mali_c720_reg_field cr_ref_low_awb;
+	struct mali_c720_reg_field cb_ref_high_awb;
+	struct mali_c720_reg_field cb_ref_low_awb;
+	struct mali_c720_reg_field awb_weight;
+};
+
+struct mali_c720_stat_histogram_regs {
+	struct mali_c720_reg_field skip_x;
+	struct mali_c720_reg_field skip_y;
+	struct mali_c720_reg_field offset_x;
+	struct mali_c720_reg_field offset_y;
+	struct mali_c720_reg_field scale_bottom;
+	struct mali_c720_reg_field scale_top;
+	struct mali_c720_reg_field plane_mode;
+	struct mali_c720_reg_field nodes_used_horiz;
+	struct mali_c720_reg_field nodes_used_vert;
+	struct mali_c720_reg_field weight;
+};
+
+struct mali_c720_modules_regs {
+	const struct mali_c720_decompander_regs *decompander;
+	const struct mali_c720_digital_gain_regs *inp_dgain;
+	const struct mali_c720_square_root_regs *square_root_a;
+	const struct mali_c720_black_level_regs *black_level;
+	const struct mali_c720_wb_gain_regs *wb_gain;
+	const struct mali_c720_square_regs *square_a;
+	const struct mali_c720_square_regs *square_b;
+	const struct mali_c720_square_root_regs *square_root_b;
+	const struct mali_c720_rgb_scaler_regs *rgb_scaler;
+	const struct mali_c720_crop_regs *crop;
+	const struct mali_c720_out_format_regs *out_format;
+	const struct mali_c720_stat_color_stats_regs *stat_color_stats;
+	const struct mali_c720_stat_histogram_regs *stat_histogram;
+};
+
+const struct mali_c720_modules_regs *mali_c720_get_modules_regs(void);
+
+#endif /* MALI_C720_REGISTERS_MODULES_H */
diff --git a/drivers/media/platform/arm/mali-c720/mali-c720-registers-top.c b/drivers/media/platform/arm/mali-c720/mali-c720-registers-top.c
new file mode 100644
index 0000000000000000000000000000000000000000..58cb63348337487fc355cc76c3cee6543021da69
--- /dev/null
+++ b/drivers/media/platform/arm/mali-c720/mali-c720-registers-top.c
@@ -0,0 +1,173 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * ARM Mali-C720 ISP Driver - Image signal processor
+ *
+ * Copyright (C) 2026 Arm Ltd
+ */
+
+#include <linux/bits.h>
+
+#include "mali-c720-registers-top.h"
+
+static const struct mali_c720_irq_regs irq_r0 = {
+	.cm_input_0_stream_3_cmsi_active_video = { .offset = 0x1020, .mask = BIT(30), .shift = 30 },
+	.cm_input_0_stream_2_cmsi_active_video = { .offset = 0x1020, .mask = BIT(22), .shift = 22 },
+	.cm_input_0_stream_1_cmsi_active_video = { .offset = 0x1020, .mask = BIT(14), .shift = 14 },
+	.cm_input_0_stream_0_cmsi_active_video = { .offset = 0x1020, .mask = BIT(6), .shift = 6 },
+	.cm_input_1_stream_3_cmsi_active_video = { .offset = 0x1030, .mask = BIT(30), .shift = 30 },
+	.cm_input_1_stream_2_cmsi_active_video = { .offset = 0x1030, .mask = BIT(22), .shift = 22 },
+	.cm_input_1_stream_1_cmsi_active_video = { .offset = 0x1030, .mask = BIT(14), .shift = 14 },
+	.cm_input_1_stream_0_cmsi_active_video = { .offset = 0x1030, .mask = BIT(6), .shift = 6 },
+	.cm_input_2_stream_3_cmsi_active_video = { .offset = 0x1040, .mask = BIT(30), .shift = 30 },
+	.cm_input_2_stream_2_cmsi_active_video = { .offset = 0x1040, .mask = BIT(22), .shift = 22 },
+	.cm_input_2_stream_1_cmsi_active_video = { .offset = 0x1040, .mask = BIT(14), .shift = 14 },
+	.cm_input_2_stream_0_cmsi_active_video = { .offset = 0x1040, .mask = BIT(6), .shift = 6 },
+	.cm_input_3_stream_3_cmsi_active_video = { .offset = 0x1050, .mask = BIT(30), .shift = 30 },
+	.cm_input_3_stream_2_cmsi_active_video = { .offset = 0x1050, .mask = BIT(22), .shift = 22 },
+	.cm_input_3_stream_1_cmsi_active_video = { .offset = 0x1050, .mask = BIT(14), .shift = 14 },
+	.cm_input_3_stream_0_cmsi_active_video = { .offset = 0x1050, .mask = BIT(6), .shift = 6 },
+	.cm_status_slot_15 = { .offset = 0x1060, .mask = BIT(15), .shift = 15 },
+	.cm_status_slot_14 = { .offset = 0x1060, .mask = BIT(14), .shift = 14 },
+	.cm_status_slot_13 = { .offset = 0x1060, .mask = BIT(13), .shift = 13 },
+	.cm_status_slot_12 = { .offset = 0x1060, .mask = BIT(12), .shift = 12 },
+	.cm_status_slot_11 = { .offset = 0x1060, .mask = BIT(11), .shift = 11 },
+	.cm_status_slot_10 = { .offset = 0x1060, .mask = BIT(10), .shift = 10 },
+	.cm_status_slot_9 = { .offset = 0x1060, .mask = BIT(9), .shift = 9 },
+	.cm_status_slot_8 = { .offset = 0x1060, .mask = BIT(8), .shift = 8 },
+	.cm_status_slot_7 = { .offset = 0x1060, .mask = BIT(7), .shift = 7 },
+	.cm_status_slot_6 = { .offset = 0x1060, .mask = BIT(6), .shift = 6 },
+	.cm_status_slot_5 = { .offset = 0x1060, .mask = BIT(5), .shift = 5 },
+	.cm_status_slot_4 = { .offset = 0x1060, .mask = BIT(4), .shift = 4 },
+	.cm_status_slot_3 = { .offset = 0x1060, .mask = BIT(3), .shift = 3 },
+	.cm_status_slot_2 = { .offset = 0x1060, .mask = BIT(2), .shift = 2 },
+	.cm_status_slot_1 = { .offset = 0x1060, .mask = BIT(1), .shift = 1 },
+	.cm_status_slot_0 = { .offset = 0x1060, .mask = BIT(0), .shift = 0 },
+};
+
+static const struct mali_c720_pre_cm_regs pre_cm_r0 = {
+	.tpg_0_splitter_sel = { .offset = 0x3200, .mask = GENMASK(1, 0), .shift = 0 },
+	.tpg_1_splitter_sel = { .offset = 0x3200, .mask = GENMASK(9, 8), .shift = 8 },
+	.input_0_mux_sel = { .offset = 0x3200, .mask = GENMASK(17, 16), .shift = 16 },
+	.input_1_mux_sel = { .offset = 0x3200, .mask = GENMASK(21, 20), .shift = 20 },
+	.input_2_mux_sel = { .offset = 0x3200, .mask = GENMASK(25, 24), .shift = 24 },
+	.input_3_mux_sel = { .offset = 0x3200, .mask = GENMASK(29, 28), .shift = 28 },
+};
+
+static const struct mali_c720_precm_tpg_regs precm_tpgs_r0 = {
+	.group = { .offset = 0x3280, .size = 0x80 },
+	.glbl_active_width = { .offset = 0x0, .mask = GENMASK(13, 0), .shift = 0 },
+	.glbl_active_height = { .offset = 0x0, .mask = GENMASK(29, 16), .shift = 16 },
+	.glbl_rggb_start = { .offset = 0x4, .mask = GENMASK(1, 0), .shift = 0 },
+	.test_pattern_off_on = { .offset = 0x8, .mask = BIT(0), .shift = 0 },
+	.generate_mode = { .offset = 0x8, .mask = BIT(4), .shift = 4 },
+	.frame_request = { .offset = 0x8, .mask = BIT(16), .shift = 16 },
+	.pattern_type = { .offset = 0x8, .mask = GENMASK(31, 24), .shift = 24 },
+	.horizontal_blanking = { .offset = 0x38, .mask = GENMASK(13, 0), .shift = 0 },
+	.vertical_blanking = { .offset = 0x3c, .mask = GENMASK(27, 0), .shift = 0 },
+};
+
+static const struct mali_c720_pipeline_regs pipeline_r0 = {
+	.frame_count = { .offset = 0x0, .mask = GENMASK(31, 0), .shift = 0 },
+	.active_width = { .offset = 0x4, .mask = GENMASK(13, 0), .shift = 0 },
+	.active_height = { .offset = 0x4, .mask = GENMASK(29, 16), .shift = 16 },
+	.rggb_start = { .offset = 0x8, .mask = GENMASK(1, 0), .shift = 0 },
+	.inp_remosaic_cv_mux_sel = { .offset = 0x18, .mask = BIT(0), .shift = 0 },
+	.inp_remosaic_ir0_mux_sel = { .offset = 0x18, .mask = BIT(1), .shift = 1 },
+	.inp_cv_mux_sel = { .offset = 0x18, .mask = GENMASK(4, 2), .shift = 2 },
+	.fr0_hv_cv_mux_sel = { .offset = 0x1c, .mask = BIT(0), .shift = 0 },
+	.fr1_hv_cv_mux_sel = { .offset = 0x1c, .mask = BIT(1), .shift = 1 },
+	.fr2_hv_cv_mux_sel = { .offset = 0x1c, .mask = BIT(2), .shift = 2 },
+	.fr3_hv_cv_mux_sel = { .offset = 0x1c, .mask = BIT(3), .shift = 3 },
+	.pyr_hv_cv_ir0_mux_sel = { .offset = 0x20, .mask = GENMASK(1, 0), .shift = 0 },
+	.fov_fr_mux_sel = { .offset = 0x24, .mask = GENMASK(2, 0), .shift = 0 },
+	.fov_raw_fr_mux_sel = { .offset = 0x24, .mask = BIT(3), .shift = 3 },
+	.raw_input_mux_sel = { .offset = 0x28, .mask = GENMASK(2, 0), .shift = 0 },
+	.af_stats_mux_sel = { .offset = 0x2c, .mask = BIT(0), .shift = 0 },
+	.color_stats_0_mux_sel = { .offset = 0x2c, .mask = BIT(1), .shift = 1 },
+	.color_stats_1_mux_sel = { .offset = 0x2c, .mask = BIT(2), .shift = 2 },
+	.histogram_0_mux_sel = { .offset = 0x2c, .mask = BIT(3), .shift = 3 },
+	.histogram_1_stream_mux_sel = { .offset = 0x2c, .mask = BIT(4), .shift = 4 },
+	.histogram_1_mux_sel = { .offset = 0x2c, .mask = BIT(5), .shift = 5 },
+	.histogram_2_mux_sel = { .offset = 0x2c, .mask = BIT(6), .shift = 6 },
+	.histogram_3_stream_mux_sel = { .offset = 0x2c, .mask = BIT(7), .shift = 7 },
+	.histogram_3_mux_sel = { .offset = 0x2c, .mask = BIT(8), .shift = 8 },
+	.histogram_4_mux_sel = { .offset = 0x2c, .mask = BIT(9), .shift = 9 },
+	.intensity_zone_1_mux_sel = { .offset = 0x2c, .mask = BIT(10), .shift = 10 },
+	.intensity_zone_3_mux_sel = { .offset = 0x2c, .mask = BIT(11), .shift = 11 },
+	.bypass_inp_decompander = { .offset = 0x30, .mask = BIT(0), .shift = 0 },
+	.bypass_inp_frame_stitch = { .offset = 0x30, .mask = BIT(1), .shift = 1 },
+	.bypass_inp_dgain = { .offset = 0x30, .mask = BIT(2), .shift = 2 },
+	.bypass_inp_square_root_a = { .offset = 0x30, .mask = BIT(3), .shift = 3 },
+	.bypass_inp_dpc = { .offset = 0x30, .mask = BIT(4), .shift = 4 },
+	.bypass_inp_remosaic = { .offset = 0x30, .mask = BIT(5), .shift = 5 },
+	.bypass_inp_cac = { .offset = 0x30, .mask = BIT(6), .shift = 6 },
+	.bypass_inp_temper = { .offset = 0x30, .mask = BIT(7), .shift = 7 },
+	.bypass_inp_sinter = { .offset = 0x30, .mask = BIT(8), .shift = 8 },
+	.bypass_hv_black_level = { .offset = 0x34, .mask = BIT(0), .shift = 0 },
+	.bypass_hv_wb_gain = { .offset = 0x34, .mask = BIT(1), .shift = 1 },
+	.bypass_hv_smart_shading = { .offset = 0x34, .mask = BIT(2), .shift = 2 },
+	.bypass_hv_raw_to_intensity = { .offset = 0x34, .mask = BIT(3), .shift = 3 },
+	.bypass_hv_dehaze = { .offset = 0x34, .mask = BIT(4), .shift = 4 },
+	.bypass_hv_dgain_iridix = { .offset = 0x34, .mask = BIT(5), .shift = 5 },
+	.bypass_hv_iridix = { .offset = 0x34, .mask = BIT(6), .shift = 6 },
+	.bypass_hv_square_a = { .offset = 0x34, .mask = BIT(7), .shift = 7 },
+	.bypass_hv_demosaic = { .offset = 0x34, .mask = BIT(8), .shift = 8 },
+	.bypass_hv_pf_correction = { .offset = 0x34, .mask = BIT(9), .shift = 9 },
+	.bypass_hv_square_b = { .offset = 0x34, .mask = BIT(10), .shift = 10 },
+	.bypass_hv_ccm = { .offset = 0x34, .mask = BIT(11), .shift = 11 },
+	.bypass_hv_square_root_b = { .offset = 0x34, .mask = BIT(12), .shift = 12 },
+	.bypass_hv_cnr = { .offset = 0x34, .mask = BIT(13), .shift = 13 },
+	.bypass_cv_black_level = { .offset = 0x38, .mask = BIT(0), .shift = 0 },
+	.bypass_cv_wb_gain = { .offset = 0x38, .mask = BIT(1), .shift = 1 },
+	.bypass_cv_smart_shading = { .offset = 0x38, .mask = BIT(2), .shift = 2 },
+	.bypass_cv_raw_to_intensity = { .offset = 0x38, .mask = BIT(3), .shift = 3 },
+	.bypass_cv_dehaze = { .offset = 0x38, .mask = BIT(4), .shift = 4 },
+	.bypass_cv_dgain_iridix = { .offset = 0x38, .mask = BIT(5), .shift = 5 },
+	.bypass_cv_iridix = { .offset = 0x38, .mask = BIT(6), .shift = 6 },
+	.bypass_cv_square_a = { .offset = 0x38, .mask = BIT(7), .shift = 7 },
+	.bypass_cv_demosaic_dfd = { .offset = 0x38, .mask = BIT(8), .shift = 8 },
+	.bypass_cv_square_b = { .offset = 0x38, .mask = BIT(9), .shift = 9 },
+	.bypass_cv_ccm = { .offset = 0x38, .mask = BIT(10), .shift = 10 },
+	.bypass_cv_square_root_b = { .offset = 0x38, .mask = BIT(11), .shift = 11 },
+	.bypass_cv_cnr = { .offset = 0x38, .mask = BIT(12), .shift = 12 },
+	.bypass_fr0_rgb_scaler = { .offset = 0x3c, .mask = BIT(0), .shift = 0 },
+	.bypass_fr1_rgb_scaler = { .offset = 0x3c, .mask = BIT(1), .shift = 1 },
+	.bypass_fr2_rgb_scaler = { .offset = 0x3c, .mask = BIT(2), .shift = 2 },
+	.bypass_fr3_rgb_scaler = { .offset = 0x3c, .mask = BIT(3), .shift = 3 },
+	.bypass_fr0_crop = { .offset = 0x40, .mask = BIT(0), .shift = 0 },
+	.bypass_fr0_rgb_sharpening = { .offset = 0x40, .mask = BIT(1), .shift = 1 },
+	.bypass_fr0_gain_and_offset = { .offset = 0x40, .mask = BIT(2), .shift = 2 },
+	.bypass_fr0_gamma = { .offset = 0x40, .mask = BIT(3), .shift = 3 },
+	.bypass_fr1_crop = { .offset = 0x44, .mask = BIT(0), .shift = 0 },
+	.bypass_fr1_rgb_sharpening = { .offset = 0x44, .mask = BIT(1), .shift = 1 },
+	.bypass_fr1_gain_and_offset = { .offset = 0x44, .mask = BIT(2), .shift = 2 },
+	.bypass_fr1_gamma = { .offset = 0x44, .mask = BIT(3), .shift = 3 },
+	.bypass_fr2_crop = { .offset = 0x48, .mask = BIT(0), .shift = 0 },
+	.bypass_fr2_rgb_sharpening = { .offset = 0x48, .mask = BIT(1), .shift = 1 },
+	.bypass_fr2_gain_and_offset = { .offset = 0x48, .mask = BIT(2), .shift = 2 },
+	.bypass_fr2_gamma = { .offset = 0x48, .mask = BIT(3), .shift = 3 },
+	.bypass_fr3_crop = { .offset = 0x4c, .mask = BIT(0), .shift = 0 },
+	.bypass_fr3_rgb_sharpening = { .offset = 0x4c, .mask = BIT(1), .shift = 1 },
+	.bypass_fr3_gain_and_offset = { .offset = 0x4c, .mask = BIT(2), .shift = 2 },
+	.bypass_fr3_gamma = { .offset = 0x4c, .mask = BIT(3), .shift = 3 },
+	.bypass_pyr_tc_lut = { .offset = 0x50, .mask = BIT(0), .shift = 0 },
+	.bypass_fov_crop_0 = { .offset = 0x54, .mask = BIT(0), .shift = 0 },
+	.bypass_fov_crop_1 = { .offset = 0x54, .mask = BIT(1), .shift = 1 },
+	.bypass_fov_crop_2 = { .offset = 0x54, .mask = BIT(2), .shift = 2 },
+	.bypass_raw_offset = { .offset = 0x58, .mask = BIT(0), .shift = 0 },
+	.bypass_raw_dgain = { .offset = 0x58, .mask = BIT(1), .shift = 1 },
+	.bypass_raw_tc_lut = { .offset = 0x58, .mask = BIT(2), .shift = 2 },
+	.bypass_raw_crop = { .offset = 0x58, .mask = BIT(3), .shift = 3 },
+};
+
+static const struct mali_c720_top_regs mali_c720_top_regs_r0 = {
+	.irq = &irq_r0,
+	.pre_cm = &pre_cm_r0,
+	.precm_tpgs = &precm_tpgs_r0,
+	.pipeline = &pipeline_r0,
+};
+
+const struct mali_c720_top_regs *mali_c720_get_top_regs(void)
+{
+	return &mali_c720_top_regs_r0;
+}
diff --git a/drivers/media/platform/arm/mali-c720/mali-c720-registers-top.h b/drivers/media/platform/arm/mali-c720/mali-c720-registers-top.h
new file mode 100644
index 0000000000000000000000000000000000000000..9ac853ad9eb902aead4cf551992f8f3b2ba8aa39
--- /dev/null
+++ b/drivers/media/platform/arm/mali-c720/mali-c720-registers-top.h
@@ -0,0 +1,228 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * ARM Mali-C720 ISP Driver - Image signal processor
+ *
+ * Copyright (C) 2026 Arm Ltd
+ */
+
+#ifndef MALI_C720_REGISTERS_TOP_H
+#define MALI_C720_REGISTERS_TOP_H
+
+#include "mali-c720-registers.h"
+
+struct mali_c720_irq_regs {
+	struct mali_c720_reg_field cm_input_0_stream_3_cmsi_active_video;
+	struct mali_c720_reg_field cm_input_0_stream_2_cmsi_active_video;
+	struct mali_c720_reg_field cm_input_0_stream_1_cmsi_active_video;
+	struct mali_c720_reg_field cm_input_0_stream_0_cmsi_active_video;
+	struct mali_c720_reg_field cm_input_1_stream_3_cmsi_active_video;
+	struct mali_c720_reg_field cm_input_1_stream_2_cmsi_active_video;
+	struct mali_c720_reg_field cm_input_1_stream_1_cmsi_active_video;
+	struct mali_c720_reg_field cm_input_1_stream_0_cmsi_active_video;
+	struct mali_c720_reg_field cm_input_2_stream_3_cmsi_active_video;
+	struct mali_c720_reg_field cm_input_2_stream_2_cmsi_active_video;
+	struct mali_c720_reg_field cm_input_2_stream_1_cmsi_active_video;
+	struct mali_c720_reg_field cm_input_2_stream_0_cmsi_active_video;
+	struct mali_c720_reg_field cm_input_3_stream_3_cmsi_active_video;
+	struct mali_c720_reg_field cm_input_3_stream_2_cmsi_active_video;
+	struct mali_c720_reg_field cm_input_3_stream_1_cmsi_active_video;
+	struct mali_c720_reg_field cm_input_3_stream_0_cmsi_active_video;
+	struct mali_c720_reg_field cm_status_slot_15;
+	struct mali_c720_reg_field cm_status_slot_14;
+	struct mali_c720_reg_field cm_status_slot_13;
+	struct mali_c720_reg_field cm_status_slot_12;
+	struct mali_c720_reg_field cm_status_slot_11;
+	struct mali_c720_reg_field cm_status_slot_10;
+	struct mali_c720_reg_field cm_status_slot_9;
+	struct mali_c720_reg_field cm_status_slot_8;
+	struct mali_c720_reg_field cm_status_slot_7;
+	struct mali_c720_reg_field cm_status_slot_6;
+	struct mali_c720_reg_field cm_status_slot_5;
+	struct mali_c720_reg_field cm_status_slot_4;
+	struct mali_c720_reg_field cm_status_slot_3;
+	struct mali_c720_reg_field cm_status_slot_2;
+	struct mali_c720_reg_field cm_status_slot_1;
+	struct mali_c720_reg_field cm_status_slot_0;
+};
+
+struct mali_c720_pre_cm_regs {
+	struct mali_c720_reg_field tpg_0_splitter_sel;
+	struct mali_c720_reg_field tpg_1_splitter_sel;
+	struct mali_c720_reg_field input_0_mux_sel;
+	struct mali_c720_reg_field input_1_mux_sel;
+	struct mali_c720_reg_field input_2_mux_sel;
+	struct mali_c720_reg_field input_3_mux_sel;
+};
+
+struct mali_c720_precm_tpg_regs {
+	struct mali_c720_group_regs group;
+	struct mali_c720_reg_field glbl_active_width;
+	struct mali_c720_reg_field glbl_active_height;
+	struct mali_c720_reg_field glbl_rggb_start;
+	struct mali_c720_reg_field test_pattern_off_on;
+	struct mali_c720_reg_field generate_mode;
+	struct mali_c720_reg_field frame_request;
+	struct mali_c720_reg_field pattern_type;
+	struct mali_c720_reg_field horizontal_blanking;
+	struct mali_c720_reg_field vertical_blanking;
+};
+
+struct mali_c720_pipeline_regs {
+	struct mali_c720_reg_field frame_count;
+	struct mali_c720_reg_field active_width;
+	struct mali_c720_reg_field active_height;
+	struct mali_c720_reg_field rggb_start;
+	struct mali_c720_reg_field inp_remosaic_cv_mux_sel;
+	struct mali_c720_reg_field inp_remosaic_ir0_mux_sel;
+	struct mali_c720_reg_field inp_cv_mux_sel;
+	struct mali_c720_reg_field fr0_hv_cv_mux_sel;
+	struct mali_c720_reg_field fr1_hv_cv_mux_sel;
+	struct mali_c720_reg_field fr2_hv_cv_mux_sel;
+	struct mali_c720_reg_field fr3_hv_cv_mux_sel;
+	struct mali_c720_reg_field pyr_hv_cv_ir0_mux_sel;
+	struct mali_c720_reg_field fov_fr_mux_sel;
+	struct mali_c720_reg_field fov_raw_fr_mux_sel;
+	struct mali_c720_reg_field raw_input_mux_sel;
+	struct mali_c720_reg_field af_stats_mux_sel;
+	struct mali_c720_reg_field color_stats_0_mux_sel;
+	struct mali_c720_reg_field color_stats_1_mux_sel;
+	struct mali_c720_reg_field histogram_0_mux_sel;
+	struct mali_c720_reg_field histogram_1_stream_mux_sel;
+	struct mali_c720_reg_field histogram_1_mux_sel;
+	struct mali_c720_reg_field histogram_2_mux_sel;
+	struct mali_c720_reg_field histogram_3_stream_mux_sel;
+	struct mali_c720_reg_field histogram_3_mux_sel;
+	struct mali_c720_reg_field histogram_4_mux_sel;
+	struct mali_c720_reg_field intensity_zone_1_mux_sel;
+	struct mali_c720_reg_field intensity_zone_3_mux_sel;
+	struct mali_c720_reg_field bypass_inp_decompander;
+	struct mali_c720_reg_field bypass_inp_frame_stitch;
+	struct mali_c720_reg_field bypass_inp_dgain;
+	struct mali_c720_reg_field bypass_inp_square_root_a;
+	struct mali_c720_reg_field bypass_inp_dpc;
+	struct mali_c720_reg_field bypass_inp_remosaic;
+	struct mali_c720_reg_field bypass_inp_cac;
+	struct mali_c720_reg_field bypass_inp_temper;
+	struct mali_c720_reg_field bypass_inp_sinter;
+	struct mali_c720_reg_field bypass_hv_black_level;
+	struct mali_c720_reg_field bypass_hv_wb_gain;
+	struct mali_c720_reg_field bypass_hv_smart_shading;
+	struct mali_c720_reg_field bypass_hv_raw_to_intensity;
+	struct mali_c720_reg_field bypass_hv_dehaze;
+	struct mali_c720_reg_field bypass_hv_dgain_iridix;
+	struct mali_c720_reg_field bypass_hv_iridix;
+	struct mali_c720_reg_field bypass_hv_square_a;
+	struct mali_c720_reg_field bypass_hv_demosaic;
+	struct mali_c720_reg_field bypass_hv_pf_correction;
+	struct mali_c720_reg_field bypass_hv_square_b;
+	struct mali_c720_reg_field bypass_hv_ccm;
+	struct mali_c720_reg_field bypass_hv_square_root_b;
+	struct mali_c720_reg_field bypass_hv_cnr;
+	struct mali_c720_reg_field bypass_cv_black_level;
+	struct mali_c720_reg_field bypass_cv_wb_gain;
+	struct mali_c720_reg_field bypass_cv_smart_shading;
+	struct mali_c720_reg_field bypass_cv_raw_to_intensity;
+	struct mali_c720_reg_field bypass_cv_dehaze;
+	struct mali_c720_reg_field bypass_cv_dgain_iridix;
+	struct mali_c720_reg_field bypass_cv_iridix;
+	struct mali_c720_reg_field bypass_cv_square_a;
+	struct mali_c720_reg_field bypass_cv_demosaic_dfd;
+	struct mali_c720_reg_field bypass_cv_square_b;
+	struct mali_c720_reg_field bypass_cv_ccm;
+	struct mali_c720_reg_field bypass_cv_square_root_b;
+	struct mali_c720_reg_field bypass_cv_cnr;
+	struct mali_c720_reg_field bypass_fr0_rgb_scaler;
+	struct mali_c720_reg_field bypass_fr1_rgb_scaler;
+	struct mali_c720_reg_field bypass_fr2_rgb_scaler;
+	struct mali_c720_reg_field bypass_fr3_rgb_scaler;
+	struct mali_c720_reg_field bypass_fr0_crop;
+	struct mali_c720_reg_field bypass_fr0_rgb_sharpening;
+	struct mali_c720_reg_field bypass_fr0_gain_and_offset;
+	struct mali_c720_reg_field bypass_fr0_gamma;
+	struct mali_c720_reg_field bypass_fr1_crop;
+	struct mali_c720_reg_field bypass_fr1_rgb_sharpening;
+	struct mali_c720_reg_field bypass_fr1_gain_and_offset;
+	struct mali_c720_reg_field bypass_fr1_gamma;
+	struct mali_c720_reg_field bypass_fr2_crop;
+	struct mali_c720_reg_field bypass_fr2_rgb_sharpening;
+	struct mali_c720_reg_field bypass_fr2_gain_and_offset;
+	struct mali_c720_reg_field bypass_fr2_gamma;
+	struct mali_c720_reg_field bypass_fr3_crop;
+	struct mali_c720_reg_field bypass_fr3_rgb_sharpening;
+	struct mali_c720_reg_field bypass_fr3_gain_and_offset;
+	struct mali_c720_reg_field bypass_fr3_gamma;
+	struct mali_c720_reg_field bypass_pyr_tc_lut;
+	struct mali_c720_reg_field bypass_fov_crop_0;
+	struct mali_c720_reg_field bypass_fov_crop_1;
+	struct mali_c720_reg_field bypass_fov_crop_2;
+	struct mali_c720_reg_field bypass_raw_offset;
+	struct mali_c720_reg_field bypass_raw_dgain;
+	struct mali_c720_reg_field bypass_raw_tc_lut;
+	struct mali_c720_reg_field bypass_raw_crop;
+};
+
+/* Register field encodings used by the R0 programming model. */
+enum mali_c720_top_fov_fr_mux_sel {
+	ISP_TOP_FOV_FR_MUX_SEL_FR0_GAMMA,
+	ISP_TOP_FOV_FR_MUX_SEL_FR0_OUT_FORMAT_444_FOV,
+	ISP_TOP_FOV_FR_MUX_SEL_FR1_GAMMA,
+	ISP_TOP_FOV_FR_MUX_SEL_FR1_OUT_FORMAT_444_FOV,
+	ISP_TOP_FOV_FR_MUX_SEL_FR2_GAMMA,
+	ISP_TOP_FOV_FR_MUX_SEL_FR2_OUT_FORMAT_444_FOV,
+	ISP_TOP_FOV_FR_MUX_SEL_FR3_GAMMA,
+	ISP_TOP_FOV_FR_MUX_SEL_FR3_OUT_FORMAT_444_FOV,
+};
+
+enum mali_c720_top_fov_raw_fr_mux_sel {
+	ISP_TOP_FOV_RAW_FR_MUX_SEL_RAW_TC_LUT,
+	ISP_TOP_FOV_RAW_FR_MUX_SEL_FOV_FR_MUX,
+};
+
+enum mali_c720_top_fr0_hv_cv_mux_sel {
+	ISP_TOP_FR0_HV_CV_MUX_SEL_HV,
+	ISP_TOP_FR0_HV_CV_MUX_SEL_CV,
+};
+
+enum mali_c720_top_inp_cv_mux_sel {
+	ISP_TOP_INP_CV_MUX_SEL_SQRT_A,
+	ISP_TOP_INP_CV_MUX_SEL_REMOSAIC_CV,
+	ISP_TOP_INP_CV_MUX_SEL_CAC,
+	ISP_TOP_INP_CV_MUX_SEL_TEMPER,
+	ISP_TOP_INP_CV_MUX_SEL_SINTER,
+};
+
+enum mali_c720_top_inp_remosaic_cv_mux_sel {
+	ISP_TOP_INP_REMOSAIC_CV_MUX_SEL_REMOSAIC_IR_FULL,
+	ISP_TOP_INP_REMOSAIC_CV_MUX_SEL_REMOSAIC_IR_QUARTER,
+};
+
+enum mali_c720_top_inp_remosaic_ir0_mux_sel {
+	ISP_TOP_INP_REMOSAIC_IR0_MUX_SEL_REMOSAIC_IR_FULL,
+	ISP_TOP_INP_REMOSAIC_IR0_MUX_SEL_REMOSAIC_IR_QUARTER,
+};
+
+enum mali_c720_top_pyr_hv_cv_ir0_mux_sel {
+	ISP_TOP_PYR_HV_CV_IR0_MUX_SEL_HV,
+	ISP_TOP_PYR_HV_CV_IR0_MUX_SEL_CV,
+	ISP_TOP_PYR_HV_CV_IR0_MUX_SEL_REMOSAIC_IR0,
+};
+
+enum mali_c720_top_raw_input_mux_sel {
+	ISP_TOP_RAW_INPUT_MUX_SEL_IN0,
+	ISP_TOP_RAW_INPUT_MUX_SEL_DECOMPANDER,
+	ISP_TOP_RAW_INPUT_MUX_SEL_SQRT_A,
+	ISP_TOP_RAW_INPUT_MUX_SEL_CV_SQUARE_A,
+	ISP_TOP_RAW_INPUT_MUX_SEL_HV_SQUARE_A,
+	ISP_TOP_RAW_INPUT_MUX_SEL_REMOSAIC_IR0,
+};
+
+struct mali_c720_top_regs {
+	const struct mali_c720_irq_regs *irq;
+	const struct mali_c720_pre_cm_regs *pre_cm;
+	const struct mali_c720_precm_tpg_regs *precm_tpgs;
+	const struct mali_c720_pipeline_regs *pipeline;
+};
+
+const struct mali_c720_top_regs *mali_c720_get_top_regs(void);
+
+#endif /* MALI_C720_REGISTERS_TOP_H */
diff --git a/drivers/media/platform/arm/mali-c720/mali-c720-registers.c b/drivers/media/platform/arm/mali-c720/mali-c720-registers.c
new file mode 100644
index 0000000000000000000000000000000000000000..d6a731e9c1fa6e9b1579fd53a14c2eb45894f070
--- /dev/null
+++ b/drivers/media/platform/arm/mali-c720/mali-c720-registers.c
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * ARM Mali-C720 ISP Driver - Image signal processor
+ *
+ * Copyright (C) 2026 Arm Ltd
+ */
+
+#include <linux/bits.h>
+#include <linux/errno.h>
+
+#include "mali-c720-common.h"
+
+static const struct mali_c720_id_regs id_regs = {
+	.pid4 = { .offset = 0xfd0, .mask = GENMASK(31, 0), .shift = 0 },
+	.pid4_des_2 = { .offset = 0xfd0, .mask = GENMASK(3, 0), .shift = 0 },
+	.pid0 = { .offset = 0xfe0, .mask = GENMASK(31, 0), .shift = 0 },
+	.pid0_part_0 = { .offset = 0xfe0, .mask = GENMASK(7, 0), .shift = 0 },
+	.pid1 = { .offset = 0xfe4, .mask = GENMASK(31, 0), .shift = 0 },
+	.pid1_part_1 = { .offset = 0xfe4, .mask = GENMASK(3, 0), .shift = 0 },
+	.pid1_des_0 = { .offset = 0xfe4, .mask = GENMASK(7, 4), .shift = 4 },
+	.pid2 = { .offset = 0xfe8, .mask = GENMASK(31, 0), .shift = 0 },
+	.pid2_des_1 = { .offset = 0xfe8, .mask = GENMASK(2, 0), .shift = 0 },
+	.pid2_revision = { .offset = 0xfe8, .mask = GENMASK(7, 4), .shift = 4 },
+	.pid3 = { .offset = 0xfec, .mask = GENMASK(31, 0), .shift = 0 },
+	.pid3_cmod = { .offset = 0xfec, .mask = GENMASK(3, 0), .shift = 0 },
+	.pid3_revand = { .offset = 0xfec, .mask = GENMASK(7, 4), .shift = 4 },
+	.cid0_prmbl_0 = { .offset = 0xff0, .mask = GENMASK(7, 0), .shift = 0 },
+	.cid1_prmbl_1 = { .offset = 0xff4, .mask = GENMASK(3, 0), .shift = 0 },
+	.cid1_class = { .offset = 0xff4, .mask = GENMASK(7, 4), .shift = 4 },
+	.cid2_prmbl_2 = { .offset = 0xff8, .mask = GENMASK(7, 0), .shift = 0 },
+	.cid3_prmbl_3 = { .offset = 0xffc, .mask = GENMASK(7, 0), .shift = 0 },
+};
+
+const struct mali_c720_id_regs *mali_c720_get_id_regs(void)
+{
+	return &id_regs;
+}
+
+int mali_c720_get_registers(struct mali_c720_registers *regs)
+{
+	*regs = (struct mali_c720_registers) {
+		.id = &id_regs,
+		.top = mali_c720_get_top_regs(),
+		.cm = mali_c720_get_ctx_mgr_regs(),
+		.modules = mali_c720_get_modules_regs(),
+		.context_offset = 0x80000,
+		.context_size = 0x100000,
+	};
+	return 0;
+}
diff --git a/drivers/media/platform/arm/mali-c720/mali-c720-registers.h b/drivers/media/platform/arm/mali-c720/mali-c720-registers.h
new file mode 100644
index 0000000000000000000000000000000000000000..288bd168be41c8569f79ff147c919c7daceaa039
--- /dev/null
+++ b/drivers/media/platform/arm/mali-c720/mali-c720-registers.h
@@ -0,0 +1,81 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * ARM Mali-C720 ISP Driver - Image signal processor
+ *
+ * Copyright (C) 2026 Arm Ltd
+ */
+
+#ifndef MALI_C720_REGISTERS_H
+#define MALI_C720_REGISTERS_H
+
+#include <linux/types.h>
+
+struct mali_c720_top_regs;
+struct mali_c720_ctx_mgr_regs;
+struct mali_c720_modules_regs;
+
+struct mali_c720_reg_field {
+	u32 offset;
+	u32 mask;
+	u8 shift;
+};
+
+struct mali_c720_id_regs {
+	struct mali_c720_reg_field pid4;
+	struct mali_c720_reg_field pid4_des_2;
+	struct mali_c720_reg_field pid0;
+	struct mali_c720_reg_field pid0_part_0;
+	struct mali_c720_reg_field pid1;
+	struct mali_c720_reg_field pid1_part_1;
+	struct mali_c720_reg_field pid1_des_0;
+	struct mali_c720_reg_field pid2;
+	struct mali_c720_reg_field pid2_des_1;
+	struct mali_c720_reg_field pid2_revision;
+	struct mali_c720_reg_field pid3;
+	struct mali_c720_reg_field pid3_cmod;
+	struct mali_c720_reg_field pid3_revand;
+	struct mali_c720_reg_field cid0_prmbl_0;
+	struct mali_c720_reg_field cid1_prmbl_1;
+	struct mali_c720_reg_field cid1_class;
+	struct mali_c720_reg_field cid2_prmbl_2;
+	struct mali_c720_reg_field cid3_prmbl_3;
+};
+
+struct mali_c720_group_regs {
+	u32 offset;
+	u32 size;
+};
+
+struct mali_c720_registers {
+	const struct mali_c720_id_regs *id;
+	const struct mali_c720_top_regs *top;
+	const struct mali_c720_ctx_mgr_regs *cm;
+	const struct mali_c720_modules_regs *modules;
+	u32 context_offset;
+	u32 context_size;
+};
+
+const struct mali_c720_id_regs *mali_c720_get_id_regs(void);
+int mali_c720_get_registers(struct mali_c720_registers *regs);
+
+static inline u32 mali_c720_reg_addr(u32 base, const struct mali_c720_reg_field *field)
+{
+	return base + field->offset;
+}
+
+static inline u32 mali_c720_reg_mask(const struct mali_c720_reg_field *field)
+{
+	return field->mask;
+}
+
+static inline u8 mali_c720_reg_shift(const struct mali_c720_reg_field *field)
+{
+	return field->shift;
+}
+
+static inline u32 mali_c720_group_base(const struct mali_c720_group_regs *group, unsigned int index)
+{
+	return group->offset + index * group->size;
+}
+
+#endif /* MALI_C720_REGISTERS_H */

-- 
2.55.0

