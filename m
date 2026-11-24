Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540086;
	b=pWIO/jFGpQP8xx3y8jbh++MHwbjgV/alZ0YGlAvqqDHy1Rn9+jmn3q7U4oqWh09EFBA/
	 xP/Scil+aQ3Tar4zijG28r5SfDPl/2KmkYKs65TJzwfmOm4RhnBPKO1edDZ2AvUg7ioYJ
	 WITSy7j9mWP8JIT7ia1QpIvpl+aKfxvdibLk2mLw1R14G8UQXOFgK0oNrI+1+5b83aqrw
	 AaEfMyY9BHLm9KoHwE9PlOzNHSZpJjPriA/I6mevV8D6+SfQ0pKhqOAePYSs+avS8WurD
	 G0nQzLaPCe32McY2IkUbFLHNUQ4i4EBS8rM/umKVoTTdArZO9EXTKe4qCCl856ZHcZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540086;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=PLAKBBjfWwaZTSxQGEG3u3gLM52RfLn5YnoJBhqd8CM=;
	b=NKC6hd+rAND0i18KJne3PRY18JDv6Th94Jls7IUgWhK3wPwS1iURpgU20dkpEA21nhYw
	 Ap1HD9fL7J1r4ZSUL8MZo0KZMISYgN4idsFjYlIKJrMTqE00i9+YMDK0fLo9kZJbUzJXq
	 29JmleYOIRQHYYXeY0769XS5YnaIrN1yIv0ZBk4V3HkQdpR2vp64e9mHJGY313CWWsdD7
	 t/KWZbL9L8+NP4hWEV53CjEMPvK6Oy+BzFRorvUH0BysrMw4M3IgGqeG8PrnFkEILB1wu
	 1gecqVcWWYivN8PV9OHgtkUl1HyChsZ+UDaEkoyJ8V0+NO0h1890azs7W/kDceSsRmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=SWuzB456;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6130A606A683;
	Tue, 24 Nov 2026 17:08:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6130A606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=SWuzB456
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AED60339;
	Tue, 24 Nov 2026 09:08:02 -0800 (PST)
Received: from e126453.arm.com (e126453.arm.com [10.33.8.63])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D43793F763;
	Tue, 24 Nov 2026 09:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795540085; bh=Ee1uoVS+C8ceA693P5UP5IkBsXFB6FbSUzM+Y1SvUg0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SWuzB456fR+qplsh3lo8vtTGPCZvp9u96n/f1B4qEmSYCXYgXEtQsHLDcYXbvA/e6
	 ybntTbyZJCCzD5sjf/xhnq0zq7V5B2zS2TxkOKIx2g2WrBJdjcPhYTX2jH79w/IOyP
	 ovKpLwGGo6FEJlS/GGjpQ6wzXqzUlQtyj7CWHdeo=
From: Anthony McGivern <anthony.mcgivern@arm.com>
Date: Tue, 24 Nov 2026 17:07:29 +0000
Subject: [PATCH 01/24] media: uapi: Add 24-bit Bayer media bus formats
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
Message-Id: <20261124-b4-initial-upstream-candidate-v1-1-0cb9bde1bd30@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795540078; l=14554;
 i=Anthony.McGivern@arm.com; s=20261124; h=from:subject:message-id;
 bh=jW1v1LS7b8VuSi9Ac9uZdb1A5tjhReRMElWF2Idbxps=;
 b=qdr76PomAtxyqkFNIVUVV3J1JBZ09kZtfGVY5UXu/OQelS3MOZFmo1Q2uyO0jWFdSsuxnbgJe
 Fl8FbQKTWuIAHIHq36P54QUXCVoD/PXRS2cDUxVb7C2wEtY5D+vcHgB
X-Developer-Key: i=Anthony.McGivern@arm.com; a=ed25519;
 pk=cvw1HHVRuWpdkn55JpnRyCO2oGBkBWaBXcc2S3CmHTU=

From: Anthony McGivern <Anthony.McGivern@arm.com>

The Mali-C720 ISP processes Bayer data on a 24-bit internal bus. Add
media bus format codes for all four Bayer orders and document their
data layout.

