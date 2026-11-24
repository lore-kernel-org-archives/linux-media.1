Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540157;
	b=dDTb15WzES/rGAxNVWxtbN/8a1r8gxNrnlpLidXrjePGX/Ygtp//F+Z16VoVaRhOMBUQ
	 tqSv+YNKfQpRmQGwNOBGr5MjvSKcPrkR0OoxOkzCvI39gRJo4OusJq8c6EjePFVUMAgNH
	 s8bzVigCHPrno/ol4lSd+k8Mc7/S69YwFlCrm6ck3J5bKoSdcpUg3JPa5P6OoDqQZ9O7I
	 Ud1Bo3bDomdZCe40TJEWINWmbnixchAm/j1UF0KxTAGFnQGISkGZlgrsJK0AGkrReR/d0
	 fwIUqr0YrZrpxhylbIXNGsuk2jBY1m9dgaXQQ/uEdmr/TN1lrSSBHeVU5bUbmKxA82Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540157;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=Cl1G/Mg3MLListnA7EQNEKCHeIDoZedVmpyUo6+IOEs=;
	b=jzu2CYRXWMEMmSItJ/75WMjSYfQJbPLJ3qXCfYwRzPd2tSfMStynT/5R/Zzd2uJ6IP92
	 7+yrgxg+8mk/dmtPsz5oajlKfyhcdpsw82dOMqOKr9pKIuEgi4VstBp1Mm+S8JhY+Mw1H
	 KY5qWF46RkrbfgdJl5GBUozM5YC9jGzF6bn/1/qjc1QMzzw5mudvSIo4ZWFzb4UwkkWFN
	 uz45Rez5lWVAIj+rtIweQ+tz2Bg+J9/Fz4rZ7AJUegXSNSReG+qvVvdO2hdATJ6AUHPKY
	 /pHFADgP5D4Yy/1RZzOwX5vu8LW9SBFuqXWluDo6LIKn+Zl+K5wRKItczkMWHKTx/2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=bUl4I4qK;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D77F7606A680;
	Tue, 24 Nov 2026 17:09:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D77F7606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=bUl4I4qK
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 853BE1C0A;
	Tue, 24 Nov 2026 09:09:13 -0800 (PST)
Received: from e126453.arm.com (e126453.arm.com [10.33.8.63])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AB2293F763;
	Tue, 24 Nov 2026 09:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795540156; bh=lla7fRQ9ubK7UCYFc/yUdmuI1cGz4l0bT3PTGoiJq8Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bUl4I4qKXOYiT9kAy1gWLDQMyRJ7tr9Pea5q/SHd2Z9f+k82Gg8O8nf+mrLr5btDt
	 8Dn1sJa7A+AoLpCEOhDAuYV0mrRup52O3sXH/vqKOyH78OJ3IKm1LznLmLJihbS1as
	 x7ZqgF7LoIQ1hvRuyP5P0hMKj2yjOeICHyT53I+k=
From: Anthony McGivern <anthony.mcgivern@arm.com>
Date: Tue, 24 Nov 2026 17:07:52 +0000
Subject: [PATCH 24/24] MAINTAINERS: Add entry for mali-c720 driver
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
Message-Id: <20261124-b4-initial-upstream-candidate-v1-24-0cb9bde1bd30@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795540079; l=1300;
 i=Anthony.McGivern@arm.com; s=20261124; h=from:subject:message-id;
 bh=gwm371NAmKOxnRaNds+4uLTJHOtoy/2+DHC1Mr7k2p0=;
 b=0lxdEHwrHw6DY4UHEjB2QJgO30puD9OOmiAT670llLbXbop41rljqaJ837TpWYy9toenI2ywU
 lAiUM4gWQFCDLv5Cw+QYqdD7X8wekGZMCyn7nHpnd0oOWQSCJJVoUYT
X-Developer-Key: i=Anthony.McGivern@arm.com; a=ed25519;
 pk=cvw1HHVRuWpdkn55JpnRyCO2oGBkBWaBXcc2S3CmHTU=

From: Anthony McGivern <Anthony.McGivern@arm.com>

Add a MAINTAINERS entry for the mali-c720 driver and its associated
documentation.

Signed-off-by: Anthony McGivern <Anthony.McGivern@arm.com>
---
 MAINTAINERS | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 44540a1eb2b8088f9da95a9b6f83b4bf05188ee1..1bf854fb64fb7fcfef50d956350df05da3b2df75 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2392,6 +2392,19 @@ F:	Documentation/userspace-api/media/v4l/metafmt-arm-mali-c55.rst
 F:	drivers/media/platform/arm/mali-c55/
 F:	include/uapi/linux/media/arm/mali-c55-config.h
 
+ARM MALI-C720 ISP DRIVER
+M:	Anthony McGivern <anthony.mcgivern@arm.com>
+M:	Vincenzo Frascino <vincenzo.frascino@arm.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/admin-guide/media/mali-c720-graph.dot
+F:	Documentation/admin-guide/media/mali-c720.rst
+F:	Documentation/devicetree/bindings/media/arm,mali-c720.yaml
+F:	Documentation/userspace-api/media/drivers/mali-c720.rst
+F:	Documentation/userspace-api/media/v4l/metafmt-arm-mali-c720.rst
+F:	drivers/media/platform/arm/mali-c720/
+F:	include/uapi/linux/media/arm/mali-c720-config.h
+
 ARM MALI PANTHOR DRM DRIVER
 M:	Boris Brezillon <boris.brezillon@collabora.com>
 M:	Steven Price <steven.price@arm.com>

-- 
2.55.0

