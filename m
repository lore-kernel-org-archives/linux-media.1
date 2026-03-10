Received: from mail-106121.protonmail.ch (mail-106121.protonmail.ch [79.135.106.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0823C389455
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 04:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773116504; cv=none; b=s0Ol7hWN2qvwfSJz4vspsI9CsRCMESqEqNvcvU96r4raNqyo4r/bOzK2Mh5jGaBbxSziAOz+JdQMODXxsnxtCzxQXTrURCjN8q/oxzmtmzPcR9i9nEnmj+PA3jqq3QfIX2EDcDSYx5IQ2U1zIQllAu+QqDUOY5wWo8KtWAYWAyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773116504; c=relaxed/simple;
	bh=bcCfDhJMuFO9LQmoPDmK4ZbWID8mungHniC/M/CthFI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t/vFG+w3VOUCTMlbO+etZhfygkDPG/42lrBCN6sefoVQT61hQ6dRQ3NF0HtvHihYoI2kdawo0kTOXdBDD0RE6Ij8JfXSFNoAbIks/om6X/NeklKLfbzefZpxGVQL9rdV7weNqlbShz/R2b8BId0jXl//ZPHM3BsI2GTdEnJlDYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=TxVFpHfQ; arc=none smtp.client-ip=79.135.106.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="TxVFpHfQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773116500; x=1773375700;
	bh=ebBnmgoocAzhOW+k1R3Jn9juCf240BgRJruqDT67ZYo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=TxVFpHfQKpSrr88BKEjqYAJg0pTaggUlCl8H54EC3GothjUmiRjyUp12EGrWg7nlQ
	 6FEHfPiw1jkE9K6zzFsYjUw63835REjEYWRO6Z2xED14N5BzLaR77QmGWcfz53bPCM
	 ClWHFwZL+nRSgChq5TH9xj7vE/rAXRz2kU5+eaQAAZexR80mYTGX4RQ8v18PToT8uf
	 EiGO09yn+rnnZOd6DxI3Q2ZIgfiKa4q8ZxUaKMPn+mdO4yMAWh0RouGQUQA3FvJS6x
	 rfVf2JipIefXTGa1hM21hl7Rgept3DSYYaAhRHSzLuTSoIWr36soEEXZHX6f4uCaZg
	 LpfyghQswWdhg==
Date: Tue, 10 Mar 2026 04:21:34 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH v2 2/2] media: i2c: ov8856: parse and register V4L2 device tree properties
Message-ID: <20260310-ov8856-v4l2-props-v2-2-2717404ed045@pm.me>
In-Reply-To: <20260310-ov8856-v4l2-props-v2-0-2717404ed045@pm.me>
References: <20260310-ov8856-v4l2-props-v2-0-2717404ed045@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 459aab906aa66932aa31ce1b64bcffae0f7f21cf
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Parse V4L2 device tree properties and register controls for them.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 drivers/media/i2c/ov8856.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
index e2998cfa0d18..9d7d16ba8911 100644
--- a/drivers/media/i2c/ov8856.c
+++ b/drivers/media/i2c/ov8856.c
@@ -1887,12 +1887,14 @@ static const struct v4l2_ctrl_ops ov8856_ctrl_ops =
=3D {
=20
 static int ov8856_init_controls(struct ov8856 *ov8856)
 {
+=09struct i2c_client *client =3D v4l2_get_subdevdata(&ov8856->sd);
+=09struct v4l2_fwnode_device_properties props;
 =09struct v4l2_ctrl_handler *ctrl_hdlr;
 =09s64 exposure_max, h_blank;
 =09int ret;
=20
 =09ctrl_hdlr =3D &ov8856->ctrl_handler;
-=09ret =3D v4l2_ctrl_handler_init(ctrl_hdlr, 8);
+=09ret =3D v4l2_ctrl_handler_init(ctrl_hdlr, 10);
 =09if (ret)
 =09=09return ret;
=20
@@ -1954,6 +1956,15 @@ static int ov8856_init_controls(struct ov8856 *ov885=
6)
 =09if (ctrl_hdlr->error)
 =09=09return ctrl_hdlr->error;
=20
+=09ret =3D v4l2_fwnode_device_parse(&client->dev, &props);
+=09if (ret)
+=09=09return ret;
+
+=09ret =3D v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &ov8856_ctrl_ops,
+=09=09=09=09=09      &props);
+=09if (ret)
+=09=09return ret;
+
 =09ov8856->sd.ctrl_handler =3D ctrl_hdlr;
=20
 =09return 0;

--=20
2.53.0


