Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792737592;
	b=IAju4T0QGFujQGan8wBcJmBt0BlVuxIyu2XVmADCzkTgZE5+tMkbcYVn3ruq5TN2H/98
	 pnB0PpC1TSaWFQ2KbTscR1dgeaaYBrdgTIHlx7OEl+yQF6z0b5J+qTTk3MwzqJlODzWFU
	 h0k663gIdGemrOMtK5RxXIAZ1MXsOf73xxRss7AAygru6OczEccmJ+t6leQt2saSkEG2U
	 sMT4eaukV95X/4d6XYunHwgoe/O5cYwt5p13i1f7Au1XLqaEy8plR2sEO5RIzBPkxRl4E
	 JDzfhjzvaKgzKs0ymU5BwyxWanjlTYpnfqIOiGndDcoUYOhfmMnZzg4HF44rZYSAlJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792737592;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=+kWBOdNA2CLKnF7HvCdhEAOcKVb/1PjdN+3pUhazcPM=;
	b=MylrywlKla12ncFJ9PsaCOiKnJR9HG4/0yTQpVjBz5CmcNIxK3PwUESM2YmGOK2TACH1
	 bG87GPRVfFR39AOybLVlVwh9SiSK4Xo7Z4fIj4pPey8gghfSeQq8aMb+WCRtuCWJRF37E
	 FSAKPWNYdnaydrBdM0B+HGw/ViNYhZ0zaEmB5gDEffGcp4kNihHAWJuMmRMNHmbKDcTct
	 l3Re6ekDFB0pDtAGrutZqmekTF/xbm2D32xG9BdeWMASOUFoIMOQ64GDTPLwJh6yrrZgW
	 v1QgljdScNfnllhmoiWdfnLvET8QXkd4QpF7mfZ8KwFiqi2lvsV7X/BaztmNvY+88iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FMd9z65R;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A0E606A324
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 06:39:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81A0E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FMd9z65R
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso407326f8f.2
        for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 23:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792737590; x=1793342390; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+kWBOdNA2CLKnF7HvCdhEAOcKVb/1PjdN+3pUhazcPM=;
        b=FMd9z65RUUHdjWakeOsijZeOImEUCgbnmOCqjd2u+NxgLR64dJfW1HN6kCLtlObDaZ
         3gtCQX8lRUBhtNzTUvy9XaEkuUNDyyLrKMG1GWoljw/M8HI4TfrM15wIEHyfOx4k4vaf
         s1y5qTL8XTGeh9cZ2uz2lyjn/dOcoHM+LU9X5qIjG9b+39sLBRC6kKmMR9aqc0AFu0es
         ysyGNh6iy3PnWaR8YfVTNUsTiwjs3qeOHS6+qR+Vs2xT6qJ4vsLRLqlkjHa55mhi0/4K
         Tv+Bz3wiphVv8fvw8QKRAXlaphr8i67XRzLB/L8mvviQBlbY3CuBIxy9+JxZQUu9rRPG
         rC7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737590; x=1793342390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+kWBOdNA2CLKnF7HvCdhEAOcKVb/1PjdN+3pUhazcPM=;
        b=zmCkG1GopebX5fvh8EX0LZRv69uU36d0wANIKSNGxtDnSQ6ocSABQmvyImsuF85Zi7
         aALnsUG3sg4/FFtbmq4748T3yEmFvr/eOulA92dg2sJ2CdpCDafn+0ltk+2bztIsEhBC
         +qyVQVffUpcxOFFo+kmmVCeBqMLdBGFAjmbw4IbtMa4JGjLBpPDnRke5KGG8XIQcSoy5
         tYsgQ8Z50nwkxWGgucCkeqA2ztAgaUasX6Olrn2KEPZYjwmV3FwNUalk1gDY91lTjdJR
         PmTs2pGbQsO4qzcPN52yK1zDz5xIFZlDylEmvyEHBMKA96fh1W1adVkamnCQ3FfgWCOS
         nirw==
