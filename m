Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793740258;
	b=nXu7LN3CZD8q6MmvicTA2qwfprtdY6WtE6HK1CyqngaRSfv5nKqABBagH2irQ3sb8cCq
	 xve0gnewgvGK4iiHXMxdKm1SYT463EWBBjvp743fVPpARWJ2+WX7cahXy8p4wV8HJchhL
	 RxcXeD+No1dQiOaS/kvhUAnOgHEMnsj0CjohqGUwgLRe7BVDaO1d7Q8sZ3UFQoDvJ+OzZ
	 IgVDLAYJwxZJxHtAo7qAz0obBedPs3qsPg7Tdc8jeTs4zqcnyfuR1pKl/W02P8c+zAnCG
	 VMZEG5jGu/yetG59jcG3g/k9ZqczQ/3pzd8uynPGZY02p+kcGhtda2B29u0jn9EiE6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793740258;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=gtERkWDzO0PHtfDx9Zf4SS6nQpyodBmcFFuGoGQG+xo=;
	b=djEKTRIeXa2/6bod02Q8ZpBGtDyzdWsaGNvVVHRJz4m5l1XkRp3zbW2XWyZIn9YnVEjj
	 iDfMBFRJIRyK87c11tSfT2A2ym4gSZpcxbT7+zhrBMON3ryzezZEAz3eVl+nBzXCM1wCh
	 SGGHT6CpZwLWcnfv8snrY9KE5LGqavfXt5ET0OR6q2vrrey7kNpnsmyHdtLobgjHdhQCb
	 axh5Dqd5Fvx9B6T8gG3XgbPArruUSbHWo/0B4pu1aaApqSUUWQv7aiZU/k4q0e034yQWz
	 DN0IwR0gMnncX7icKa8rfVG678YRz2c5BqVbTETpLhmGeLDXeOgYFRmRIomwMt5YkEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=q8E0kEXQ;
	arc=none smtp.remote-ip=185.70.43.16
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC9B606D801
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 21:10:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EC9B606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=q8E0kEXQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793740256; x=1793999456;
	bh=gtERkWDzO0PHtfDx9Zf4SS6nQpyodBmcFFuGoGQG+xo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=q8E0kEXQfqwUuOP6sOF5uWHvsF7zuvrEI/QiseZJFtAQt/rsNWGK7WSgGlH3JID35
	 S6TeOIjkS1YVxaQRjgEovOntNNUTw5bXzsPLfsH1OMxMk4jdiSOpbrEkhdL7RfgYMB
	 MNIBqgzNqMV3DDaDu2pdaekJSTwIM/N/hbt3cjcKysFe7QUq/cQNtahp+fBZPQFXRf
	 XwS4jWXiD64zXBvcilk4iSO4ZGozqcsix+8MsxhsIoydBOAsJeL+hHpNHKZeCsgIuO
	 ptnwEoCrHWgQ/XByRnjzAw+GoYlFATwgysvyK6mJ1FfwDdS9jrtSQHOL0hbIlbWf9N
	 4eGhNVT8/cuXw==
Date: Tue, 03 Nov 2026 21:10:51 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>
From: Valerii Sokolov <valerii.sokolov@pm.me>
Cc: Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, Antti Laakso <antti.laakso@linux.intel.com>, Sarang Sapre <sarang.sapre@intel.com>, Divyamani Tripathi <divyamani.tripathi@intel.com>, Manik Bajpai <manik.bajpai@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Valerii Sokolov <valerii.sokolov@pm.me>, stable@vger.kernel.org
Subject: [PATCH v2 04/11] media: intel/ipu6: clamp crop top offset in ipu6_isys_csi2_set_sel()
Message-ID: <20261103211031.1573726-5-valerii.sokolov@pm.me>
In-Reply-To: <20261103211031.1573726-1-valerii.sokolov@pm.me>
References: <20261103211031.1573726-1-valerii.sokolov@pm.me>
Feedback-ID: 17117034:user:proton
X-Pm-Message-ID: 412fd22f511f99bc2bba9a29875b8db8f924bf3f
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
Reviewed-by: Antti Laakso <antti.laakso@linux.intel.com>
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


