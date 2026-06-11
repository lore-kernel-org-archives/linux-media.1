Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9146E1A0BD0;
	Thu, 11 Jun 2026 06:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781158206; cv=none; b=dfbcflk7YKjp2SZyRPVMPubIhsWDilMc9u5XY8Il2QXuf8x8narmbUeqepfIBQJ6HKLwKHluUPjlatYawZ47Ihnsi227oXJvcl83OqfkdL9ZtYf77PN2w+eMQxPx5faqNu2IbzlTF7SWoZSTqIq1m2JYr5C0b1M8XZ4yFN4jRX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781158206; c=relaxed/simple;
	bh=ElaN3MA+r7gbV2oGehvuhfujvcI0kDw9G1DVXIYDWoM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Y9H+04ORzNuVRg6NpINjFq6hfHkNTUmOGcs18gVINymtY6BWe6F5ioyLfxBGKxuZwhS8mCRApccdREBBDgsDHNJgrpq7epo/6A98w4MhtOHuy3bWGLM5YI6r2lu+YPiV/hldFyJ85/JNNSDajRM4fE+++7h8Kz+7zv209nG27lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cq4TRXsJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cq4TRXsJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29B3D1F00893;
	Thu, 11 Jun 2026 06:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781158205;
	bh=QMwju+bF00fDRWgD6aFjamUkfyRvkUx8XZMI5aZiZ14=;
	h=From:Date:Subject:To:Cc;
	b=Cq4TRXsJNrWHvMYJo5W7d1NrCYcnm28ETJ1Z1i6euJUPMcVxTTi469wALxVqBI+JQ
	 Xa9jp8kC6PtfqIcIKs0hGGn5HauYqi+2aDTaA0cpLzs79siGdr3MmBERskBCw0zOQ1
	 CBGqcnyuHTkutUaM35s/O9jNyrYpLCkMtGmGRGqLTXfVLezrOBEOyWWhRVbBfBILi2
	 7Sl8h9ynBKCXylM3JE2GRRUR6ON8PeHJ/fBAjn73nu+lt83pZGa4cxHp/4WvOpRe2M
	 vYBU1Vefa/CFXXtHq8QhRrIThH638nSfQtZpafJmoVlGbSRiMSNAmmE0d6VbLseaFJ
	 yiev1y0YEVTZg==
From: Eugen Hristev <ehristev@kernel.org>
Date: Thu, 11 Jun 2026 09:09:51 +0300
Subject: [PATCH] media: bcm2835-unicam: Fix querycap multiple caps
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-bcmpiqcap-v1-1-10cf7fb438df@kernel.org>
X-B4-Tracking: v=1; b=H4sIAC5RKmoC/yXM0QpAMBSA4VfRubayKZlXkYuzOTgKsyEl7264/
 OrvvyCQZwpQJRd4OjjwMkfINAE74NyT4DYaVKaKrJBSGDs5Xi060ZU6R02oWtQQe+ep4/N71c3
 vsJuR7PYO4L4fqiXti20AAAA=
X-Change-ID: 20260611-bcmpiqcap-f893a9ea2da9
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, 
 Naushir Patuck <naush@raspberrypi.com>
Cc: Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Eugen Hristev <ehristev@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1843; i=ehristev@kernel.org;
 h=from:subject:message-id; bh=ElaN3MA+r7gbV2oGehvuhfujvcI0kDw9G1DVXIYDWoM=;
 b=owGbwMvMwCXWkjcnuXne3fmMp9WSGLK0As2FhAxepPjJRsg4WGn1X9vGH7rok6+nTc3+2paE9
 fv//H7VUcrCIMbFICumyFJt8q9WuH+H+0lXSxWYOaxMIEMYuDgFYCILZjL84dNWXXt8ywfNiQk/
 wqfpCNfss+LtKnt1+2CdocGO/zslfjEyrFco5av/VRmnuORq+a0ZLb8F3Tc+6+hSPMDEy7RIlle
 ZDQA=
X-Developer-Key: i=ehristev@kernel.org; a=openpgp;
 fpr=AB184498D27A77B65D7852C81EB31E020EAC2FC8

The unicam exposes two video nodes, one for image, another for metadata.
Querycap should return the right caps for the respective node, not both.

video0:

Capabilities     : 0xa4200001
        Video Capture
        I/O MC
        Streaming
        Extended Pix Format
        Device Capabilities
Device Caps      : 0x24200001
        Video Capture
        I/O MC
        Streaming
        Extended Pix Format

video1:

Capabilities     : 0xa4a00000
        Metadata Capture
        I/O MC
        Streaming
        Extended Pix Format
        Device Capabilities
Device Caps      : 0x24a00000
        Metadata Capture
        I/O MC
        Streaming
        Extended Pix Format

Fixes: 392cd78d495f ("media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface")
Signed-off-by: Eugen Hristev <ehristev@kernel.org>
---
 drivers/media/platform/broadcom/bcm2835-unicam.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
index 8d28ba0b59a3..4bf36ce80047 100644
--- a/drivers/media/platform/broadcom/bcm2835-unicam.c
+++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
@@ -1833,7 +1833,10 @@ static int unicam_querycap(struct file *file, void *priv,
 	strscpy(cap->driver, UNICAM_MODULE_NAME, sizeof(cap->driver));
 	strscpy(cap->card, UNICAM_MODULE_NAME, sizeof(cap->card));
 
-	cap->capabilities |= V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_META_CAPTURE;
+	if (is_image_node(node))
+		cap->capabilities |= V4L2_CAP_VIDEO_CAPTURE;
+	else
+		cap->capabilities |= V4L2_CAP_META_CAPTURE;
 
 	return 0;
 }

---
base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72
change-id: 20260611-bcmpiqcap-f893a9ea2da9

Best regards,
--  
Eugen Hristev <ehristev@kernel.org>

