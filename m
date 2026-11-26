Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.24
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795655726;
	b=xfLtAd0F0OF7eds3z1/NuVMt5ClfP4ql3UtD7dOtMz6d4Z/0Oi5+4iLWKxlRGH1/zIis
	 pm4EVtJAm1uCpjqtA+4uyptGCazhZsbWCqXPGI/4/CvW2VcEknnTElfcrtVzr1a8Wq7NW
	 /G5x4liO25hr485jbL/AV07pChIl8RRN1I/aR3unI+qm4mabqH4KNhX3Rq4cbdMRmj3bI
	 irlmMDt/nV64rv39XTF3Rtfrhuu7GlUZDOzuIO42zzr9DnzU4i6atqWgd2d1izYLcWQ8b
	 q6IYKs+CEC5bS/Nm9792+pQ3yB/XdPtt2aZnt+b/HQqnqWJfvWbPkHay6u81Qb9dCrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795655726;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=nILVZaqxC2rH9z83PsO5LQ8bJDjN0yQgfBnavVLDKK8=;
	b=PgBZc4t3gQ5T2uQfN/GiJFH/bpTZGi42S2khRN7nfV2aYbNtDQYIF43o/v6IwFkAv5D9
	 UNzxjIKmjNqKwvm//ReyYvMjlo0Te0r7MBEQmZMKgGd6Wufnp7maGagWVKfy9djuYzSPr
	 4gvknkFdxRPxKElXo/z9iYq4Kycz00tt98X2OFfuW4pl58DlkEiey8hkmbBPaDEf/K0QR
	 Sq0uyEQtkUtAB48i2Zl8c51nI+umM/PSfAT169cX3I8amxY9Rggnl4DgCrKp1gcik0B6R
	 hs5tRqRCPO5lPjyJGzQMAK0D7HRt1fvQtsypo5wcWsxgB9QAJFhOzUegweTi6p4aXkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=innora.ai;
	spf=pass smtp.mailfrom=innora.ai;
	dkim=pass header.d=innora.ai header.i=@innora.ai header.a=rsa-sha256 header.s=protonmail3 header.b=Lc0Mof7h;
	arc=none smtp.remote-ip=79.135.106.24
Received: from mail-10624.protonmail.ch (mail-10624.protonmail.ch [79.135.106.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB427606A323
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 01:15:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB427606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=innora.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=innora.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=innora.ai header.i=@innora.ai header.a=rsa-sha256 header.s=protonmail3 header.b=Lc0Mof7h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=innora.ai;
	s=protonmail3; t=1795655722; x=1795914922;
	bh=nILVZaqxC2rH9z83PsO5LQ8bJDjN0yQgfBnavVLDKK8=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Lc0Mof7hQKkYmv7/G6BIu2XFgaALAcmHUMgfUh4D63hAmroF6gbpmY82JhqmXgb9U
	 ACHtCHj5Plm29MEWBsTxDzxIWxTcMM25swGooKSYZiauV9kanviDQku72wVeOZH9Os
	 ZEsX/1Zncy2lrt1/A3Yz8Y9QGvR4M09nhFY1O6+pzHuX/VF8U7nyIEWgvY5PAN4X90
	 xjlh9hI3T7sGpyAIvs4oY4J/ovTWZeZYqMKyQxQhmPn4tKZIaHYmF0Cy8AVrfBhFve
	 9Lh/Owlh9Fespe/rqzNKW8b8J+XqSCrURWx34wyhazg1mrtppyq7+iMWGDhJPNsh9d
	 u6aegnXlWAhxA==
Date: Thu, 26 Nov 2026 01:15:16 +0000
To: linux-media@vger.kernel.org
From: Feng Ning <feng@innora.ai>
Cc: linux-staging@lists.linux.dev, Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2] staging: media: atomisp: validate DVS 6-axis config dimensions
Message-ID: <20261126011505.85041-1-feng@innora.ai>
Feedback-ID: 140578448:user:proton
X-Pm-Message-ID: 5bea168c82dd945e48247ec9b5e175bce03788e1
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

The atomisp driver allocates the DVS 6-axis coordinate buffers using the
stream geometry, but copies from userspace using the dimensions supplied
in the ioctl argument.  If the user-supplied dimensions are larger than
the stream geometry, copy_from_compatible() writes past the end of the
allocated buffer.

Validate that the user-supplied dimensions match the allocated table
before copying.

Note on commit d178c7ca8fef ("staging: media: atomisp: use array3_size()
for overflow-safe allocation"): that commit fixed the multiplication
wrap in these same allocations.  It does not change which dimensions are
used for the copy, so the two issues are independent.

Signed-off-by: Feng Ning <feng@innora.ai>
---
Changes in v2:
- Use the existing error path (set ret to -EINVAL and goto error)
  instead of an open-coded free and return, as reported by the Media
  CI smatch check ("missing unwind goto?").
- Wrap the dev_err_ratelimited() call.
- Cc all atomisp and staging maintainers.

v1: https://lore.kernel.org/r/0c2Zqei57CqmMI6Dh34hKZdsp1D1ar1jHsyfzY4owI-GI=
Au-jshsaBCptOXe6b81ZwQ39udm6hHTgalp23YhtChJnYEuYu4pW5oPsu42acA=3D@innora.ai

 .../staging/media/atomisp/pci/atomisp_cmd.c   | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/stag=
ing/media/atomisp/pci/atomisp_cmd.c
index e66a7d1..91d38ca 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -2629,6 +2629,16 @@ int atomisp_cp_dvs_6axis_config(struct atomisp_sub_d=
evice *asd,
 =09=09=09=09return -ENOMEM;
 =09=09}
=20
+=09=09if (t_6axis_config.width_y !=3D dvs_6axis_config->width_y ||
+=09=09    t_6axis_config.height_y !=3D dvs_6axis_config->height_y ||
+=09=09    t_6axis_config.width_uv !=3D dvs_6axis_config->width_uv ||
+=09=09    t_6axis_config.height_uv !=3D dvs_6axis_config->height_uv) {
+=09=09=09dev_err_ratelimited(asd->isp->dev,
+=09=09=09=09=09    "invalid DVS 6-axis table dimensions\n");
+=09=09=09ret =3D -EINVAL;
+=09=09=09goto error;
+=09=09}
+
 =09=09dvs_6axis_config->exp_id =3D t_6axis_config.exp_id;
=20
 =09=09if (copy_from_compatible(dvs_6axis_config->xcoords_y,
@@ -2681,6 +2691,16 @@ int atomisp_cp_dvs_6axis_config(struct atomisp_sub_d=
evice *asd,
 =09=09=09}
 =09=09}
=20
+=09=09if (source_6axis_config->width_y !=3D dvs_6axis_config->width_y ||
+=09=09    source_6axis_config->height_y !=3D dvs_6axis_config->height_y ||
+=09=09    source_6axis_config->width_uv !=3D dvs_6axis_config->width_uv ||
+=09=09    source_6axis_config->height_uv !=3D dvs_6axis_config->height_uv)=
 {
+=09=09=09dev_err_ratelimited(asd->isp->dev,
+=09=09=09=09=09    "invalid DVS 6-axis table dimensions\n");
+=09=09=09ret =3D -EINVAL;
+=09=09=09goto error;
+=09=09}
+
 =09=09dvs_6axis_config->exp_id =3D source_6axis_config->exp_id;
=20
 =09=09if (copy_from_compatible(dvs_6axis_config->xcoords_y,
--=20
2.55.0


