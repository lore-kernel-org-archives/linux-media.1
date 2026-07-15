Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACFA3AEF55;
	Wed, 15 Jul 2026 17:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784136750; cv=none; b=RrN6Rx8ujVM2ds+5nT/JCpNOWRjGKR9Um9/OZf2Br6RCu5xewAVMgnUCc6m/7y7AP+oTMDAYT6xkCPzF2ChqZth8dciyQ/4mI3GQKox1xBtGigGj+nNHfhWgiI9ZP/Pg0NFxS00UxYg8FJGWwtqrdIWQ+ZP2EP2C+odlUYySeKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784136750; c=relaxed/simple;
	bh=8C7seGjTrmjWFg0LVvx+iP4iv21Hc7LrRhjeAUMDouI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZFXHO0KTblc4DeVh4mxI3L/rs4iy64bQ6zubPlOFSiXRRgTrlw0JNiT+mqDYA7Bw1a1PF7vAOTYMAL2Ryl/qDVFR3NokGV8uHNSoGAPW+PuRvs1oKMF13KCMI7I8CmPo2u78ZErGcgKgoNtCa0xCYqu4vuxU8UeLiGGBaqX5nec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Xsw24kL9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Xsw24kL9"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:66a6:48e1:9e1:50d5:c75c])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8A39C104C;
	Wed, 15 Jul 2026 19:31:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784136689;
	bh=8C7seGjTrmjWFg0LVvx+iP4iv21Hc7LrRhjeAUMDouI=;
	h=From:Subject:Date:To:Cc:From;
	b=Xsw24kL9ogi/Bja9GA9rtXi0BiE0P39udemDe4v0OL/DpbscowiLC7zuoGtZFoOBu
	 0U15iUwz1tiPjzCA5QoG1HEfNMIBIBfhc9luH0QIQp99KoTbn5oYB7Z2MuhIzzeYlY
	 TfRo23VEaVgl1TXpNlTGeZrk6X1d8GxhSMGBdqh8=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH 0/2] media: Add bindings and driver for Sony IMX708
Date: Wed, 15 Jul 2026 23:01:27 +0530
Message-Id: <20260715-imx708-v1-0-1f36f54e14d4@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDc0NT3czcCnMDC11LM/MUM4vkRLPkRAsloOKCotS0zAqwQdGxEH5RamE
 p0LwSqGBtLQCio4bAbQAAAA==
X-Change-ID: 20260715-imx708-967d68ca6ca8
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Naushir Patuck <naush@raspberrypi.com>, 
 David Plowman <david.plowman@raspberrypi.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1286;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=8C7seGjTrmjWFg0LVvx+iP4iv21Hc7LrRhjeAUMDouI=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqV8QfJeRWnGN6n60793fcBmEmlQQT+q66ohB60
 CLS6UUiIqCJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCalfEHwAKCRBD3pH5JJpx
 RXzBEACtsFjQ1GeYnOjQvSHVI2TPJzkQ7Gva3hV7C1vnkQ/hhppeba1FaZqWr9sd5Ds5Nlk5TbK
 8Yv5P6nvwpkbL8kLrF7Ail6gOVZlkgacYbwuvAssBfrwfuc8ubsQzjt5r1h7+RxFv46qUmJQ1Ql
 KRShJT9IPT+Pufc7Q/9WHACuSoYRzAsM0Z2O1NBbBxrKeqLqKGXIFykrNnRyDP/xPp4V89QWh4d
 oCipMKiTs8IRVFPIHRa67n8yND+1spSD8ir4c7hvD+UsLsNJKEmZe+q9iO0Wuq5vl2a7HiOLROI
 jBckxVXsCNUAb4R6EMA0S4ZkvfVouCj28RSieHj26cXiR+f1cjG38QKRlK8JekwT5nLWsZ6S9g5
 72re2Cd4W2CiawhO3yh492P8xFGxJNEOtXP1NPrcGJErFRB+kOcRbOCFKGnKZORIP7deYqY/M5X
 1GzCCvkvgfghEpJorLF6HQiOXk7z621/v/z5+6Boj860DN/05KBXQ20hX2y5Kei88hjKJGbq7jo
 eekYKZEPb3peKYvpfCQSrTo2tbBFAjXy8A8/JhosBpj/cnw7SduOSxYotB3ww5P+Bo6bXwPtjwu
 MIEw9VWs/cjIrn+U5OibgjBES5SuUvVl/z1RP1hWKouTgJ87eYWIp7cZnXqVaRkJfVCYT2EPiFn
 t8obfukAdZgoHLQ==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

Hi,

This series adds dt-bindings and a basic V4L2 driver for Sony IMX708
camera sensor, used in Raspberry Pi Camera Module 3 [1].

This basic driver is an adaptation of the one present in the downstream
rpi-6.18.y tree (written by Nick Hollinghurst). Many features from the
downstream driver (like HDR, binned and 720p crop modes, etc.) are not
present here, and will be added on top using common raw sensor model in
a later series.

This has been tested on a Raspberry Pi 5 with libcamera.

[1]: https://www.raspberrypi.com/products/camera-module-3/

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Jai Luthra (2):
      dt-bindings: media: i2c: Add imx708 image sensor
      media: i2c: Add a driver for Sony IMX708

 .../devicetree/bindings/media/i2c/sony,imx708.yaml |  120 ++
 MAINTAINERS                                        |    8 +
 drivers/media/i2c/Kconfig                          |   11 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/imx708.c                         | 1255 ++++++++++++++++++++
 5 files changed, 1395 insertions(+)
---
base-commit: 6c3a86e563b5c79e4429d8aa4cde39b2485bf969
change-id: 20260715-imx708-967d68ca6ca8

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>

