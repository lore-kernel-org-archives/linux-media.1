Received: from mail-244123.protonmail.ch (mail-244123.protonmail.ch [109.224.244.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D073DA7D6;
	Thu, 12 Mar 2026 17:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773335790; cv=none; b=jUmeKKTe2O326rO0OFNiQAIpmT9yp9ExkY6vosLVSY/VCpuysiDdJwl7biiflA4RFDzXoPqzhB4b03WeWvZ7Xw3tYJ1mrMZ4sU/rCZM2t/5KgQ0kJneRFrB8HjsuTU/aEfaTiqOu7SGLLnBrc35txd99MOjcGK9KYFaSnKNVhEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773335790; c=relaxed/simple;
	bh=NVMwtQlyC8e5SSHUET4w5SgeHLaqCvymevWoNkfb2/U=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N9RbEeDk+N735/ohCKzImK2h7pQVlXAmmSGrZRcGSOnCTyVW4cwVwDmJ0iyJ8KPYa0WYIbMDmulfR/ICBR2OCUzkevl93xrvtKIm2ryqdnDXyTQqzDe4HMN3Q2vpsevtAiTnY8YRpMkbaR1um65VtfsRmQ5YRYiPZU2/kyxV/HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=J6gR+VYv; arc=none smtp.client-ip=109.224.244.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="J6gR+VYv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773335784; x=1773594984;
	bh=FzitFSVWOjlVYKdzVKhaIr96unT6y6nT6ms/8MK/Jvk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=J6gR+VYv5/qL0XP++vtXfszfWdhRAdH/ZazeStweZWWJyMDRzTTSpKUjaCdFWRC8X
	 8R1UsDwCOfm1hT48tGdekjDFltOdvAM8Kl093Ql7h7OWkpG96tqqJ0T9WYf0lQVIl9
	 QlrM4tVffmiumg5hem4oEIp6lLZ6LMIUloSj6D6b7WPa5KBotun2YzwQ6HXZynYVh8
	 Q04bZhB7xCV4vltMV7nsTZ8IIAwrclNTj/8i/hvJ3FiImEMvIH4qGJdaO+TLn+V5TU
	 WsNpNqwldE12pYtx3cBEgXNjNAjyQhZaznGYrWGEczFAWHz/savxZ5pyWy6y0SCRrJ
	 4sKdJ9IXawW6w==
Date: Thu, 12 Mar 2026 17:16:20 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ben Kao <ben.kao@intel.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH v3 1/3] media: i2c: ov8856: free control handler on error in ov8856_init_controls()
Message-ID: <20260312-ov8856-v4l2-props-v3-1-3771ab40a4c0@pm.me>
In-Reply-To: <20260312-ov8856-v4l2-props-v3-0-3771ab40a4c0@pm.me>
References: <20260312-ov8856-v4l2-props-v3-0-3771ab40a4c0@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 5bb5d02937e49747ff967e760bb9685ea351a460
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The control handler wasn't freed if adding controls failed, add an error
exit label and convert the existing error return to use it.

Fixes: 879347f0c258 ("media: ov8856: Add support for OV8856 sensor")
Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 drivers/media/i2c/ov8856.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
index e2998cfa0d18..dd01e1d515ff 100644
--- a/drivers/media/i2c/ov8856.c
+++ b/drivers/media/i2c/ov8856.c
@@ -1951,12 +1951,18 @@ static int ov8856_init_controls(struct ov8856 *ov88=
56)
 =09=09=09  V4L2_CID_HFLIP, 0, 1, 1, 0);
 =09v4l2_ctrl_new_std(ctrl_hdlr, &ov8856_ctrl_ops,
 =09=09=09  V4L2_CID_VFLIP, 0, 1, 1, 0);
-=09if (ctrl_hdlr->error)
-=09=09return ctrl_hdlr->error;
+=09if (ctrl_hdlr->error) {
+=09=09ret =3D ctrl_hdlr->error;
+=09=09goto err_ctrl_handler_free;
+=09}
=20
 =09ov8856->sd.ctrl_handler =3D ctrl_hdlr;
=20
 =09return 0;
+
+err_ctrl_handler_free:
+=09v4l2_ctrl_handler_free(ctrl_hdlr);
+=09return ret;
 }
=20
 static void ov8856_update_pad_format(struct ov8856 *ov8856,

--=20
2.53.0


