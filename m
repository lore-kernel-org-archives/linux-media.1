Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793449993;
	b=e4xYRU8gddDPXs2923c+SjvsFs87FCiKobIqTdTOI9dM4SVTrrXoBYpdNb4i4Qrqpi8R
	 nK/w7U6ePxNVuU7e1VYv/Z4R3mtWsDmCQKycDciHSO+3RIPNfEvc01oM7Yajsn4CT9Spk
	 FAUgNdh45H2CRauWYBTUdjmhe+/vyNJJgaEEM9CbPZ/AXBlKY/wh4nWI9z5rWqlCjjPm8
	 hGHEROELIqUV1fdT3dVHQcOLYgeW5LCVa730ZYzaot+Uun4QToyl92rCTZ0scv2N9h6xj
	 qYGF4lIeChS0cuh00GeMrFfmZUkKu1ngvLmB7VwgfsIEMey3liIMfjR0uVkDQernwzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793449993;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=pfjpRQLj6SjvV41a0/nWW3gf4p4OlD0OuiKSKVjxjZk=;
	b=sykU0ctoarKpGsPHSo58+K6iuX4dBGBZmxyD5Q4iDjAGE3xLiIRQqid5CXtIDYVinFI+
	 tVx0yIL126AEHNiKmWF5z7mF4+5z5DkO4jkXzfLUmheC/80F1TFd08Y3nKBTwVZ/X0Q8u
	 1yQN+nn+I1RWcGeGnbp0tzSZbbmOAz8nrx2DS3HpgLWIudkNvxpc7FltBLVspI9CRPjwB
	 RI0KxupAn2RdkIKF0KsIeUAoCvA3339bcLDbX7EEKqsdnFbxzlloIP5ssILxDSAuoqjeX
	 zbLk9SO7/fgedqNaa62hF/UItqAjz1oUVIkz1Zi5pc+oPQc9uFt4ParwC8o719x/m4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=emaup7a4zfdjrasoczetsmtkyq.protonmail2 header.b="suN9/hyK";
	arc=none smtp.remote-ip=185.70.43.19
Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch [185.70.43.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A0C606A31A
	for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 12:33:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25A0C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=emaup7a4zfdjrasoczetsmtkyq.protonmail2 header.b=suN9/hyK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=emaup7a4zfdjrasoczetsmtkyq.protonmail2; t=1793449989;
	x=1793709189; bh=pfjpRQLj6SjvV41a0/nWW3gf4p4OlD0OuiKSKVjxjZk=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=suN9/hyK/wfB1r/Ee5u5NSX/3MbxZPiriozHM9Bg0fxb1Z69xscp1fndFg5e+BCwx
	 /XPCBz3jZQp/IdXJtSL1Z3M+jyc41Ty7UJ5OaX0jNuzTlRW37YkxQHgl+eIp5t/pny
	 s5iFErDdMkFHXB7OytfFacTGKhDEvb5yV6G76SaejoWoY6jJM43KC25BFvGiJjFTT3
	 GaeRrTt8NnqbbN5JoFpkFMM9GvFQeF8KV9E9tWSZKV/y1P7E31imDXAcdQorUEu23S
	 OX0dEFikxysPDaCPsLHfdjhCkCdqB5rDvHcVcIATQ6JEWWIhzmWGj6JxTQxfCyhyd5
	 hJdyCfK9MPCBA==
Date: Sat, 31 Oct 2026 12:33:05 +0000
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From: Ruslan Bay <ruslanbey@proton.me>
Cc: Antti Laakso <antti.laakso@linux.intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Ricardo Ribalda <ribalda@chromium.org>, Andreas Helbech Kleist <andreaskleist@gmail.com>, "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, "tfiga@chromium.org" <tfiga@chromium.org>, "senozhatsky@chromium.org" <senozhatsky@chromium.org>, "claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>, "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>
Subject: [RFC PATCH v2 04/12] media: ipu6: Add IPU4P ISYS firmware ABI definitions
Message-ID: <qJpspBAWzqglGBR73yrjsGpt-xP4GhpO-73O__h9kLQEoqcTFymSrOlMxiG45wqdn8KmRxM6nkpNwuatbAl8IVltCj991siWcK_CbCpru4Q=@proton.me>
Feedback-ID: 183606634:user:proton
X-Pm-Message-ID: 9c0f6b2063d7e531ceca7350435c2b9364b78e77
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Define the IPU4P ISYS firmware message types, queue tokens and data
structures.

Signed-off-by: Ruslan Bay <ruslanbey@proton.me>
---
 drivers/media/pci/intel/ipu6/ipu4p-fw-isys.h | 398 +++++++++++++++++++
 1 file changed, 398 insertions(+)
 create mode 100644 drivers/media/pci/intel/ipu6/ipu4p-fw-isys.h

diff --git a/drivers/media/pci/intel/ipu6/ipu4p-fw-isys.h b/drivers/media/p=
ci/intel/ipu6/ipu4p-fw-isys.h
new file mode 100644
index 00000000000..d2d5962b218
--- /dev/null
+++ b/drivers/media/pci/intel/ipu6/ipu4p-fw-isys.h
@@ -0,0 +1,398 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (C) 2026 Intel Corporation */
+
+#ifndef IPU4P_FW_ISYS_H
+#define IPU4P_FW_ISYS_H
+
+#include <linux/build_bug.h>
+#include <linux/stddef.h>
+#include <linux/types.h>
+
+#define IPU4P_ISYS_MAX_STREAMS=09=09=098U
+#define IPU4P_MAX_IPINS=09=09=09=094U
+#define IPU4P_MAX_OPINS=09=09=09=096U
+#define IPU4P_NOF_SRAM_BLOCKS_MAX=09=098U
+#define IPU4P_DEV_SEND_QUEUE_SIZE=09=098U
+#define IPU4P_ISYS_SIZE_RECV_QUEUE=09=0940U
+#define IPU4P_ISYS_SIZE_SEND_QUEUE=09=0940U
+#define IPU4P_ISYS_SIZE_PROXY_RECV_QUEUE=095U
+#define IPU4P_ISYS_SIZE_PROXY_SEND_QUEUE=095U
+#define IPU4P_ISYS_OPEN_RETRY=09=09=092000
+#define IPU4P_ISYS_CLOSE_RETRY=09=09=092000
+
+#define IPU4P_BASE_PROXY_SEND_QUEUES=09=090U
+#define IPU4P_BASE_DEV_SEND_QUEUES=09=091U
+#define IPU4P_BASE_MSG_SEND_QUEUES=09=092U
+#define IPU4P_BASE_PROXY_RECV_QUEUES=09=090U
+#define IPU4P_BASE_MSG_RECV_QUEUES=09=091U
+#define IPU4P_N_MAX_RECV_QUEUES=09=09=092U
+
+#define IPU4P_ISYS_CROPPING_LOCATION_MAX=094U
+#define IPU4P_ISYS_RESOLUTION_INFO_MAX=09=092U
+
+enum ipu4p_fw_isys_resp_type {
+=09IPU4P_FW_ISYS_RESP_TYPE_STREAM_OPEN_DONE =3D 0,
+=09IPU4P_FW_ISYS_RESP_TYPE_STREAM_START_ACK,
+=09IPU4P_FW_ISYS_RESP_TYPE_STREAM_START_AND_CAPTURE_ACK,
+=09IPU4P_FW_ISYS_RESP_TYPE_STREAM_CAPTURE_ACK,
+=09IPU4P_FW_ISYS_RESP_TYPE_STREAM_STOP_ACK,
+=09IPU4P_FW_ISYS_RESP_TYPE_STREAM_FLUSH_ACK,
+=09IPU4P_FW_ISYS_RESP_TYPE_STREAM_CLOSE_ACK,
+=09IPU4P_FW_ISYS_RESP_TYPE_PIN_DATA_READY,
+=09IPU4P_FW_ISYS_RESP_TYPE_PIN_DATA_WATERMARK,
+=09IPU4P_FW_ISYS_RESP_TYPE_FRAME_SOF,
+=09IPU4P_FW_ISYS_RESP_TYPE_FRAME_EOF,
+=09IPU4P_FW_ISYS_RESP_TYPE_STREAM_START_AND_CAPTURE_DONE,
+=09IPU4P_FW_ISYS_RESP_TYPE_STREAM_CAPTURE_DONE,
+=09IPU4P_FW_ISYS_RESP_TYPE_PIN_DATA_SKIPPED,
+=09IPU4P_FW_ISYS_RESP_TYPE_STREAM_CAPTURE_SKIPPED,
+=09IPU4P_FW_ISYS_RESP_TYPE_FRAME_SOF_DISCARDED,
+=09IPU4P_FW_ISYS_RESP_TYPE_FRAME_EOF_DISCARDED,
+=09IPU4P_FW_ISYS_RESP_TYPE_STATS_DATA_READY,
+=09N_IPU4P_FW_ISYS_RESP_TYPE
+};
+
+enum ipu4p_fw_isys_send_type {
+=09IPU4P_FW_ISYS_SEND_TYPE_STREAM_OPEN =3D 0,
+=09IPU4P_FW_ISYS_SEND_TYPE_STREAM_START,
+=09IPU4P_FW_ISYS_SEND_TYPE_STREAM_START_AND_CAPTURE,
+=09IPU4P_FW_ISYS_SEND_TYPE_STREAM_CAPTURE,
+=09IPU4P_FW_ISYS_SEND_TYPE_STREAM_STOP,
+=09IPU4P_FW_ISYS_SEND_TYPE_STREAM_FLUSH,
+=09IPU4P_FW_ISYS_SEND_TYPE_STREAM_CLOSE,
+=09N_IPU4P_FW_ISYS_SEND_TYPE
+};
+
+enum ipu4p_fw_isys_queue_type {
+=09IPU4P_FW_ISYS_QUEUE_TYPE_PROXY =3D 0,
+=09IPU4P_FW_ISYS_QUEUE_TYPE_DEV,
+=09IPU4P_FW_ISYS_QUEUE_TYPE_MSG,
+=09N_IPU4P_FW_ISYS_QUEUE_TYPE
+};
+
+enum ipu4p_fw_isys_stream_source {
+=09IPU4P_FW_ISYS_STREAM_SRC_PORT_0 =3D 0,
+=09IPU4P_FW_ISYS_STREAM_SRC_PORT_1,
+=09IPU4P_FW_ISYS_STREAM_SRC_PORT_2,
+=09IPU4P_FW_ISYS_STREAM_SRC_PORT_3,
+=09IPU4P_FW_ISYS_STREAM_SRC_PORT_4,
+=09IPU4P_FW_ISYS_STREAM_SRC_PORT_5,
+=09IPU4P_FW_ISYS_STREAM_SRC_PORT_6,
+=09IPU4P_FW_ISYS_STREAM_SRC_PORT_7,
+=09IPU4P_FW_ISYS_STREAM_SRC_PORT_8,
+=09IPU4P_FW_ISYS_STREAM_SRC_PORT_9,
+=09IPU4P_FW_ISYS_STREAM_SRC_PORT_10,
+=09IPU4P_FW_ISYS_STREAM_SRC_PORT_11,
+=09IPU4P_FW_ISYS_STREAM_SRC_PORT_12,
+=09IPU4P_FW_ISYS_STREAM_SRC_PORT_13,
+=09IPU4P_FW_ISYS_STREAM_SRC_PORT_14,
+=09IPU4P_FW_ISYS_STREAM_SRC_PORT_15,
+=09IPU4P_FW_ISYS_STREAM_SRC_MIPIGEN_0,
+=09IPU4P_FW_ISYS_STREAM_SRC_MIPIGEN_1,
+=09IPU4P_FW_ISYS_STREAM_SRC_MIPIGEN_2,
+=09IPU4P_FW_ISYS_STREAM_SRC_MIPIGEN_3,
+=09IPU4P_FW_ISYS_STREAM_SRC_MIPIGEN_4,
+=09IPU4P_FW_ISYS_STREAM_SRC_MIPIGEN_5,
+=09IPU4P_FW_ISYS_STREAM_SRC_MIPIGEN_6,
+=09IPU4P_FW_ISYS_STREAM_SRC_MIPIGEN_7,
+=09IPU4P_FW_ISYS_STREAM_SRC_MIPIGEN_8,
+=09IPU4P_FW_ISYS_STREAM_SRC_MIPIGEN_9,
+=09N_IPU4P_FW_ISYS_STREAM_SRC
+};
+
+enum ipu4p_fw_isys_mipi_vc {
+=09IPU4P_FW_ISYS_MIPI_VC_0 =3D 0,
+=09IPU4P_FW_ISYS_MIPI_VC_1,
+=09IPU4P_FW_ISYS_MIPI_VC_2,
+=09IPU4P_FW_ISYS_MIPI_VC_3,
+=09N_IPU4P_FW_ISYS_MIPI_VC
+};
+
+enum ipu4p_fw_isys_frame_format_type {
+=09IPU4P_FW_ISYS_FRAME_FORMAT_NV11 =3D 0,
+=09IPU4P_FW_ISYS_FRAME_FORMAT_NV12,
+=09IPU4P_FW_ISYS_FRAME_FORMAT_NV12_16,
+=09IPU4P_FW_ISYS_FRAME_FORMAT_NV12_TILEY,
+=09IPU4P_FW_ISYS_FRAME_FORMAT_NV16,
+=09IPU4P_FW_ISYS_FRAME_FORMAT_NV21,
+=09IPU4P_FW_ISYS_FRAME_FORMAT_NV61,
+=09IPU4P_FW_ISYS_FRAME_FORMAT_YV12,
+=09IPU4P_FW_ISYS_FRAME_FORMAT_YV16,
+=09IPU4P_FW_ISYS_FRAME_FORMAT_YUV420,
+=09IPU4P_FW_ISYS_FRAME_FORMAT_YUV420_10,
+=09IPU4P_FW_ISYS_FRAME_FORMAT_YUV420_12,
+=09IPU4P_FW_ISYS_FRAME_FORMAT_YUV420_14,
+=09IPU4P_FW_ISYS_FRAME_FORMAT_YUV420_16,
+=09IPU4P_FW_ISYS_FRAME_FORMAT_YUV422,
+=09IPU4P_FW_ISYS_FRAME_FORMAT_YUV422_16,
+=09IPU4P_FW_ISYS_FRAME_FORMAT_UYVY,
+=09IPU4P_FW_ISYS_FRAME_FORMAT_YUYV,
+=09IPU4P_FW_ISYS_FRAME_FORMAT_YUV444,
+=09IPU4P_FW_ISYS_FRAME_FORMAT_YUV_LINE,
+=09IPU4P_FW_ISYS_FRAME_FORMAT_RAW8,
+=09IPU4P_FW_ISYS_FRAME_FORMAT_RAW10,
+=09IPU4P_FW_ISYS_FRAME_FORMAT_RAW12,
+=09IPU4P_FW_ISYS_FRAME_FORMAT_RAW14,
+=09IPU4P_FW_ISYS_FRAME_FORMAT_RAW16,
+=09IPU4P_FW_ISYS_FRAME_FORMAT_RGB565,
+=09IPU4P_FW_ISYS_FRAME_FORMAT_PLANAR_RGB888,
+=09IPU4P_FW_ISYS_FRAME_FORMAT_RGBA888,
+=09IPU4P_FW_ISYS_FRAME_FORMAT_QPLANE6,
+=09IPU4P_FW_ISYS_FRAME_FORMAT_BINARY_8,
+=09N_IPU4P_FW_ISYS_FRAME_FORMAT
+};
+
+enum ipu4p_fw_isys_mipi_data_type {
+=09IPU4P_FW_ISYS_MIPI_DATA_TYPE_FRAME_START_CODE =3D 0x00,
+=09IPU4P_FW_ISYS_MIPI_DATA_TYPE_FRAME_END_CODE =3D 0x01,
+=09IPU4P_FW_ISYS_MIPI_DATA_TYPE_LINE_START_CODE =3D 0x02,
+=09IPU4P_FW_ISYS_MIPI_DATA_TYPE_LINE_END_CODE =3D 0x03,
+=09IPU4P_FW_ISYS_MIPI_DATA_TYPE_EMBEDDED =3D 0x12,
+=09IPU4P_FW_ISYS_MIPI_DATA_TYPE_YUV420_8 =3D 0x18,
+=09IPU4P_FW_ISYS_MIPI_DATA_TYPE_YUV420_10 =3D 0x19,
+=09IPU4P_FW_ISYS_MIPI_DATA_TYPE_YUV422_8 =3D 0x1e,
+=09IPU4P_FW_ISYS_MIPI_DATA_TYPE_YUV422_10 =3D 0x1f,
+=09IPU4P_FW_ISYS_MIPI_DATA_TYPE_RGB_565 =3D 0x22,
+=09IPU4P_FW_ISYS_MIPI_DATA_TYPE_RGB_888 =3D 0x24,
+=09IPU4P_FW_ISYS_MIPI_DATA_TYPE_RAW_6 =3D 0x28,
+=09IPU4P_FW_ISYS_MIPI_DATA_TYPE_RAW_7 =3D 0x29,
+=09IPU4P_FW_ISYS_MIPI_DATA_TYPE_RAW_8 =3D 0x2a,
+=09IPU4P_FW_ISYS_MIPI_DATA_TYPE_RAW_10 =3D 0x2b,
+=09IPU4P_FW_ISYS_MIPI_DATA_TYPE_RAW_12 =3D 0x2c,
+=09IPU4P_FW_ISYS_MIPI_DATA_TYPE_RAW_14 =3D 0x2d,
+=09IPU4P_FW_ISYS_MIPI_DATA_TYPE_RAW_16 =3D 0x2e,
+=09IPU4P_FW_ISYS_MIPI_DATA_TYPE_USER_DEF1 =3D 0x30,
+=09IPU4P_FW_ISYS_MIPI_DATA_TYPE_USER_DEF2 =3D 0x31,
+=09IPU4P_FW_ISYS_MIPI_DATA_TYPE_USER_DEF3 =3D 0x32,
+=09IPU4P_FW_ISYS_MIPI_DATA_TYPE_USER_DEF4 =3D 0x33,
+=09IPU4P_FW_ISYS_MIPI_DATA_TYPE_USER_DEF5 =3D 0x34,
+=09IPU4P_FW_ISYS_MIPI_DATA_TYPE_USER_DEF6 =3D 0x35,
+=09IPU4P_FW_ISYS_MIPI_DATA_TYPE_USER_DEF7 =3D 0x36,
+=09IPU4P_FW_ISYS_MIPI_DATA_TYPE_USER_DEF8 =3D 0x37,
+=09N_IPU4P_FW_ISYS_MIPI_DATA_TYPE =3D 0x40
+};
+
+enum ipu4p_fw_isys_pin_type {
+=09IPU4P_FW_ISYS_PIN_TYPE_MIPI =3D 0,
+=09IPU4P_FW_ISYS_PIN_TYPE_RAW_NS,
+=09IPU4P_FW_ISYS_PIN_TYPE_RAW_S,
+=09IPU4P_FW_ISYS_PIN_TYPE_RAW_SOC,
+=09IPU4P_FW_ISYS_PIN_TYPE_METADATA_0,
+=09IPU4P_FW_ISYS_PIN_TYPE_METADATA_1,
+=09IPU4P_FW_ISYS_PIN_TYPE_AWB_STATS,
+=09IPU4P_FW_ISYS_PIN_TYPE_AF_STATS,
+=09IPU4P_FW_ISYS_PIN_TYPE_HIST_STATS,
+=09IPU4P_FW_ISYS_PIN_TYPE_PAF_FF,
+=09N_IPU4P_FW_ISYS_PIN_TYPE
+};
+
+enum ipu4p_fw_isys_isl_use {
+=09IPU4P_FW_ISYS_USE_NO_ISL_NO_ISA =3D 0,
+};
+
+enum ipu4p_fw_isys_mipi_store_mode {
+=09IPU4P_FW_ISYS_MIPI_STORE_MODE_NORMAL =3D 0,
+=09IPU4P_FW_ISYS_MIPI_STORE_MODE_DISCARD_LONG_HEADER,
+=09N_IPU4P_FW_ISYS_MIPI_STORE_MODE
+};
+
+enum ipu4p_fw_isys_link_id {
+=09IPU4P_FW_ISYS_LINK_OFFLINE =3D 0,
+=09IPU4P_FW_ISYS_LINK_MAIN_OUTPUT =3D 1,
+=09IPU4P_FW_ISYS_LINK_PDAF_OUTPUT =3D 2,
+=09N_IPU4P_FW_ISYS_LINK_ID
+};
+
+enum ipu4p_fw_isys_error {
+=09IPU4P_FW_ISYS_ERROR_NONE =3D 0,
+=09IPU4P_FW_ISYS_ERROR_FW_INTERNAL_CONSISTENCY,
+=09IPU4P_FW_ISYS_ERROR_HW_CONSISTENCY,
+=09IPU4P_FW_ISYS_ERROR_DRIVER_INVALID_COMMAND_SEQUENCE,
+=09IPU4P_FW_ISYS_ERROR_DRIVER_INVALID_DEVICE_CONFIGURATION,
+=09IPU4P_FW_ISYS_ERROR_DRIVER_INVALID_STREAM_CONFIGURATION,
+=09IPU4P_FW_ISYS_ERROR_DRIVER_INVALID_FRAME_CONFIGURATION,
+=09IPU4P_FW_ISYS_ERROR_INSUFFICIENT_RESOURCES,
+=09IPU4P_FW_ISYS_ERROR_HW_REPORTED_STR2MMIO,
+=09IPU4P_FW_ISYS_ERROR_HW_REPORTED_SIG2CIO,
+=09IPU4P_FW_ISYS_ERROR_SENSOR_FW_SYNC,
+=09IPU4P_FW_ISYS_ERROR_STREAM_IN_SUSPENSION,
+=09IPU4P_FW_ISYS_ERROR_RESPONSE_QUEUE_FULL,
+=09N_IPU4P_FW_ISYS_ERROR
+};
+
+enum ipu4p_fw_proxy_error {
+=09IPU4P_FW_PROXY_ERROR_NONE =3D 0,
+=09IPU4P_FW_PROXY_ERROR_INVALID_WRITE_REGION,
+=09IPU4P_FW_PROXY_ERROR_INVALID_WRITE_OFFSET,
+=09N_IPU4P_FW_PROXY_ERROR
+};
+
+struct ipu4p_fw_isys_resolution {
+=09u32 width;
+=09u32 height;
+};
+
+struct ipu4p_fw_isys_isa_cfg {
+=09struct ipu4p_fw_isys_resolution
+=09=09isa_res[IPU4P_ISYS_RESOLUTION_INFO_MAX];
+=09u32 cfg_fields;
+};
+
+struct ipu4p_fw_isys_cropping {
+=09s32 top_offset;
+=09s32 left_offset;
+=09s32 bottom_offset;
+=09s32 right_offset;
+};
+
+struct ipu4p_fw_isys_input_pin_info {
+=09struct ipu4p_fw_isys_resolution input_res;
+=09u8 dt;
+=09u8 mipi_store_mode;
+=09u8 bits_per_pix;
+=09u8 mapped_dt;
+};
+
+/**
+ * struct ipu4p_fw_isys_output_pin_info - IPU4P output pin configuration
+ *
+ * Unlike the IPU6 ABI, IPU4P ends this structure at reserve_compression;
+ * snoopable and sensor_type are not part of the IPU4P firmware wire forma=
t.
+ *
+ * @link_id: PPG link; zero selects offline capture
+ */
+struct ipu4p_fw_isys_output_pin_info {
+=09struct ipu4p_fw_isys_resolution output_res;
+=09u32 stride;
+=09u32 watermark_in_lines;
+=09u32 payload_buf_size;
+=09u8 send_irq;
+=09u8 input_pin_id;
+=09u8 pt;
+=09u8 ft;
+=09u8 link_id;
+=09u8 reserve_compression;
+};
+
+struct ipu4p_fw_isys_stream_cfg {
+=09/* Preserve the firmware ABI slot; ISA is disabled by this driver. */
+=09struct ipu4p_fw_isys_isa_cfg isa_cfg;
+=09struct ipu4p_fw_isys_cropping crop[IPU4P_ISYS_CROPPING_LOCATION_MAX];
+=09struct ipu4p_fw_isys_input_pin_info input_pins[IPU4P_MAX_IPINS];
+=09struct ipu4p_fw_isys_output_pin_info output_pins[IPU4P_MAX_OPINS];
+=09u32 compfmt;
+=09u8 nof_input_pins;
+=09u8 nof_output_pins;
+=09u8 send_irq_sof_discarded;
+=09u8 send_irq_eof_discarded;
+=09u8 send_resp_sof_discarded;
+=09u8 send_resp_eof_discarded;
+=09u8 src;
+=09u8 vc;
+=09u8 isl_use;
+};
+
+struct ipu4p_fw_isys_output_pin_payload {
+=09u64 out_buf_id;
+=09u32 addr;
+=09u32 compress;
+};
+
+struct ipu4p_fw_isys_param_pin {
+=09u64 param_buf_id;
+=09u32 addr;
+};
+
+struct ipu4p_fw_isys_frame_buff_set {
+=09struct ipu4p_fw_isys_output_pin_payload
+=09=09output_pins[IPU4P_MAX_OPINS];
+=09struct ipu4p_fw_isys_param_pin process_group_light;
+=09u8 send_irq_sof;
+=09u8 send_irq_eof;
+=09u8 send_irq_capture_ack;
+=09u8 send_irq_capture_done;
+=09u8 send_resp_sof;
+=09u8 send_resp_eof;
+=09u8 frame_counter;
+};
+
+struct ipu4p_fw_isys_error_info {
+=09u32 error;
+=09u32 error_details;
+};
+
+struct ipu4p_fw_isys_resp_info {
+=09u64 buf_id;
+=09struct ipu4p_fw_isys_output_pin_payload pin;
+=09struct ipu4p_fw_isys_param_pin process_group_light;
+=09struct ipu4p_fw_isys_error_info error_info;
+=09u32 timestamp[2];
+=09u8 stream_handle;
+=09u8 type;
+=09u8 pin_id;
+=09u8 acc_id;
+=09u8 frame_counter;
+=09u8 written_direct;
+};
+
+struct ipu4p_fw_isys_proxy_error_info {
+=09u32 error;
+=09u32 error_details;
+};
+
+struct ipu4p_fw_isys_proxy_resp_info {
+=09u32 request_id;
+=09struct ipu4p_fw_isys_proxy_error_info error_info;
+};
+
+struct ipu4p_fw_isys_send_token {
+=09u64 buf_handle;
+=09u32 payload;
+=09u16 send_type;
+=09u16 stream_id;
+};
+
+struct ipu4p_fw_isys_recv_token {
+=09struct ipu4p_fw_isys_resp_info resp_info;
+};
+
+struct ipu4p_fw_isys_proxy_send_token {
+=09u32 request_id;
+=09u32 region_index;
+=09u32 offset;
+=09u32 value;
+};
+
+struct ipu4p_fw_isys_proxy_recv_token {
+=09struct ipu4p_fw_isys_proxy_resp_info proxy_resp_info;
+};
+
+struct ipu4p_fw_isys_buffer_partition {
+=09u32 num_gda_pages[IPU4P_ISYS_MAX_STREAMS];
+};
+
+struct ipu4p_fw_isys_fw_config {
+=09struct ipu4p_fw_isys_buffer_partition buffer_partition;
+=09u32 num_send_queues[N_IPU4P_FW_ISYS_QUEUE_TYPE];
+=09u32 num_recv_queues[N_IPU4P_FW_ISYS_QUEUE_TYPE];
+};
+
+/* Keep these assertions in sync with the IPU4P firmware ABI. */
+static_assert(sizeof(struct ipu4p_fw_isys_output_pin_payload) =3D=3D 16);
+static_assert(offsetof(struct ipu4p_fw_isys_output_pin_payload, addr) =3D=
=3D 8);
+static_assert(sizeof(struct ipu4p_fw_isys_send_token) =3D=3D 16);
+static_assert(offsetof(struct ipu4p_fw_isys_send_token, payload) =3D=3D 8)=
;
+static_assert(sizeof(struct ipu4p_fw_isys_output_pin_info) =3D=3D 28);
+static_assert(offsetof(struct ipu4p_fw_isys_output_pin_info, link_id) =3D=
=3D 24);
+static_assert(offsetof(struct ipu4p_fw_isys_output_pin_info,
+=09=09       reserve_compression) =3D=3D 25);
+static_assert(sizeof(struct ipu4p_fw_isys_stream_cfg) =3D=3D 316);
+static_assert(offsetof(struct ipu4p_fw_isys_stream_cfg, output_pins) =3D=
=3D 132);
+static_assert(offsetof(struct ipu4p_fw_isys_stream_cfg, compfmt) =3D=3D 30=
0);
+static_assert(offsetof(struct ipu4p_fw_isys_stream_cfg, src) =3D=3D 310);
+static_assert(offsetof(struct ipu4p_fw_isys_frame_buff_set,
+=09=09       process_group_light) =3D=3D 96);
+static_assert(offsetof(struct ipu4p_fw_isys_resp_info,
+=09=09       process_group_light) =3D=3D 24);
+
+#endif /* IPU4P_FW_ISYS_H */
--=20
2.56.0


