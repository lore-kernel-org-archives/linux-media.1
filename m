Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102766;
	b=vZo29vVsmcC+Ui2sVqoth1lhe7I5VRhpPjUImOq6pZnh5YgvWy140EkkaCJHWOR2nsUh
	 iY57eOdCuC6zY121BMnMPP6+TCvJAmfxCeiJtgycwqhw1dBMACpfpepvTXOnGV8hfhNrv
	 ZFoew40YIoCsmQkNdISHpyU9zXncEsmHRRH1QRgsejunMUz+1XjIy9QQF0OCOIm/3ZOK2
	 13LGt7gDysyaKodzlkhXkYNik/KuMC/NQYrermegMutv+2eegX6OaI1HAuakhm5fAS4U0
	 bcCoU+VLFRNDtEMZoTXf0lx7cuhqvlD3MsBS8+Fyge4ahHTHldPYb9nyLe9xYCskCoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102766;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ko2E/pPj+F/XnTIobk+TpMFXCcD15m+twzbNVjdwDZQ=;
	b=2CNSPT883Ka+p2o4Y/x+ObPuLdhNVvHmbEdyONXuXpeyyxYlhdJMOtHW21cLN1k+I4cw
	 7Ze14Of88koOfFp/4gpIOWrk+dEnUPKE9v7RFRQSL2dQCmOEOZNxQozfuUv97JHSLm0Zi
	 6fKgpcBHPpY+ajgQQgaJRh5+zzcSOda0WsodoMHR1pkA7IYKGBpeiXSCyASH4qIISGEQ2
	 lzU7fzWDPKvMHGqtghIeii7ukFxdVCt+xDu3UkOxDA6FhxdhH7noAYjEhwFU6Z9+7IdHy
	 22AOzESVrim1pBJuBdfLk0HCY9Fg+nackAmUmS6fDaEq42zsJyKM0NlsxbVBxvo5m5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=h0uCTX3Q;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18CE660A5BE0;
	Thu, 19 Nov 2026 15:39:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18CE660A5BE0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=h0uCTX3Q
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB24D1C0A;
	Thu, 19 Nov 2026 07:39:14 -0800 (PST)
Received: from e140322.cambridge.arm.com (e140322.arm.com [10.2.201.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4FF333F882;
	Thu, 19 Nov 2026 07:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795102757; bh=vKj1OrMlK1Vha6UO7fFyJT9DSnM8PrK5famG4DemWJw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h0uCTX3Qyt+99YKjwc1KqN2Ke8u4hZWQWVIJKGRfnLujanrKuPFjFjBzvgW1L4/co
	 +e4gLw4zJcQCx6fCMCeqrOvmJzC2XKBLNU3MB5sh1w0EL7kr8MEaj1gKYJy7EsDhEE
	 4co/+EIMEpSbvfweoXIRNYCECs1uyL5N15v2VxPM=
From: Charvi Mehta <charvi.mehta@arm.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Charvi Mehta <charvi.mehta@arm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Rathinavel Sankaralingam <rath.sankaralingam@arm.com>,
	Shobhit Pandey <shobhit.pandey@arm.com>
Subject: [RFC PATCH 28/28] media: MAINTAINERS: add Arm Mali-V76 VPU driver
Date: Thu, 19 Nov 2026 15:37:58 +0000
Message-ID: <20261119153758.1426673-29-charvi.mehta@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119153758.1426673-1-charvi.mehta@arm.com>
References: <20261119153758.1426673-1-charvi.mehta@arm.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add maintenance contacts and file patterns for Arm Mali-V76 VPU driver.

Signed-off-by: Charvi Mehta <charvi.mehta@arm.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c08aade46f61d..3150c3bef7d54 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2409,6 +2409,17 @@ F:	Documentation/userspace-api/media/v4l/metafmt-arm-mali-c55.rst
 F:	drivers/media/platform/arm/mali-c55/
 F:	include/uapi/linux/media/arm/mali-c55-config.h
 
+ARM MALI-V76 VPU DRIVER
+M:	Charvi Mehta <charvi.mehta@arm.com>
+M:	Vincenzo Frascino <vincenzo.frascino@arm.com>
+R:	Rathinavel Sankaralingam <rath.sankaralingam@arm.com>
+R:	Shobhit Pandey <shobhit.pandey@arm.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/arm,mali-v76.yaml
+F:	drivers/media/platform/arm/mali-vpu/
+F:	include/uapi/linux/media/arm/mali-vpu-config.h
+
 ARM MALI PANTHOR DRM DRIVER
 M:	Boris Brezillon <boris.brezillon@collabora.com>
 M:	Steven Price <steven.price@arm.com>
-- 
2.43.0

