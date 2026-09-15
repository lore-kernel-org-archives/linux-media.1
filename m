Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92493F1ACE
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 08:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789460564; cv=none; b=MqQqwK/SihUPPGPMPSgqKB3KP1+WmGvX2kqkFR8ZSLgpAGSd90oEwZPWltnmoJYUrm/MYdXUQu5Mc15pfXsprhLdH/ZqhfkNY9NtBHKCbAxtH6QrZSWAeWZJwyYdc8aQpu2KTcamPrmLK1DibIlbZG4fQR3GOtQhTunGI8JbRLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789460564; c=relaxed/simple;
	bh=C9KYtPlI7ZMCyFQ9z0YFTlmCZFRzUMM33buNbWt5z4U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WPn1KCNqNjBCTwrkcQ+X4xPKwSPeACdR5qiTs5oi1YYhx5HaDfH7pt+5MhhShq4I0r9d0UQX+9ys36nA27otIkI7jxzXRKJDCyGwgDnIeIwU4ihXX04Cx7t9RCcweZIOlb6JY6+tDAcL9pbcGkwGx6F3N/PdrAWA72Bggl5wkzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ELK0ebjI; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ELK0ebjI"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4ab4fe290so713380a12.1
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 01:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789460561; x=1790065361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vnJp0gFL0rnbjTXBsTtZtrnRTdihrTDqa0f0ZnMfF0M=;
        b=ELK0ebjIerWSvbTWmvxCOMc++ii+a61Ul0rJ1Z8Arju0vBNDUk3FS1CD2LKG8PvkRq
         f3qFcDs8GnIk+DSQJW38UXFMyE3euIlVR0E8/BWBjTAzmHV1DJCDyV6YoxWquL69hL2c
         218vBGhDlb8jEgAG12xuGkUWuVwtrtOdTN8xBNMJgou9ke2V3dvBzjM+VIzEbgyOpj0o
         lfmh1QGBkgSsca0VyrDiGAvpqI62mKsyICApKjxTp+UJSg0bqx9xXqxAfZQUbZ3T0uiB
         juBwC+NUuKqEODdkVxBM8HLHAiVn4T8XJTjyp4vvbuqG7CcEdULzDoYJdtvpU25Ji1To
         FpEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789460561; x=1790065361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vnJp0gFL0rnbjTXBsTtZtrnRTdihrTDqa0f0ZnMfF0M=;
        b=S4WkII5JQq/IrVBxDjW2NSkkvmAR64DI5FlIn42QDQ3kqg6KTzwT/d2Ku/TPQP3R7Z
         CSa9dLRZ+eSThIaZKvsAkDs7n0k7uD38rNHDCO3yA15YN0W7ZG8B4Ws/HPRZ/aUJ4y7M
         Wz4o1/BKJFdfC83yuns2ZCzZ8mwO/G8Wh2w+WlGT+RMtoRuQ8WksGVIMowa3XWTRwaqi
         rDZ+H1AABFhGn5W15U4JVd77mMf1GLg0/uKWfp9KO8s+TKxSvdeMA2CNAO/xo24m8ucX
         yuOkQyjMSHpNCY+i8oiMcRtO2VPzvD8DFJC//2OQeuM7nSeEeZHh1zugxmqiiDvRwEpz
         lIeQ==
X-Forwarded-Encrypted: i=1; AKwUvBwji15wLFMQGc+xrthMWr0Y3ytBv8h8ZBXAWO7MaxQXagfPXGeq3CeZ/udi47k/qPaUrQ/H4U42ve3NWg==@vger.kernel.org
X-Gm-Message-State: AFuF++l4Rp4SuU9+g5fe5n/dpiH9G/oiaZ2V5SYymsdEPLWrZlDfvlQz
	y71DcCvUkt1B0Df1S1UcltQHEpdBzkD+kVT7WVbg2ldQvXKRgCXmHISp
X-Gm-Gg: AYBFou3DBowgK0MpkvbJHXwGm0msB8BAJ6CWmck7StMvoycnAIvV6ue21YuyQS6y2r1
	/Na05FUs15DkGscWgdCtUmn4p6cCR2sh5s2ZEjLrReP3tbM/dTeF9cc0g1WdLsMqoxd6FdHbQym
	h9lwWY1emIu0nJey/O5zGGmbuZCKyHMaWGtAgpEJx6qHOZsH3VJ7XyeqUXOwjgEJHWLagJo6G8Y
	kFdflCql7R8RPISp3I+KVmtAHUVub3kUqbhL2PNZIA5RbsUBf5djI57GbV8Z3vcUECZSZKixlFy
	lBsuJ1Av9WNcSaXqS3XA2Jsq6kfVVW+NCjXO4IBgyGAtmRfz5DjoqWKA3r3nGgS5y3L1ajARpFa
	fBYrHHUYUwweuH78fGncA7FmT+tDQxdKIgTCXwQmnJEZHv8FNlh5Jn0pPiRAJTDaK7XAcZxv5pc
	VcEMlRVycop1e21QduqmbwsnJRmRGEWW3x4Z81ZqUBn6k9dyh/dUMaJA==
X-Received: by 2002:a17:902:ebd1:b0:2db:2c05:5d92 with SMTP id d9443c01a7336-2dd764ea0abmr38594445ad.8.1789460561120;
        Tue, 15 Sep 2026 01:22:41 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cca26cdsm63466485ad.7.2026.09.15.01.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:22:40 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Benjamin Bara <benjamin.bara@skidata.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: i2c: imx290: fix runtime PM reference handling on probe errors
Date: Tue, 15 Sep 2026 16:22:29 +0800
Message-ID: <20260915082229.2235439-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imx290_probe() takes an initial runtime PM reference with
pm_runtime_get_noresume(). Historically, the probe error path balanced
that reference with pm_runtime_put_noidle().

The change that moved the successful-path pm_runtime_put_autosuspend()
into imx290_subdev_init() made the initial runtime PM reference get
dropped once imx290_subdev_init() is called.

The longest probe error path, however, still falls through to err_pm
and calls pm_runtime_put_noidle(). Failures from imx290_subdev_init()
or v4l2_async_register_subdev() therefore decrement the runtime PM
usage count a second time.

Move pm_runtime_put_noidle() to the imx290_stop_streaming() failure
path, which is the only error path taken before imx290_subdev_init()
drops the initial runtime PM reference.

This issue was found by manual code inspection.

Fixes: a92651b8e288 ("media: i2c: imx290: Avoid communication during probe()")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/i2c/imx290.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 21cbc81cb2ed..c2cdb1557dea 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -1634,6 +1634,7 @@ static int imx290_probe(struct i2c_client *client)
 	ret = imx290_stop_streaming(imx290);
 	if (ret) {
 		ret = dev_err_probe(dev, ret, "Could not initialize device\n");
+		pm_runtime_put_noidle(dev);
 		goto err_pm;
 	}
 
@@ -1662,7 +1663,6 @@ static int imx290_probe(struct i2c_client *client)
 	imx290_subdev_cleanup(imx290);
 err_pm:
 	pm_runtime_disable(dev);
-	pm_runtime_put_noidle(dev);
 	imx290_power_off(imx290);
 	return ret;
 }
-- 
2.43.0

