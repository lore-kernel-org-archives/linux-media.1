Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778723F485D;
	Fri, 17 Jul 2026 11:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784286324; cv=none; b=RBRJLxd8Fov6I3spRg1SdDL06YQlcgf3dzaZFt0fTKcDECt7KVbV2qH1pFvqvAU1dhp02zxl4cJ/1RYLqj9A5d837Ei0JbjYTh9PwZXejHlLl78B7/+G5KHzFouRl1wEOi3MKUpTzv2WkBOcBWnecBeBRMNbvQiSX7mWa4nbg3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784286324; c=relaxed/simple;
	bh=iMWS1uRm6ThowvAMGP3VxcUHNYt0kc5cCSs3koYZCbM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A/mxmURTSZk4Bn0avyuk545HZn3JxL2DZE3pMxcZMzCE4SQLdc461yC/fcfoIQKIbTQbL3Cm8YT2THW2++JeAbBkajML+Hv6ss5Ol3/FobHJfoZsbzALYQUB7TlnbpOA9R6nlOdfl2AkbAjSCUCo2kp6C7traoh0P1nzkSlXORA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=v0cahx6Y; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="v0cahx6Y"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:66a6:48e1:9e1:50d5:c75c])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6AF401337;
	Fri, 17 Jul 2026 13:04:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784286259;
	bh=iMWS1uRm6ThowvAMGP3VxcUHNYt0kc5cCSs3koYZCbM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=v0cahx6YRZPUwZE2vJ3nBR666MzXRHUzLUQOhDIa2k5VyRDa/Tq8sbLutb/nVQyH9
	 uI09gUpamfq4Xt7HOeNlMZuS9sz40NKxWNLeVNjI6m2eIVfeO3x1oNwhysn8i97soy
	 mbvjFIqMj1ch7Y18vzYaL2DvJdXaxI+qCWt18rGc=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 17 Jul 2026 16:34:17 +0530
Subject: [PATCH v3 2/9] platform/raspberrypi: vchiq-mmal: Move headers to
 include/linux
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-b4-vchiq-isp-v3-2-fb8235e15c68@ideasonboard.com>
References: <20260717-b4-vchiq-isp-v3-0-fb8235e15c68@ideasonboard.com>
In-Reply-To: <20260717-b4-vchiq-isp-v3-0-fb8235e15c68@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4837;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=iMWS1uRm6ThowvAMGP3VxcUHNYt0kc5cCSs3koYZCbM=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqWgxVTvUV63MBjTMFLwzj8l19deZ83O652pWU8
 GSI1kU3TsCJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaloMVQAKCRBD3pH5JJpx
 Ra5lEADGG9Nm/iCGWxKLBheKTsMjNIClOVrSiUKb/q6FgMkGgPykqU1zMKzmnLQOq8UzF4irIEG
 iHV6xwZeYMn/mgKqVdWPQ+qeSuGkmrGzKzK0OvCNdNEfXB+88rKiKAIjGLX41RcZHDkbfjkMW6Q
 5GIM4grVBu+Za/JrWhd6JKMsMFpGQpIyKFpSgH3RZKMt7TNPcXWlD4OMiKs+SZF3N7R3wcMIDsj
 94FNloE+H9UGwhJTKZvAd7XTLHxJvrEWLuGH6KPcJBGD8LqyVit8FpHR79gCCchJzh0c2Di7s/G
 yIqBkeO46H7hSFjKm0upwCNpk6tQOEvbo1Ro9lLXD8la0EOETO10UGX7QW8WHg46WP+DfNhSzwl
 muSMRfCj0j+X7HYedWhIpIUOpFHcUUBCqDDvnpvC1fwX5r/bU3J1lOQ+WLopKefKN1UXV22Ct4a
 urQcKKVRjp+Ql9Pcv7XW/Yn6N3zUICNzZd1nCFAxea3NapHHiibuAK3CzYPy2vHLbZ9wVmg00ay
 7iUpRC6SUTS7mQ44bw4/wq9tALLYQgqSnNwMzHCrM+FwBPXKCv2WKpA6Apl6pBEhQs8hJv22wQn
 q8YDIEeLWuP07RJquAnG7YksHU1gRlD/eTiL2nxc+EHYaWQaVG0D1kOCtcWYSwYTc3b/Osdd1sa
 TyIiZxIO1faLqIQ==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

Now that VCHIQ interface is destaged, different drivers (like ISP or
codec) no longer live under the same tree as VCHIQ-MMAL, but in their
relevant trees like media or audio.

