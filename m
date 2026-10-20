Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792525200;
	b=BhJGP1G4C2Ym2JScqJqEtwMNcXd6MlQ6bmepiwfnrXE7MKVEsOmQjRcnZBczQ2qU3jkv
	 omc1djk0Hs0d9O2da4xyhOzUQRB0i0t1pRoIaqsNdlkfi0chMDjEO9jT2c7HnETJ4Hveh
	 NTzrTA8dvAadNPHpL+o22OuB2B+g4j0a2XPhpR12MM0bwFlaWF66BBI3P9U1yvkYFPQkC
	 RzSt5hHX+Gv7dxzT70HplnBSfWGmDsrZko7i4+r+iVoQg4Fh0vBmWeE+kiAy4oVgzL5yU
	 vIcHr3OFSJT8R5jYdkogI+bwNUTk1DMkkMd7Oj+jQTuaiuyUVgATxN14A3EmYXLsvTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792525200;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=qEfgzdCa/IDx24/x+dDWecgbPq23qJT6V4/xf2GkPtk=;
	b=Cxoswk1QWt07m0f9VzGnQIYspnjI13gHmwmDk4sgqZKMO3LOZx/5FHbn3v08/HbPEizs
	 bTeDoqP4dZgPkelLtW4oQmUZfF99Vh//mYV3Ojf0Zqk7waPMsac4erMHxe9E27p29GVhs
	 nthk/GQPYmwM5R0+JdM1jntXOurkaskgcRgWbXtDzjFcvDkTTxfAvqBOKZIK6AjK7DCVe
	 hKOsRisNjYzUAzDIWHZ9T3hsVKCAnpCKKI+bJVjSyrLkym5T+f1DI6FT4QcLVWYPeuAM/
	 5MSuIGQpv/OeEamkarOyHEKXOI7N5tpQXFoTG6+6n5Yqc+luuPAL9vjf9K+17J+GSyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=ch3gBHCG;
	arc=none smtp.remote-ip=79.135.106.31
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56614606A324;
	Tue, 20 Oct 2026 19:40:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56614606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=ch3gBHCG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1792525198; x=1792784398;
	bh=qEfgzdCa/IDx24/x+dDWecgbPq23qJT6V4/xf2GkPtk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ch3gBHCGWlcEgyN6KxjQZ81KFymOaINZEpX31PHsKFc6y4KWiVIdXw+0ac+2xY/4E
	 5g1T3Vw7Npzknn6nUAKekmbBvsWqZJk5HKvMTY3aMaA1Bk4IqkjLP11GjzA3uRNr7u
	 A4gB7q16UOUfNvjq8KtBHYP+tipKpQ+1y8Mwm7lGqAyBsqklseTsPjSTCFnVZ/AouO
	 4mca+EAGjhW5Ma3Jqa87kSvrsoY10PfkhkeeXYtbXL1Vnx7GhHibHnY16EMIhqr+tb
	 kmL7EBoXYc2Lef7X4qCxQwFLcvnD0yfVOdUty2kl8yo84unmm74WLso6Nb3NZHlquH
	 5FyMXQJV/RfLA==
Date: Tue, 20 Oct 2026 19:39:53 +0000
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
From: Birk Skyum <birk.skyum@pm.me>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>, Saikiran <bjsaikiran@gmail.com>, Mark Brown <broonie@kernel.org>, linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] i2c: qcom-cci: Reset the controller when it resumes
Message-ID: <20261020193946.51478-2-birk.skyum@pm.me>
In-Reply-To: <20261020193946.51478-1-birk.skyum@pm.me>
References: <20261020193946.51478-1-birk.skyum@pm.me>
Feedback-ID: 21326998:user:proton
X-Pm-Message-ID: f20e7bec206ef0b4f778bf80e001fa4845b9a58c
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

A CCI master can stop starting transfers after a target on its bus was
powered down and up again while the controller kept its clocks running.
The next transfer's queue then stays on its first command, neither
CCI_IRQ_STATUS_0 nor the queue's report status changes, and
cci_run_queue() times out after 100 ms ("master 1 queue 0 timeout").
Only the controller reset in that error path, or the controller's power
domain collapsing while it is runtime suspended, brings it back.

On the Lenovo Yoga Slim 7x (X1E80100) the OV02C10 front camera is
powered down whenever it stops streaming, and the unpowered sensor
holds SCL and SDA low: both read low at the TLMM pins with the internal
pull-ups enabled. The queue registers at the timeout show the stuck
first command (CUR_CMD 0x08010339, a write of 03 01 08) with the bus
timing registers intact and no error or halt interrupt before it.

cci_resume_runtime() only programs the interrupt mask and the bus timing
again, so a controller that was runtime suspended without its power
domain collapsing keeps the stuck state. With the camera's TITAN_TOP
GDSC held on and the controller suspended between camera starts, 3 of
40 starts failed this way; with a reset on resume, 0 of 40.

Reset the controller on every runtime resume, as the timeout path does.

Signed-off-by: Birk Skyum <birk.skyum@pm.me>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qco=
m-cci.c
index 76a5ded..51ce174 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -651,7 +651,20 @@ static int __maybe_unused cci_resume_runtime(struct de=
vice *dev)
 =09if (ret)
 =09=09return ret;
=20
-=09return cci_init(cci);
+=09/*
+=09 * A master can stop starting transfers after a target was powered
+=09 * down and up again while the controller ran, and keeps that state
+=09 * over a runtime suspend unless the power domain collapsed. Reset
+=09 * the controller, with the interrupt mask set first so that the
+=09 * reset-done interrupt also arrives after a power collapse.
+=09 */
+=09ret =3D cci_init(cci);
+=09if (!ret)
+=09=09ret =3D cci_reset(cci);
+=09if (ret)
+=09=09cci_disable_clocks(cci);
+
+=09return ret;
 }
=20
 static const struct dev_pm_ops qcom_cci_pm =3D {
--=20
2.53.0


