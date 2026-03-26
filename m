Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C635D401A31;
	Thu, 26 Mar 2026 16:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774542326; cv=none; b=E9OSBb2M8SgUF/Fh+TLV/uFRNbT/NAA+rgR2puh2XV6ribCKO/xvEndMpiaUk4CwwOrS2CnXLHum2sF7/rB7Op53ErUeEwhLFG4D4aaN/B0kAeCCPy4LGMokoDO/DJS4qKJw2DR3JpKjyQKXwUmXlS1DZBWXeAo7iE+NS47DCbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774542326; c=relaxed/simple;
	bh=ZgZDpQRSMfPBKxJ2VnOcaItDSaszC5rXA4r8Iu9baNQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=H2uoIaRGW73pJNqr7zzdczJ4lFwrxQHb7JQKGvds0b2MmqdGclX9BlUnDi10YdUAr0lYZlCNfypgCzQ4NJ6laaOZg8GgLnyhlZkdDIT2Aww8aNMzGIRVF3YfWv7bjkL8sFeGAnc8Q7WdDI2Gks+TDqfml+9YyDeoJKvUs0BFd84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=biDbeCjU; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="biDbeCjU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=7mUS7OPySrPGX4cMY41dJjLR+viFD3dCVn+ILwjM5Dc=; b=biDbeCjUEyn4VN3Mry99tCsEdG
	Yd1mZjfpPlO+vUC1sZlxixbCGNVSBJd6CdiEU8m+J0S1EcqAYde9S+K0MUqqATon0QkOE3PSzC42p
	DOAUkmbc05Ue6xeBS1CQuTX76zn4Cztza9ELsuyUlM55ZracgDM9Ix1QvgSINXMwJnPQ=;
Received: from 194-208-226-106.tele.net ([194.208.226.106]:56017 helo=[127.0.1.1])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1w5nW3-00GGUt-Ij; Thu, 26 Mar 2026 17:25:03 +0100
From: Matthias Fend <matthias.fend@emfend.at>
Date: Thu, 26 Mar 2026 17:24:56 +0100
Subject: [PATCH] fixup! media: i2c: ov08d10: add support for reset and
 power management
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-ov08d10-fixups-v1-1-d19914cdf667@emfend.at>
X-B4-Tracking: v=1; b=H4sIANddxWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYyMz3fwyA4sUQwPdtMyK0oJi3RRDY0PzpLREU8sUMyWgpoKiVKAM2MD
 o2NpaAMIxtoVgAAAA
X-Change-ID: 20260326-ov08d10-fixups-d1317bfa59d6
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jimmy Su <jimmy.su@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Matthias Fend <matthias.fend@emfend.at>
X-Mailer: b4 0.14.2
X-Spam-Score: 
X-Spam-Bar: 
X-Spam-Report: 

Unconditionally wait for the "XSHUTDN pull up to SCCB start" delay at
startup and fix a violation of the preferred line limit of 80 characters.

Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
---
 drivers/media/i2c/ov08d10.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov08d10.c b/drivers/media/i2c/ov08d10.c
index 9adef5446a61f3204fb809ca3f077c1afb5f7a47..da517eb2181b83ed2ad786bd5e197fe755a47ada 100644
--- a/drivers/media/i2c/ov08d10.c
+++ b/drivers/media/i2c/ov08d10.c
@@ -1358,11 +1358,11 @@ static int ov08d10_power_on(struct device *dev)
 		fsleep(5 * USEC_PER_MSEC);
 
 		reset_control_deassert(ov08d10->reset);
-
-		/* Delay from XSHUTDN pull up to SCCB start: 8ms */
-		fsleep(8 * USEC_PER_MSEC);
 	}
 
+	/* Delay from XSHUTDN pull up to SCCB start: 8ms */
+	fsleep(8 * USEC_PER_MSEC);
+
 	return 0;
 }
 
@@ -1515,7 +1515,8 @@ static int ov08d10_probe(struct i2c_client *client)
 		return ret;
 	}
 
-	ov08d10->reset = devm_reset_control_get_optional_exclusive(ov08d10->dev, NULL);
+	ov08d10->reset = devm_reset_control_get_optional_exclusive(ov08d10->dev,
+								   NULL);
 	if (IS_ERR(ov08d10->reset))
 		return dev_err_probe(ov08d10->dev, PTR_ERR(ov08d10->reset),
 				     "failed to get reset\n");

---
base-commit: 80a7ee2c54995130472b02c66acd34c2e171b90d
change-id: 20260326-ov08d10-fixups-d1317bfa59d6

Best regards,
-- 
Matthias Fend <matthias.fend@emfend.at>

