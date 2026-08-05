Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146C53C553A;
	Wed,  5 Aug 2026 19:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785959703; cv=none; b=dEOZXvbK0GKgctu9vPrxRYJwqs14A+SvRUZHnN6hTqUFu0CvnY6I1faIm99LaovST+HPWVpTfy8qSqPGjIZCvo9omcpIwaMEIaunjkVfeTiUg+AnKoskOYUs/0XsS7TQb7LD0xd6qTTKgl8KPqKnxxRPO4311E5GM+8wCiPlVEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785959703; c=relaxed/simple;
	bh=SGnRo+08e8k7RsyDTw1gMSux8u7Bv1qxzZd0aUowON0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jxqhIRqX7Fuhs91YOPGTUclLxr5fP0fJ3blbNhSr7sUO1R0RTTphgLYSiKYgqADrp6djL5pCYOra1ABcNc7xDk7v6nlXxV2NIEVVTNQ0QpydYntiRhRfh+zP3EbcdzdOZFHANWOXZ5zC3bcG6tqrhbpFfBh2fq2QVF9em6umCVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=MSobwCYp; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=lnj8Dy4T; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="MSobwCYp";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="lnj8Dy4T"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1785959688; bh=is9XdQ9w4SDrDonko7w16dQ
	sWjnQkpXJS636KDBNe20=; b=MSobwCYpcMLmmqiH+pznJZC841gJK3lY2I19XgchUrsgVsul9e
	r7S4NpEPVRIclOIIGJwFSpIKzgaSssWdD39tFR4AcS36lJ5wV+cken+qtIpzoEwzAxjSdamj2hB
	48pFYkxA4yOHEaKio/pJH3/xu1pqv7u4V4zkoRCgfqhpcfqiZ1H6kZZr7R7OCkRLykEOzeiJDRa
	ULSsZWmstojz7SgXX61pYfeqpNfo2OD47as1VWs+HLNfKO6jGZgMq88herXdC+H26C4E9ibLxfY
	HePCYZbLgeydjLY3kNyQjKXF3yuojarRMnq4f9wi4DO1UwvMdLq0hvJr3VIVWxYWsXA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1785959688; bh=is9XdQ9w4SDrDonko7w16dQ
	sWjnQkpXJS636KDBNe20=; b=lnj8Dy4TilgZrjrY9oXzpE9pEuUpNMrs+1iXZgHCZQ80bzpDa9
	ESOVVWkf4xywnUSh1KH2DYs+EdXoObGtEdBw==;
From: Danila Tikhonov <danila@mainlining.org>
Date: Wed, 05 Aug 2026 22:54:25 +0300
Subject: [PATCH 2/4] drivers: media: i2c: imx471: Add vdig and vif power
 supplies
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-imx471-v1-2-7be79f539ed8@mainlining.org>
References: <20260805-imx471-v1-0-7be79f539ed8@mainlining.org>
In-Reply-To: <20260805-imx471-v1-0-7be79f539ed8@mainlining.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kate Hsuan <hpa@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Eugene Lepshy <fekz115@gmail.com>, 
 Vasiliy Doylov <neko@altlinux.org>, Achill Gilgenast <achill@achill.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Danila Tikhonov <danila@mainlining.org>
X-Mailer: b4 0.15.2

According to the product brief, the IMX471 sensor requires analog
(vana, 2.8V), digital (vdig, 1.05V), and interface (vif, 1.8V) power
supplies. Currently, only the analog supply is requested.

Add 'vdig' and 'vif' to the regulator supply array. Following the
pattern of other media i2c drivers (e.g., imx219, imx415), the regulator
core will automatically substitute dummy regulators if these are
missing.

Signed-off-by: Danila Tikhonov <danila@mainlining.org>
---
 drivers/media/i2c/imx471.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx471.c b/drivers/media/i2c/imx471.c
index 4053aed84340..3ad123699f14 100644
--- a/drivers/media/i2c/imx471.c
+++ b/drivers/media/i2c/imx471.c
@@ -117,7 +117,9 @@
 #define to_imx471(_sd) container_of_const(_sd, struct imx471, sd)
 
 static const char * const imx471_supply_name[] = {
-	"vana",
+	"vana", /* 2p8V */
+	"vdig", /* 1p05V */
+	"vif",  /* 1p8V */
 };
 
 struct imx471_mode {

-- 
2.55.0

