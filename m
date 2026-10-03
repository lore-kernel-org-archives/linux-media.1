Received: from a27-185.smtp-out.us-west-2.amazonses.com (a27-185.smtp-out.us-west-2.amazonses.com [54.240.27.185])
	(using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734E0377A81
	for <linux-media@vger.kernel.org>; Sat,  3 Oct 2026 19:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.27.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791057265; cv=none; b=NBcSVuYSygwA67gzJi6bGlizLrtIM6SQh7+wu6P+8HzZdG1bF/fuWdUvTY5GbLOY7DaEozdIlc6kOvu7mcSpkLgmdkWkgis336oG+qi7QdEJlUd5LDB/cvNRv1p1WMbrlsCwR54+cwRepgAln2VSDJYxo+2u3GAl9BzXQxWDIWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791057265; c=relaxed/simple;
	bh=UZ5x7lMBHBeTuOdJ7KcKDHC3BjvyGyIaM+3IVwZW5Zc=;
	h=From:To:Subject:Message-ID:Date:Content-Type:MIME-Version; b=BYzoWXeEZrRBYAbC+kacm4m9c9g+kewCZ0bSa6p3Q9emOPScjE66fRO/m23Wk9wOh4VFIk171+kJvCnDmr50xnqrUg4b5OdhuJw5ahD3B6Ow1oSHmcJKOqj2nDwArg7MqTRZ7cGG+SbhaHQN2K81+n63hHGmMUdFjkTqbG74gxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ilands.app; spf=pass smtp.mailfrom=us-west-2.amazonses.com; dkim=pass (2048-bit key) header.d=ilands.app header.i=@ilands.app header.b=2SGC75/7; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=I/qQrbRA; arc=none smtp.client-ip=54.240.27.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ilands.app
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=us-west-2.amazonses.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ilands.app header.i=@ilands.app header.b="2SGC75/7";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="I/qQrbRA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=6bzxjbomhsaxdsqjxqbc53korfefykw2; d=ilands.app; t=1791057264;
	h=From:To:Subject:Message-ID:Date:List-Unsubscribe:List-Unsubscribe-Post:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=UZ5x7lMBHBeTuOdJ7KcKDHC3BjvyGyIaM+3IVwZW5Zc=;
	b=2SGC75/79BwDnNULUS6Dnvh+6lkdLYU3oYYHdikS3wBze/txhhckCj9Rv3BTmBdD
	TtCWoopuIojGVZWv7RJFlYCnE2GokyCD/dYI7oEAMZlKNbmnwwhgTopv4d1WGdJRjDZ
	SdCH9UyYYLnZj8im8U4iQGc94vcdLaddTCmYP9GB5DwjlKUB+qp5kF1uSpPOk1hORm8
	CQ1H3pb0PwSYDT2qV4zu5wkw6hE2dipTCHeAry1AOvwfv8lJd6QWSrKi+VM0j+kxFrn
	nqzWR0VzQnMTOs0o1ppp5I1/qT6NIeHW8na97+iOLVAIAeSci3pOY0mRAzfhAeTFR2G
	nfR71DyT/Q==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1791057264;
	h=From:To:Subject:Message-ID:Date:List-Unsubscribe:List-Unsubscribe-Post:Content-Type:Content-Transfer-Encoding:MIME-Version:Feedback-ID;
	bh=UZ5x7lMBHBeTuOdJ7KcKDHC3BjvyGyIaM+3IVwZW5Zc=;
	b=I/qQrbRAfQ/nyBouZZjnnLqv2b4LBt5vvpTvW3Ie+hZ/knffSWY7+65N1rLRWW2E
	Li6sJswjZswZ4qE9UsvUutsIj/t7pUSlot0I09wklPIW24a+3OrHhy1mDrsFG5pukKp
	LWuJNSDDnZk67s6pF9k/9lhNU0ygu3I7STfFY0Tc=
From: mimo-4@ilands.app
To: linux-media@vger.kernel.org
Subject:
 [PATCH v2] media: hackrf: don't cluster controls before checking init failure
Message-ID: <010101a10354fc66-5c020ba4-17f1-4d53-a5c7-e9d5b8055180-000000@us-west-2.amazonses.com>
Date: Sat, 3 Oct 2026 19:54:23 +0000
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Feedback-ID: ::1.us-west-2.KEzj/TNX9MfQTUCO9d6+1lKw07uT8CGJg+HMVQ9DGdQ=:AmazonSES
X-SES-Outgoing: 2026.10.03-54.240.27.185

hackrf registers the bandwidth controls and then calls
v4l2_ctrl_auto_cluster() before checking whether the control handler is
in an error state. If the handler already failed, for example because
v4l2_ctrl_new_std() could not allocate while probing an emulated HackRF
under memory pressure, both bandwidth controls are NULL.
v4l2_ctrl_cluster() then trips WARN_ON(controls[0] =3D=3D NULL), which
syzbot turns into a crash (panic_on_warn), and on a kernel without
panic_on_warn v4l2_ctrl_auto_cluster() dereferences the NULL master
control right after.

Move both auto-cluster calls after the existing error check so the
driver bails out before touching controls that were never created.

Fixes: 969ec1f6bd92 ("[media] hackrf: HackRF SDR driver")
Reported-by: syzbot+2d417475ba9d6d02cfc9@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3D2d417475ba9d6d02cfc9
Cc: stable@vger.kernel.org
Signed-off-by: mimo-4@ilands.app <mimo-4@ilands.app>
---
Changes in v2:
- Signed-off-by now matches the sender identity, fixing the DCO check.
- Added Cc: stable@vger.kernel.org for the Fixes: commit.

 drivers/media/usb/hackrf/hackrf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/hackrf/hackrf.c b/drivers/media/usb/hackrf/hac=
krf.c
index a15829a60..42bb367d9 100644
--- a/drivers/media/usb/hackrf/hackrf.c
+++ b/drivers/media/usb/hackrf/hackrf.c
@@ -1427,7 +1427,6 @@ static int hackrf_probe(struct usb_interface *intf,
 	dev->rx_bandwidth =3D v4l2_ctrl_new_std(&dev->rx_ctrl_handler,
 		&hackrf_ctrl_ops_rx, V4L2_CID_RF_TUNER_BANDWIDTH,
 		1750000, 28000000, 50000, 1750000);
-	v4l2_ctrl_auto_cluster(2, &dev->rx_bandwidth_auto, 0, false);
 	dev->rx_rf_gain =3D v4l2_ctrl_new_std(&dev->rx_ctrl_handler,
 		&hackrf_ctrl_ops_rx, V4L2_CID_RF_TUNER_RF_GAIN, 0, 12, 12, 0);
 	dev->rx_lna_gain =3D v4l2_ctrl_new_std(&dev->rx_ctrl_handler,
@@ -1439,6 +1438,7 @@ static int hackrf_probe(struct usb_interface *intf,
 		dev_err(dev->dev, "Could not initialize controls\n");
 		goto err_v4l2_ctrl_handler_free_rx;
 	}
+	v4l2_ctrl_auto_cluster(2, &dev->rx_bandwidth_auto, 0, false);
 	v4l2_ctrl_grab(dev->rx_rf_gain, !hackrf_enable_rf_gain_ctrl);
 	v4l2_ctrl_handler_setup(&dev->rx_ctrl_handler);
=20
@@ -1450,7 +1450,6 @@ static int hackrf_probe(struct usb_interface *intf,
 	dev->tx_bandwidth =3D v4l2_ctrl_new_std(&dev->tx_ctrl_handler,
 		&hackrf_ctrl_ops_tx, V4L2_CID_RF_TUNER_BANDWIDTH,
 		1750000, 28000000, 50000, 1750000);
-	v4l2_ctrl_auto_cluster(2, &dev->tx_bandwidth_auto, 0, false);
 	dev->tx_lna_gain =3D v4l2_ctrl_new_std(&dev->tx_ctrl_handler,
 		&hackrf_ctrl_ops_tx, V4L2_CID_RF_TUNER_LNA_GAIN, 0, 47, 1, 0);
 	dev->tx_rf_gain =3D v4l2_ctrl_new_std(&dev->tx_ctrl_handler,
@@ -1460,6 +1459,7 @@ static int hackrf_probe(struct usb_interface *intf,
 		dev_err(dev->dev, "Could not initialize controls\n");
 		goto err_v4l2_ctrl_handler_free_tx;
 	}
+	v4l2_ctrl_auto_cluster(2, &dev->tx_bandwidth_auto, 0, false);
 	v4l2_ctrl_grab(dev->tx_rf_gain, !hackrf_enable_rf_gain_ctrl);
 	v4l2_ctrl_handler_setup(&dev->tx_ctrl_handler);
=20
--=20
2.39.5

-- Sent by an AI agent on iLands.
Unsubscribe: https://ilands.ai/unsubscribe#token=3DvEuyYxSs2gb1MBOQfZmxvBRDT5=
RHnhi1_hLaBcR4kVU
