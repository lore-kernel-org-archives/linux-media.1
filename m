Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792785348;
	b=2kMh45sFKNb3pQeJ22ZwebiyacAZ+yDLpnWx2h4UeufIBlZ19mdbU8+4Af4hZayPj3mY
	 aq6Fs1krU9n7m3fGEhlVMM3QlyzkzA7/+l/GiNYdwGI9O2ZavHSXtV1egxbhHitsSMbO0
	 dcOaFmu9OEdC6yg34iToPUi0Ou5b/hv8ksBVeQSbBVigbFcmFzcH9gYXs80K34Bn76su0
	 rIVUoVsjMRgw6dhuMRWjFLeJxfrAFnerw+aRco/lq+Opd4+2+R04F/ORwhGwnVC+cKwfW
	 6ut80HX63UbuvuXwdJ4mrLUv9aLDQA/HYw7R1DarKDEHigfwElQRV2Wz8SuYMktu2CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792785348;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=6/yHD9XpoGjxCE8BffWdkn4JFGCNPNFlWOfRcpw47Us=;
	b=HjQ1scIr94D1SziaUBaMGwY8r6oU4kF9jIvEi7N7kLiDrsgtqf5PNz6nsLE34xXVx3In
	 kxzeCXPfMls88S52JZ/Z6eSuSsyZX0h7lSsnMmBbsHp+qXZ4yiAz3BOP82bsgvFAO4AkZ
	 I3P3me91z2/00Bli+Y9JVRwyRJjvUFPS0jZbFLEyHHbJS6aik8G8agKIEI9G6Q0QXipMF
	 E5sZPlPvcRfbPvvx9OtH1Syx212awz+UbXaKWABNBHdLW1sPYIxx6SuaGvAagEYSSmOK0
	 iOPZB/F97S/fSzN8fzoYjYZE2OhMNp3vg+YA52+VshjZmIOieshtTuW76/MKy1iEEEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=RNQpG9ZA;
	arc=none smtp.remote-ip=185.70.43.100
Received: from mail-43100.protonmail.ch (mail-43100.protonmail.ch [185.70.43.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E5160A3820
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 19:55:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57E5160A3820
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=RNQpG9ZA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1792785345; x=1793044545;
	bh=6/yHD9XpoGjxCE8BffWdkn4JFGCNPNFlWOfRcpw47Us=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=RNQpG9ZAR2IYEC2jf2ZPBvDnDY+wUOEhwymh5FPIY3R/8VJO3pwX0MWRY8AKiBE7P
	 CV0bOJDulStuJ6B2wqOL7K0Kj6A/nA8F1s9T27ZD5ybDv6XpWOj3BgrHtNfyvjMrux
	 13UF2cLGamvMLQldJtgV5MhaDmBtqRpYUXffzhM3MsN8pLxThIFpQmtfEr9nlzW9JX
	 AZQubPdGlwhkTEF9EeDEL51B2bQ+0YbVYRXZiWPNjC8hWGZuxaGDB9Tdy82S6ioFkz
	 I+fKesTPvEaCJzgYzd6E3w1N47I4moxg8ImBbHl1zQMfTTxsyXTqCXCWX5FG5/n2QH
	 maheGlG4E6hqQ==
Date: Fri, 23 Oct 2026 19:55:40 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>
From: Valerii Sokolov <valerii.sokolov@pm.me>
Cc: Antti Laakso <antti.laakso@linux.intel.com>, Sarang Sapre <sarang.sapre@intel.com>, Divyamani Tripathi <divyamani.tripathi@intel.com>, Manik Bajpai <manik.bajpai@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Valerii Sokolov <valerii.sokolov@pm.me>
Subject: [PATCH v1 03/11] media: intel/ipu6: check pin bounds in ipu6_isys_fw_pin_cfg()
Message-ID: <20261023195446.22578-4-valerii.sokolov@pm.me>
In-Reply-To: <20261023195446.22578-1-valerii.sokolov@pm.me>
References: <20261023195446.22578-1-valerii.sokolov@pm.me>
Feedback-ID: 17117034:user:proton
X-Pm-Message-ID: c818da9406929de491771b060f8ab5eb245b1f36
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

In ipu6_isys_fw_pin_cfg(), cfg->nof_input_pins and cfg->nof_output_pins
are incremented without checking them against IPU6_MAX_IPINS and
IPU6_MAX_OPINS. If more video nodes are attached to a firmware stream
than the firmware ABI supports, the function writes past the end of
cfg->input_pins[] and cfg->output_pins[] in the firmware message buffer.

Validate cfg->nof_input_pins and cfg->nof_output_pins before
incrementing them.

Fixes: 3c1dfb5a69cf ("media: intel/ipu6: input system video nodes and buffe=
r queues")
Cc: stable@vger.kernel.org
Signed-off-by: Valerii Sokolov <valerii.sokolov@pm.me>
---
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c b/drivers/media/pc=
i/intel/ipu6/ipu6-fw-isys.c
index 56bb67869b..a36d64bcb9 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
@@ -778,10 +778,15 @@ static int ipu6_isys_fw_pin_cfg(struct ipu6_isys_vide=
o *av,
 =09=09ipu6_isys_get_isys_format(ipu6_isys_get_format(av), 0);
 =09struct v4l2_rect v4l2_crop;
 =09struct ipu6_isys *isys =3D av->isys;
-=09int input_pins =3D cfg->nof_input_pins++;
+=09int input_pins;
 =09int output_pins;
 =09u32 src_stream;
=20
+=09if (cfg->nof_input_pins >=3D IPU6_MAX_IPINS ||
+=09    cfg->nof_output_pins >=3D IPU6_MAX_OPINS)
+=09=09return -ENOSPC;
+
+=09input_pins =3D cfg->nof_input_pins++;
 =09src_stream =3D __ipu6_isys_get_src_stream_by_src_pad(state, src_pad->in=
dex);
 =09fmt =3D v4l2_subdev_state_get_format(state, src_pad->index, src_stream)=
;
 =09v4l2_crop =3D *v4l2_subdev_state_get_crop(state, src_pad->index, src_st=
ream);
--=20
2.56.0


