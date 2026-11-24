Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540133;
	b=NfDOdatPWo+2qC6BeVAMEBxHyFwECpsMe1HaWzYIk2NqxHQgVve/rc+fqDOGkJQLlB/5
	 6p6/iSv3321jr/OhpiTzkmXIblBPDVXqO8Zqk65i+7ii06KbFckd7JGN9tdhC67T6Qhis
	 lUY1kuSS6f0Y11yMqVEmYJsvNqZOwNSBJPWzxLlVGmbhnbbUXhVKhb3u50+UwuNKTo+Q0
	 3QmSMec1xFNzlkW35QnGr03ZOClMK/4JvOU1GzM2gPGSmNntYHECogeHrMqHs5giJwRaG
	 fuw9HI5OUjb8Q85kKvm1CildOmWNn5QCgPt6Vbig6N8B0qy+X7eqrSu3K78oKKFpsWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540133;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=RAV1IdK9ll2YiAow1763lmAOyMd2ZFB8VR3ExdHkkYo=;
	b=IBwkUHiLpaTlD4ROks3pEJuj7cECD/xFltvyUPyu5vkJ3jZTkErK9IyRvtFsCDHQmHvH
	 VJcUBnqSjJL5DYnVg4su/OnmP7i4xk8Js/rNDvGA82ZpehTLg62M7qODjX5F2Ouqc1ZqH
	 qkSbB7E0z6yWhSjkDgI6W0z/J4YUOxtOFkRDL0Ox+YfFedshugm+gg/9B34oq1lAbtUap
	 +8W/hsblQlq482G6msE3jySn9RpSnJ2vyh0alehY0gFQmYjVFvfwrd37r0L08x2NQhius
	 8FTj66Tcwkqh7liKHeaEzbWkYxPuF2loNDHOoVVXq/fpFz2S8c/QJMiNA0fn9DeSHrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=C49+SZq1;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7AE360A3819;
	Tue, 24 Nov 2026 17:08:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7AE360A3819
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=C49+SZq1
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D13D1BB2;
	Tue, 24 Nov 2026 09:08:49 -0800 (PST)
Received: from e126453.arm.com (e126453.arm.com [10.33.8.63])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 438F23F763;
	Tue, 24 Nov 2026 09:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795540132; bh=yx3ouZnaG/jM4uhFqZLSd7F4g0A9hh6nuGcAOMTuPQI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=C49+SZq1SFdpgp4Fs2nAb3jXRDvZb0T+IqUoF1yOVLZtRKQRKyZzOB8MNpPSYFPgo
	 YxFMecsNO00cEDTV/UxrS8YwKQhOskhy4F8AsJ4Qi/e97k2KPrYXXtZWSvCgU5LKBB
	 iBfLFXuD53qfdeevkOhNdHbAoeolUBg9+TkXxcr0=
From: Anthony McGivern <anthony.mcgivern@arm.com>
Date: Tue, 24 Nov 2026 17:07:44 +0000
Subject: [PATCH 16/24] media: uapi: Add Mali-C720 statistics meta format
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
Message-Id: <20261124-b4-initial-upstream-candidate-v1-16-0cb9bde1bd30@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795540079; l=2171;
 i=Anthony.McGivern@arm.com; s=20261124; h=from:subject:message-id;
 bh=j6Gm/dnMdks3celwDJxd0CeZ6Ie4FbVKuf8nwrJybFA=;
 b=Qju6e7NDF6TAeyEqUJEqnP9OhhIpF1T43gtYIba2J8Tl3wUcgO6ZLYLmU5p57GYnY3LJtn5FC
 B6t7Dablh7ND1SO0KwaSl2jjhUCM4JuiXzocOS+TsZt95XdD/pwKeDh
X-Developer-Key: i=Anthony.McGivern@arm.com; a=ed25519;
 pk=cvw1HHVRuWpdkn55JpnRyCO2oGBkBWaBXcc2S3CmHTU=

From: Anthony McGivern <Anthony.McGivern@arm.com>

Add a new meta format for the Mali-C720 ISP's 3A statistics along
with a format description.

Signed-off-by: Anthony McGivern <Anthony.McGivern@arm.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
 include/uapi/linux/videodev2.h       | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 17ba1ae707355a134047de646f61fcc2d1512d4c..657adc0f4550e50aafc8855de524eb2e7c6297cb 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1471,6 +1471,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
 	case V4L2_META_FMT_MALI_C55_PARAMS:	descr = "ARM Mali-C55 ISP Parameters"; break;
 	case V4L2_META_FMT_MALI_C55_STATS:	descr = "ARM Mali-C55 ISP 3A Statistics"; break;
+	case V4L2_META_FMT_MALI_C720_STATS:	descr = "ARM Mali-C720 ISP 3A Statistics"; break;
 	case V4L2_META_FMT_RPPX1_PARAMS:	descr = "Dreamchip RPP-X1 ISP Parameters"; break;
 	case V4L2_META_FMT_RPPX1_STATS:	descr = "Dreamchip RPP-X1 ISP Statistics"; break;
 	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 5373dba640fae3d19247ab1c74ba336e05dc0fe0..a59f6642ce3d120c28f395f72653137831ef09b6 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -889,6 +889,9 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_MALI_C55_PARAMS	v4l2_fourcc('C', '5', '5', 'P') /* ARM Mali-C55 Parameters */
 #define V4L2_META_FMT_MALI_C55_STATS	v4l2_fourcc('C', '5', '5', 'S') /* ARM Mali-C55 3A Statistics */
 
+/* Vendor specific - used for Arm Mali-C720 ISP */
+#define V4L2_META_FMT_MALI_C720_STATS	v4l2_fourcc('C', '7', '2', 'S') /* ARM Mali-C720 3A Statistics */
+
 /* Vendor specific - used for Dreamchip RPP-X1 ISP */
 #define V4L2_META_FMT_RPPX1_PARAMS	v4l2_fourcc('D', 'R', '1', 'P') /* Dreamchip RPP-X1 Parameters */
 #define V4L2_META_FMT_RPPX1_STATS	v4l2_fourcc('D', 'R', '1', 'S') /* Dreamchip RPP-X1 Statistics */

-- 
2.55.0

