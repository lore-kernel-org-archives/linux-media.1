Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A1C3DD850
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 22:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780697312; cv=none; b=mdAysYHPr9faUt6oh3Bw1anCgFk4vTFIbkyZLK/Tpu3OfOYToSDTtV5TYFJitStYgHSmrkYByVxJeU1NZbZVzPy9MILCvMgJnSQXryhVkIXRux7qO9jZWb2mf0Kk8H+6hwvQVCS5VQcts52O3sGEbSiKfWZTOUL7vT323GE/sSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780697312; c=relaxed/simple;
	bh=3lB6SIc4z983gdFSSBdDF3XCzDGtkT4zgcI9V2ZTIHo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UoWLsqjxvvQQmMgBgdthrVit69KxToao7h612+yWVjoSR1zAIuuDJdIkqWCZxnKmv4ohXB+hwA8ALhIdYPyOxRZNTW0+UXA3TdinicfiRJtJ5b5KznB6XbvNEvdv4ZztrR4wS/cjNb+CeV890A1lfTwLB5BzmUm0d/jlpxBj7eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wVciD-0000LW-Ii; Sat, 06 Jun 2026 00:08:21 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Sat, 06 Jun 2026 00:07:00 +0200
Subject: [PATCH 14/17] media: rockchip: rga: put all cores into first core
 iommu domain
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260606-spu-rga3multicore-v1-14-3ec2b15675f7@pengutronix.de>
References: <20260606-spu-rga3multicore-v1-0-3ec2b15675f7@pengutronix.de>
In-Reply-To: <20260606-spu-rga3multicore-v1-0-3ec2b15675f7@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Detlev Casanova <detlev.casanova@collabora.com>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.15.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

Put all cores into the iommu domain of the first core to allow them to
be used by any core. All buffers accessed by the hardware are allocated
on the first core, as the scheduling to a specific core is done after
the allocation. Therefore put all cores into the same domain to have the
same iommu mapping on all cores.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 6add6c510c127..9cebb461b3fd2 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -10,6 +10,7 @@
 #include <linux/delay.h>
 #include <linux/fs.h>
 #include <linux/interrupt.h>
+#include <linux/iommu.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
@@ -757,6 +758,19 @@ static int rga_core_bind(struct device *dev, struct device *master, void *data)
 		  version.major, version.minor);
 
 	if (rga->num_cores) {
+		/* Attach to the first cores iommu */
+		struct iommu_domain *domain = iommu_get_domain_for_dev(rga->cores[0]->dev);
+
+		if (IS_ERR(domain)) {
+			dev_err(core->dev, "Couldn't get domain of the first core\n");
+			return PTR_ERR(domain);
+		}
+		ret = iommu_attach_device(domain, core->dev);
+		if (ret) {
+			dev_err(core->dev, "Couldn't attach to the domain of the first core\n");
+			return ret;
+		}
+
 		/* we are not the first core, expect that we have the same version */
 		if (rga->version.major != version.major || rga->version.minor != version.minor)
 			v4l2_warn(&rga->v4l2_dev, "Detected multi-core setup with different core versions!\n");

-- 
2.54.0

