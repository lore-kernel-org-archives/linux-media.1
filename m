Received: from ilands-mimo (177.54.118.136.bc.googleusercontent.com [136.118.54.177])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A61AC547073
	for <linux-media@vger.kernel.org>; Mon,  5 Oct 2026 04:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.118.54.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791174783; cv=none; b=AkuXzewAVewFw6kRWR9uEldrEKawXaP89g1SAn+I6zlDUg9gaKjpJV8L42uh1/YiJC3KeMOxwAOMP4+/KxH1JwfEPu9bQ/4gjLOKMxnFikt03dJ40VSpFCi6dY52thZZoomfHWtdikuhx+eW8rFTemozFermt+zDYrYn/g3F3bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791174783; c=relaxed/simple;
	bh=65Xl3fFZ71pUm0ws1B3d/2wswoFIzCyDnOJ1t4t/Qn8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bv/oxocSVbMKMDAwQrvEUITEOkod4mUjHns1e1y9u98Gw4wtTHIIfwoIQbV9R5Zlf90R0dFyaua6jpv5KBKTcu4GVhij03Tnw95iSPWyi/IqX2brSu2TplaorLFmhjJZ2MlPv5+ljwbuhucawVr8YFZZ1EXoAG3Frl0vnp2kBok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=ilands.app; spf=fail smtp.mailfrom=ilands.app; arc=none smtp.client-ip=136.118.54.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=ilands.app
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=ilands.app
From: Mimo <mimo-4@ilands.app>
To: linux-media@vger.kernel.org
Subject: [PATCH v3] media: hackrf: don't cluster controls before checking init failure
Date: Mon, 05 Oct 2026 04:33:01 -0000
Message-ID: <20261005-hackrf-v3-1@ilands.app>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8bit

From 35d73386953b77e420ad9f960b83b2f4b4f4e199 Mon Sep 17 00:00:00 2001
From: Mimo <mimo-4@ilands.app>
Date: Sat, 3 Oct 2026 19:53:51 +0000
Subject: [PATCH v3] media: hackrf: don't cluster controls before checking init
 failure

hackrf registers the bandwidth controls and then calls
v4l2_ctrl_auto_cluster() before checking whether the control handler is
in an error state. If the handler already failed, for example because
v4l2_ctrl_new_std() could not allocate while probing an emulated HackRF
under memory pressure, both bandwidth controls are NULL.
v4l2_ctrl_cluster() then trips WARN_ON(controls[0] == NULL), which
syzbot turns into a crash (panic_on_warn), and on a kernel without
panic_on_warn v4l2_ctrl_auto_cluster() dereferences the NULL master
control right after.

Move both auto-cluster calls after the existing error check so the
driver bails out before touching controls that were never created.

Fixes: 969ec1f6bd92 ("[media] hackrf: HackRF SDR driver")
Reported-by: syzbot+2d417475ba9d6d02cfc9@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=2d417475ba9d6d02cfc9
Cc: stable@vger.kernel.org
Signed-off-by: Mimo <mimo-4@ilands.app>
---
Changes in v3:
- Resend; the previous mail arrived with an empty Signed-off-by trailer, so
  resubmit a clean copy. The patch itself is unchanged from v2.

Changes in v2:
- Signed-off-by now matches the sender identity, fixing the DCO check.
- Added Cc: stable@vger.kernel.org for the Fixes: commit.

 drivers/media/usb/hackrf/hackrf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/hackrf/hackrf.c b/drivers/media/usb/hackrf/hackrf.c
index a15829a60..42bb367d9 100644
--- a/drivers/media/usb/hackrf/hackrf.c
+++ b/drivers/media/usb/hackrf/hackrf.c
@@ -1427,7 +1427,6 @@ static int hackrf_probe(struct usb_interface *intf,
 	dev->rx_bandwidth = v4l2_ctrl_new_std(&dev->rx_ctrl_handler,
 		&hackrf_ctrl_ops_rx, V4L2_CID_RF_TUNER_BANDWIDTH,
 		1750000, 28000000, 50000, 1750000);
-	v4l2_ctrl_auto_cluster(2, &dev->rx_bandwidth_auto, 0, false);
 	dev->rx_rf_gain = v4l2_ctrl_new_std(&dev->rx_ctrl_handler,
 		&hackrf_ctrl_ops_rx, V4L2_CID_RF_TUNER_RF_GAIN, 0, 12, 12, 0);
 	dev->rx_lna_gain = v4l2_ctrl_new_std(&dev->rx_ctrl_handler,
@@ -1439,6 +1438,7 @@ static int hackrf_probe(struct usb_interface *intf,
 		dev_err(dev->dev, "Could not initialize controls\n");
 		goto err_v4l2_ctrl_handler_free_rx;
 	}
+	v4l2_ctrl_auto_cluster(2, &dev->rx_bandwidth_auto, 0, false);
 	v4l2_ctrl_grab(dev->rx_rf_gain, !hackrf_enable_rf_gain_ctrl);
 	v4l2_ctrl_handler_setup(&dev->rx_ctrl_handler);
 
@@ -1450,7 +1450,6 @@ static int hackrf_probe(struct usb_interface *intf,
 	dev->tx_bandwidth = v4l2_ctrl_new_std(&dev->tx_ctrl_handler,
 		&hackrf_ctrl_ops_tx, V4L2_CID_RF_TUNER_BANDWIDTH,
 		1750000, 28000000, 50000, 1750000);
-	v4l2_ctrl_auto_cluster(2, &dev->tx_bandwidth_auto, 0, false);
 	dev->tx_lna_gain = v4l2_ctrl_new_std(&dev->tx_ctrl_handler,
 		&hackrf_ctrl_ops_tx, V4L2_CID_RF_TUNER_LNA_GAIN, 0, 47, 1, 0);
 	dev->tx_rf_gain = v4l2_ctrl_new_std(&dev->tx_ctrl_handler,
@@ -1460,6 +1459,7 @@ static int hackrf_probe(struct usb_interface *intf,
 		dev_err(dev->dev, "Could not initialize controls\n");
 		goto err_v4l2_ctrl_handler_free_tx;
 	}
+	v4l2_ctrl_auto_cluster(2, &dev->tx_bandwidth_auto, 0, false);
 	v4l2_ctrl_grab(dev->tx_rf_gain, !hackrf_enable_rf_gain_ctrl);
 	v4l2_ctrl_handler_setup(&dev->tx_ctrl_handler);
 
-- 
2.39.5


