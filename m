Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795025346;
	b=1eBo4yRU9CretSlinyY8VWO6uNSGc81xR/CSnNpzFltyZ/PThLg1JkgRm018IIR/Asgk
	 oRgoTOm5GLhEPO4xZb+6oIJkO0yNlNOS3odFV3L7XSxFYv/k0+n8atwaAbEquyFARbA+Z
	 Xc+NGo2lMeJjKIyoxOVz5ADZuvenw98Bxp3psPJKDIO6HHD5REMRHmVMHsJ5UVASjHybh
	 elQH+LNHdYP63II+BWy2Qip2Vbq6u0ityUyDgm3hyyHm5fVjjIEZ88cjGBwT1k7pJgr9n
	 PONV/rN2HcjCG/dwNnH6mrcc+3UF2CWhPOL3ZGGqNScAN/FY7hxwFHJH5uqOsTBgjIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795025346;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=zPrI4dvsVw/+t9ULutPovtzpIsQOq291JIs4t5ai2jg=;
	b=P3KxMim0bDN72v0OH6mdpQi9+fGYiNp3gR5IhZoSQJRw8y66HmmJBP9HKzowjckw+u9U
	 ohNnbzKg7ZaNozXdjJjYqcyjjY8Q0gtwoBNatOl4OMZTI6NXJrFhnWMAL++TrHcqsB8q+
	 Ay7H1CNHi4Lwf5xs26o6z5tuIzM04ycHfuKsncYqCHU6QIyqrwmP927S7OeEn2ErNS8CX
	 mribn5f4mtERe89Kxd+nvGtFun9j1aF9Y2/Z2mwNoqLAVVvnsJ7SAEikUpU3iWjHiMEyG
	 wDpNnrzD1reIwoJnEcNWchnIq2AQAGNsgB0S9wB8ZTQbIkO/9EOISBps6Yu16eEZjzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=WnsM8Uea;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77FE606A32F;
	Wed, 18 Nov 2026 18:09:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C77FE606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=WnsM8Uea
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c67:cdf:7464:6c04:36e4:ee87])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 931EA34;
	Wed, 18 Nov 2026 19:06:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795025196;
	bh=ms3PCuSrnI9+C32o6Wzh1BRJIZUol0LHORntoI5HwFI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WnsM8Ueaxket4ByW6BRX61QQfAiCzIVMNDeSOaYSGJMDFPQi2QYNpTuITB8X3VpKo
	 CaB9CUyvqgUVw8qycgX6kwhWcbGobieRy9QKOTyUctZfg42OnbtxxALXm9RHl42ifz
	 p0vRwTC3ZbLoxdilUNwqJMg1GfAhFJD3JkSq7voM=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Wed, 18 Nov 2026 23:38:18 +0530
Subject: [PATCH v7 5/5] platform/raspberrypi: vchiq: Load bcm2835_isp
 driver from vchiq
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
Message-Id: <20261118-b4-vchiq-isp-v7-5-b8c81d193abf@ideasonboard.com>
References: <20261118-b4-vchiq-isp-v7-0-b8c81d193abf@ideasonboard.com>
In-Reply-To: <20261118-b4-vchiq-isp-v7-0-b8c81d193abf@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans Verkuil <hans@jjverkuil.nl>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, 
 Paul Elder <paul.elder@ideasonboard.com>, linux-media@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1897;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=LawGpoDpIsT4XigouVhGEr1vmXiXiOdrQJ9R/tQC5wM=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBq/emept9nabfAkIuU8mVvOao33RqaEOQyAeziz
 1uM0CowiI+JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCav3pngAKCRBD3pH5JJpx
 RVZTD/96SvF3hE4rGwKXv7QV/WXIyeScuLB+GD5wufIRbTD6f6fRtRzwsTQFGM8/ipH0ilZh4Y9
 wcrsOFb9ebPim/xqmDTPZJGodSA0I7L5ki24R40QUSIk/o6c4lQ/YxI3rNQV1yVNLXZppYJtD+9
 Gk9nDHincWQy9VgIZQXgVKwWTNBbBgjNBKnXVhxyVb9vJll7Yrvoias4SYEspBft41o3DFKi8H8
 2jZgWvJ58vPAhuiIzgIkuzkZeCdclBLEDEA6I5mg+VZMHZY3IVEkc2ESGN3qHGCXj97ofpoG9JZ
 9HwS4eiy0hZmn65E34lqjpaLU8GXvWQmgJ5guCjF9r91/emI85BZ9mTgKr7bKD0B2buADVpiCK9
 lY8K6r9kJksaHeIfgqpgIbtTHo6x25eOGZUX/YZzGAO1JfkuvQkJzI1EaMTDTiUK7IDvJMlgPKX
 rYaRr+5Kshau6a+szLbBruD+I/nbZW+zDjOy4K03X36v+gHL4SgWOIqLdn9g6duyNOu7V9MgArM
 e5+c8Dga52T+Fl5gVbByP8jqe80+A0GiFQrMlG+vluLyV6DSIq7gnUye9Up7YC7oNddZsCayixG
 4H7xaLK8U5saFXmQRmc6kmIKlXex/lPlp74045sKtKbWJ1tUGx1De4oTxhvg3n0bFwLt3dMdD04
 OVbbXuTKe8kMSNA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Naushir Patuck <naush@raspberrypi.com>

Broadcom BCM2835 ISP driver is managed through the VCHIQ interface, so
register it to the VCHIQ driver, similar to the audio and shared memory
drivers.

Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
Tested-by: Paul Elder <paul.elder@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c | 2 ++
 include/linux/raspberrypi/vchiq_arm.h                    | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
index ec951ab19d67..f35b40bdd963 100644
--- a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
+++ b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
@@ -1415,6 +1415,7 @@ static int vchiq_probe(struct platform_device *pdev)
 
 	mgmt->audio_dev = vchiq_device_register(&pdev->dev, "bcm2835-audio");
 	mgmt->vcsm_cma_dev = vchiq_device_register(&pdev->dev, "vcsm-cma");
+	mgmt->isp_dev = vchiq_device_register(&pdev->dev, "bcm2835-isp");
 
 	return 0;
 }
@@ -1423,6 +1424,7 @@ static void vchiq_remove(struct platform_device *pdev)
 {
 	struct vchiq_drv_mgmt *mgmt = dev_get_drvdata(&pdev->dev);
 
+	vchiq_device_unregister(mgmt->isp_dev);
 	vchiq_device_unregister(mgmt->vcsm_cma_dev);
 	vchiq_device_unregister(mgmt->audio_dev);
 	vchiq_debugfs_deinit();
diff --git a/include/linux/raspberrypi/vchiq_arm.h b/include/linux/raspberrypi/vchiq_arm.h
index d59837eaaa8c..ea1bd419e471 100644
--- a/include/linux/raspberrypi/vchiq_arm.h
+++ b/include/linux/raspberrypi/vchiq_arm.h
@@ -63,6 +63,7 @@ struct vchiq_drv_mgmt {
 	 */
 	struct vchiq_device *audio_dev;
 	struct vchiq_device *vcsm_cma_dev;
+	struct vchiq_device *isp_dev;
 };
 
 struct user_service {

-- 
2.56.0

