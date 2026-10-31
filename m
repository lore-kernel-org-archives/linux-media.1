Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.103
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793450094;
	b=UQqisXGXzt1GEg4YLWmcL4dYxEIMXNvndLEGTjGemIjl/1HedhRUf3vgMdw+yX2WlYHt
	 hANPVu61L67SkxbZ6gGHLBMST2rs1v84tzsaK3Jxl21koqf7pVmxLMjwFDAseG4JKHogj
	 Rkk5Ii6ExbpqvXhbKXWnuuZ3U0oFsE3YPp5JOvkifWJPaxPBA3h916yTE3JkhHbMYENaw
	 mVM57O33CDHUbDjnLK+Gnsq3nulwZOBH1UWwdD13bVrPZVga/NNc6IfQLcu+IRhn79fOA
	 4UrSQVFmcnNuUEU/+th45aT1fk+rq/RjsHSUDaj8U8ihoYLyQaxEg8PQCYNe6fnjZqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793450094;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=v+t4TcfYIxv3yGZVVecyp/ynY/r3hKQNsH2Vq96RZB4=;
	b=FqoOx9EutGcJW/8ec8PDSVbSUren3uro+burZu8/42Zb+Jn8IEcBZYLMzvKEzJcJyb7C
	 GUP+63Su87Ai/P1jmcRoLx6IA3mpLpL5WRDxiK0v8ZqEuBK5DXHShvWNISXiQkWI54WKQ
	 lRagQLDgiXwTUm8XNVVxyaPafffj/1lz8VCeJQfAGKuSfC+UpKKOvqRh/5BgKmVxeDd6T
	 TvE6STQBHnyFlG6tjraMrwtPGqIeXeTuKM0nfujemgtdmf0Rd1ZAKiTB3xj5PI+7YNzXv
	 9JwKWvW3JAjgieiEgto/61mwqp4lX12+b0cMi4dsi1y01Xf6X3P0CPa1bfBN2KN8imQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=TKHW8ZMD;
	arc=none smtp.remote-ip=79.135.106.103