X-Forwarded-Encrypted: i=1; AKwUvBzwQPLOXyXtf+9+rTrzMMKniLTDEggaPhhAY7PNNO33FwsJhJnqkp1odTxT2b8Ch6httKV/XUl6hUqkTQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ82R95xlHttWi1Embb7Bknwjx1gYCN2ZGiXyvKEnQEm/8UP5Wi
	lo4lWjBrDob6FO0jwEeH46wFVjr36B8JFfnzNcAk1QqztHHzH32R5UlP
X-Gm-Gg: AYBFou2zIOLJ6xCErO0ESzCGGr1zT9MghKTGg4pL63QPhlmRoBFbYgm+YDjxSfK2SMO
	JW7Ek3dBEwxdw1ljDCRyVsMbr+F8YT2lVvPSK4jwnoTmVQxtalBXxGsNwH73Co8kxzIyOzwWWn5
	Uj/KxcouFTYC0u9ePujTjgfD3G+GsjgeWHAFFCj0ut5nGU8ItWSxqwCO07cAo6V20JRJxZyQi68
	AZC72PH9nN3ulx9yDyzKjqx6poUbzhSE72BuV8QDB3guKug2Cl+i8+k9w3/7fwUWEFspS4dyt1h
	6IhtKlZCE1WfEoiNNLXMpXcLepWnWa4bUfvr8LA6L41NiYfWsEwk84l+cbsEmP2GfQhYNEjEIUX
	V0ZTKgwxbAng372U7ksoeEL09exrk9O3/jUlZyv31G2uyDqhH5CRSwqrXEQR9bjzeFKRAR4IWUO
	Bia7Ha8PxgsxfFiE71IxDVCNBDx9ZC0GBQm02LZRKTeKHhlxyA7kKwKPBtiH3iyEFGvwquHu2bn
	ArwPK6NIXEDt+cwk0/2PMdq6Ay9BLqhFYml96XyWOyBOSNnfCoU8JOrAiKBjKD/NWqlwOtrGPih
	xQbz7hRt2tiz7eakPnPNkEjIxFNFzJ39cDfSP/MZc+9stph9tze38RbuYKCY7j16doWDfKT1gJ6
	7v/g=
X-Received: by 2002:a5d:5f45:0:b0:48e:37dc:7ff8 with SMTP id ffacd0b85a97d-48e385a74dcmr1543864f8f.22.1792737589779;
        Thu, 22 Oct 2026 23:39:49 -0700 (PDT)
Received: from [192.168.1.22] (cst-prg-49-173.cust.vodafone.cz. [46.135.49.173])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38030c47sm3104782f8f.21.2026.10.22.23.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:39:48 -0700 (PDT)
From: Tomeu Vizoso <tomeu.vizoso@gmail.com>
X-Google-Original-From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 23 Oct 2026 08:39:29 +0200
Subject: [PATCH v3 04/16] accel/thames: Add header with IPC definitions
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
Message-Id: <20261023-thames-v3-4-3ab40aa17157@tomeuvizoso.net>
References: <20261023-thames-v3-0-3ab40aa17157@tomeuvizoso.net>
In-Reply-To: <20261023-thames-v3-0-3ab40aa17157@tomeuvizoso.net>
To: Nishanth Menon <nm@ti.com>, "Andrew F. Davis" <afd@ti.com>, 
 Randolph Sapp <rs@ti.com>, Jonathan Humphreys <j-humphreys@ti.com>, 
 Andrei Aldea <a-aldea@ti.com>, Chirag Shilwant <c-shilwant@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Beleswar Padhi <b-padhi@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Robert Nelson <robertcnelson@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Markus Elfring <Markus.Elfring@web.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Suman Anna <s-anna@ti.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 linux-remoteproc@vger.kernel.org, linux-hardening@vger.kernel.org
X-Mailer: b4 0.15.2

This header defines constants and structs used by both the kernel driver
and the firmware for communication.

