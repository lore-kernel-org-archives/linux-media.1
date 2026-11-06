Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793969151;
	b=QfuCYkeLMc7qN68M4azdOepYw9kDKFiCsbtqv8Phhg4xUQByRcBpsOHJzB/Zi41vaO6b
	 NN24zDiyjdpOvk7qJ4XZ0vh1ArLFcimBH/+q5/2UDEejFzc8Zt/nM8oLdgmfD7+m6rqfq
	 HGawIzaPPTyLPLD596yKjkIE16QxHqodSlY3clAqrVPhkvraINCKzxHgz8frBMtQBQQ7K
	 AA3tYet4c4Ee4l/HV187RfU4n0EDg+ICC/9zcUFmBUsK6uh20ZkspsxR4kEQxj3i29Wvg
	 yGegEjklokWdmXpHhTrQ855uhzaOyW/lcSLJh46huj2H9D0fYnd9Ew5fnBstTB9kDgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793969151;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=SvCOCf3YteA9iimmP/e0lnCKLJTugesY45Fw5285iVw=;
	b=BJNhef7G9yRPJCuZUqtpizRB9lnmIMMtCLg4ib6G4U2ogBstPCqpMle6L/F8DhVbkH3j
	 KMeZ73/s10SJI2Rdk8vUGoTYGX5VPTYfrHkbP3qT20OPJ3XQmiBZxv1w5oPjWLpa5lPM4
	 9VlEkxn1s45l1zFih75E6iJgEVVqj8DYMPLkICGEqozUpN+yCdNT176wn//lum5tjTT3O
	 6HdNPraW+N0C/Pg3GwueI5JMUXP8aZRO6e8KsnL4P8RufdHrraEjd5l/xaRGesSHNzJ3W
	 8q+wfhUUrzz05aWC685m2Jh5MKW2ZkMnSfdJP8fSugb5qITUS6dqhz7ej4vSLny5McA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=QSZCZtXd;
	arc=none smtp.remote-ip=185.70.43.22
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3D9606A32C;
	Fri,  6 Nov 2026 12:45:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE3D9606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=QSZCZtXd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793969149; x=1794228349;
	bh=SvCOCf3YteA9iimmP/e0lnCKLJTugesY45Fw5285iVw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=QSZCZtXdqU+7S8oGK81m5dtWVyyK2pLUfp8XDB2j7lZTm7xXDVZDDRdB+JSUCJHHw
	 RfuauBmStZCLCwBZXsu1md1ZMO73h0xEipezjF60ti5kmGV+67RhZlp29tWcMN8I4o
	 xO351TK50c+kADkedAxJEUqu+N5oz86eOaTfbXw2ZtNzKzYG9JRo7kKdb+9u7WheIv
	 iLxa39b/4C9OkB0AU21smxHGblE65tk6Cpvql1iqI4/WF6O9EohX/CfMPJrUDaI8gA
	 3FLEVwB7tMq/ylovZUl2VXqjTEfZCTGJ6HviX9b+uxvXQQbasqGsRTLipbhuI9gDir
	 9NuPKuULVnuQw==
Date: Fri, 06 Nov 2026 12:45:44 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Andre Gilerson <andre.gilerson@gmail.com>, Dan Scally <dan.scally@ideasonboard.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, German Pablo Lindo <germanpapulindez@gmail.com>, George Neacsu <geocausa@gmail.com>, sashiko-bot@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v10 3/3] media: ipu-bridge: Add Sony IMX681
Message-ID: <20261106124505.71429-4-lsa.uz@pm.me>
In-Reply-To: <20261106124505.71429-1-lsa.uz@pm.me>
References: <20261106124505.71429-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 83f751e65593d37a7ae0d24e615f62f4cf494344
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


