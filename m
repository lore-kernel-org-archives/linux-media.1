Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F003D1CD7;
	Tue, 24 Mar 2026 10:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774348928; cv=none; b=mtXiqwT/VuwqhOvpyZ8txdy/K0v8WZr0dOKgaxJ4xiXP5vkFVLvHk5QxiaPKu6ajRdTFSj/7mHBuyylrdjt6xx50IZ8wZ+yco8HoZ2puBNnqb5rPK2ashSow7Lt7XGTof59h4gmW7haZFYKZzjFAa9WmYb8ouxROAlSi4X+MkOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774348928; c=relaxed/simple;
	bh=9m8usDxjoIYEaL2IG/QrB3J6DW7Hoz4wLcyyEMK0pAE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sCQFBaBLXic7o0TmNzCac9lq5uoCugh3NOQ8z4BdpOJTqzeRK1yEoIC697nVvighFFPOyvBb6CokQboYO+X0W+g9rBb87+GHzDrMZbUFmzjM0D9gGivbIfvwuaYoZ0V4t4fKTaNyk/1IvBnmw3krH+BvKE6GzdqZhQkNkhy9+yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=Hok0jLrz; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="Hok0jLrz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=XnozTzcJqIffnJeCxoJ2SjzuE5JsUzNHOv3KnWqTbfc=; b=Hok0jLrzpJZA6BEbabcznRXcjA
	3QsmuvYVj7vlDrU9tqlWkO/K4P7L+JTnole1A72avxAKdD07fkaPgNz3ns81/u8NA7MeR0BU+7UKk
	QyQI7lYMRtFUj3rbMEXPhUA69pUXXYm711Paag4Jdxmzv8CHE5Tm7krrTgsxNVDS8iqM=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:55336 helo=[127.0.1.1])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1w4zD1-00DIvK-9n; Tue, 24 Mar 2026 11:42:03 +0100
From: Matthias Fend <matthias.fend@emfend.at>
Date: Tue, 24 Mar 2026 11:41:37 +0100
Subject: [PATCH v3 3/9] media: i2c: ov08d10: remove duplicate register
 write
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-ov08d10-v3-3-1e44069cf91e@emfend.at>
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
 
 Content preview:  The current settings for the "image vertical start" register
    appear to be incorrect. While this only results in an incorrect start line
    for native modes, this faulty setting causes actual problems in [...] 
 
 Content analysis details:   (-1.0 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -1.0 ALL_TRUSTED            Passed through trusted hosts only via SMTP
  0.0 TVD_RCVD_IP            Message was received from an IP address
  0.0 KAM_DMARC_STATUS       Test Rule for DKIM or SPF Failure with Strict
                             Alignment (older systems)
  0.0 Local_hs_NotFromHoststar Sender is NOT hoststar.(ch|at|com)
  0.0 Local_hs_NotToHoststar Recipient is NOT hoststar.(ch|at|com)

Register P1:0x33 is written twice with the same value in the
'lane_2_mode_1632x1224' sequence. Remove one unnecessary write access.

Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
---
 drivers/media/i2c/ov08d10.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/ov08d10.c b/drivers/media/i2c/ov08d10.c
index 5e1b8b58b3d64bcf20a7b1a4e47f547d2fd82998..9d54170cdf7da6fe4f03dbf64d5e8976df247846 100644
--- a/drivers/media/i2c/ov08d10.c
+++ b/drivers/media/i2c/ov08d10.c
@@ -381,7 +381,6 @@ static const struct ov08d10_reg lane_2_mode_1632x1224[] = {
 	{0x07, 0x05},
 	{0x21, 0x02},
 	{0x24, 0x30},
-	{0x33, 0x03},
 	{0x31, 0x06},
 	{0x33, 0x03},
 	{0x01, 0x03},

-- 
2.34.1

