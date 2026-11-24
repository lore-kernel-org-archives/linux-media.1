Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540145;
	b=mvIdOUMoPGLkZ8zjaQKlQHZ6UT4V1mUbxDPRF40a9XbzttFFUyOzHjVik7JaSzJTvqJP
	 U4b67EI33tyO+B1N62WAo226BQbjlauU8iYECqeSlxtf2DTHcIvDLUf3mh+YVMFw1KlBv
	 U/wm2Jw21MGNLfsPJ+aGc5HNRJV+ii3rGSF/BOtbtVHYwdLhhwITIgXcUXOPyHmSaxlL8
	 1OCfBcfVWpT3xoMCUuQbh7EqbpBjiNlCwndSSg2n821CKGW5oG6avbU0icK7d9lpqIfuz
	 QcwXTxlE6h3+t1hXxhlXqXA8NBxrO7LB9uHONoiZ/lD1UVsAx6+XTJbBj14xrvTwYaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540145;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=mE17vVmVQNaiRNnZ3sKJgOG4MUZ2qjN2wuquPCU/b58=;
	b=nOw4bBV58nLWrqiGlFMVlDeglTP5MD5WfEgAqJk4KAh4gripq6cyQyeXFH3Ro45VtRVz
	 eGb8yQtLiuyaV9yyR30kmXFQibFzfLuBrMEzu9KXC3k0CSOMQHVYcR2z28NxxNe9XPL6U
	 JTBZS2vpKcyR8pagjafTe/suJ6dhqwC96XnWgSXIehorRLR9csBGzucpFyAh4sCuoBK09
	 agJ3SSc8PpOe9JcJyoXguhU2IuwxL0QSkh1gDdPcIJ/6LIFlkd8FNex3U9+Ka2OGhF6i7
	 MpM7bjgIs4YHgJYv+ryAuWxBCeenknpz50adzuoEr5pQMW+xyzb7+LW9JOmM6QsUylw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=nO9xQRq5;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE3E2606A33F;
	Tue, 24 Nov 2026 17:09:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE3E2606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=nO9xQRq5
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 532A71BF3;
	Tue, 24 Nov 2026 09:09:01 -0800 (PST)
Received: from e126453.arm.com (e126453.arm.com [10.33.8.63])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7851D3F763;
	Tue, 24 Nov 2026 09:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795540144; bh=Ce+85ggRAd1UhJ8zTp85aEB+VF2sCwEd4DzNDrgIvi0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nO9xQRq5p7PCtn4CJrCINvsKQKscUhNZOe3Nsi5edlT53zozDrSMFbs2zgZUAa3kA
	 MvqjSpN5Hqeb53t/LQpkMzR7eEjymZs8+FUimuDn6AFUM8oT7A1kTX577JpeIg8SG/
	 x/PYxiQ/PgcP0sWXXJnHWMQ9wO7Q9beDYuA8GoGs=
From: Anthony McGivern <anthony.mcgivern@arm.com>
Date: Tue, 24 Nov 2026 17:07:48 +0000
Subject: [PATCH 20/24] media: uapi: Add Mali-C720 parameters meta format
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-b4-initial-upstream-candidate-v1-20-0cb9bde1bd30@arm.com>
References: <20261124-b4-initial-upstream-candidate-v1-0-0cb9bde1bd30@arm.com>
In-Reply-To: <20261124-b4-initial-upstream-candidate-v1-0-0cb9bde1bd30@arm.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Anthony McGivern <anthony.mcgivern@arm.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Nayden Kanchev <nayden.kanchev@arm.com>, 
 Konstantin Babin <konstantin.babin@arm.com>, 
 Linus Walleij <linusw@kernel.org>, jacopo.mondi@ideasonboard.com, 
 kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com, 
 dan.scally@ideasonboard.com, Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Anthony McGivern <Anthony.McGivern@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795540079; l=1950;
 i=Anthony.McGivern@arm.com; s=20261124; h=from:subject:message-id;
 bh=rql1C8/eZd0TrUw8XoHMFAMSAaQz8Qm4oVzl0nn4Ke0=;
 b=pFGgJ5PNf550bRvbhWuU931KO6YaHXgQbKVLZ9Ufa2Ys1PpQ5zAWQWNwqKV2AM82FRNeBtZbY
 uYnAW+OVsU5CYhVtdQHOoDv1DMC/Zi9LCRMz27aXfOVFJ9ioeMmmkv8
X-Developer-Key: i=Anthony.McGivern@arm.com; a=ed25519;
 pk=cvw1HHVRuWpdkn55JpnRyCO2oGBkBWaBXcc2S3CmHTU=

From: Anthony McGivern <Anthony.McGivern@arm.com>

Add a new V4L2 meta format code for Mali-C720 ISP parameters.

Signed-off-by: Anthony McGivern <Anthony.McGivern@arm.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
 include/uapi/linux/videodev2.h       | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 657adc0f4550e50aafc8855de524eb2e7c6297cb..60b77b18dcc402dd6f0efae8b216bf8fa8b8e6c9 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1471,6 +1471,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
 	case V4L2_META_FMT_MALI_C55_PARAMS:	descr = "ARM Mali-C55 ISP Parameters"; break;
 	case V4L2_META_FMT_MALI_C55_STATS:	descr = "ARM Mali-C55 ISP 3A Statistics"; break;
+	case V4L2_META_FMT_MALI_C720_PARAMS:	descr = "ARM Mali-C720 ISP Parameters"; break;
 	case V4L2_META_FMT_MALI_C720_STATS:	descr = "ARM Mali-C720 ISP 3A Statistics"; break;
 	case V4L2_META_FMT_RPPX1_PARAMS:	descr = "Dreamchip RPP-X1 ISP Parameters"; break;
 	case V4L2_META_FMT_RPPX1_STATS:	descr = "Dreamchip RPP-X1 ISP Statistics"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index a59f6642ce3d120c28f395f72653137831ef09b6..b8d06bac29e4bd550b332d57448cce86540e0f87 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -890,6 +890,7 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_MALI_C55_STATS	v4l2_fourcc('C', '5', '5', 'S') /* ARM Mali-C55 3A Statistics */
 
 /* Vendor specific - used for Arm Mali-C720 ISP */
+#define V4L2_META_FMT_MALI_C720_PARAMS	v4l2_fourcc('C', '7', '2', 'P') /* ARM Mali-C720 Parameters */
 #define V4L2_META_FMT_MALI_C720_STATS	v4l2_fourcc('C', '7', '2', 'S') /* ARM Mali-C720 3A Statistics */
 
 /* Vendor specific - used for Dreamchip RPP-X1 ISP */

-- 
2.55.0

