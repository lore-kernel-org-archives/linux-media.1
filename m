Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6480435966;
	Mon, 24 Aug 2026 06:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787553588; cv=none; b=tYB1DKEC+fuauzI56WPBsQRbq/1wXGzWWGDfywSuNIkO/oJEYOuJuyKPA8lRabaska9Hx0NSzfoX+Oxh21z54tZlS27g1V4HE4Sh80JGBy81gqPPrWU9ef82g/ioHxSXQkvk7sZmUAxvO1EumJHnw9n0Y3M3TRMzuavJWgMpZ+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787553588; c=relaxed/simple;
	bh=CSDZMDraCixAGdr5N8Azz8zPQA868QAxlWadugj7Sys=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FexKklcgVBOwN0GPEw7KpRBlCm5m+NMC0k7uFr/ZSPksXwcHSpwlZKYR8U7Ij1uwudwzEmxgq6oZxwY8nAzY0tkYCbpkomeKRf49Ei4ChunKCX0ECROBMm70YYgx9R7lYJSj53/FZI8EOZPqGBt9Hpm6uKLN6+QZDWeMeUIZ7zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id CBB41201AD4;
	Mon, 24 Aug 2026 08:39:35 +0200 (CEST)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1wyOLH-0033if-2B;
	Mon, 24 Aug 2026 08:39:35 +0200
Received: from [::1] (helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.98.2)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1wyOLH-0000000DClv-26dq;
	Mon, 24 Aug 2026 08:39:35 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Mon, 24 Aug 2026 08:39:36 +0200
Subject: [PATCH 3/3] media: verisilicon: Allow the EOS event to be
 subscribed
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-rk3588-jpegdec-v1-3-180a30a2852d@pengutronix.de>
References: <20260824-rk3588-jpegdec-v1-0-180a30a2852d@pengutronix.de>
In-Reply-To: <20260824-rk3588-jpegdec-v1-0-180a30a2852d@pengutronix.de>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Hans Verkuil <hverkuil@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787553575; l=2637;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=CSDZMDraCixAGdr5N8Azz8zPQA868QAxlWadugj7Sys=;
 b=zIi40BZhFWOQYmFfJkmHHGaGki/pbyuUFglvSD79epaBQRsubEh9/Y7Yn5kw7pXRNk7ALSU0m
 7Oy8gz3DFrxBm2S7h59kv3tcmiGIBFQ8BGNVTW8W2bShsZxEx5xFUwI
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=

hantro queues a V4L2_EVENT_EOS in three places.  vidioc_encoder_cmd()
sends it when a V4L2_ENC_CMD_STOP has drained the encoder:

	if (ec->cmd == V4L2_ENC_CMD_STOP &&
	    v4l2_m2m_has_stopped(ctx->fh.m2m_ctx))
		v4l2_event_queue_fh(&ctx->fh, &hantro_eos_event);

hantro_buf_queue() sends it for a capture buffer queued after the last
one, and hantro_stop_streaming() when the output queue stops while
draining.

No application can ask for any of them.  The ioctl ops offer

	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,

and v4l2_ctrl_subscribe_event() only knows about V4L2_EVENT_CTRL, so
VIDIOC_SUBSCRIBE_EVENT for V4L2_EVENT_EOS fails with -EINVAL and the
queued events are dropped on the floor.  An application following the
drain sequence in the stateful encoder documentation has to fall back to
V4L2_BUF_FLAG_LAST, which hantro does set, so this has gone unnoticed.

Dispatch on the event type and hand V4L2_EVENT_EOS to
v4l2_event_subscribe(), the way coda-common.c does.  Everything else
keeps going to the control handler.

V4L2_EVENT_SOURCE_CHANGE is deliberately not added, hantro never sends
one.

Fixes: daf3999c12dc ("media: hantro: Implement support for encoder commands")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/media/platform/verisilicon/hantro_v4l2.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index 83af9fa1ce949..9e19daffe0075 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -765,6 +765,17 @@ static int vidioc_encoder_cmd(struct file *file, void *priv,
 	return 0;
 }
 
+static int hantro_subscribe_event(struct v4l2_fh *fh,
+				  const struct v4l2_event_subscription *sub)
+{
+	switch (sub->type) {
+	case V4L2_EVENT_EOS:
+		return v4l2_event_subscribe(fh, sub, 0, NULL);
+	default:
+		return v4l2_ctrl_subscribe_event(fh, sub);
+	}
+}
+
 const struct v4l2_ioctl_ops hantro_ioctl_ops = {
 	.vidioc_querycap = vidioc_querycap,
 	.vidioc_enum_framesizes = vidioc_enum_framesizes,
@@ -787,7 +798,7 @@ const struct v4l2_ioctl_ops hantro_ioctl_ops = {
 	.vidioc_remove_bufs = v4l2_m2m_ioctl_remove_bufs,
 	.vidioc_expbuf = v4l2_m2m_ioctl_expbuf,
 
-	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
+	.vidioc_subscribe_event = hantro_subscribe_event,
 	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
 
 	.vidioc_streamon = v4l2_m2m_ioctl_streamon,

-- 
2.47.3

