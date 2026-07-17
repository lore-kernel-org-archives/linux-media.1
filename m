Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B013890E4;
	Fri, 17 Jul 2026 11:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784286117; cv=none; b=dx5Rsjx62YWf1rmx+dWN4MD0mY7ep5fA69cuwJR0afmODMmVdiyHFWuiljjsRXz4O0tnbRpTdmjxS5oBJhJjs4bcgFQpV15+92IFH+QrOIN26gB8tioVKfZqyE4dlfGbVFsfToTjkjcDCJJenMnKwmKlhl0MwQhLls8HzoVIJDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784286117; c=relaxed/simple;
	bh=H1BtMGvadj2xGJTMpalk+Z2QB8jdAxVM5Zq5z8h+2xA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uP1ANmj28Ea9TH/aYcvR8uc3zJpOpyyvJWb0tVLy/tsKnkAZRrtRNJZUGUmv6TDTjIKpC86AqgRE28uM4Sk1/wmM7QiooaJt4APBNGnCQ4Qo2Mvdm3vgPA2aS522UUKoWr+Gvf0yPuTkVdudxjW1afx4ICoGoQWhE5+FhBY+T2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HWcpN1iL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HWcpN1iL"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:66a6:48e1:9e1:50d5:c75c])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 01CE8664;
	Fri, 17 Jul 2026 13:00:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784286032;
	bh=H1BtMGvadj2xGJTMpalk+Z2QB8jdAxVM5Zq5z8h+2xA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HWcpN1iL/KpLN7yFLecCdVjyKn+Qq81fAP2X7Ve009gI7CiCV8UqUx6oBCuQoWt9O
	 sf1k+OPbDC/z7RDOjHd0sefeuyDOGDoDM0YEpwVGCpqcLvJcG2Ww2evNEqFDwtZsuu
	 7pHFvw+83/Z0V/VzKe5HrdmeShWs7gSGER34KMOY=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 17 Jul 2026 16:30:16 +0530
Subject: [PATCH v3 5/6] platform/raspberrypi: vchiq-mmal: Support sending
 data to MMAL ports
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-b4-vc-sm-cma-v3-5-6c4e77804e5d@ideasonboard.com>
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
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1944;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=Uu+p6zDWnVn0i9Gc8bkparl69k3TOlNR1E7lOgj8vyQ=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqWgtiWssQ3ksL7TyljvZ9hIPj1SliyHVSAerLM
 4ewStfMriaJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaloLYgAKCRBD3pH5JJpx
 RZ2IEACKgnXY4AAkZyQUKw5518Tbaa4KuWh9WI8El6j9s6/Ifdw5tgV1eiebMpTFP2zW3WZcW/f
 oSOE9NCBhq3BjHuWH4h5mlt/SF/4xR/FcI8zGX7pFuiy6Uck8mjfHVTyptzanFCmYkaEDJc/pbx
 uSTAxvaoej/GlYORUnPQvd+XY43YFe4VTL7wX6GGhkPG2fJgGUqhfpFWgqf2N38VOCswwaE48Mp
 qm1Em2Ct5FBFp+H7YgnGYSwY5jeMxd4htCaPAnXAO7WKnDcG8HAyloiSgmnA9KKQ6u2YKp/a1iZ
 F3fV3vhEfpomx22xCqDVGjnEwkq2ToL/eF6BHAwursb93tCvvseLCxbArydB+170wPHh1DwisZ6
 ndKKtKrhbC0CTaSmOHOAsTkykLAiAzRysNqZMElCik82Ladh2czIdYx+fFxK209I3lhPzeW5jzq
 dx9a7EvJn5XIuEa0w0kBbcpy8CJKVZbRCeMA1LciZEdQV99XUyBUA13Y+aMUaa3Q4xgX0l+PfxT
 oLqKGcwHvChbpFx90raqdxb1L7prRa/wNKpZARDq+SXwq/EbTuMfVdO1biqw1/6xxL+PTXxlJZX
 BoC+m3CKCemmvvCDqzCq1iB2EGeReVtvnFQIg2jl3FBYCC0e1Fx6nKDCLXRd4fAX3DHSsJy7xat
 hhdBu9s+y6GPHAQ==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

Add the ability to send data to ports. This only supports
zero copy mode as the required bulk transfer setup calls
are not done.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
index a64b5175e1a9..ccd8910c315f 100644
--- a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
@@ -430,11 +430,19 @@ buffer_from_host(struct vchiq_mmal_instance *instance,
 			(u32)(unsigned long)buf->buffer;
 
 	m.u.buffer_from_host.buffer_header.alloc_size = buf->buffer_size;
-	m.u.buffer_from_host.buffer_header.length = 0;	/* nothing used yet */
-	m.u.buffer_from_host.buffer_header.offset = 0;	/* no offset */
-	m.u.buffer_from_host.buffer_header.flags = 0;	/* no flags */
-	m.u.buffer_from_host.buffer_header.pts = MMAL_TIME_UNKNOWN;
-	m.u.buffer_from_host.buffer_header.dts = MMAL_TIME_UNKNOWN;
+	if (port->type == MMAL_PORT_TYPE_OUTPUT) {
+		m.u.buffer_from_host.buffer_header.length = 0;
+		m.u.buffer_from_host.buffer_header.offset = 0;
+		m.u.buffer_from_host.buffer_header.flags = 0;
+		m.u.buffer_from_host.buffer_header.pts = MMAL_TIME_UNKNOWN;
+		m.u.buffer_from_host.buffer_header.dts = MMAL_TIME_UNKNOWN;
+	} else {
+		m.u.buffer_from_host.buffer_header.length = buf->length;
+		m.u.buffer_from_host.buffer_header.offset = 0;
+		m.u.buffer_from_host.buffer_header.flags = buf->mmal_flags;
+		m.u.buffer_from_host.buffer_header.pts = buf->pts;
+		m.u.buffer_from_host.buffer_header.dts = buf->dts;
+	}
 
 	/* clear buffer type specific data */
 	memset(&m.u.buffer_from_host.buffer_header_type_specific, 0,

-- 
2.54.0