Received: from mail-106103.protonmail.ch (mail-106103.protonmail.ch [79.135.106.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A57606A31A
	for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 12:34:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27A57606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=TKHW8ZMD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1793450089; x=1793709289;
	bh=v+t4TcfYIxv3yGZVVecyp/ynY/r3hKQNsH2Vq96RZB4=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=TKHW8ZMD4V5xtY6PfV03oKsJBPzPQUv5Sy4itNSCShhef7VxAmh35E//uOy2XNecM
	 Q1O6nnYRw7qR/79vXycYryZKRuDZFza9mrvMnT19O4fwKtwnIDb3kWuU343FRpIXwT
	 2GNmJK6eJIMhifMaRLJi9rREuLZMB3dMMrCohBUeMwgn4B8Tgu0lV+zR2qaW8wzXqV
	 OffX9/F7Iob8NvCDjAoWaUyQyNCLALNDgDiwfVg4e2b7p5Cd5AjKfZU2xclhAhxv0X
	 D6xY4jIZVfvUySFS30bjIY6r831P+t9FqZ2r015yPBHpg9teC9IK4ZqS9QKWnhLXuj
	 Kzk6a7+c9xDSA==
Date: Sat, 31 Oct 2026 12:34:43 +0000
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From: Ruslan Bay <ruslanbey@proton.me>
Cc: Antti Laakso <antti.laakso@linux.intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Ricardo Ribalda <ribalda@chromium.org>, Andreas Helbech Kleist <andreaskleist@gmail.com>, "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, "tfiga@chromium.org" <tfiga@chromium.org>, "senozhatsky@chromium.org" <senozhatsky@chromium.org>, "claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>, "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>
Subject: [RFC PATCH v2 06/12] media: ipu6: Add firmware-specific ISYS response dispatch
Message-ID: <B4M1vUVEJG-bpgpO3B_4JKq2KUnJn56WFxEbA8byH4SjqblOQWrnG-O2WAzY-PnwccdL03yZzjS8VfD1CsZ-FFyQXbrpN3eB1K13Cp_o_Ok=@proton.me>
Feedback-ID: 183606634:user:proton
X-Pm-Message-ID: 6b60c3b003cb72e2a62988d555a0347af32ca8ba
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

Route ISYS response dequeueing through firmware-specific operations
while keeping response handling shared.

Allow the common handler to skip message-buffer release when required
by the firmware's buffer ownership rules.

Signed-off-by: Ruslan Bay <ruslanbey@proton.me>
---
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c | 55 +++++++++++++--------
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.h |  4 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.h    |  1 +
 3 files changed, 39 insertions(+), 21 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c b/drivers/media/pc=
i/intel/ipu6/ipu6-fw-isys.c
index 56bb67869bd..c6066e37ef5 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
@@ -531,20 +531,17 @@ static u32 resp_type_to_index(int type)
 =09return  ARRAY_SIZE(fw_msg) - 1;
 }
=20
-int ipu6_isys_isr_one(struct ipu6_bus_device *adev)
+void ipu6_isys_handle_response(struct ipu6_bus_device *adev,
+=09=09=09       struct ipu6_fw_isys_resp_info_abi *resp,
+=09=09=09       bool release_msg_buf)
 {
 =09struct ipu6_isys *isys =3D ipu6_bus_get_drvdata(adev);
-=09struct ipu6_fw_isys_resp_info_abi *resp;
 =09struct ipu6_isys_stream *stream;
 =09struct ipu6_isys_csi2 *csi2 =3D NULL;
 =09struct isys_fw_msgs *isys_fw_msg =3D NULL;
 =09u32 index;
 =09u64 ts;
=20
-=09resp =3D ipu6_fw_isys_get_resp(isys);
-=09if (!resp)
-=09=09return 1;
-
 =09ts =3D (u64)resp->timestamp[1] << 32 | resp->timestamp[0];
=20
 =09index =3D resp_type_to_index(resp->type);
@@ -580,7 +577,8 @@ int ipu6_isys_isr_one(struct ipu6_bus_device *adev)
 =09}
 =09stream->error =3D resp->error_info.error;
=20
-=09csi2 =3D ipu6_isys_subdev_to_csi2(stream->asd);
+=09if (stream->asd)
+=09=09csi2 =3D ipu6_isys_subdev_to_csi2(stream->asd);
=20
 =09switch (resp->type) {
 =09case IPU6_FW_ISYS_RESP_TYPE_STREAM_OPEN_DONE:
@@ -606,16 +604,17 @@ int ipu6_isys_isr_one(struct ipu6_bus_device *adev)
 =09=09 * firmware only release the capture message until software
 =09=09 * get pin_data_ready event
 =09=09 */
-=09=09if (!resp->buf_id) {
-=09=09=09dev_warn(&adev->auxdev.dev, "%d: Invalid buf ID\n",
-=09=09=09=09 resp->stream_handle);
-=09=09=09goto leave;
-=09=09}
-
-=09=09isys_fw_msg =3D container_of((void *)(uintptr_t)resp->buf_id,
-=09=09=09=09=09   struct isys_fw_msgs, dummy);
+=09=09if (release_msg_buf) {
+=09=09=09if (!resp->buf_id) {
+=09=09=09=09dev_warn(&adev->auxdev.dev, "%d: Invalid buf ID\n",
+=09=09=09=09=09 resp->stream_handle);
+=09=09=09=09goto leave;
+=09=09=09}
=20
-=09=09ipu6_put_fw_msg_buf(ipu6_bus_get_drvdata(adev), isys_fw_msg);
+=09=09=09isys_fw_msg =3D container_of((void *)(uintptr_t)resp->buf_id,
+=09=09=09=09=09=09   struct isys_fw_msgs, dummy);
+=09=09=09ipu6_put_fw_msg_buf(ipu6_bus_get_drvdata(adev), isys_fw_msg);
+=09=09}
 =09=09if (resp->pin_id < IPU6_ISYS_OUTPUT_PINS &&
 =09=09    stream->output_pins_queue[resp->pin_id])
 =09=09=09ipu6_isys_queue_buf_ready(stream, resp);
@@ -633,8 +632,8 @@ int ipu6_isys_isr_one(struct ipu6_bus_device *adev)
 =09case IPU6_FW_ISYS_RESP_TYPE_STREAM_CAPTURE_DONE:
 =09=09break;
 =09case IPU6_FW_ISYS_RESP_TYPE_FRAME_SOF:
-
-=09=09ipu6_isys_csi2_sof_event_by_stream(stream);
+=09=09if (csi2)
+=09=09=09ipu6_isys_csi2_sof_event_by_stream(stream);
 =09=09stream->seq[stream->seq_index].sequence =3D
 =09=09=09atomic_read(&stream->sequence) - 1;
 =09=09stream->seq[stream->seq_index].timestamp =3D ts;
@@ -646,7 +645,8 @@ int ipu6_isys_isr_one(struct ipu6_bus_device *adev)
 =09=09=09% IPU6_ISYS_MAX_PARALLEL_SOF;
 =09=09break;
 =09case IPU6_FW_ISYS_RESP_TYPE_FRAME_EOF:
-=09=09ipu6_isys_csi2_eof_event_by_stream(stream);
+=09=09if (csi2)
+=09=09=09ipu6_isys_csi2_eof_event_by_stream(stream);
 =09=09dev_dbg(&adev->auxdev.dev,
 =09=09=09"eof: handle %d: (index %u), timestamp 0x%16.16llx\n",
 =09=09=09resp->stream_handle,
@@ -661,7 +661,21 @@ int ipu6_isys_isr_one(struct ipu6_bus_device *adev)
 =09}
=20
 leave:
+=09return;
+}
+
+static int ipu6_isys_isr_one(struct ipu6_bus_device *adev)
+{
+=09struct ipu6_isys *isys =3D ipu6_bus_get_drvdata(adev);
+=09struct ipu6_fw_isys_resp_info_abi *resp;
+
+=09resp =3D ipu6_fw_isys_get_resp(isys);
+=09if (!resp)
+=09=09return 1;
+
+=09ipu6_isys_handle_response(adev, resp, true);
 =09ipu6_fw_isys_put_resp(isys);
+
 =09return 0;
 }
=20
@@ -742,7 +756,7 @@ irqreturn_t ipu6_isys_isr(struct ipu6_bus_device *adev)
=20
 =09=09writel(0, base + IPU6_REG_ISYS_UNISPART_SW_IRQ_REG);
=20
-=09=09if (!ipu6_isys_isr_one(adev))
+=09=09if (!adev->auxdrv_data->fw_ops->isr_one(adev))
 =09=09=09status_sw =3D IPU6_ISYS_UNISPART_IRQ_SW;
 =09=09else
 =09=09=09status_sw =3D 0;
@@ -958,6 +972,7 @@ static void ipu6_fw_isys_prepare_buf_set(struct isys_fw=
_msgs *msg,
 const struct ipu6_fw_isys_ops ipu6_fw_isys_ops =3D {
 =09.init =3D ipu6_fw_isys_init,
 =09.close =3D ipu6_fw_isys_close,
+=09.isr_one =3D ipu6_isys_isr_one,
 =09.cleanup =3D ipu6_fw_isys_cleanup,
 =09.prepare_stream_cfg =3D ipu6_fw_isys_prepare_stream_cfg,
 =09.prepare_buf_set =3D ipu6_fw_isys_prepare_buf_set,
diff --git a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.h b/drivers/media/pc=
i/intel/ipu6/ipu6-fw-isys.h
index 2a679d99596..498cb7f0691 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.h
@@ -562,7 +562,9 @@ struct ipu6_fw_proxy_send_queue_token {
 int ipu6_fw_isys_send_proxy_token(struct ipu6_isys *isys, unsigned int req=
_id,
 =09=09=09=09  unsigned int index, unsigned int offset,
 =09=09=09=09  u32 value);
-int ipu6_isys_isr_one(struct ipu6_bus_device *adev);
+void ipu6_isys_handle_response(struct ipu6_bus_device *adev,
+=09=09=09       struct ipu6_fw_isys_resp_info_abi *resp,
+=09=09=09       bool release_msg_buf);
 irqreturn_t ipu6_isys_isr(struct ipu6_bus_device *adev);
=20
 #endif
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.h b/drivers/media/pci/i=
ntel/ipu6/ipu6-isys.h
index f4d00f763eb..86b1ab681e3 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.h
@@ -167,6 +167,7 @@ struct isys_fw_msgs {
 struct ipu6_fw_isys_ops {
 =09int (*init)(struct ipu6_isys *isys, unsigned int num_streams);
 =09int (*close)(struct ipu6_isys *isys);
+=09int (*isr_one)(struct ipu6_bus_device *adev);
 =09int (*send_cmd)(struct ipu6_isys *isys,
 =09=09=09const unsigned int stream_handle,
 =09=09=09void *cpu_mapped_buf,
--=20
2.56.0