It is versioned following Sound Open Firmware's conventions with some
measures to avoid having to increase the major (incompatible) version.

An identical copy is in the firmware's code.

Every structure is laid out on 128-byte lines, the coherence line of
the C7x, with the words the host writes and the words the firmware
writes on different lines. The Ring has 64 entries and a fault record
per entry; the Context table has 64 entries, the ASID width the
firmware reports permitting. The Kernels' stack and save area sit at a
fixed address in every Context, above 1 TiB, so the firmware's user-mode
entry needs no per-Context setup. The host writes a random challenge
into the Ring and the firmware echoes it in the handshake, which tells
this boot's handshake from one an earlier firmware left in the memory.

Assisted-by: LLM
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

---

v3:
- Initial version.
---
 drivers/accel/thames/thames_abi.h | 238 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 238 insertions(+)

diff --git a/drivers/accel/thames/thames_abi.h b/drivers/accel/thames/thames_abi.h
new file mode 100644
index 000000000000..8f8b8323f747
--- /dev/null
+++ b/drivers/accel/thames/thames_abi.h
@@ -0,0 +1,238 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
+/* Copyright (C) 2026 Texas Instruments Incorporated - https://www.ti.com/ */
+#ifndef __THAMES_ABI_H__
+#define __THAMES_ABI_H__
+
+/* Shared with the firmware, whose copy is byte-equal. */
+#ifdef __KERNEL__
+#include <linux/types.h>
+#include <linux/stddef.h>
+#include <linux/build_bug.h>
+#else
+#include <stdint.h>
+#include <stddef.h>
+typedef uint8_t __u8;
+typedef uint16_t __u16;
+typedef uint32_t __u32;
+typedef uint64_t __u64;
+#endif
+
+#ifndef THAMES_ABI_ASSERT
+#ifdef __KERNEL__
+#define THAMES_ABI_ASSERT(expr, msg) static_assert(expr, msg)
+#else
+#define THAMES_ABI_ASSERT(expr, msg) _Static_assert(expr, msg)
+#endif
+#endif
+
+/*
+ * The kernel driver refuses a firmware whose major differs; a newer minor on
+ * either side is accepted.  A field appended under a minor reads zero from an
+ * older firmware, which means "not reported".
+ */
+#define THAMES_ABI_MAJOR	1
+#define THAMES_ABI_MINOR	0
+#define THAMES_ABI_PATCH	0
+
+#define THAMES_ABI_VERSION \
+	((THAMES_ABI_MAJOR << 24) | (THAMES_ABI_MINOR << 12) | THAMES_ABI_PATCH)
+
+#define THAMES_ABI_VERSION_MAJOR(version)	(((version) >> 24) & 0xff)
+#define THAMES_ABI_VERSION_MINOR(version)	(((version) >> 12) & 0xfff)
+#define THAMES_ABI_VERSION_PATCH(version)	((version) & 0xfff)
+
+/*
+ * No coherence line holds both a field the kernel driver writes and one the
+ * firmware writes.
+ */
+#define THAMES_ABI_LINE_SIZE	128
+
+#define THAMES_RING_DEPTH	64
+#define THAMES_MAX_CONTEXTS	64
+
+/*
+ * The save page sits on an 8 KiB boundary: TCSP keeps a nesting count in bits
+ * 16:13 and reserves bits 12:0 (SPRUIP0 3.7.49.2, Table 3-76).
+ */
+#define THAMES_USER_REGION_BASE		0x10000000000ull
+#define THAMES_USER_REGION_SIZE		0x200000ull
+#define THAMES_USER_SAVE_AREA_BASE	(THAMES_USER_REGION_BASE + 0x2000ull)
+#define THAMES_USER_SAVE_AREA_SIZE	0x2000ull
+#define THAMES_USER_STACK_BASE		(THAMES_USER_REGION_BASE + 0x5000ull)
+#define THAMES_USER_STACK_SIZE		0x1000ull
+
+/*
+ * The uAPI's fault kinds, register indexes and hardware IDs, for the firmware,
+ * which cannot include the uAPI header.
+ */
+#define THAMES_FAULT_KIND_KERNEL	1u
+#define THAMES_FAULT_KIND_FIRMWARE	2u
+#define THAMES_FAULT_KIND_TIMEOUT	3u
+
+#define THAMES_FAULT_REG_IERR		0
+#define THAMES_FAULT_REG_IEAR		1
+#define THAMES_FAULT_REG_IESR		2
+#define THAMES_FAULT_REG_NRP		3
+#define THAMES_FAULT_REG_NTSR		4
+#define THAMES_FAULT_REG_SE0_FAR	5
+#define THAMES_FAULT_REG_SE0_FSR	6
+#define THAMES_FAULT_REG_SE1_FAR	7
+#define THAMES_FAULT_REG_SE1_FSR	8
+#define THAMES_FAULT_REGISTERS		9
+
+#define THAMES_HW_J722S_C7524		1u
+
+/*
+ * Written by the firmware at boot.  Its loop then copies the Ring's challenge
+ * into challenge_echo, which tells this boot's handshake from one an earlier
+ * firmware left in the IPC memory.
+ *
+ * @ipc_address: the address the firmware was linked for.
+ * @dru_kernel_channel_first: the first of the dru_channel_count channels a
+ *	Job's transfers name, all on one page of the DRU's real-time registers;
+ *	the firmware's own channels are on another.
+ */
+struct thames_handshake {
+	__u32 abi_version;
+	__u32 l2_size;
+	__u64 ipc_address;
+	__u32 dru_channel_count;
+	__u32 dru_queue_depth;
+	__u32 asid_bits;
+	__u32 hardware_id;
+	__u32 dru_channel_stride;
+	__u32 dru_kernel_channel_first;
+	__u32 timestamp_hz;
+	__u32 pad;
+	__u64 challenge_echo;
+	__u64 dru_capabilities;
+	__u32 transfer_table_pool_size;
+	__u8 reserved[2 * THAMES_ABI_LINE_SIZE - 68];
+};
+THAMES_ABI_ASSERT(sizeof(struct thames_handshake) == 2 * THAMES_ABI_LINE_SIZE,
+		  "handshake must be two coherence lines");
+
+/*
+ * The firmware invalidates the core's TLB before a Job whose entry's
+ * mapping_generation differs from the one it last honoured.  The page tables
+ * take io-pgtable-arm's attribute indexes for ARM_64_LPAE_S1: 0 non-cacheable,
+ * 1 cacheable, 2 device.
+ */
+struct thames_context_entry {
+	__u64 page_table_base;
+	__u64 mapping_generation;
+	__u32 asid;
+	__u8 reserved[THAMES_ABI_LINE_SIZE - 20];
+};
+THAMES_ABI_ASSERT(sizeof(struct thames_context_entry) == THAMES_ABI_LINE_SIZE,
+		  "context entry must be one coherence line");
+
+/*
+ * SPRUIL1D 10.4.3.3; physical addresses: the DRU does not translate through
+ * the core's MMU.
+ */
+struct thames_dru_record {
+	__u32 words[16];
+};
+THAMES_ABI_ASSERT(sizeof(struct thames_dru_record) == 64, "a DRU record is 64 bytes");
+
+/*
+ * The groups are an array of __u16, each entry the number of transfers in its
+ * group, the groups consecutive in the table's order.
+ */
+#define THAMES_TRANSFER_TABLE_CHANNELS_OFFSET(transfer_count)	((transfer_count) * 64u)
+#define THAMES_TRANSFER_TABLE_GROUPS_OFFSET(transfer_count) \
+	((transfer_count) * 64u + (((transfer_count) + 7u) & ~7u))
+#define THAMES_TRANSFER_TABLE_SIZE(transfer_count, group_count) \
+	((THAMES_TRANSFER_TABLE_GROUPS_OFFSET(transfer_count) + (group_count) * 2u + \
+	  THAMES_ABI_LINE_SIZE - 1u) & ~(THAMES_ABI_LINE_SIZE - 1u))
+
+/*
+ * @context_serial: a change makes the firmware clear what the last Context left
+ *	in the core.
+ * @timeout_ms: 0 is no device timeout.
+ */
+struct thames_ring_host {
+	__u32 context_id;
+	__u32 transfer_count;
+	__u64 seqno;
+	__u64 program_dsp_va;
+	__u64 params_dsp_va;
+	__u64 context_serial;
+	__u32 transfer_table_offset;
+	__u32 transfer_group_count;
+	__u32 timeout_ms;
+	__u8 reserved[THAMES_ABI_LINE_SIZE - 52];
+};
+THAMES_ABI_ASSERT(sizeof(struct thames_ring_host) == THAMES_ABI_LINE_SIZE,
+		  "ring host half must be one coherence line");
+
+/*
+ * Stamps in ticks of the handshake's timestamp_hz; zero when no Kernel ran, and
+ * the Kernel's end stamp also when it faulted or timed out.
+ */
+struct thames_ring_fw {
+	__u64 doorbell_seen_stamp;
+	__u64 run_start_stamp;
+	__u64 run_end_stamp;
+	__u64 fence_value;
+	__u64 kernel_entry_stamp;
+	__u64 kernel_exit_stamp;
+	__u8 reserved[THAMES_ABI_LINE_SIZE - 48];
+};
+THAMES_ABI_ASSERT(sizeof(struct thames_ring_fw) == THAMES_ABI_LINE_SIZE,
+		  "ring firmware half must be one coherence line");
+
+struct thames_ring_entry {
+	struct thames_ring_host host;
+	struct thames_ring_fw fw;
+};
+THAMES_ABI_ASSERT(sizeof(struct thames_ring_entry) ==
+		  sizeof(struct thames_ring_host) + THAMES_ABI_LINE_SIZE, "");
+
+struct thames_ring {
+	__u32 tail;
+	__u32 pad;
+	__u64 challenge;
+	__u8 tail_pad[THAMES_ABI_LINE_SIZE - 16];
+	__u32 head;
+	__u8 head_pad[THAMES_ABI_LINE_SIZE - sizeof(__u32)];
+	struct thames_ring_entry entries[THAMES_RING_DEPTH];
+};
+
+struct thames_fence {
+	__u64 seqno;
+	__u8 reserved[THAMES_ABI_LINE_SIZE - 8];
+};
+THAMES_ABI_ASSERT(sizeof(struct thames_fence) == THAMES_ABI_LINE_SIZE,
+		  "fence must be one coherence line");
+
+/* The fence_value of a failed or refused Job; the Fence still advances past it. */
+#define THAMES_FENCE_ERROR	(~(__u64)0)
+
+/* @seqno tells a record from one an earlier Job left in the same Ring slot. */
+struct thames_fault_record {
+	__u32 kind;
+	__u32 pad;
+	__u64 seqno;
+	__u64 registers[THAMES_FAULT_REGISTERS];
+	__u8 reserved[THAMES_ABI_LINE_SIZE - 88];
+};
+THAMES_ABI_ASSERT(sizeof(struct thames_fault_record) == THAMES_ABI_LINE_SIZE,
+		  "fault record must be one coherence line");
+
+/*
+ * The handshake's transfer_table_pool_size bytes follow the fixed part.  The
+ * IPC memory is mapped in no Context, so a Kernel cannot change a transfer
+ * record after the kernel driver checked it.
+ */
+struct thames_ipc {
+	struct thames_handshake handshake;
+	struct thames_context_entry context_table[THAMES_MAX_CONTEXTS];
+	struct thames_ring ring;
+	struct thames_fence fence;
+	struct thames_fault_record fault_records[THAMES_RING_DEPTH];
+	__u8 transfer_table_pool[];
+};
+
+#endif /* __THAMES_ABI_H__ */

-- 
2.54.0