Enable access to the MMAL headers for such drivers by moving them under
include/linux/raspberrypi with other VCHIQ headers.

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v3:
- Split missing includes patch
- Update commit message
---
 MAINTAINERS                                                      | 1 +
 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c             | 9 ++++-----
 .../vchiq-mmal => include/linux/raspberrypi}/mmal-common.h       | 0
 .../vchiq-mmal => include/linux/raspberrypi}/mmal-encodings.h    | 0
 .../vchiq-mmal => include/linux/raspberrypi}/mmal-msg-common.h   | 0
 .../vchiq-mmal => include/linux/raspberrypi}/mmal-msg-format.h   | 0
 .../vchiq-mmal => include/linux/raspberrypi}/mmal-msg-port.h     | 0
 .../vchiq-mmal => include/linux/raspberrypi}/mmal-msg.h          | 0
 .../vchiq-mmal => include/linux/raspberrypi}/mmal-parameters.h   | 0
 .../vchiq-mmal => include/linux/raspberrypi}/mmal-vchiq.h        | 0
 10 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f81226569eb2..d570a293b1d1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5114,6 +5114,7 @@ F:	Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
 F:	drivers/pci/controller/pcie-brcmstb.c
 F:	drivers/platform/raspberrypi/vchiq-*
 F:	drivers/staging/vc04_services
+F:	include/linux/raspberrypi/mmal*
 F:	include/linux/raspberrypi/vchiq*
 N:	bcm2711
 N:	bcm2712
diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
index ccd8910c315f..80406e1f4bdc 100644
--- a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
@@ -22,17 +22,16 @@
 #include <linux/mm.h>
 #include <linux/slab.h>
 #include <linux/completion.h>
+#include <linux/raspberrypi/mmal-common.h>
+#include <linux/raspberrypi/mmal-parameters.h>
+#include <linux/raspberrypi/mmal-vchiq.h>
+#include <linux/raspberrypi/mmal-msg.h>
 #include <linux/raspberrypi/vchiq.h>
 #include <linux/raspberrypi/vchiq_arm.h>
 #include <linux/raspberrypi/vc_sm_knl.h>
 #include <linux/vmalloc.h>
 #include <media/videobuf2-vmalloc.h>
 
-#include "mmal-common.h"
-#include "mmal-parameters.h"
-#include "mmal-vchiq.h"
-#include "mmal-msg.h"
-
 /*
  * maximum number of components supported.
  * This matches the maximum permitted by default on the VPU
diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h b/include/linux/raspberrypi/mmal-common.h
similarity index 100%
rename from drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h
rename to include/linux/raspberrypi/mmal-common.h
diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-encodings.h b/include/linux/raspberrypi/mmal-encodings.h
similarity index 100%
rename from drivers/platform/raspberrypi/vchiq-mmal/mmal-encodings.h
rename to include/linux/raspberrypi/mmal-encodings.h
diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-msg-common.h b/include/linux/raspberrypi/mmal-msg-common.h
similarity index 100%
rename from drivers/platform/raspberrypi/vchiq-mmal/mmal-msg-common.h
rename to include/linux/raspberrypi/mmal-msg-common.h
diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-msg-format.h b/include/linux/raspberrypi/mmal-msg-format.h
similarity index 100%
rename from drivers/platform/raspberrypi/vchiq-mmal/mmal-msg-format.h
rename to include/linux/raspberrypi/mmal-msg-format.h
diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-msg-port.h b/include/linux/raspberrypi/mmal-msg-port.h
similarity index 100%
rename from drivers/platform/raspberrypi/vchiq-mmal/mmal-msg-port.h
rename to include/linux/raspberrypi/mmal-msg-port.h
diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-msg.h b/include/linux/raspberrypi/mmal-msg.h
similarity index 100%
rename from drivers/platform/raspberrypi/vchiq-mmal/mmal-msg.h
rename to include/linux/raspberrypi/mmal-msg.h
diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-parameters.h b/include/linux/raspberrypi/mmal-parameters.h
similarity index 100%
rename from drivers/platform/raspberrypi/vchiq-mmal/mmal-parameters.h
rename to include/linux/raspberrypi/mmal-parameters.h
diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.h b/include/linux/raspberrypi/mmal-vchiq.h
similarity index 100%
rename from drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.h
rename to include/linux/raspberrypi/mmal-vchiq.h

-- 
2.54.0

