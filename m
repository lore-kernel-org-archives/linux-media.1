Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3DF424D6E;
	Wed,  5 Aug 2026 19:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785959711; cv=none; b=UOKg5fg2623kD5wDEGdTrcLbCVFS+eQbKXQG7tvu0jizlk/8mD9rFgGovpv5kQ6o+Tf4xm/KzKrRmpR0Z/R1g8HrnH3IdiThaoNnpopDmM0BnIrFLwZYGcI1LK9wdwCdMF6qasg9nRkb/+R0jxeFreCBR8lgJji8NoDe7HDllTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785959711; c=relaxed/simple;
	bh=681JJgp5OPVloQXHR86FcL6E83ka9C03v4AqdEp6oE0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MrPrLFX4mA07olehJG4aqvF1eRJyEqlibiDDgb6wert/zrDgDzfwJDPq46PG8O/eGBMjAhQBHCqFBzlb8ZGa86m6SfwGKOAoDUqUiPWZN2RcAhFj3jj3yBLeSFkfSBlP2L47XQzOxsIpThAeLvM7PX0BCHOlcU0pce8OCwk2FQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=dBYk4uDT; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Fovs7QfN; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="dBYk4uDT";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Fovs7QfN"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1785959684; bh=+1CEtwTX8nTbraYAJYOSqZH
	usIXom3NWgt22+dmTteo=; b=dBYk4uDTWfH4qYxoXI4RXaQkydovIuwyhlltLvsyMYS/6hBCox
	dmyHWtOMB3Tdw0XBWdXSXjg8rXAqxohoYHBilFKQ3amxNsCwdo2C9lrmKs9qZUTa7uTNLnudUrn
	3q8AsyxUjrYzFc5N4u0RiCTS9G4YEdjahfXSI++ZeZkrEDtsvfG2O+K58Iwxwbtls/r+9EPzW1U
	j8Bp7l4e8SUAznNblgr3+ud58ECU/HrZk6FzO6UwK8mck/gyFe64ARdVtIfYTxPxthpUy3FKAmA
	5qVBNUI7PKcqJmNgWYAqyZrmYXqmH6H6Xec95jn4LgpKQGUu+j6yXjOf+nNU93mWT2w==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1785959684; bh=+1CEtwTX8nTbraYAJYOSqZH
	usIXom3NWgt22+dmTteo=; b=Fovs7QfNJjHoVhGijFXQsVZrFzjQBxEUBzDAAwcpf84TR+pRDc
	7GnQgfHPm4xc0Gb5zNc8Yuc4mshZTJ6LrjAg==;
From: Danila Tikhonov <danila@mainlining.org>
Subject: [PATCH 0/4] Add front-facing camera support for Nothing Phone (1)
Date: Wed, 05 Aug 2026 22:54:23 +0300
Message-Id: <20260805-imx471-v1-0-7be79f539ed8@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCwNT3czcChNzQ91kI0NLiyQLQxNDk0QloOKCotS0zAqwQdGxEH5xaVJ
 WanIJSLdSbS0AKYjzXmoAAAA=
X-Change-ID: 20260805-imx471-c2198b81414a
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

This series adds support for the Sony IMX471 front-facing camera sensor
on the Nothing Phone (1).

The Sony IMX471 driver currently supports the sensor only on ACPI-based
platforms. To support the sensor on the Nothing Phone (1), this series
adds handling for the required vdig and vif supplies, extends the driver
for use on Devicetree-based systems, and enables the sensor as the
device's front-facing camera.

- Patch 1 adds the Sony IMX471 CMOS image sensor dt-binding.
- Patch 2 updates the Sony IMX471 sensor driver to support the required 
vdig and vif power supplies.
- Patch 3 updates the Sony IMX471 sensor driver to add Device Tree
matching support.
- Patch 4 adds and configures the nodes required to enable the Sony
IMX471 front-facing camera in the Nothing Phone (1) Device Tree.

Signed-off-by: Danila Tikhonov <danila@mainlining.org>
---
Danila Tikhonov (4):
      dt-bindings: media: i2c: Add Sony IMX471 CMOS Image Sensor
      drivers: media: i2c: imx471: Add vdig and vif power supplies
      drivers: media: i2c: imx471: Add Device Tree matching support
      arm64: dts: qcom: sm7325-nothing-spacewar: Add front camera support

 .../devicetree/bindings/media/i2c/sony,imx471.yaml | 123 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/kodiak.dtsi               |   7 ++
 .../boot/dts/qcom/sm7325-nothing-spacewar.dts      |  46 +++++++-
 drivers/media/i2c/imx471.c                         |  12 +-
 4 files changed, 186 insertions(+), 2 deletions(-)
---
base-commit: 1701fda2f58e345c050f4309971bdc07cd6146ba
change-id: 20260805-imx471-c2198b81414a

Best regards,
--  
Danila Tikhonov <danila@mainlining.org>