Signed-off-by: Anthony McGivern <Anthony.McGivern@arm.com>
---
 .../userspace-api/media/v4l/subdev-formats.rst     | 289 ++++++++++++++++++++-
 include/uapi/linux/media-bus-format.h              |   6 +-
 2 files changed, 291 insertions(+), 4 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index c9999b929773b244290b16280b180a9d4f0ff609..6190a1381a4807a7d81d7a9900ea2831606aef30 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -2821,11 +2821,11 @@ organization is given as an example for the first pixel only.
     \tiny
     \setlength{\tabcolsep}{2pt}
 
-.. tabularcolumns:: |p{6.0cm}|p{0.7cm}|p{0.3cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|
+.. tabularcolumns:: |p{6.0cm}|p{0.7cm}|p{0.3cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|
 
 .. _v4l2-mbus-pixelcode-bayer:
 
-.. cssclass: longtable
+.. cssclass:: longtable
 
 .. flat-table:: Bayer Formats
     :header-rows:  2
@@ -2834,10 +2834,14 @@ organization is given as an example for the first pixel only.
     * - Identifier
       - Code
       -
-      - :cspan:`19` Data organization
+      - :cspan:`23` Data organization
     * -
       -
       - Bit
+      - 23
+      - 22
+      - 21
+      - 20
       - 19
       - 18
       - 17
@@ -2875,6 +2879,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - b\ :sub:`7`
       - b\ :sub:`6`
       - b\ :sub:`5`
@@ -2900,6 +2908,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`7`
       - g\ :sub:`6`
       - g\ :sub:`5`
@@ -2925,6 +2937,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`7`
       - g\ :sub:`6`
       - g\ :sub:`5`
@@ -2950,6 +2966,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - r\ :sub:`7`
       - r\ :sub:`6`
       - r\ :sub:`5`
@@ -2975,6 +2995,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - b\ :sub:`7`
       - b\ :sub:`6`
       - b\ :sub:`5`
@@ -3000,6 +3024,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`7`
       - g\ :sub:`6`
       - g\ :sub:`5`
@@ -3025,6 +3053,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`7`
       - g\ :sub:`6`
       - g\ :sub:`5`
@@ -3050,6 +3082,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - r\ :sub:`7`
       - r\ :sub:`6`
       - r\ :sub:`5`
@@ -3075,6 +3111,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - b\ :sub:`7`
       - b\ :sub:`6`
       - b\ :sub:`5`
@@ -3100,6 +3140,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`7`
       - g\ :sub:`6`
       - g\ :sub:`5`
@@ -3125,6 +3169,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`7`
       - g\ :sub:`6`
       - g\ :sub:`5`
@@ -3150,6 +3198,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - r\ :sub:`7`
       - r\ :sub:`6`
       - r\ :sub:`5`
@@ -3175,6 +3227,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - 0
       - 0
       - 0
@@ -3198,6 +3254,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - b\ :sub:`7`
       - b\ :sub:`6`
       - b\ :sub:`5`
@@ -3223,6 +3283,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - b\ :sub:`7`
       - b\ :sub:`6`
       - b\ :sub:`5`
@@ -3246,6 +3310,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - 0
       - 0
       - 0
@@ -3271,6 +3339,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - b\ :sub:`9`
       - b\ :sub:`8`
       - b\ :sub:`7`
@@ -3294,6 +3366,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - b\ :sub:`1`
       - b\ :sub:`0`
       - 0
@@ -3319,6 +3395,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - b\ :sub:`1`
       - b\ :sub:`0`
       - 0
@@ -3342,6 +3422,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - b\ :sub:`9`
       - b\ :sub:`8`
       - b\ :sub:`7`
@@ -3365,6 +3449,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - b\ :sub:`9`
       - b\ :sub:`8`
       - b\ :sub:`7`
@@ -3390,6 +3478,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`9`
       - g\ :sub:`8`
       - g\ :sub:`7`
@@ -3415,6 +3507,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`9`
       - g\ :sub:`8`
       - g\ :sub:`7`
@@ -3440,6 +3536,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - r\ :sub:`9`
       - r\ :sub:`8`
       - r\ :sub:`7`
@@ -3463,6 +3563,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - b\ :sub:`11`
       - b\ :sub:`10`
       - b\ :sub:`9`
@@ -3488,6 +3592,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`11`
       - g\ :sub:`10`
       - g\ :sub:`9`
@@ -3513,6 +3621,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`11`
       - g\ :sub:`10`
       - g\ :sub:`9`
@@ -3538,6 +3650,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - r\ :sub:`11`
       - r\ :sub:`10`
       - r\ :sub:`9`
@@ -3561,6 +3677,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - b\ :sub:`13`
       - b\ :sub:`12`
       - b\ :sub:`11`
@@ -3586,6 +3706,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`13`
       - g\ :sub:`12`
       - g\ :sub:`11`
@@ -3611,6 +3735,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`13`
       - g\ :sub:`12`
       - g\ :sub:`11`
@@ -3636,6 +3764,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - r\ :sub:`13`
       - r\ :sub:`12`
       - r\ :sub:`11`
@@ -3659,6 +3791,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - b\ :sub:`15`
       - b\ :sub:`14`
       - b\ :sub:`13`
@@ -3684,6 +3820,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`15`
       - g\ :sub:`14`
       - g\ :sub:`13`
@@ -3709,6 +3849,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`15`
       - g\ :sub:`14`
       - g\ :sub:`13`
@@ -3734,6 +3878,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - r\ :sub:`15`
       - r\ :sub:`14`
       - r\ :sub:`13`
@@ -3755,6 +3903,10 @@ organization is given as an example for the first pixel only.
       - MEDIA_BUS_FMT_SBGGR20_1X20
       - 0x3021
       -
+      -
+      -
+      -
+      -
       - b\ :sub:`19`
       - b\ :sub:`18`
       - b\ :sub:`17`
@@ -3780,6 +3932,10 @@ organization is given as an example for the first pixel only.
       - MEDIA_BUS_FMT_SGBRG20_1X20
       - 0x3022
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`19`
       - g\ :sub:`18`
       - g\ :sub:`17`
@@ -3805,6 +3961,10 @@ organization is given as an example for the first pixel only.
       - MEDIA_BUS_FMT_SGRBG20_1X20
       - 0x3023
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`19`
       - g\ :sub:`18`
       - g\ :sub:`17`
@@ -3830,6 +3990,129 @@ organization is given as an example for the first pixel only.
       - MEDIA_BUS_FMT_SRGGB20_1X20
       - 0x3024
       -
+      -
+      -
+      -
+      -
+      - r\ :sub:`19`
+      - r\ :sub:`18`
+      - r\ :sub:`17`
+      - r\ :sub:`16`
+      - r\ :sub:`15`
+      - r\ :sub:`14`
+      - r\ :sub:`13`
+      - r\ :sub:`12`
+      - r\ :sub:`11`
+      - r\ :sub:`10`
+      - r\ :sub:`9`
+      - r\ :sub:`8`
+      - r\ :sub:`7`
+      - r\ :sub:`6`
+      - r\ :sub:`5`
+      - r\ :sub:`4`
+      - r\ :sub:`3`
+      - r\ :sub:`2`
+      - r\ :sub:`1`
+      - r\ :sub:`0`
+    * .. _MEDIA-BUS-FMT-SBGGR24-1X24:
+
+      - MEDIA_BUS_FMT_SBGGR24_1X24
+      - 0x3025
+      -
+      - b\ :sub:`23`
+      - b\ :sub:`22`
+      - b\ :sub:`21`
+      - b\ :sub:`20`
+      - b\ :sub:`19`
+      - b\ :sub:`18`
+      - b\ :sub:`17`
+      - b\ :sub:`16`
+      - b\ :sub:`15`
+      - b\ :sub:`14`
+      - b\ :sub:`13`
+      - b\ :sub:`12`
+      - b\ :sub:`11`
+      - b\ :sub:`10`
+      - b\ :sub:`9`
+      - b\ :sub:`8`
+      - b\ :sub:`7`
+      - b\ :sub:`6`
+      - b\ :sub:`5`
+      - b\ :sub:`4`
+      - b\ :sub:`3`
+      - b\ :sub:`2`
+      - b\ :sub:`1`
+      - b\ :sub:`0`
+
+    * .. _MEDIA-BUS-FMT-SGBRG24-1X24:
+
+      - MEDIA_BUS_FMT_SGBRG24_1X24
+      - 0x3026
+      -
+      - g\ :sub:`23`
+      - g\ :sub:`22`
+      - g\ :sub:`21`
+      - g\ :sub:`20`
+      - g\ :sub:`19`
+      - g\ :sub:`18`
+      - g\ :sub:`17`
+      - g\ :sub:`16`
+      - g\ :sub:`15`
+      - g\ :sub:`14`
+      - g\ :sub:`13`
+      - g\ :sub:`12`
+      - g\ :sub:`11`
+      - g\ :sub:`10`
+      - g\ :sub:`9`
+      - g\ :sub:`8`
+      - g\ :sub:`7`
+      - g\ :sub:`6`
+      - g\ :sub:`5`
+      - g\ :sub:`4`
+      - g\ :sub:`3`
+      - g\ :sub:`2`
+      - g\ :sub:`1`
+      - g\ :sub:`0`
+
+    * .. _MEDIA-BUS-FMT-SGRBG24-1X24:
+
+      - MEDIA_BUS_FMT_SGRBG24_1X24
+      - 0x3027
+      -
+      - g\ :sub:`23`
+      - g\ :sub:`22`
+      - g\ :sub:`21`
+      - g\ :sub:`20`
+      - g\ :sub:`19`
+      - g\ :sub:`18`
+      - g\ :sub:`17`
+      - g\ :sub:`16`
+      - g\ :sub:`15`
+      - g\ :sub:`14`
+      - g\ :sub:`13`
+      - g\ :sub:`12`
+      - g\ :sub:`11`
+      - g\ :sub:`10`
+      - g\ :sub:`9`
+      - g\ :sub:`8`
+      - g\ :sub:`7`
+      - g\ :sub:`6`
+      - g\ :sub:`5`
+      - g\ :sub:`4`
+      - g\ :sub:`3`
+      - g\ :sub:`2`
+      - g\ :sub:`1`
+      - g\ :sub:`0`
+
+    * .. _MEDIA-BUS-FMT-SRGGB24-1X24:
+
+      - MEDIA_BUS_FMT_SRGGB24_1X24
+      - 0x3028
+      -
+      - r\ :sub:`23`
+      - r\ :sub:`22`
+      - r\ :sub:`21`
+      - r\ :sub:`20`
       - r\ :sub:`19`
       - r\ :sub:`18`
       - r\ :sub:`17`
diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
index 6005f033e62c04bdd3dff7ac905f5b921341cd47..892b8c0a945e416c242d97962b99c5673eaa3a50 100644
--- a/include/uapi/linux/media-bus-format.h
+++ b/include/uapi/linux/media-bus-format.h
@@ -124,7 +124,7 @@
 #define MEDIA_BUS_FMT_YUV16_1X48		0x202a
 #define MEDIA_BUS_FMT_UYYVYY16_0_5X48		0x202b
 
-/* Bayer - next is	0x3025 */
+/* Bayer - next is	0x3029 */
 #define MEDIA_BUS_FMT_SBGGR8_1X8		0x3001
 #define MEDIA_BUS_FMT_SGBRG8_1X8		0x3013
 #define MEDIA_BUS_FMT_SGRBG8_1X8		0x3002
@@ -161,6 +161,10 @@
 #define MEDIA_BUS_FMT_SGBRG20_1X20		0x3022
 #define MEDIA_BUS_FMT_SGRBG20_1X20		0x3023
 #define MEDIA_BUS_FMT_SRGGB20_1X20		0x3024
+#define MEDIA_BUS_FMT_SBGGR24_1X24		0x3025
+#define MEDIA_BUS_FMT_SGBRG24_1X24		0x3026
+#define MEDIA_BUS_FMT_SGRBG24_1X24		0x3027
+#define MEDIA_BUS_FMT_SRGGB24_1X24		0x3028
 
 /* JPEG compressed formats - next is	0x4002 */
 #define MEDIA_BUS_FMT_JPEG_1X8			0x4001

-- 
2.55.0

