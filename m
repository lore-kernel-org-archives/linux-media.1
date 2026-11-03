Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691694;
	b=ygnZlqMUEej3qDm+dYwQ93zuHhDvUKns4dnrW2wR9y7uU7Q2WMPZXvTpoUpOIk8LxnAs
	 MnMwGndU3kzgPSPVZKiDrQLAi8NxhHSLLs7kH9WLYbEvZVF90FO3uPhKPyGHvH/0mgHCm
	 ssehlecJK9J/ziMRDBwDbsCj9co83zUQ0sWWz/GR2lwKfhfvSL2G74lD9J/SCwcAd6Oez
	 rm0Umshx1hcdPem1gBwlfOI7fXkDDnFBStZXZ7vUtuXy13rIZ1rxYlRLkfWNpCwUejHRR
	 KymsDZrHQlxr2pQ5vnsp3NkeQwhmRoCC7wzuNTTS4icvXEMNtYDuFz/4+fTM64VXt7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691694;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=tRxob/FxqAp29srzAeWyBdjeoKfBU9kvQtAvBNpJeC0=;
	b=1V/G9iPTfPDk95xZBgZQGMgNrNyMeQdVRb2BnTQ1Co0POdMaw69AHeaRBwiDFYlAd4io
	 jhiVhEC1p6NmWTZB00Wc1kSsGja0hOUrcMtthIbl0VILvrOJ9D6I3ZfYMmLAnmmDClv+x
	 EX/nyqVSWf38tuZzyccBstCr2Nor6SG3ylc0d9yGszEE9jKLnnLpyhyNRhSrnbQuOGPDf
	 dzPeZjf5FotLh4GvE/Ng7baQi8pBRssFK4XWofgYk8EiPZm/1eI7CZeHo2jO7pGvuA1hB
	 BAxA+9MTnu96CPkhbRw/5GND8pSjEtUEyiNZx4w5yzGvLd7YdyOE7j7mE09dgzgaTJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=gNA9xwHb;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11EC606A33F
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 07:41:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C11EC606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=gNA9xwHb
Received: from [127.0.1.1] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EC7DE52DE;
	Tue,  3 Nov 2026 08:38:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793691540;
	bh=11aYblGNBtQIBApYpdqYmjnXa74aTPYSIDEjpIOfSzE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gNA9xwHbF6wZX2O98sBr/LLOK6ZLI24gnqUXwiDaGhCMYXsrAmSlFGmboc51QdHJS
	 yCznkyZpu+H8X7qyhO71eVIUDOXfN591q7qhVx96HzyEAMcMac39FH6bIr+qczsN9t
	 i952MMht5fOcAdqzVC0eAiBK3mADE/nbhO3SflHM=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Tue, 03 Nov 2026 07:40:52 +0000
Subject: [PATCH 16/16] media: rkisp1: Allow a live stream to suspend and
 resume
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
Message-Id: <20261103-rkisp1-suspend-and-resume-v1-16-08f863b6fdc5@ideasonboard.com>
References: <20261103-rkisp1-suspend-and-resume-v1-0-08f863b6fdc5@ideasonboard.com>
In-Reply-To: <20261103-rkisp1-suspend-and-resume-v1-0-08f863b6fdc5@ideasonboard.com>
To: Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5783;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=11aYblGNBtQIBApYpdqYmjnXa74aTPYSIDEjpIOfSzE=;
 b=kA0DAAoByElXemxFdTIByyZiAGrpkBLI1fvNHWJr1qce5HfSwQohY9y3FVuIXvAX1ZPQI3/KM
 okCMwQAAQoAHRYhBCrK7DIOdl1v6bGab8hJV3psRXUyBQJq6ZASAAoJEMhJV3psRXUyScEP/Aj2
 +U/gsw6Tp6NU21zqDmQOH8Z4ocNDEDIqjEI2VlUQc2IQrS0lc4RX/eneH5lnhzAOYKSH6BQnRC3
 86woIZ5jjGxAxSTRFGa4UZNRMvhahNn9fQ0kwxyimgkxhlCAmxBnncezErumliFxzGHn9EzMSwb
 yAMp68YbKBChyDGAaOGSeHpqyOwEOlh1etdrjqH3D6A672HLJY6A64z29YWKXTvUTd4bu2G+0+H
 TwVBU2gwVdvzv8187mfazGO8b2OT/NWTmK9Rb+vbVhByOJsoG/6u0NeEjjR9KRzQ92lkM9V0nRS
 V8KZPRlEvx6TYpZWu802dQ97V9Sox9h/GaBmljWkt3OuRaG7ehb5OZ4yJHIlJ4d5xF3rtYwy9cx
 L8wxo1UEPFai5JbHgjkpHSnSAfGSJff1veZEp1Xz7MlCYAUJTYvHMl3zcLgvHVm0u3KRYk/qul+
 rQAY/hdIZdiRl11VXoZh4GOpekjcoalWumOK9iNafiM7vGf8wx0NXvpIfDuaIcbh9pNTlNR4EpR
 QzkokLTKiAjgdTiIWRolPPbeGHTK3ScQxUAFWTMOqHBEMiM9tuCnBGoZcefXqqVKBlGX3IQCn+1
 P6FLpTxV4CJ5w2wQQXWGlYK67YZz1ep8HUeJqHtg6NGOcpbsR/R7ewIRtFoL3gQH5QaNZHaoQCA
 GyDdZ
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

At present the rkisp1 driver makes no provision in its suspend and
resume operations for a live stream. The effect of this is that if
userspace is streaming images through the ISP and suspends to RAM,
upon resuming the system that stream has died, but userspace has no
visibility of that.

