Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B61F3F8257;
	Fri, 17 Jul 2026 11:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784286110; cv=none; b=FMoYWUOJhJo/n0KbMCoWYn23phiHNupEjk3XgWjTEFfk/FnBJAlXSvyvAdTH+6PF7o70xJDhaxXFrkXRJck0Xbbme6OCJeqrgOCclQzC2DRoNw2rQX02hbHLUc81e2oWPTf/ToYxKJEJMXkIx/WXtQaXGRy+cuQGATVj4xWkEC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784286110; c=relaxed/simple;
	bh=9wCcGcGs+fJrlyYpf/8j26t/FFL1gq1LDLjUG1Y63ho=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IG+3UoTYey6aSPxrnzHnknrYsmHc67XljAGmoQ5aEgToiJOiY0rpVQfjp7WztMNOU3oWjrMeS0oaPOAMTd9pC6NbCwUgiUWGLqX3vyRdMK0tP/A4qkXOHnfMc2xvnEoF4knwTWL98mTI7z43c65sqjCBGkaqf60yMc5/htVNi8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=haVdTrxw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="haVdTrxw"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:66a6:48e1:9e1:50d5:c75c])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9A39B1494;
	Fri, 17 Jul 2026 13:00:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784286025;
	bh=9wCcGcGs+fJrlyYpf/8j26t/FFL1gq1LDLjUG1Y63ho=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=haVdTrxwPKaYRMm3SKRfFMG8+J5hHq2MaRs5oNrhfLiOx1v/AgjZlKHLNNNx9fjTv
	 bixvQJHh/OWoLmxvMsmBl9bUaLPIYlLbIa6AkOwQM7W2egaoUW/HanDmNgWm8RyZch
	 KoLyzPPQP3UpLWsJeDQxT44a7hnFcGvkJEI2Sd1o=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 17 Jul 2026 16:30:15 +0530
Subject: [PATCH v3 4/6] platform/raspberrypi: vchiq-mmal: Use vc-sm-cma to
 support zero copy
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-b4-vc-sm-cma-v3-4-6c4e77804e5d@ideasonboard.com>
References: <20260717-b4-vc-sm-cma-v3-0-6c4e77804e5d@ideasonboard.com>
In-Reply-To: <20260717-b4-vc-sm-cma-v3-0-6c4e77804e5d@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 bcm-kernel-feedback-list@broadcom.com, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Phil Elwell <phil@raspberrypi.com>
Cc: Stefan Wahren <wahrenst@gmx.net>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6380;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=mm9Ei9IToKCR2N+FVrx15TSn/+Hx+u1N6Yf4fduLOkQ=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqWgth1QG5YZgdsjegKer/v+mWYk2Hq7Jb/Au0v
 VYmET3xdmyJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaloLYQAKCRBD3pH5JJpx
 RbuOD/49ghNCNLZGl8C+aonNL2JJxCjBwqLOeb3ymVdi2N65rlyT59jyRdiUq97/uo021BCSjVk
 UxZEXRI7SQ16z2bkkgbb9VsjXpAlF5XiTwUbKpOebFyl0uBZgm9a/fSaHQg07H4Lrbz6nu7AlwK
 qDjsszvQSrqDM0VrsB1T++h2RDDiTYsU+/O1Ap7GO1/5jut5U9DjbmR3LSqQxO8o9jWvY21+8eu
 LYHvwPW6DdjKlnnCKw3AmuWAChkA6HfubH3ewrlefQZMRFJgZVOUW6UEgphAy+IrAkk7XW9IdPN
 9HcJxqUDQN39vI/mo7KYJRFHOjoRAfQTcuKId+bQ8QXnXLEByvR7v0iGfopJIeT3MWoJPHya08u
 VGPaSNK1ENjqHv3qF6b2VysI+PPDNeHgrastV5stigQYQb7VNxpi+aXtUGifW7WpS07MfuRnfQv
 CS2A1EDk/lO9/Z30sn4RgIJrK4SwwQetgaCxDP1+kFBVwdBbfuFVJ1dyVQrOhrAw8SsFml/QoBZ
 fN1UT643K6diCJLIb7XdA0UaH4BcB9DlkaoMz/Sair1iZ9FxuIRuW55obZvmkItoxbJfdKYS0p7
 6ye6PhX3kbrPMePdM6yIXaOJFFN68iyfkeJp5n3aENODFOHLDHiZ89/qQhXtsF/gVLAHkbNr0ou
 nu10PLO7eaONlhA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

