Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1CC20D4E9;
	Sun, 23 Aug 2026 06:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787466441; cv=none; b=sfyxpL5i/YJZoL9WczPrsOhuSHO6zYHRpqkUnZfZ+nB/gjQmMhZAT13GUKp4RsTxio/HUubvkC57xGEjNMOYygkQ1YJMsyQR7KYUTMqbZzoOzPCXon4gO7IiiFq3GuG7milT51hKGIlSzcI8IgS26VOUgIKxBVYHGSeehR+yjjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787466441; c=relaxed/simple;
	bh=6caN5GbikuqADZTPUPquRicuKp50Ix0df0KcUGo/32s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=luj1ifJozJvxD7/M3akEuNfGUJS+8iRnWkzeFW9AdXOx5VnbEc1bFjpl95wHI1QCJccueUZp9eUVi2CUMmLLMAfWLUoM9PnGvI2lmdciYkB3sQeszo+Oeu6P8HKWC4e9mDMJpLROTTETDeeRlzNcm2+o/Wf98mEQ04xnO99YI78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TGY2e4QO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TGY2e4QO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D7F41F000E9;
	Sun, 23 Aug 2026 06:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787466439;
	bh=4zZ964UaOcqM6aIvLP+DeBwxQG6DN76Q94+laK2Fad4=;
	h=From:Date:Subject:To:Cc;
	b=TGY2e4QO+Z9kVs0AgtHsqhw1zDiHU3+6xDoMX2i6/dgHwFp4asR/MJX+1tPIeHn1p
	 KAejm6pC0LKkWtENq3YrDesupEtH082B5QA0vuY+WAXFllVqTBdfW22ZzOKrw+aBFP
	 JStGAXQFpg6SSYxSzAYO7akYvlk6l+B000SV6ORA3Xya/VloWGJ89Na8A0rVRfMGOe
	 7Xv7p4uuDPCxNlj3oW/5alh5GMAsEdoPDLFw2I/ArasNwj4/7OyCbG4sQ8h+nxLl73
	 ka/47JM8b01UE7cd2qv5m1uryg7Q+uurtxb/UQc8o1vTXqUIHPMyZGqm6Di7n5EoyR
	 TmRW7V9ydbD6g==
From: Eugen Hristev <ehristev@kernel.org>
Date: Sun, 23 Aug 2026 09:27:09 +0300
Subject: [PATCH v4] media: bcm2835-unicam: Fix log status runtime access
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260823-bcmpipm-v4-1-faf20d9c3e2b@kernel.org>
X-B4-Tracking: v=1; b=H4sIALySimoC/2XNyw7CIBQE0F8xrMXwaJG68j+MC7jcKmofgUo0T
 f9dqotqXE4yZ2YkEYPHSHarkQRMPvquzaFYrwicTXtC6l3ORDChWCk4tdD0vm+ognKrcSuFrID
 kdh+w9o/30uH4yfFuLwjDzOfG2cehC8/3VeJz7381ccqpRGu0dlqzotxfMbR423ThRObZJL6hW
 KDI0EhnlAILVc3+oFyg4l+PMkNQrHIGLBNV/QOnaXoBQfimiyMBAAA=
X-Change-ID: 20260521-bcmpipm-6c578e73239c
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: Naushir Patuck <naush@raspberrypi.com>, linux-media@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Eugen Hristev <ehristev@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3369; i=ehristev@kernel.org;
 h=from:subject:message-id; bh=6caN5GbikuqADZTPUPquRicuKp50Ix0df0KcUGo/32s=;
 b=owGbwMvMwCXWkjcnuXne3fmMp9WSGLK6Ju1XWH+w+K3IrHauEPFJx90dTcVjja/p7Ko9dHyv9
 LHyVUfMO0pZGMS4GGTFFFmqTf7VCvfvcD/paqkCM4eVCWQIAxenAEzEm53hf9WdrJ+/3+yelvz3
 xsU1Tdmn55tJb50/7VvTAa/uQmZHNk5Ghpd3L65K4Gppu39q0cc13ry8t3l+9B7RNq34//peGcP
 vfSwA
X-Developer-Key: i=ehristev@kernel.org; a=openpgp;
 fpr=AB184498D27A77B65D7852C81EB31E020EAC2FC8

When requesting log status, the block might be powered off, but registers
are being read.
Avoid reading the registers if the device is not resumed, thus also avoid
powering up the device just for log status.

Fixes: 392cd78d495f ("media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface")
Signed-off-by: Eugen Hristev <ehristev@kernel.org>
---
Changes in v4:
- rebased on latest tree, no additional change.
- Link to v3: https://patch.msgid.link/20260611-bcmpipm-v3-1-c609dacb029f@kernel.org

Changes in v3:
- Changed to check return value of pm_runtime_get_if_active() and only call
  pm_runtime_put() if the device is active.
- Link to v2: https://patch.msgid.link/20260522-bcmpipm-v2-1-a3da66cbc9f0@kernel.org

Changes in v2:
- changed to use pm_runtime_get_if_active()
- add corresponding put()
- Link to v1: https://patch.msgid.link/20260521-bcmpipm-v1-1-3eba88d88045@kernel.org

To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
To: Ray Jui <rjui@broadcom.com>
To: Scott Branden <sbranden@broadcom.com>
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil@kernel.org>
To: Naushir Patuck <naush@raspberrypi.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: linux-media@vger.kernel.org
Cc: linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/media/platform/broadcom/bcm2835-unicam.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
index 14bb916dd7b1..7745aee711cb 100644
--- a/drivers/media/platform/broadcom/bcm2835-unicam.c
+++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
@@ -2043,6 +2043,7 @@ static int unicam_log_status(struct file *file, void *fh)
 	struct unicam_node *node = video_drvdata(file);
 	struct unicam_device *unicam = node->dev;
 	u32 reg;
+	int pm_active;
 
 	/* status for sub devices */
 	v4l2_device_call_all(&unicam->v4l2_dev, 0, core, log_status);
@@ -2052,6 +2053,14 @@ static int unicam_log_status(struct file *file, void *fh)
 		 node->fmt.fmt.pix.width, node->fmt.fmt.pix.height);
 	dev_info(unicam->dev, "V4L2 format:         %08x\n",
 		 node->fmt.fmt.pix.pixelformat);
+
+	pm_active = pm_runtime_get_if_active(unicam->dev);
+	if (!pm_active) {
+		dev_info(unicam->dev,
+			 "Live data N/A due to device inactive\n");
+		return 0;
+	}
+
 	reg = unicam_reg_read(unicam, UNICAM_IPIPE);
 	dev_info(unicam->dev, "Unpacking/packing:   %u / %u\n",
 		 unicam_get_field(reg, UNICAM_PUM_MASK),
@@ -2065,6 +2074,9 @@ static int unicam_log_status(struct file *file, void *fh)
 	dev_info(unicam->dev, "Write pointer:       %08x\n",
 		 unicam_reg_read(unicam, UNICAM_IBWP));
 
+	if (pm_active == 1)
+		pm_runtime_put(unicam->dev);
+
 	return 0;
 }
 

---
base-commit: 903c1cf6dff9964e71eda98a39e2e5d442050472
change-id: 20260521-bcmpipm-6c578e73239c

Best regards,
--  
Eugen Hristev <ehristev@kernel.org>

