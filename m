Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.120
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794247669;
	b=Pjvl8MN4uQOPx6hkygtcJZ9ThxGBHzxOJJiItCGiU+qnHPwf7Nc609AipryF8+Tdcall
	 RwITkN8XavH2vkhy+0/cuFwgW5l2XhmDHCW0cekPyIjtvGlmfQPk2h8HsMp8K9ix6hzGE
	 wVvF/e2Eea9J3ByO0dWe7ohgG0qNOChmCcgHHpjwtcZy3heGgU+tVDb/fsj4YiHg8f83L
	 pnT51Ho52BPaGPl3OR6J6ibotIP/Yyb+HdVkg0mPey6gVkwz5LZQlgX3w4HAxhjDQkH+z
	 FtmQ72MFZZ68AmZLXTU9GpFOPKSdWa7VqvvQhCy/viv07cKax+Ua7Vd7zJGZ5RHf1xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794247669;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=1Gd+Z3/OLlRqwOYO36qAhtu9JC5HL8fvtZ/EZ5rAaLg=;
	b=NoKUgpbjpIXTpLXnkzrZBJ8XBBxqz26DHOo/l+2fS0TDFlo8nyvn8Eexfm+PJ+bK2cWz
	 xNtL9kJaCvXqC0RTY+B/o3Ll4bztPuG0bGRFBnWOl8GsKN+l9Z+cXwkaRcfZhJxAfATag
	 LzZEMf/Ac8eEL8knSrN4IZ7IsO2vuHC2JWlrHMiopAZ+icTaDCYd/2vsIczEeq5T8zM67
	 FeXVkBCmGIgWV/etE4kuHVNUC08TaIs2R70JYodzpptBpPjnzqZHyX5AeNCuN+D5/5fTN
	 u5kZm0v7WZoF7+Lzu1e+yH4hrWmXME8TX5bA33EtXqfbJAXTLbrNSFWzspUvPDXoN9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=K0GjaAFo;
	arc=none smtp.remote-ip=79.135.106.120
Received: from mail-106120.protonmail.ch (mail-106120.protonmail.ch [79.135.106.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC71606A321
	for <linux-media@vger.kernel.org>; Mon,  9 Nov 2026 18:07:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CC71606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=K0GjaAFo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1794247666; x=1794506866;
	bh=1Gd+Z3/OLlRqwOYO36qAhtu9JC5HL8fvtZ/EZ5rAaLg=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=K0GjaAFoIez5E2XWNtv8OOtthbVyffwJW8gLJUU52J0oixcrvCidSFq6zZ0wmYSq9
	 sFDIK+UOKwRujTAkTSFQVo5zHLCbjjFEyRRQ7/JHep9tMI5qmcwTsvicZcBpXYO2Vh
	 iejqxG/4eQ3HkOzaH/IcoOlCaBHGL/uLX+e6QYjAWLfde+ze0QJotjIWnFV/cgV/0J
	 G6ITKJ4Ow0XnwgoCQX4HzArGhUIozMRI06XnMoqJyDqAxCFJzqAFC3u1Gutt/n1cyg
	 xJvPMssD28jbMftZwy9kDuj9nfq5BRDocAfd8Q4PuD5z3nAwjouIjoW4TLlG/va/z8
	 9CTi5fP/Bwg2A==
Date: Mon, 09 Nov 2026 18:07:38 +0000
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: i2c: vd55g1: Bound the number of st,leds entries
Message-ID: <20261109180732.84703-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 4c63b7482c0eacdcf5397257a4892c43328949ae
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

vd55g1_parse_dt_gpios() reads st,leds into a stack array of
VD55G1_NB_GPIOS entries, and vd55g1_parse_dt_gpios_array() reads as
many entries as the property has. The binding allows four, but nothing
checks that at run time, and on ACPI the property can come from a
software node or _DSD that no schema validates. A fifth entry is
written past the array.

Refuse more entries than the sensor has GPIOs.

Fixes: e56616d7b23c ("media: i2c: Add driver for ST VD55G1 camera sensor")
Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
---
Found while reviewing the vd55g0 driver, which has the same check.
There is no VD55G1 here, so this was tested with a module that runs
vd55g1_parse_dt_gpios_array(), copied unchanged, on a software node,
with a guard word after the four-entry array. Five st,leds entries
overwrite the guard and the call succeeds; with this patch it fails
with -EINVAL. Four entries parse as before.

Tool use, per Documentation/process/generated-content.rst (Assisted-by
tags in commits were dropped in 7.4-rc1):

* My contributions to this series were prepared with Claude Code
  (claude-opus-5-5); work by others in it is their own.
* This replaces any Assisted-by tags in earlier versions.

 drivers/media/i2c/vd55g1.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
index e3939bb9bd4..2e847af3f1e 100644
--- a/drivers/media/i2c/vd55g1.c
+++ b/drivers/media/i2c/vd55g1.c
@@ -1854,6 +1854,11 @@ static int vd55g1_parse_dt_gpios_array(struct vd55g1=
 *sensor,
 =09=09*nb =3D 0;
 =09=09return 0;
 =09}
+=09if (*nb > VD55G1_NB_GPIOS) {
+=09=09dev_err(sensor->dev, "%s lists %d GPIOs, the sensor has %d\n",
+=09=09=09prop_name, *nb, VD55G1_NB_GPIOS);
+=09=09return -EINVAL;
+=09}
=20
 =09ret =3D device_property_read_u32_array(sensor->dev,
 =09=09=09=09=09     prop_name, array, *nb);
--=20
2.54.0


