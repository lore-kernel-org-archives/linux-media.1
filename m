Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.121
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793938317;
	b=N5LYPz2lLqdGKSoGwEHgMzMSWNLZHy1zgSVrz893jRQxGPfORTdFyUK1e3HGPJ+ui7yH
	 VzHELI0PR6MbZxphiVGfVY0ylFdhJECd8GsEyIU4+8jAKc29fgftfxFPssDLYK1SKoJFx
	 MeJHFjZWAVQ53N6MU27X8/thMTC0EWYK6yRryM9KtyDGmYbn0zLVJGUkd4WWN71rR9oqN
	 9FdA0aONRm8Ar/VzknRBumcExFwF1mLAnE7jmJeIvGq7PCx47NcyL/ovnTI1dGUK490eo
	 6y5d+PwniaS8zNlQlaYxsYKBRd1eifSeYoy3yErMykVb0WoXqWlR/9VoENuwSSctDQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793938317;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=dy+6W3dhUjW+vdHYi6MZ5rHw2N/o7H/3Oheai7WIFWA=;
	b=G59Z6ours26i2SC7lJWKWWUwl+GJ8cqZVK6eEUCIKAzM32EeYb+Tw8IGQR5s7wIi7KGd
	 VPR9vNPe+c37mc3dbudGRVxZnmNHZlKkmSAnZYgX2qtc4WyVNYC84lXWrXqk2uNsZ43Xu
	 oe5lMyXBVGOsWo9jkPv25Q6V2Uk7eTf/OyDTaFJIarXOoVKN2POdZsPVBTqa8DVdw/MiG
	 50hvCQ5UYdpZ5F/Kxynod5l8ymcUeOuvUB9zw+p3IkEB+vUESeP5Rria/InwPDgyLFXKL
	 ocIyaREL4HwH8WqgMhkyDhS7Eum7Elk4G0dGjMRBgx3/sR/ktRf9tvDP5S+umdwDFcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b="QFeftPX/";
	arc=none smtp.remote-ip=79.135.106.121
Received: from mail-106121.protonmail.ch (mail-106121.protonmail.ch [79.135.106.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F29606A32E;
	Fri,  6 Nov 2026 04:11:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2F29606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=QFeftPX/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793938314; x=1794197514;
	bh=dy+6W3dhUjW+vdHYi6MZ5rHw2N/o7H/3Oheai7WIFWA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=QFeftPX/l+4YFzEwk1n2K6tt9NqpXrFSauKBIYlomoBgRBklgKjYJttpHYFgfajmH
	 Uh29tm6sNqQKbkiAEA4QwSQmcXVpBymw3Phao92cQBCgtLrwsMkSK9ugqEx6/RQZW6
	 6W0cNMa7i57IGCZagYsETBEob3XMxTC4yqc4WFtUhCIfbAmv6Ms8+3xLb7IFPonioI
	 FHLvyo3BjV2vZWgNXg1Er/cxF9nzEBguxJAJ1XxNdBL8r30IeHxRH3QH66hTGISCVu
	 0ck0k68Ttmj+4SXk3heGDaBL2ELyPIMLk7LGPp8xPSYCyfW7tiU86AtOI9brP08BX9
	 tYeM20YwfqIkg==
Date: Fri, 06 Nov 2026 04:11:48 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Andre Gilerson <andre.gilerson@gmail.com>, Dan Scally <dan.scally@ideasonboard.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, German Pablo Lindo <germanpapulindez@gmail.com>, George Neacsu <geocausa@gmail.com>, sashiko-bot@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 3/3] media: ipu-bridge: Add Sony IMX681
Message-ID: <20261106041116.78937-4-lsa.uz@pm.me>
In-Reply-To: <20261106041116.78937-1-lsa.uz@pm.me>
References: <20261106041116.78937-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 8899de5a8329939039e6e2530309d37221b2eb38
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The Microsoft Surface Pro 11 for Business (Intel Lunar Lake, IPU7) carries
a Sony IMX681 as its user-facing sensor, enumerated as ACPI device
SONY0681. Add it so ipu_bridge_connect_sensors() builds its half of the
graph; without the entry the sensor is never connected, whatever driver is
present.

One link frequency, 969.6 MHz, on two CSI-2 lanes.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel=
/ipu-bridge.c
index 3739c4a2a8c..2759c776cfc 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -124,6 +124,8 @@ static const struct ipu_sensor_config ipu_supported_sen=
sors[] =3D {
 =09IPU_SENSOR_CONFIG("SONY471A", 1, 200000000),
 =09/* Sony IMX471 (found on Lenovo X1 Carbon G14) */
 =09IPU_SENSOR_CONFIG("TBE20A0", 1, 200000000),
+=09/* Sony IMX681 */
+=09IPU_SENSOR_CONFIG("SONY0681", 1, 969600000),
 =09/* STMicroelectronics VD55G1 (found on Lenovo X1 Carbon G14) */
 =09IPU_SENSOR_CONFIG("TBE20A1", 1, 402000000),
 =09/* Toshiba T4KA3 */
--=20
2.54.0