To resolve the problem check if a VB2 queue is streaming in runtime
suspend and if so, tell connected subdevices to stop streaming and
mark all buffers as returned to userspace. On runtime resume, check
again if a VB2 queue is streaming and if so set tell the connected
subdevices to stream again. Userspace will - when unfrozen - process
the returned buffers and requeue them ready to receive images.

Because the hardware will have been power-cycled and therefore lost
its configuration, reapply the parameters buffer to restore as much
of that as possible.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
This patch re-applies the last-applied params buffer.

The driver can use the extensible parameters format, in which case
the majority of frames will not have the full configuration. Most of
them will only contain rapidly changing settings like AWB gains, and
in that case unless the scene has not changed at all (which does not
seem very likely) then they will be out of date anyway. If userspace
has configured the extensible format then at this stage the
reapplication of parameters is probably not that useful, but I have a
follow-up series which will handle that more fully.
---
 .../media/platform/rockchip/rkisp1/rkisp1-common.h |  1 +
 .../media/platform/rockchip/rkisp1/rkisp1-dev.c    | 28 ++++++++++++++++++++++
 .../media/platform/rockchip/rkisp1/rkisp1-params.c | 18 ++++++++++++++
 3 files changed, 47 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index 8f379a783da1fa97a330a7ec547354eb936cfadd..94f03310e92f110062313bf2a34afb0692d9122c 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -697,6 +697,7 @@ void rkisp1_stats_vb2_return_all_buffers(struct rkisp1_stats *stats);
 void rkisp1_params_vb2_return_buffers(struct rkisp1_params *params);
 void rkisp1_return_all_buffers(struct rkisp1_capture *cap,
 			       enum vb2_buffer_state state);
+void rkisp1_params_reapply_config(struct rkisp1_params *params);
 int rkisp1_pipeline_stream_enable(struct rkisp1_capture *cap);
 void rkisp1_pipeline_stream_disable(struct rkisp1_capture *cap);
 
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index 9f1d0f72ee9bf4364c696d9fdd8febea80d2bcde..d9c7500c92d810763775417a32f6850f48825398 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -307,6 +307,22 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
 static int __maybe_unused rkisp1_runtime_suspend(struct device *dev)
 {
 	struct rkisp1_device *rkisp1 = dev_get_drvdata(dev);
+	bool active_stream = false;
+
+	for (unsigned int i = 0; i < rkisp1_path_count(rkisp1); i++) {
+		struct rkisp1_capture *cap = &rkisp1->capture_devs[i];
+
+		if (rkisp1_vb2_is_streaming(cap)) {
+			active_stream = true;
+			rkisp1_pipeline_stream_disable(cap);
+			rkisp1_return_all_buffers(cap, VB2_BUF_STATE_ERROR);
+		}
+	}
+
+	if (active_stream) {
+		rkisp1_stats_vb2_return_all_buffers(&rkisp1->stats);
+		rkisp1_params_vb2_return_buffers(&rkisp1->params);
+	}
 
 	rkisp1->irqs_enabled = false;
 	/* Make sure the IRQ handler will see the above */
@@ -333,6 +349,7 @@ static int __maybe_unused rkisp1_runtime_suspend(struct device *dev)
 static int __maybe_unused rkisp1_runtime_resume(struct device *dev)
 {
 	struct rkisp1_device *rkisp1 = dev_get_drvdata(dev);
+	unsigned int sequence;
 	int ret;
 
 	ret = pinctrl_pm_select_default_state(dev);
@@ -346,6 +363,17 @@ static int __maybe_unused rkisp1_runtime_resume(struct device *dev)
 	/* Make sure the IRQ handler will see the above */
 	mb();
 
+	for (unsigned int i = 0; i < rkisp1_path_count(rkisp1); i++) {
+		struct rkisp1_capture *cap = &rkisp1->capture_devs[i];
+
+		if (rkisp1_vb2_is_streaming(cap)) {
+			sequence = rkisp1->isp.frame_sequence;
+			rkisp1_pipeline_stream_enable(cap);
+			rkisp1_params_reapply_config(&rkisp1->params);
+			rkisp1->isp.frame_sequence = sequence;
+		}
+	}
+
 	return 0;
 }
 
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index 1f08b57e616159a389411e13f9217c4f4fcddd57..f440e15afc74c029510e0777a9ec2f6ea4d5be88 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -2326,6 +2326,24 @@ static void rkisp1_ext_params_config(struct rkisp1_params *params,
 	}
 }
 
+void rkisp1_params_reapply_config(struct rkisp1_params *params)
+{
+	guard(spinlock)(&params->buf.lock);
+
+	if (!params->buf.curr)
+		return;
+
+	if (params->metafmt->dataformat == V4L2_META_FMT_RK_ISP1_PARAMS) {
+		rkisp1_isp_isr_other_config(params, params->buf.curr->cfg);
+		rkisp1_isp_isr_lsc_config(params, params->buf.curr->cfg);
+		rkisp1_isp_isr_meas_config(params, params->buf.curr->cfg);
+	} else {
+		rkisp1_ext_params_config(params, params->buf.curr->cfg,
+					 RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS |
+					 RKISP1_EXT_PARAMS_BLOCK_GROUP_LSC);
+	}
+}
+
 static void rkisp1_params_complete_buffer(struct rkisp1_params *params,
 					  struct rkisp1_params_buffer *buf,
 					  unsigned int frame_sequence)

-- 
2.43.0

