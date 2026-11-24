Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540092;
	b=Qldk/3U8AIdjGo3SI9y2OMtG5PwzDTTKr7TRuhhtRpT2DBtnlQSJYeZM9BUeCb6LNaDR
	 HHhIbCV1y1yr2r0F/QDitI1RqvDPUQgIa6MyA1ERx46j24voNQBX9wz2gCpKHol4/yrRD
	 S3/1KyRYynXgQHXLY/OQFDpTFNTrXdvjLiUW93ylk1eInSfdEkld3o3I49T3i4n/lkH9J
	 YcgTde9H+D1WD/sQe7QKVhnrbIHek04tPaVbUxY0btX4NRXW3CfYAR/f+iwpovys58Jp6
	 k/qKjECnPiPQ93ixgCreWEG4t7+KMTZzvXwAXRZJJw51Twrlm4yBWiw+zwdiYi+WI4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540092;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=F9PEm3E3dhfjQZ4FnxQMSFkLvBepq/7L9pJ8C30uiDA=;
	b=K4/n7Kt1gXxYREmmbP2IPCIuawLsK2j8bGXriaKPg/gx9v+g3hEusbV8M8TmCHIbv9Y8
	 gspYzaokxXD2wkECLRyNFqNbvE3io5zoY327Cw8Rxl1rtPrk3CDh05gGKOMBwAAkpD8vJ
	 KBn+i/tZDVLvfM5TABu5TObsS0zs7NvCCjnottiEa9bM15gWYniqZYgGVMj4qRvfYBF7v
	 pv65PUlT2EhPnwUiQKksyF0Vskm1mlrvyDsGYLX3vRh0IXEAd+ks04WS2l4mxZu6WIU/z
	 6vFhoW+9RJt31zE/lVU0nxDQFphbVmk5SStppEZAcRwWDF6T/Huq/28+3mriRrQypaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=AFr73xP1;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52790606A6B0;
	Tue, 24 Nov 2026 17:08:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52790606A6B0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=AFr73xP1
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D108C16F3;
	Tue, 24 Nov 2026 09:08:08 -0800 (PST)
Received: from e126453.arm.com (e126453.arm.com [10.33.8.63])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF9643F763;
	Tue, 24 Nov 2026 09:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795540091; bh=HUPy0c7hnVrU+qgLf2/taQXs9ERsoi8bd5b8Iydh0/A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AFr73xP1y+YmGEl4eszUGof8TjhaYln0PzlNlw88Y/eMYtYsHWMxlbRagcWvJ4o7A
	 wfmF7HOk8BlZztoFj/awT/9eYc5gT7fWlC449+j3OD3LQbu3WvLygFJ7Fi2j7Zx5xz
	 TN8V1p8OGr9ZBMa9JEQyApGDkRtkMOR+R4dYSyEs=
From: Anthony McGivern <anthony.mcgivern@arm.com>
Date: Tue, 24 Nov 2026 17:07:31 +0000
Subject: [PATCH 03/24] media: uapi: Add a control ID base for Mali-C720 ISP
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
Message-Id: <20261124-b4-initial-upstream-candidate-v1-3-0cb9bde1bd30@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795540078; l=967;
 i=Anthony.McGivern@arm.com; s=20261124; h=from:subject:message-id;
 bh=NElWMMW6II80wAFXo1MelDSNnk+Ga3q5z1hRRwz4j4A=;
 b=dubFCSWes0DnD96YyrkpM+F5ceDQba+2KiDXCNrI6wX/vcCSfKcqoaREG0Ki1pwnqXkVQ0o32
 9RwNDrCytNvAITyLbNN6wkiMgPAKBy8EFrCxHw2HMUvyF2WE4v58QfT
X-Developer-Key: i=Anthony.McGivern@arm.com; a=ed25519;
 pk=cvw1HHVRuWpdkn55JpnRyCO2oGBkBWaBXcc2S3CmHTU=

From: Anthony McGivern <Anthony.McGivern@arm.com>

Add the base definition for custom controls exposed by
the Mali-C720 ISP driver.

Signed-off-by: Anthony McGivern <Anthony.McGivern@arm.com>
---
 include/uapi/linux/v4l2-controls.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index d17e41d51d2ec1ccb9e8ceb3ccc89ebc4381a4cd..3fdc01200c8c3a41644e32ac12bfeddf330afe1a 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -255,6 +255,12 @@ enum v4l2_colorfx {
  */
 #define V4L2_CID_USER_IT6625_BASE		(V4L2_CID_USER_BASE + 0x1250)
 
+/*
+ * The base for the Arm Mali-C720 ISP driver controls.
+ * We reserve 16 controls for this driver.
+ */
+#define V4L2_CID_USER_MALI_C720_BASE		(V4L2_CID_USER_BASE + 0x1260)
+
 /* MPEG-class control IDs */
 /* The MPEG controls are applicable to all codec controls
  * and the 'MPEG' part of the define is historical */

-- 
2.55.0

