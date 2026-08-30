Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1252E3BCD33
	for <linux-media@vger.kernel.org>; Sun, 30 Aug 2026 16:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788105804; cv=none; b=t8uiRL13dd7U4qoqbUFeL03qm20rIasUOFpX+WM4XzUPWUILJyZk0gUNLaU3CTE9HmC43I0a2Mgl6fVrPo84OGl1Mj89w/2cRaQ+8SuT69FxHjo0lSuLK3nZA2Wt2wJU7lAmTTMIFuN/jPW3B9ik4CCXBwCjAAD6uu7lQbSOWfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788105804; c=relaxed/simple;
	bh=oiC51w1NPaioikE1Hg9uEJxGeYzaTROkH+16a9WiVbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SJ9PFuiaUz5KBeK/dCPjQs91RZWAJwv680X+dbhwu5w0YgfkJxV77W4vwZXp0I8jON2TDE5LYoxnLM4wHtR5/y7NzCW27qnrXlf7hUMpRjaZsWeq1gahg7Wd8lnM1wy6q1/EqYu7JGn6Wnw44cMKhtPyIsw+ehNHp2zOsoBzFvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KQg3q7jG; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KQg3q7jG"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc1c7364550so2754886a12.1
        for <linux-media@vger.kernel.org>; Sun, 30 Aug 2026 09:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788105802; x=1788710602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y55JaARfg3EV2mur3cWs7k4GhU5c80X4HvQLCTJYTYs=;
        b=KQg3q7jGb6UFORf0io0LV15mwS62/21ABDqJ/PJu1NzsDvZ7Hnmqis+PtErW7saHqU
         HacYZyeD/zKaqTfRLrb0vWHfsYwUqCT8K0u4QDYI7pwEzYCf0mJ/eCUtJT34WCu0tSk8
         I31Tz6Fo9JyNwuvXEpp+BLt1P/OFfVI3ejCn+8LcThlKlDrwjztSMVwVvwJT/o8IvPKO
         eLAijPZdd50ueC1d+lEfzlFoZ4t/vVa4ZntHctEnqMtNM7Mf+Q+Ahq/vXXNYhzIz2Y6S
         KJ2+V/zw1aZ5Wn0vPeSSQmxMToVgftG3aH6EwM/v2CwH14/++B3kBkdNaQpFIRK0fyRn
         cEsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788105802; x=1788710602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y55JaARfg3EV2mur3cWs7k4GhU5c80X4HvQLCTJYTYs=;
        b=FyXQWcsm/qx4zPx8xkkWHrMPx6LxTBqx8U20Mm9+adm0WLF3yyUUcMirbJyej7erzd
         7ZBdWG4+yg2kKSCn5xwKQcZ95GEon9fkhnqHnrXcxD19ZRlLHKyJKKMq/1H1UdQETz0/
         smGPGy+LuXXsD7iwcX4vb8BdnG75ZJaQ0UIidMbvlXxzCCbdsqSDs+XOC8LF+0UPEZEB
         5r58hI92VS4lerP6BpRFIOJ7Ic2BfF1l1W4aC2wXCyrQDcI84P6jQq73ALbql6eVWGnE
         zGTplkaOwgwHu7vImC6myg4jkfEdhBigg8S052o/YTRtudYDrxH9fGJm6WFpE7onxJgM
         mWng==
X-Forwarded-Encrypted: i=1; AHgh+RrImzLXscHiOT9pRk7nDt7tmpCUrp9Ln3HdpSvk9C5KTVRPCNInvhB+xlpf3v4iP3O0vnbOXW7W610NpQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kZkdxanEN5N2wD7BWJw9sfgsp19/cklXhK25kZGaRJhnRNMQpZ
	0OpAvWqyturO+m8zSZC2npUw7N3unkjfVi5xFKmseTCic+3pz8QM0SB9
X-Gm-Gg: AR+sD11SvQWOo2Wiv7Dk10Hbd/a0b5aLvI2wZDdpTSYdy7l2jc1P90h6GNuDeXsUP5H
	SukZ0XW6C51R7pcRMI147Drc7BZ7MM57JGRhfbodsq48Gt4YV/+j+NCnG48crf6n08rS6/GZ3Ya
	EsMEvRas2/lCxd91/8271Fw9shHtxb4LGr0cTEH14IPYQSGw3KFx9rjK4c1DeCEaawQHS2tvFxp
	IVPGK2oL2N/Jt0AO8kih6hhChB65Qaxifk/5XFoYQ30PHxvAUZJ1IcRDrkDuoZN0bHfz6I6kWQs
	CIqbKNkNKis95zYUzh9eOi19pEqZIJ4XyE+Ev1yg1LUu5oEWfXsJeOVZxHbGgpmi5XNHP3FfH64
	pGMzi6bKLxQXTrz3XSCRcsJEq3Foh0JUqLnKEil5ZZUjcW3lHg5YNqaUoK1zgMYa5253oHQMo0V
	37YJa9Sy0bRR7M5WH1N9Xg4bL+xtWpCkA5A1nVPR3YJu2q1ed1AGmiajlPxtPPXGtA2Wq22dbPr
	9U+a/d7UrWUzDn6cXd7XAo58/+qPdcRnDFZBQaiz0PLX4eAsfwp
X-Received: by 2002:a05:6a20:a124:b0:3bf:5b7a:fc8b with SMTP id adf61e73a8af0-3d2633a1e56mr31289054637.0.1788105802212;
        Sun, 30 Aug 2026 09:03:22 -0700 (PDT)
Received: from nuvole (2.248.212.35.bc.googleusercontent.com. [35.212.248.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f3312270sm2839584a12.11.2026.08.30.09.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 09:03:21 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v6 5/5] arm64: dts: imx8mq-librem5: Correct link frequency list
Date: Mon, 31 Aug 2026 00:00:25 +0800
Message-ID: <20260830160025.211384-6-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260830160025.211384-1-mitltlatltl@gmail.com>
References: <20260830160025.211384-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to the hi846 datasheet and the register lists, they are

mclk / prediv * multiplier / mipi_clk_div1 / mipi_clk_div2 =
25Mhz / 3 * 90 / 2 / {1,2} = 187.5Mhz, 375Mhz

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
v5:
- Rename post_div to mipi_clk_div
- Correct div1 number from 1 to 2
---
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index f5d529c5baf3..cc5604172192 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -1122,7 +1122,7 @@ port {
 			camera1_ep: endpoint {
 				data-lanes = <1 2>;
 				link-frequencies = /bits/ 64
-					<80000000 200000000 300000000>;
+					<187500000 375000000>;
 				remote-endpoint = <&mipi1_sensor_ep>;
 			};
 		};
-- 
2.55.0

