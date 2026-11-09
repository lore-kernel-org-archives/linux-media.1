Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216889;
	b=Gzag9u2f3tjeSHv0PAqfl1/VrSAVr/Iknm/iIjYaJymlN9PRyHdqaVv7/k3sxUliaFyA
	 tvo0+TVjMS37zStC3ji1hDxTwAYunLEfFI1HNuG4nN+hM4DcsZ7uNnwi8Hj0cuUkorlCv
	 31jyrG+sENMNR2JbE1n8pkQT5U8lcLCv1zRlq8tDye0KejgjSKP7MeSp1Boy4hDFA/EMf
	 +WiLHd6cIGvJLCzrcJBjj5pF1SNXrzKoyrEcWswBhQfv1mA1yx2uV8JGYhKpxMI9pT3X6
	 M57+sWPNm2fDISyuysc6rKIprmKoKATZPzROL2oF3Oui/v7lN7Ok9c2zln+/o70CmeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216889;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=5GbUc9ScSjHwegUWJddmnX7lg3jnyDG3bVgefMaPuOc=;
	b=fTQQM9SeuT3Sre2X7O+sXdmYXIdTTFGtfiQSu1nVCWqxtStqSs1k4tNXVUIBP/EmL4b/
	 sXJogKJBAvkFhvBD40U2u614ljKUaaoZD4usCDeYQu6f3uCqJTWjcZo7rxD0QWbt4wd4n
	 +WWrCq/8/IMZlBsh0KTgkelJKPCLkxFk3NbPbbcQ4pKJ/fWGoHkxdXShx7NBW6raKzqJ4
	 CCj5GcMKoq+idGs5Z5p35UktFlFdoepRiBnJNrDnNvkXJH70kaoqZPNxxKyJaMuZQM3LE
	 bWGeh4oTs06Ssf/wH7eZRFf3f7I+j/hUfGZx5FAw+N5OQxFhjFoljYJkAx/plZ1XW8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=L3bwc6Q1;
	arc=none smtp.remote-ip=79.135.106.30
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch [79.135.106.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711DA606D815
	for <linux-media@vger.kernel.org>; Mon,  9 Nov 2026 09:34:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 711DA606D815
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=L3bwc6Q1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1794216886; x=1794476086;
	bh=5GbUc9ScSjHwegUWJddmnX7lg3jnyDG3bVgefMaPuOc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=L3bwc6Q16wgBtN6f+cuYpUCF2FpJz2copj7hnd4Ys13U/mSjDh9f/SCXxRw7U7+aw
	 S1ZHIhWOwp9n9NrKHXY4P5BSid+Agheeym+7mEmtHApCtBTJAI6qaTW7/+f8hzLOPL
	 cfzQJdGnRU4N75nHKU8HcibkuwlYw0P6lmQtm/+GnqmOq23/VPr/upn54H4teD9gwQ
	 WwRxBojOiCcrMDy/McWYZsy5rtTY5O1ednInxpUs10qY3LnuxBQikbSPtUtTfN3QWS
	 o9JVMZ8V/HLcxEYO+uTDywEQYAZohp0GwKsvRwHiHpxoNTfLjZ5+Vr5j6hqkKq6oEj
	 wKZUDz2iMvudg==
Date: Mon, 09 Nov 2026 09:34:39 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Marshall <pm@petermarshall.ca>, George Neacsu <geocausa@gmail.com>, Hao Yao <hao.yao@intel.com>, Fernando Rimoli <fernandorimoli11@gmail.com>, "D. Manresa" <dmanresa@gmail.com>, Jizhou Tong <fqwqf@fqwqf.xyz>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] media: ipu-bridge: Add ST VD55G0
Message-ID: <20261109093353.3757-4-lsa.uz@pm.me>
In-Reply-To: <20261109093353.3757-1-lsa.uz@pm.me>
References: <20261109093353.3757-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: ac3c6ffab691e6bfad9ade0ff54fea87a9118e4c
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

The infrared camera of the Surface Pro 11 with Intel is an ST VD55G0,
enumerated by ACPI as SMO55F0 and wired to the IPU7 over one CSI-2 data
lane.

The vd55g0 driver takes only a link frequency whose MIPI rate, twice it,
is an integer multiple of the input clock. 396 MHz gives 792 Mbps, 33
times the 24 MHz the sensor's SSDB lists on the Surface Pro 8, 9, 10 and
11, and within the sensor's 750 to 1200 Mbps. Peter Marshall's earlier
patch for the Surface Pro 9 used 380 MHz, 760 Mbps, which is not a
multiple of 24 MHz, so the driver would refuse it:
https://lore.kernel.org/all/20260918221705.323510-4-pm@petermarshall.ca/

Tested-by: Fernando Rimoli <fernandorimoli11@gmail.com> # Surface Pro 9, IP=
U6
Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
---
v3: moved before VD55G1, for vendor order. imx681 v10 3/3 adds SONY0681
at the same place, so whichever lands second needs a trivial fixup.

 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel=
/ipu-bridge.c
index 3739c4a2a8c..c99c85b7e6f 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -124,6 +124,8 @@ static const struct ipu_sensor_config ipu_supported_sen=
sors[] =3D {
 =09IPU_SENSOR_CONFIG("SONY471A", 1, 200000000),
 =09/* Sony IMX471 (found on Lenovo X1 Carbon G14) */
 =09IPU_SENSOR_CONFIG("TBE20A0", 1, 200000000),
+=09/* STMicroelectronics VD55G0 */
+=09IPU_SENSOR_CONFIG("SMO55F0", 1, 396000000),
 =09/* STMicroelectronics VD55G1 (found on Lenovo X1 Carbon G14) */
 =09IPU_SENSOR_CONFIG("TBE20A1", 1, 402000000),
 =09/* Toshiba T4KA3 */
--=20
2.54.0


