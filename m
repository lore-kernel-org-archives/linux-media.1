Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792785351;
	b=WI5GcEH6GEJPhUstZ886LP+CwsJgIf1mn8VEOswypPirLTYNHxECUVrBqGr+gTZJ34do
	 5ows5UNQL3TjJEQdkx1pUCI8L6NK5EMMQwQqyhjZf03zxD3pYBRLoOkif4r8waEzXUomJ
	 5GYpL+Z6E3vl+/W4f+VJwAUI+Xfuvm5dLjL5GuUqi38YvWvLqtwrqIietoa50Y7lEjiSw
	 C2tlo5WLJ5IQEn3aLdTBerVTC/5NbJ49SHwjuI54IqPIzxKQ8E8p9Z4OZJbJjqs+GGvz+
	 a0FLieOTlwezjxrMxqq4gheyKg1BgE9Lp9bZ1Ec4fqfS5usSXaOvi/Ne1BPvK55GBag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792785351;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=vdT1a4Pw/YTLbaed8FSmFt8HagIufL3M0jEHQxnTQSg=;
	b=LNWFg28Faqtalf4QUZmbo1WOB3iYpaMGwKmDAEzbm/Wj7ws/1qTnV2UlejA6t+ZvS3NX
	 6X2Mac9uBCJdy5a6g2MrdAFdEmwwehiMBXlkaO62jarsrAYr3LazI6EaiZxZG4srUwdXp
	 OhPgFPkGummVquMwdvvelsnX0ucVEztKghKsT9LR8hF8labUyTeI5WwBq9DY78mpr+af9
	 nVBb+P2yhjjXkUbwcrycVWd0Rhp9+USbAb4dVikeHiBKN9rs7/licA6TY8SFeiIKwYGeu
	 PJlsBxN9Xi6v5F47HvMpFZi5bVSJrPNcIchMCCpF8xQe1kGKY3pq58PYVpms8FeGTIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=W5OLR5Mf;
	arc=none smtp.remote-ip=185.70.43.22
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19609606EA4C
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 19:55:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19609606EA4C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=W5OLR5Mf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1792785347; x=1793044547;
	bh=vdT1a4Pw/YTLbaed8FSmFt8HagIufL3M0jEHQxnTQSg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=W5OLR5MfDeOTHUa8RKaVx4/cjeAh7ysdEtDtoALUWGtv7c3PJdSG1lwB4pu5q9nsY
	 9y0MlxVcKWa4VSTLmtphi7vIaxTMCGC0qjzVlKSDGunzw+OvI1hMn0/jGfFKSJ1LBu
	 Usc3vlW/FadOxbO7ueAz18QeaNsBTRJjPzT+moAtwDmlc9EKDXtYAzknBYtlz2Dv6x
	 Yh7MhzhXhkfqS8pjaoclvKDor6oyUvIEztM70tCSEgRtX6Oi9ylNnn/eJN3rK0eNLR
	 TNl8WaFhg8NmwLdFft2HdXTPtazkk1Hrd87h0ydddcd/q6UtW+U4jZtCEm7tiX0Fbs
	 eCkPw3Xvr/WYw==
Date: Fri, 23 Oct 2026 19:55:44 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>
From: Valerii Sokolov <valerii.sokolov@pm.me>
Cc: Antti Laakso <antti.laakso@linux.intel.com>, Sarang Sapre <sarang.sapre@intel.com>, Divyamani Tripathi <divyamani.tripathi@intel.com>, Manik Bajpai <manik.bajpai@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Valerii Sokolov <valerii.sokolov@pm.me>
Subject: [PATCH v1 04/11] media: intel/ipu6: clamp crop top offset in ipu6_isys_csi2_set_sel()
Message-ID: <20261023195446.22578-5-valerii.sokolov@pm.me>
In-Reply-To: <20261023195446.22578-1-valerii.sokolov@pm.me>
References: <20261023195446.22578-1-valerii.sokolov@pm.me>
Feedback-ID: 17117034:user:proton
X-Pm-Message-ID: 6211db852f15d5754737f0a2b5668d0ec08c38ca
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

In ipu6_isys_csi2_set_sel(), sel->r.height is clamped with:

    clamp(sel->r.height & ~1, IPU6_ISYS_MIN_HEIGHT,
          sink_ffmt->height - sel->r.top);

However, user space supplies sel->r.top (__s32) without bounds checking,
while sink_ffmt->height is __u32. If sel->r.top is negative or greater
than sink_ffmt->height - IPU6_ISYS_MIN_HEIGHT, the unsigned upper bound
sink_ffmt->height - sel->r.top either becomes 0 (smaller than the lower
bound IPU6_ISYS_MIN_HEIGHT, violating clamp()'s lo <=3D hi invariant) or
wraps around in u32 to a value larger than sink_ffmt->height (allowing
sel->r.height to exceed sink_ffmt->height and storing an out-of-bounds
crop->top offset).

Clamp sel->r.top to [0, sink_ffmt->height - IPU6_ISYS_MIN_HEIGHT] before
aligning it and calculating the allowed crop height range.

Fixes: a11a5570a09d ("media: intel/ipu6: add IPU6 CSI2 receiver v4l2 sub-de=
vice")
Cc: stable@vger.kernel.org
Signed-off-by: Valerii Sokolov <valerii.sokolov@pm.me>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/=
pci/intel/ipu6/ipu6-isys-csi2.c
index 1525454279..a2491729d3 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -821,6 +821,8 @@ static int ipu6_isys_csi2_set_sel(struct v4l2_subdev *s=
d,
 =09/* Only vertical cropping is supported */
 =09sel->r.left =3D 0;
 =09sel->r.width =3D sink_ffmt->width;
+=09sel->r.top =3D clamp_t(s32, sel->r.top, 0,
+=09=09=09     sink_ffmt->height - IPU6_ISYS_MIN_HEIGHT);
 =09/* Non-bayer formats can't be single line cropped */
 =09if (!ipu6_isys_is_bayer_format(sink_ffmt->code))
 =09=09sel->r.top &=3D ~1;
--=20
2.56.0