With the vc-sm-cma driver we can support zero copy of buffers between
the kernel and VPU. Add this support to mmal-vchiq.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/platform/raspberrypi/vchiq-mmal/Kconfig    |  3 +-
 .../platform/raspberrypi/vchiq-mmal/mmal-common.h  |  4 ++
 .../platform/raspberrypi/vchiq-mmal/mmal-vchiq.c   | 65 ++++++++++++++++++++--
 .../platform/raspberrypi/vchiq-mmal/mmal-vchiq.h   |  1 +
 4 files changed, 68 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/raspberrypi/vchiq-mmal/Kconfig b/drivers/platform/raspberrypi/vchiq-mmal/Kconfig
index c99525a0bb45..8a798dae408c 100644
--- a/drivers/platform/raspberrypi/vchiq-mmal/Kconfig
+++ b/drivers/platform/raspberrypi/vchiq-mmal/Kconfig
@@ -1,6 +1,7 @@
 config BCM2835_VCHIQ_MMAL
 	tristate "BCM2835 MMAL VCHIQ service"
-	depends on BCM2835_VCHIQ
+	select BCM2835_VCHIQ if HAS_DMA
+	select BCM_VC_SM_CMA
 	help
 	  Enables the MMAL API over VCHIQ interface as used for the
 	  majority of the multimedia services on VideoCore.
diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h b/drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h
index b33129403a30..6c5092a68b99 100644
--- a/drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h
+++ b/drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h
@@ -50,6 +50,10 @@ struct mmal_buffer {
 
 	struct mmal_msg_context *msg_context;
 
+	struct dma_buf *dma_buf;/* Exported dmabuf fd from videobuf2 */
+	void *vcsm_handle;	/* VCSM handle having imported the dmabuf */
+	u32 vc_handle;		/* VC handle to that dmabuf */
+
 	unsigned long length;
 	u32 mmal_flags;
 	s64 dts;
diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
index 918c30d84ba0..a64b5175e1a9 100644
--- a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
@@ -23,12 +23,13 @@
 #include <linux/slab.h>
 #include <linux/completion.h>
 #include <linux/raspberrypi/vchiq.h>
+#include <linux/raspberrypi/vchiq_arm.h>
+#include <linux/raspberrypi/vc_sm_knl.h>
 #include <linux/vmalloc.h>
 #include <media/videobuf2-vmalloc.h>
 
-#include <linux/raspberrypi/vchiq_arm.h>
-
 #include "mmal-common.h"
+#include "mmal-parameters.h"
 #include "mmal-vchiq.h"
 #include "mmal-msg.h"
 
@@ -422,8 +423,12 @@ buffer_from_host(struct vchiq_mmal_instance *instance,
 
 	/* buffer header */
 	m.u.buffer_from_host.buffer_header.cmd = 0;
-	m.u.buffer_from_host.buffer_header.data =
-		(u32)(unsigned long)buf->buffer;
+	if (port->zero_copy)
+		m.u.buffer_from_host.buffer_header.data = buf->vc_handle;
+	else
+		m.u.buffer_from_host.buffer_header.data =
+			(u32)(unsigned long)buf->buffer;
+
 	m.u.buffer_from_host.buffer_header.alloc_size = buf->buffer_size;
 	m.u.buffer_from_host.buffer_header.length = 0;	/* nothing used yet */
 	m.u.buffer_from_host.buffer_header.offset = 0;	/* no offset */
@@ -484,6 +489,20 @@ static void buffer_to_host_cb(struct vchiq_mmal_instance *instance,
 
 		msg_context->u.bulk.status = msg->h.status;
 
+	} else if (msg->u.buffer_from_host.is_zero_copy) {
+		/*
+		 * Zero copy buffer, so nothing to do.
+		 * Copy buffer info and make callback.
+		 */
+		msg_context->u.bulk.buffer_used =
+				msg->u.buffer_from_host.buffer_header.length;
+		msg_context->u.bulk.mmal_flags =
+				msg->u.buffer_from_host.buffer_header.flags;
+		msg_context->u.bulk.dts =
+				msg->u.buffer_from_host.buffer_header.dts;
+		msg_context->u.bulk.pts =
+				msg->u.buffer_from_host.buffer_header.pts;
+
 	} else if (msg->u.buffer_from_host.buffer_header.length == 0) {
 		/* empty buffer */
 		if (msg->u.buffer_from_host.buffer_header.flags &
@@ -1431,6 +1450,9 @@ int vchiq_mmal_port_parameter_set(struct vchiq_mmal_instance *instance,
 
 	mutex_unlock(&instance->vchiq_mutex);
 
+	if (parameter == MMAL_PARAMETER_ZERO_COPY && !ret)
+		port->zero_copy = !!(*(bool *)value);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(vchiq_mmal_port_parameter_set);
@@ -1599,6 +1621,31 @@ int vchiq_mmal_submit_buffer(struct vchiq_mmal_instance *instance,
 	unsigned long flags = 0;
 	int ret;
 
+	/*
+	 * We really want to do this in mmal_vchi_buffer_init but can't as
+	 * videobuf2 won't let us have the dmabuf there.
+	 */
+	if (port->zero_copy && buffer->dma_buf && !buffer->vcsm_handle) {
+		pr_debug("%s: import dmabuf %p\n", __func__, buffer->dma_buf);
+		ret = vc_sm_cma_import_dmabuf(buffer->dma_buf,
+					      &buffer->vcsm_handle);
+		if (ret) {
+			pr_err("%s: vc_sm_import_dmabuf_fd failed, ret %d\n",
+			       __func__, ret);
+			return ret;
+		}
+
+		buffer->vc_handle = vc_sm_cma_int_handle(buffer->vcsm_handle);
+		if (!buffer->vc_handle) {
+			pr_err("%s: vc_sm_int_handle failed %d\n",
+			       __func__, ret);
+			vc_sm_cma_free(buffer->vcsm_handle);
+			return ret;
+		}
+		pr_debug("%s: import dmabuf %p - got vc handle %08X\n",
+			 __func__, buffer->dma_buf, buffer->vc_handle);
+	}
+
 	ret = buffer_from_host(instance, port, buffer);
 	if (ret == -EINVAL) {
 		/* Port is disabled. Queue for when it is enabled. */
@@ -1632,6 +1679,16 @@ int mmal_vchi_buffer_cleanup(struct mmal_buffer *buf)
 		release_msg_context(msg_context);
 	buf->msg_context = NULL;
 
+	if (buf->vcsm_handle) {
+		int ret;
+
+		pr_debug("%s: vc_sm_cma_free on handle %p\n", __func__,
+			 buf->vcsm_handle);
+		ret = vc_sm_cma_free(buf->vcsm_handle);
+		if (ret)
+			pr_err("%s: vcsm_free failed, ret %d\n", __func__, ret);
+		buf->vcsm_handle = 0;
+	}
 	return 0;
 }
 EXPORT_SYMBOL_GPL(mmal_vchi_buffer_cleanup);
diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.h b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.h
index 8c3959f6f97f..9d31816f5be5 100644
--- a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.h
+++ b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.h
@@ -49,6 +49,7 @@ typedef void (*vchiq_mmal_buffer_cb)(struct vchiq_mmal_instance  *instance,
 
 struct vchiq_mmal_port {
 	bool enabled;
+	u32 zero_copy:1;
 	u32 handle;
 	u32 type; /* port type, cached to use on port info set */
 	u32 index; /* port index, cached to use on port info set */

-- 
2.54.0

