Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75483D4102;
	Tue, 24 Mar 2026 10:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774348929; cv=none; b=n3ZtfkbJIE4EEiBG788iGbsH+0XfQXbv05/HgTAm/RhVGy5VFoEEZPkVUbCCOTLSUQ0BQHdnXmVWHhC0ythnAFd61/82XY8x4s97Z1fBPvRh290CvlhYAH77Ju4NFPpO40bLLLfUREDlGuc1KJEHm367KBS759q53DkCcbrYS08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774348929; c=relaxed/simple;
	bh=IfU1Y8onDOfWqqELfqFJsJ0vpN6YdPyB9fFFjmm5Qfs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pDlCyieXB9sM7aS7Gm5vJt+Fr1t8p2uQO4rlJ+12T8F3kfCtiZAWAxrKmDUW37HZ+cJsb/wl0yxy29sSyDKwY2HAXUJDSSB3o3yi4YkbE9T6RMHuHWOmfB14LfM7duVdgY1tbKVNzzPffpBHpGZwpmfbRIVlBPTzTWv/D3NMeX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=Ss/lSACX; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="Ss/lSACX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=7SVm8W87fXLlxZkokAgEevAaF5wTPfi0LE7BY0/dgJ4=; b=Ss/lSACXx56UQrGjva/6MDo/wY
	IypKqcC9Qb0kmYfrmxnFdTM93aAsxU7PePBkc4xiL6xHqR5xwcgqoTOF7L5vNscNpgnm0oVjZQl7m
	Uhj5xi1MuaGhEcaa9I2KvPiu2tQ3uzqGHazXtc5T1nEEt1eVjc5pHQjCeQhZ59/wP8eY=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:55336 helo=[127.0.1.1])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1w4zD1-00DIvK-VW; Tue, 24 Mar 2026 11:42:04 +0100
From: Matthias Fend <matthias.fend@emfend.at>
Date: Tue, 24 Mar 2026 11:41:38 +0100
Subject: [PATCH v3 4/9] media: i2c: ov08d10: fix some typos in comments
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-ov08d10-v3-4-1e44069cf91e@emfend.at>
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
 
 Content preview:  Register P1:0x33 is written twice with the same value in the
    'lane_2_mode_1632x1224' sequence. Remove one unnecessary write access. Signed-off-by:
    Matthias Fend <matthias.fend@emfend.at> --- drivers/media/i2c/ov08d10.c |
    1 - 1 file changed, 1 deletion(-) 
 
 Content analysis details:   (-1.0 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -1.0 ALL_TRUSTED            Passed through trusted hosts only via SMTP
  0.0 TVD_RCVD_IP            Message was received from an IP address
  0.0 KAM_DMARC_STATUS       Test Rule for DKIM or SPF Failure with Strict
                             Alignment (older systems)
  0.0 Local_hs_NotFromHoststar Sender is NOT hoststar.(ch|at|com)
  0.0 Local_hs_NotToHoststar Recipient is NOT hoststar.(ch|at|com)

Fix some spelling errors in comments.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
---
 drivers/media/i2c/ov08d10.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/ov08d10.c b/drivers/media/i2c/ov08d10.c
index 9d54170cdf7da6fe4f03dbf64d5e8976df247846..fd1e0769eebe99ec2e827e9bfd0d0a7731116669 100644
--- a/drivers/media/i2c/ov08d10.c
+++ b/drivers/media/i2c/ov08d10.c
@@ -88,13 +88,13 @@ struct ov08d10_mode {
 	/* Frame height in pixels */
 	u32 height;
 
-	/* Horizontal timining size */
+	/* Horizontal timing size */
 	u32 hts;
 
-	/* Default vertical timining size */
+	/* Default vertical timing size */
 	u32 vts_def;
 
-	/* Min vertical timining size */
+	/* Min vertical timing size */
 	u32 vts_min;
 
 	/* Link frequency needed for this resolution */
@@ -533,7 +533,7 @@ struct ov08d10 {
 	/* Current mode */
 	const struct ov08d10_mode *cur_mode;
 
-	/* To serialize asynchronus callbacks */
+	/* To serialize asynchronous callbacks */
 	struct mutex mutex;
 
 	/* lanes index */
@@ -863,7 +863,7 @@ static int ov08d10_set_ctrl(struct v4l2_ctrl *ctrl)
 					 exposure_max);
 	}
 
-	/* V4L2 controls values will be applied only when power is already up */
+	/* V4L2 control values will be applied only when power is already up */
 	if (!pm_runtime_get_if_in_use(ov08d10->dev))
 		return 0;
 

-- 
2.34.1

