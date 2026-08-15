Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB2E201278
	for <linux-media@vger.kernel.org>; Sat, 15 Aug 2026 02:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786760647; cv=none; b=QJ0xVIw+wrLVmYBf6fDH9ZllM77BbKt8gTnK9UXvkJw/nZiVx0Eb9tCwWirZ3Pb66o2b+5495dFXfH/bSVMgIjaZ6rcWrdoPN9KYtV7sPLQIrGMMGKFBTLGjyRlKebU8O940my5IgrPE93tMK5DVWEzt+MnsoIJFcpQz2cPVt0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786760647; c=relaxed/simple;
	bh=xshB2XP+4+64spuX2Zf8enVu3M98izEeJpN+ScuIfrE=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZtyAanWOIsBh2BnIfOdt9iJ4DzvvCh8+zUyYflhTQ/BO1+J4AyTtiXRzZXcagdwLu4GEauet70bH+TAtFJixGBnuSt+T+WCdYOOaw4W/q0J7WAl9ruvmXvih+Q3s5W/usiIqkqwr1Qo0waMcoufgL0EEUUVJ3xiHRikHAjQU1Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=SRQ6qYtl; arc=none smtp.client-ip=109.224.244.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="SRQ6qYtl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1786760636; x=1787019836;
	bh=jMLb2xOHGE2Kb5g8JOv7WBzZBlRcKRFUckc4miIvm6E=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=SRQ6qYtlquS3VXymrNYrzcKuUAh60b2DbY+FAUQfMrVeMC8NnEFTg9OaagLY84VBN
	 rI5pJuxAofJCuyM0N5taIxvii6Kule6jtzjnv2sczrEjDg/ntn8P/qwB0Cf+8Gf2Ig
	 qbDWp66Inq2S/20+wdHMyzzeqptSMFRHia7clLrlcRUHEfKG2dZXxOvOacbHmZ1ACP
	 8/rD9cz5bB/N+deZMKpRQ+jvSodsOtFC14ZKX3zW2NTc7CJmybtG9WDrkh8PTwvcr3
	 AjbxOFDhLs8WN7oMkvYljSm4xx3bQTWAO2pBzMMMc30Secg0bYwqSle4jBFTIfbVS5
	 eL39SEnESJ0TQ==
Date: Sat, 15 Aug 2026 02:23:50 +0000
To: linux-media@vger.kernel.org
From: Steve Kaznak <skaznak@protonmail.com>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com, johannes.goede@oss.qualcomm.com, hverkuil+cisco@kernel.org, mehdi.djait@linux.intel.com, linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: ipu-bridge: Add OV01A1B sensor config
Message-ID: <20260815022320.728925-1-skaznak@protonmail.com>
Feedback-ID: 24244511:user:proton
X-Pm-Message-ID: dbbef4033255d718b3f0d6687b7ea7a9129debbe
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add the Omnivision OV01A1B (ACPI HID OVTI01AB) to the
ipu_supported_sensors[] table, with the same single 400 MHz link
frequency as the OV01A10 and OV01A1S entries it shares a comment with.

The sensor is the IR camera in the Dell XPS 13 Plus 9320, behind an
Intel Vision Sensing Controller (IVSC). Commit 36eab90d3f4f ("media:
i2c: ov01a10: Add ov01a1b support") added driver support for it, but
without a bridge entry no fwnode graph endpoint is created, so the
driver never binds and the camera is not enumerated.

Tested on an XPS 13 Plus 9320: the sensor binds and streams 1296x816
Y10 at 30 fps.

Signed-off-by: Steve Kaznak <skaznak@protonmail.com>
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
---
Changes in v2:
- Move OVTI01AB before OVTI01AS so the table stays sorted by ACPI HID,
  and reorder the shared comment to match (Mehdi Djait)
- Add Reviewed-by from v1

v1: https://lore.kernel.org/linux-media/20260805021154.51404-1-skaznak@prot=
onmail.com/

 drivers/media/pci/intel/ipu-bridge.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel=
/ipu-bridge.c
index 88581a4c081d..3dde07443002 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -73,8 +73,9 @@ static const struct ipu_sensor_config ipu_supported_senso=
rs[] =3D {
 =09IPU_SENSOR_CONFIG("INT3537", 1, 437000000),
 =09/* Lontium lt6911uxe */
 =09IPU_SENSOR_CONFIG("INTC10C5", 0),
-=09/* Omnivision OV01A10 / OV01A1S */
+=09/* Omnivision OV01A10 / OV01A1B / OV01A1S */
 =09IPU_SENSOR_CONFIG("OVTI01A0", 1, 400000000),
+=09IPU_SENSOR_CONFIG("OVTI01AB", 1, 400000000),
 =09IPU_SENSOR_CONFIG("OVTI01AS", 1, 400000000),
 =09/* Omnivision OV02C10 */
 =09IPU_SENSOR_CONFIG("OVTI02C1", 1, 400000000),
--=20
2.55.0


