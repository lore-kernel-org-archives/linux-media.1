Received: from mail-43100.protonmail.ch (mail-43100.protonmail.ch [185.70.43.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C308A339361
	for <linux-media@vger.kernel.org>; Sun, 13 Sep 2026 15:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789313745; cv=none; b=iEHiONAor5ssR3wrv/aMwIazx9IzePR0pVoUXCPGSp+faw2ONbX4z5x2C8RYjtX7ckV5Vhy+wooZ6baBs8SULIaGv1aDI7YGxbilMZgba4mWTJe65EnOUB6InxQCPMgDdKkEwGnVC7tZYiuggr/T4Uh50XDmH+g4bfciYrlV6yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789313745; c=relaxed/simple;
	bh=sNN45jwN4P5GOX8mewg8wxBsaXBXEoltuY+cPXXvEPA=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IWW+BRj0oumk/bIBPPfPlntfc5QMvLj1Ksqg7rds8gLvP3CSs2Fi9SddroGqG+UjRyS/kDhhS6C/yTqQXqlls5+Pis+ayS16ix6bG8kYhpUelLsgM36iwWe/3nVgjTDUSQMtExgU/XT0UORbhfDox2eHIeml+y42S2ifn0TPLm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=Yi1569ev; arc=none smtp.client-ip=185.70.43.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="Yi1569ev"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1789313735; x=1789572935;
	bh=Vgjob02lUSyZ+lnl7P1ZMfyaUqoKEe0KNjeCU4nnXbo=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Yi1569evf7XV0qQQDNkwen0QVpVTy7qZ4ve+4B4YAdmb4FXgm/dj/MnyKkfm0XiHa
	 FJUjPHe4CNBdTWWl/MnFe0J4q2/7S8IkBENbn1wT+rAVOAgi8PU13jDseCVVHBjfDd
	 4+XycroIAmw1vZPWqUm6VZ9q51/hWIDflk751rltptsFcZGWhFMy3ssfTWKvm+GVcX
	 /l4M31Kw3cRbRTInqugs7x4jiSZeo0jFwSqbxT+q2ERYRxtrU+T2bMERu/I2gGDGPz
	 EE6Z308YGdZvdb/V4PsZenNtGfDA/gWH83EixwmmfBI9NXZVt/w03/9233C+sXBm2M
	 B+kZ1OKuYgdaQ==
Date: Sun, 13 Sep 2026 15:35:32 +0000
To: linux-media@vger.kernel.org
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <hansg@kernel.org>, Dan Scally <dan.scally@ideasonboard.com>, German Pablo Lindo <germanpapulindez@gmail.com>, linux-kernel@vger.kernel.org
Subject: [PATCH] media: ipu-bridge: the Surface Pro 11 rear sensor is mounted upside down
Message-ID: <20260913153526.80287-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 135248b5e06c9c1b7983f7430215e3282822633f
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The Microsoft Surface Pro for Business 11th Edition with Intel mounts its
OV13858 rear sensor rotated 180 degrees and declares it in neither the SSDB
nor a matching _PLD, so the rotation reads as 0 and every frame arrives
inverted with nothing to say so.

Add it to upside_down_sensor_dmi_ids, the table that exists for this class
of firmware. Matched on DMI_PRODUCT_NAME as the rest of that table is; the
entry only takes effect when the ACPI HID matches too, so a machine of the
same model that shipped a different rear sensor is left alone.

Measured on the machine. Before:

  camera_sensor_rotation  min=3D0 max=3D0 value=3D0
  libcamera: Property: Rotation =3D 0

After:

  camera_sensor_rotation  min=3D180 max=3D180 value=3D180
  libcamera: Property: Rotation =3D 180

and the front sensor is untouched at 0.

This makes the kernel report the mounting truthfully, and that is all it
does. The pixels are unchanged: capturing one static scene through
libcamera with the property at 0 and at 180 and correlating the vertical
brightness profile gives +0.995 the same way up and -0.781 flipped, so
libcamera delivers the same buffer either way. The sensor has no flip
controls, so nothing is corrected in hardware either.

An application that reads the property can now rotate; one that ignores it
still shows the image inverted. That is a userspace matter and is not
addressed here.

Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
---
Written 2026-08-31 against a variant of upside_down_sensor_dmi_ids that
takes a struct with a match type and an id list. No such variant exists in
media/next, so the patch could never have applied and was never sent;
rewritten today in the form the table actually uses, and measured.

Applies to media/next on its own and on top of

  https://lore.kernel.org/linux-media/20260913142034.5632-1-lsa.uz@pm.me/

which adds the OVTID858 bridge entry the same machine needs.

A second machine reporting the same DMI product name independently reports
the same inverted image, in three different applications:

  https://lore.kernel.org/linux-media/20260913144127.17995-1-germanpapulind=
ez@gmail.com/
  https://lore.kernel.org/linux-media/20260903080854.16266-1-germanpapulind=
ez@gmail.com/

I have asked its owner to confirm the string and to say whether any of thos=
e
three applications turns the picture the right way up once the property is
set. It would surprise me if they did.

 drivers/media/pci/intel/ipu-bridge.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel=
/ipu-bridge.c
index 7e65491faf..a5de450284 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -192,6 +192,14 @@ static const struct dmi_system_id upside_down_sensor_d=
mi_ids[] =3D {
 =09=09},
 =09=09.driver_data =3D "OVTI02E1",
 =09},
+=09{
+=09=09.matches =3D {
+=09=09=09DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Microsoft Corporation"),
+=09=09=09DMI_EXACT_MATCH(DMI_PRODUCT_NAME,
+=09=09=09=09=09"Surface Pro for Business 11th Edition with Intel"),
+=09=09},
+=09=09.driver_data =3D "OVTID858",
+=09},
 =09{} /* Terminating entry */
 };
=20

