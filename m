Received: from mail-07.mail-europe.com (mail-07.mail-europe.com [37.187.220.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9CD448CE6
	for <linux-media@vger.kernel.org>; Sun, 11 Oct 2026 14:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.187.220.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791729526; cv=none; b=UFidwoCbadY9n743C71IIHkmygIWd1U/U2bSNz0caA68v7iePQ4Pw2mO8FgyYVcMD0TSTFaTOKip8bbTH7KtP56tGSp7b9dDK+vHoHmpE3RI9sJvdxbLAiF8/Z1g9oI/LiN5knqlT/V2Dd6sXpLlSRp9NA3QY21txpzpWrE6Y+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791729526; c=relaxed/simple;
	bh=i2HgPP1o8Qkg8bGUjf9C/JuaxBhZ1WAjMYRA9oS3ycc=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mRuy6HWxcf74LUix8D2ETqMhsJZSE4Psd3uLPBJfLTxDdW3v51dN+04l97nvYmyLZ+k654vrmObEgt/+QeSdho0poKumb3CnofuWmCb7W0PHboAFc6x2IoZPU5nWg89sDg8v0UQbtjc0DqR5ISxckYctMITnd461FpGnFfg0Dvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=ax/awpp4; arc=none smtp.client-ip=37.187.220.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="ax/awpp4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1791729512; x=1791988712;
	bh=nvGDDZmsetPxDko7CMECJSjMJVYkhE1mJhgbiCG+Zb4=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=ax/awpp4+CT7r2aKtoOCkNvdCKFqegwHWe+cH1L4rL5cZ+fb9rocTDfknffgX/FXh
	 o73y3XPIhm/hhkqzTzNUeBS4yqRjN0silsfUEzWWpOquwrHShYOcuGzznDsWt6MKZI
	 GHp2uXGcmFcPA1QZwPe37oD5qTljpzWwb5Ha0Z9v+k/EDUZCIdRVH6yOY70nZB+bOh
	 ocFdVivwrtrtBcASCf/A/2IOIZhTOWhbOdCAUPfM1WtONP70+JzWim5RvBS8oNVnXd
	 hE/0gOnJHslfVbySscPDMKDqwucFcZiHTgzrIfI0VAYzZMKx3/esziZTGIa8mKR0DC
	 hHfN66XNoU8Mw==
Date: Sun, 11 Oct 2026 14:38:29 +0000
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
From: Ruslan Bay <ruslanbey@proton.me>
Cc: Antti Laakso <antti.laakso@linux.intel.com>, "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, Ricardo Ribalda <ribalda@chromium.org>, Andreas Helbech Kleist <andreaskleist@gmail.com>, "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, "tfiga@chromium.org" <tfiga@chromium.org>, "senozhatsky@chromium.org" <senozhatsky@chromium.org>, "claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>, "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>, Ruslan Bay <ruslanbey@proton.me>
Subject: [RFC PATCH 06/12] media: ipu6: Add firmware-specific ISYS response  dispatch
Message-ID: <8P13ltZ_zw_2u1N4bZN3Eo3oMmM33G5EH-PTfCSzH_WK6en4U-1YR3Zx6coVzCL0hzgEc1ZOHl4VImJ4EQjXuhl5H6_JOQl8CvPv_mg_xOw=@proton.me>
Feedback-ID: 183606634:user:proton
X-Pm-Message-ID: f21b0eab01498f9b855f6d52aec636bafb1e8f3a
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Separate firmware response dequeueing from common ISYS response
handling. Add a firmware-operations callback for consuming one response
and retain the IPU6 implementation as the default, allowing other
firmware ABIs to reuse the common response handler.

Signed-off-by: Ruslan Bay <ruslanbey@proton.me>
---
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c | 41 ++++++++++++++-------
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.h |  3 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.h    |  1 +
 3 files changed, 30 insertions(+), 15 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c b/drivers/media/pc=
i/intel/ipu6/ipu6-fw-isys.c
index 3cad7d8f9ca9..ae4576025a49 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
@@ -521,23 +521,16 @@ static u32 resp_type_to_index(int type)
 =09return  ARRAY_SIZE(fw_msg) - 1;
 }
=20
-int ipu6_isys_isr_one(struct ipu6_bus_device *adev)
+void ipu6_isys_handle_response(struct ipu6_bus_device *adev,
+=09=09=09       struct ipu6_fw_isys_resp_info_abi *resp)
 {
 =09struct ipu6_isys *isys =3D ipu6_bus_get_drvdata(adev);
-=09struct ipu6_fw_isys_resp_info_abi *resp;
 =09struct ipu6_isys_stream *stream;
 =09struct ipu6_isys_csi2 *csi2 =3D NULL;
 =09struct isys_fw_msgs *isys_fw_msg =3D NULL;
 =09u32 index;
 =09u64 ts;
=20
-=09if (!isys->fwctx)
-=09=09return 1;
-
-=09resp =3D ipu6_fw_isys_get_resp(isys);
-=09if (!resp)
-=09=09return 1;
-
 =09ts =3D (u64)resp->timestamp[1] << 32 | resp->timestamp[0];
=20
 =09index =3D resp_type_to_index(resp->type);
@@ -570,7 +563,8 @@ int ipu6_isys_isr_one(struct ipu6_bus_device *adev)
 =09}
 =09stream->error =3D resp->error_info.error;
=20
-=09csi2 =3D ipu6_isys_subdev_to_csi2(stream->asd);
+=09if (stream->asd)
+=09=09csi2 =3D ipu6_isys_subdev_to_csi2(stream->asd);
=20
 =09switch (resp->type) {
 =09case IPU6_FW_ISYS_RESP_TYPE_STREAM_OPEN_DONE:
@@ -623,8 +617,8 @@ int ipu6_isys_isr_one(struct ipu6_bus_device *adev)
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
@@ -636,7 +630,8 @@ int ipu6_isys_isr_one(struct ipu6_bus_device *adev)
 =09=09=09% IPU6_ISYS_MAX_PARALLEL_SOF;
 =09=09break;
 =09case IPU6_FW_ISYS_RESP_TYPE_FRAME_EOF:
-=09=09ipu6_isys_csi2_eof_event_by_stream(stream);
+=09=09if (csi2)
+=09=09=09ipu6_isys_csi2_eof_event_by_stream(stream);
 =09=09dev_dbg(&adev->auxdev.dev,
 =09=09=09"eof: handle %d: (index %u), timestamp 0x%16.16llx\n",
 =09=09=09resp->stream_handle,
@@ -653,7 +648,24 @@ int ipu6_isys_isr_one(struct ipu6_bus_device *adev)
 leave_put_stream:
 =09ipu6_isys_put_stream(stream);
 leave:
+=09return;
+}
+
+static int ipu6_isys_isr_one(struct ipu6_bus_device *adev)
+{
+=09struct ipu6_isys *isys =3D ipu6_bus_get_drvdata(adev);
+=09struct ipu6_fw_isys_resp_info_abi *resp;
+
+=09if (!isys->fwctx)
+=09=09return 1;
+
+=09resp =3D ipu6_fw_isys_get_resp(isys);
+=09if (!resp)
+=09=09return 1;
+
+=09ipu6_isys_handle_response(adev, resp);
 =09ipu6_fw_isys_put_resp(isys);
+
 =09return 0;
 }
=20
@@ -737,7 +749,7 @@ irqreturn_t ipu6_isys_isr(struct ipu6_bus_device *adev)
=20
 =09=09writel(0, base + IPU6_REG_ISYS_UNISPART_SW_IRQ_REG);
=20
-=09=09if (!ipu6_isys_isr_one(adev))
+=09=09if (!adev->auxdrv_data->fw_ops->isr_one(adev))
 =09=09=09status_sw =3D IPU6_ISYS_UNISPART_IRQ_SW;
 =09=09else
 =09=09=09status_sw =3D 0;
@@ -957,6 +969,7 @@ static void ipu6_fw_isys_prepare_buf_set(struct isys_fw=
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
index 2a679d995961..de4608a18f41 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.h
@@ -562,7 +562,8 @@ struct ipu6_fw_proxy_send_queue_token {
 int ipu6_fw_isys_send_proxy_token(struct ipu6_isys *isys, unsigned int req=
_id,
 =09=09=09=09  unsigned int index, unsigned int offset,
 =09=09=09=09  u32 value);
-int ipu6_isys_isr_one(struct ipu6_bus_device *adev);
+void ipu6_isys_handle_response(struct ipu6_bus_device *adev,
+=09=09=09       struct ipu6_fw_isys_resp_info_abi *resp);
 irqreturn_t ipu6_isys_isr(struct ipu6_bus_device *adev);
=20
 #endif
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.h b/drivers/media/pci/i=
ntel/ipu6/ipu6-isys.h
index 3a91f6a34c5a..7d652a06837d 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.h
@@ -192,6 +192,7 @@ struct isys_fw_msgs {
 struct ipu6_fw_isys_ops {
 =09int (*init)(struct ipu6_isys *isys, unsigned int num_streams);
 =09int (*close)(struct ipu6_isys *isys);
+=09int (*isr_one)(struct ipu6_bus_device *adev);
 =09int (*send_cmd)(struct ipu6_isys *isys,
 =09=09=09const unsigned int stream_handle,
 =09=09=09void *cpu_mapped_buf,
--=20
2.55.0


