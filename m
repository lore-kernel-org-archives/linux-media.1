Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4593B3890;
	Tue, 24 Mar 2026 10:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774348928; cv=none; b=tV1KxjKozR9i98IHH7v45N6aChTYPM+TyAHc1aO9xqd8bM2euZmmCVw/Ewep2CIh8S80PDTNjYXax13g4Qo4LfxlrOZndRZrc81iFRCtHJr6sWtyRFoxMJTYcgXD/InwUazZ4EeOEAZnB3dYsnWpvHAHVfVippmpOthJGKxl50M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774348928; c=relaxed/simple;
	bh=Uc6xjJaFE7PobznqEBdDlJgmxrZXf0y3Ig7nqbSGQzY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uIdnAaYUSKh9nXgvOyhUSBiV2QtI2uMpqJ6VpABkFi9ogUg5NE0zN4PYM2qqlgrzFwfdsCGsDqCyTMATxDr1lby0ZuJaxyU5SQzVl3cTFbGvXouwIIwadrMpxk2UINRXxqE7IYYiyF2vIrMZ7DW6fcR8Xow5XALGpw7jmKRetjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=YmtBCGVr; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="YmtBCGVr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=XfCMILvliDmEG90LbBt8CLqzU1EbXJrdVztecSvsrrA=; b=YmtBCGVraPlzEIKgwiX1ruefs3
	RNyKZ0hN663cwWsRvIl8ATbLpeN1FHyEXtm98UkKKzuy3vSFguPgOWkO17CaGt2f/a0X4DI4CCy0t
	IWvBfHG1YXDWiDb4jcmuZwMK3eMEjsx0s8qbXkFMKv/6jifuVm6S4g8u1qcxNlaM24BM=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:55336 helo=[127.0.1.1])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1w4zCz-00DIvK-Op; Tue, 24 Mar 2026 11:42:02 +0100
From: Matthias Fend <matthias.fend@emfend.at>
Date: Tue, 24 Mar 2026 11:41:35 +0100
Subject: [PATCH v3 1/9] media: i2c: ov08d10: fix runtime PM handling in
 probe
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-ov08d10-v3-1-1e44069cf91e@emfend.at>
References: <20260324-ov08d10-v3-0-1e44069cf91e@emfend.at>
In-Reply-To: <20260324-ov08d10-v3-0-1e44069cf91e@emfend.at>
To: Jimmy Su <jimmy.su@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Matthias Fend <matthias.fend@emfend.at>, 
 bsp-development.geo@leica-geosystems.com
X-Mailer: b4 0.14.2
X-Spam-Score: -1.0
X-Spam-Bar: -
X-Spam-Report: Spam detection software, running on the system "lx20.hoststar.hosting",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  This series provides basic device tree support and handling
    for power supplies, an optional reset, and the option to use a 24MHz input
    clock. In addition to a few minor fixes, a major problem with the configuration
    of the sensor modes has also been resolved. 
 
 Content analysis details:   (-1.0 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -1.0 ALL_TRUSTED            Passed through trusted hosts only via SMTP
  0.0 TVD_RCVD_IP            Message was received from an IP address
  0.0 KAM_DMARC_STATUS       Test Rule for DKIM or SPF Failure with Strict
                             Alignment (older systems)
  0.0 Local_hs_NotFromHoststar Sender is NOT hoststar.(ch|at|com)
  0.0 Local_hs_NotToHoststar Recipient is NOT hoststar.(ch|at|com)

Set the device's runtime PM status and enable runtime PM before registering
the async sub-device. This is needed to avoid the case where the device is
runtime PM resumed while runtime PM has not been enabled yet.

Remove the related, non-driver-specific comment while at it.

Fixes: 7be91e02ed57 ("media: i2c: Add ov08d10 camera sensor driver")
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
---
 drivers/media/i2c/ov08d10.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ov08d10.c b/drivers/media/i2c/ov08d10.c
index 43ec2a1f2fcffb7fa11a6268af3c2edc4df129f3..5b02f61e359fa900da9290c1c151aa01b9d70e6e 100644
--- a/drivers/media/i2c/ov08d10.c
+++ b/drivers/media/i2c/ov08d10.c
@@ -1430,6 +1430,9 @@ static int ov08d10_probe(struct i2c_client *client)
 		goto probe_error_v4l2_ctrl_handler_free;
 	}
 
+	pm_runtime_set_active(ov08d10->dev);
+	pm_runtime_enable(ov08d10->dev);
+
 	ret = v4l2_async_register_subdev_sensor(&ov08d10->sd);
 	if (ret < 0) {
 		dev_err(ov08d10->dev, "failed to register V4L2 subdev: %d",
@@ -1437,17 +1440,13 @@ static int ov08d10_probe(struct i2c_client *client)
 		goto probe_error_media_entity_cleanup;
 	}
 
-	/*
-	 * Device is already turned on by i2c-core with ACPI domain PM.
-	 * Enable runtime PM and turn off the device.
-	 */
-	pm_runtime_set_active(ov08d10->dev);
-	pm_runtime_enable(ov08d10->dev);
 	pm_runtime_idle(ov08d10->dev);
 
 	return 0;
 
 probe_error_media_entity_cleanup:
+	pm_runtime_disable(ov08d10->dev);
+	pm_runtime_set_suspended(ov08d10->dev);
 	media_entity_cleanup(&ov08d10->sd.entity);
 
 probe_error_v4l2_ctrl_handler_free:

-- 
2.34.1

