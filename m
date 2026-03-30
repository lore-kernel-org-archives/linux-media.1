Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CD43B47F2;
	Mon, 30 Mar 2026 09:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774863457; cv=none; b=lCKS3hQ/7TTy02bNUGqR9oDFWO1QLzMi+6ZZq2wpVo95Z3nAS8mKG+Rs5qmjiM+q0I/hpCYdv32FBRUI18BPsPt/Y22qcEc+jebizVvc08sNx/w8sSUYn0n1i2q5Hb8sJCxyTbQ51c2maXL7InIp4bM2G37SgxnXXhxdHn8CaqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774863457; c=relaxed/simple;
	bh=6eTC8ivQMaowuQSMttB5PKW1I3Jp7oOAYny//89yC5I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a6WrfeCH4vhELbTuOcK+mx01h4Q0AC+YPW+X7oxefpYO4C1LMXHCJgxInHHqWttS4HRU3j1w3EEmwng8e5bPXBs/AHnbN/ifhuieaGwoaPQzqfRrnomuhF7zQRTJNwHYZyF6pUSceij/W9ZM+jugk1wrN+F5MH9BQrVMsKArJ5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qJk4AJvx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qJk4AJvx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFA03C4CEF7;
	Mon, 30 Mar 2026 09:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774863456;
	bh=6eTC8ivQMaowuQSMttB5PKW1I3Jp7oOAYny//89yC5I=;
	h=From:To:Cc:Subject:Date:From;
	b=qJk4AJvxX0pVogEHVl6BtjN3FF2U4caIfHpkJqFnU16WD2DkWO61OwVdVw35mrnrE
	 XNVODF5hP5G7/dm3KIBduq1U86soTRU4PaUIWRTFdfGEi5ptTzYR55lKUVE1TISFyq
	 Lxcp9Yqe6OZHkrQctR5IOx5I80vRAE7g6xtzORguOQM02KpmAG5ks20aQ+Egcwv6Su
	 PSoRlOVBYGEhhBiiNuPMAD8pEf0SG+zJuadrtTStUJP2+4l9BOfiySFJOlCmsgtJ+l
	 sIf4bX/MKkzRDHwXwhR+rNe0hPiK/Chyccy/QJfPUOsqT5FN1HKzDJrLlJ5JryY2lT
	 Pkp7w7W4ntDdg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1w793u-00000006o54-2XKW;
	Mon, 30 Mar 2026 11:37:34 +0200
From: Johan Hovold <johan@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH v2] media: cx231xx: fix devres lifetime
Date: Mon, 30 Mar 2026 11:37:27 +0200
Message-ID: <20260330093727.1622465-1-johan@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

USB drivers bind to USB interfaces and any device managed resources
should have their lifetime tied to the interface rather than parent USB
device. This avoids issues like memory leaks when drivers are unbound
without their devices being physically disconnected (e.g. on probe
deferral or configuration changes).

Fix the driver state lifetime so that it is released on driver unbind.

Fixes: 184a82784d50 ("[media] cx231xx: use devm_ functions to allocate memory")
Cc: stable@vger.kernel.org	# 3.17
Signed-off-by: Johan Hovold <johan@kernel.org>
---

Changes in v2
 - Drop CC tag for Mauro to make the CI bot happy


 drivers/media/usb/cx231xx/cx231xx-cards.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-cards.c b/drivers/media/usb/cx231xx/cx231xx-cards.c
index b75535d6abaf..69b24205bc56 100644
--- a/drivers/media/usb/cx231xx/cx231xx-cards.c
+++ b/drivers/media/usb/cx231xx/cx231xx-cards.c
@@ -1573,7 +1573,8 @@ static int cx231xx_init_v4l2(struct cx231xx *dev,
 		 dev->video_mode.end_point_addr,
 		 dev->video_mode.num_alt);
 
-	dev->video_mode.alt_max_pkt_size = devm_kmalloc_array(&udev->dev, 32, dev->video_mode.num_alt, GFP_KERNEL);
+	dev->video_mode.alt_max_pkt_size = devm_kmalloc_array(&interface->dev, 32,
+							      dev->video_mode.num_alt, GFP_KERNEL);
 	if (dev->video_mode.alt_max_pkt_size == NULL)
 		return -ENOMEM;
 
@@ -1614,7 +1615,8 @@ static int cx231xx_init_v4l2(struct cx231xx *dev,
 		 dev->vbi_mode.num_alt);
 
 	/* compute alternate max packet sizes for vbi */
-	dev->vbi_mode.alt_max_pkt_size = devm_kmalloc_array(&udev->dev, 32, dev->vbi_mode.num_alt, GFP_KERNEL);
+	dev->vbi_mode.alt_max_pkt_size = devm_kmalloc_array(&interface->dev, 32,
+							    dev->vbi_mode.num_alt, GFP_KERNEL);
 	if (dev->vbi_mode.alt_max_pkt_size == NULL)
 		return -ENOMEM;
 
@@ -1656,7 +1658,9 @@ static int cx231xx_init_v4l2(struct cx231xx *dev,
 		 "sliced CC EndPoint Addr 0x%x, Alternate settings: %i\n",
 		 dev->sliced_cc_mode.end_point_addr,
 		 dev->sliced_cc_mode.num_alt);
-	dev->sliced_cc_mode.alt_max_pkt_size = devm_kmalloc_array(&udev->dev, 32, dev->sliced_cc_mode.num_alt, GFP_KERNEL);
+	dev->sliced_cc_mode.alt_max_pkt_size = devm_kmalloc_array(&interface->dev, 32,
+								  dev->sliced_cc_mode.num_alt,
+								  GFP_KERNEL);
 	if (dev->sliced_cc_mode.alt_max_pkt_size == NULL)
 		return -ENOMEM;
 
@@ -1720,7 +1724,7 @@ static int cx231xx_usb_probe(struct usb_interface *interface,
 	udev = interface_to_usbdev(interface);
 
 	/* allocate memory for our device state and initialize it */
-	dev = devm_kzalloc(&udev->dev, sizeof(*dev), GFP_KERNEL);
+	dev = devm_kzalloc(&interface->dev, sizeof(*dev), GFP_KERNEL);
 	if (dev == NULL) {
 		retval = -ENOMEM;
 		goto err_if;
@@ -1850,7 +1854,9 @@ static int cx231xx_usb_probe(struct usb_interface *interface,
 			 dev->ts1_mode.end_point_addr,
 			 dev->ts1_mode.num_alt);
 
-		dev->ts1_mode.alt_max_pkt_size = devm_kmalloc_array(&udev->dev, 32, dev->ts1_mode.num_alt, GFP_KERNEL);
+		dev->ts1_mode.alt_max_pkt_size = devm_kmalloc_array(&interface->dev, 32,
+								    dev->ts1_mode.num_alt,
+								    GFP_KERNEL);
 		if (dev->ts1_mode.alt_max_pkt_size == NULL) {
 			retval = -ENOMEM;
 			goto err_video_alt;
-- 
2.52.0

