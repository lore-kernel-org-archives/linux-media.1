Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.2.68.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792584334;
	b=RwHQ6jm9Kx1mFxnn3LKIYu9Wi7DiF88miyO/Qi1YXc7UAiSwN1RAsgAdbBzP39iXwyy/
	 1GFynd4igxX3OPoMHz+j/FWsMUFkVrtPWot2ihY92QN07quNfCT72VVcZqxh33zoDenDq
	 Me2QhnY1r6irQVE6gwePfTEVWr8gUGITNIaV6HQsw6rtFjvTpyUW5vphcLQPLBwdiOE28
	 uEwxQNQUIX3nzUEzU2TY39bQpe1NnMi+mEBzlq59XdkyZgleuAuoka8o/uErzio/XNoLb
	 gmXYURBoL0y8SAGwyJHnctFu0ADiWwxbNJU0r+kdjrQOPiYL78U1ckdYfThSbC8ondw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792584334;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:References;
	bh=GYOCVrWKCcVPmhgR6wpgNdE0QkeuGJygng5tO7tV7dg=;
	b=IJjo9iQCMJH9UM9RCnIsUBEUEJXTUxIVVsDxLxRJfpE/jcw8iM99+R0U47N8NNznV8tt
	 XlppvKhB4rpp8RvDhzxXM2v+PINlfJArHrbWlj9VzLqtpjeec9p96FPI5s93PHNOzxq/2
	 JDE/lBXyCGj6fkWk3b1aarXPdVzQfBZBp8uMp2lUTGhCZ7OrpqUaKs+cWwcgF6J3fqFOB
	 F9T/BbwY6eQilRqzoDjwTSgqC3Cdqf4LSecta9pUeM4oOf6S/mAo2rdSQekMmJwgplY3L
	 UyIfXtfOlaVvsaaZC8QB9zxaLTiGAW+UeRQ2aL/6oidwBYlzwPqD6mc7M5nn5Kfzbuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=g0pJuDdh;
	arc=none smtp.remote-ip=34.2.68.31
Received: from sonic.asd.mail.yahoo.com (sonic-usea4-0032.asd.mail.yahoo.com [34.2.68.31])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F9C606A319
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 12:05:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47F9C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=g0pJuDdh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1792584333; bh=GYOCVrWKCcVPmhgR6wpgNdE0QkeuGJygng5tO7tV7dg=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=g0pJuDdhwIno9oP6qEJm34SgYrFKZ0Pbyc2kBJMGNRLfpABcoW1BC0HQIS6FdmPb1OvcJHbx/j5jEjpc1duEHKGEGiBRhwU0CoIj9hLRKyQUSbT0kL+0Qu6nE35cbjJXLPdL7B8zYTgRP1x/y3cJNM8oOrXL0ZY06DMqLUo/zsmo1/AOGyHaFT+nz/IrZgCwGEBv6TycP8iVgwogI3UMzEhtoIRQ1k/WunYWt1KPumZbDDryU9xcg8Ujl0iCUp9/NjYN4p31psmHnAkFlGCgcmb7vp3OL/23oVqdaUwitr0zXo2Ef1QGxy0tpXnVQXl9q+I5HcDz6iMtG+0ssTa1nw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1792584333; bh=VYFDewArvlXZ/3KAPuamklKJR4cKTHuc8kV0CAEBJOn=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=MUrkYK5Spmw/lJf+DPq9CpeXXY/etmsACv6YI4Yt4lWl76oBU9ygZ4YD7rQnCWa8ER4eh+7jUNUmgFI4Bi80cZibBnisBTrHOs4Q4EZhU73OAYArYZ8XdqAoQhQFJU5vls6bNIkse2QiG0zCg+2bmEb8KbOf5TWTyCT8wbqPMK8+qI58nZ7/J7X8hLCI4+8jipsdD29n9znLwa+cxAy8m8WH/vMH99R2Qyy3ACO8hnLFiggbXn16vgsQV5ox4FZzrdKv1PUqkEBWgv+fxhHA05lQxGz0WIIMYiNx2qqqixWJ2vI/nkfg74O3AUpm2lTj2rH22lyCpxzxYf+0gkJPtg==
X-YMail-OSG: wqtScOkVM1ljhTKA7FKY9z3S3PhqkhjUhPOMUj0gTbjnZ0HrY3vb7HwKneY4Ce6
 SXGfOQO2VhVVIASywGnfWgWcdkLS3QuPHBfAdwxKnN80t3e5fTMxZG7huZuy1H5xVqIipG.5wG4.
 L1bBA3U2xKvBeRYeoqA4pY.s63gveGt1xsm28sY99nq8MILDCL26To6Fx2aEJ5cQOwuYY.31VOlp
 rA34pTncwnldYgCRburclCkD0c1g9zVtb7Sxg77CvTYtwTm1NxM_qM.ablokKmWXXOAMi4kEY_Vi
 MoldDW23xKU7QO0Om.DR7bl.FcaTPrhYISIp7J5AngmhtCzAIzoRof48sgk1tJdrtL4QRn4penoj
 XsuWRzVkMo7cBrUtZxghmBcxl0yrbTMilTeOuLJA7rfUMI6k2X4GAZ.gJhOYSC_sxxiOe7oN0bAV
 fHfppdVzGoKNAGIuLTRO2RyeOUfh3j.pteG3i9b6UQs.BpI7qWZlesAAg8cggHXUWMDml6GRoFyd
 qG_ha8FJ9y6LOCn6QDgsrbwebfOSd6UkPDgoGzNeXYsX0X3pXN0YtyvNG.eka7uMYeegK2h3jcV9
 XiAOdaZNHTgkErc17yXw.MkNZpjNYj8dTMmTxCjJm9lIu_5w.sQ3.bOChr6xeK3mTdsF8x.CJ5w8
 CFwmdRu7wN4BD9P3reK3T8j0wAhQaz6hSsajXGKfnGAQrR0SM8cdRV7eL5uzcs8maMlK3X9dm8ZZ
 RqjEoUveXvXZMh4h4kkMuS9ctSueB3hQ6yQOffPKJFyPspn1Vepe0rF8Rs.StoJvQDcr9xoWf6Hy
 UFTemNFgWqRnr8izoIwHlkMOXIVf26.nM9CslQbByXDMzv5ScJ6DlWB73s78TOuenG7SkRUDPyQc
 xPispeEgHiu.YVcKbGaaDbyeLbi5wCFFUolVOnFg_fl9QtUvPAj9qws3_8fRoFcn7649.ltXesmw
 H.AHtMDug953ixx.s7q8mJ4j1s.fheemiajW7nwQ3ooWMHFhcN.OOoQVMGis10b5vqS7C98.wUlp
 7rqR38RKKiHclrX3Flhw8CtUo4bVBfzrWVLZUEcVjLvwo2NOI82ATXkVieRLTe7uNJxqhZmGQ6yn
 S0V5ikGvMAZmSIdGBRwMVuXifdBI2nDdAlzfkmgAJLPhL8Pr9dMLTCX8y8M5Fyo0uJM3j0c67dGp
 7y.Cz1BcCXtMh3PJPUnHd9CKHFKO3Xlc5FIMFnHBxhglug_tPngzKt6LzTrJohjAVMeW4yi77Cbw
 l1Dvf1f2X50.xJEbnoU.z98syUMGRmAAyPqdmAJYApCL0D5_o7zRAw.IoJ7C3fnldWl0LNN78GqS
 FMDpZFdD5YcjX1v07b7FWTybs1dfC9LK1AoZ7y2ldkzN507CISuCSWbbCm2BwaFzvCnd3Nf9Iaf2
 7fo8MzFRZoQi9UIO6rFyVXZv8v8qtMMAp4LqKeYUW_X_mJAURF1gq6WOHnMrYchxrrQoyHMMnmq1
 XnueQZ7wFhcmNRObIch0MVC8CVEm2POFdHsjpbJ6YmjmY38X3y85zHJ.UtK6iSxEsWhfdeGWJORc
 IIIqx5TIsnHmaFr3HlnkwyMnTNwO8ddMqFgwkLPL97_lZDwr.5x_kec40zBihDTTSWvs3LiZql.2
 6aIlSf3aKnMoV5jbB8s5PbXTuQgzVKwaFpiUb4qySQSB06feU.0Hd1qmq0YDE9l6r9VAJLZfhMs1
 UR_43n_TFtR8.7YS5DGosAJ5k4TGOsWZ2V8SET72FqgtQKcZA8ooXAyxJtDm5mOAz0do353VrVvc
 pT5KWD7drPn7SBwADe0bLjjC9dFkR8wrTVwfkK64mLSPMlAl55QzjceJA47kvXQIrL7uGGtcX3qW
 8tDGT.D0Wajh82uERMUw34cenYUQ5sJQ4yKjehS1s2FrR6Q6gzzwTPNOCg3jaGOOScdkYs0yH4b.
 rMM4PPNqySzhV6ja3sE8uE6Z1zOonY_UzakdElyEeTnbNaCSQxOiIo4qF1r0ctYiHeRqBISR3CkB
 yGTQvSOqSOyCjd3JbXXIJlETdwol.lKOrY.NhtWE-
X-Sonic-MF: <stealth3m@yahoo.com>
X-Sonic-ID: 95be4c3c-9d3f-4bb9-a7a2-167db8021e53
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-usea4-prod-sonicconsumer-svc-104 with HTTP; Wed, 21 Oct 2026 12:05:33 +0000
Received: from dip49.lsn.bf1.yahoo.com ([67.195.177.58])
          by hello (SMTP) with SMTP ID b65559d1d8d29b1b7d97e0ce6de8c5d1;
          Wed, 21 Oct 2026 12:05:28 +0000 (UTC)
From: Ext745 <stealth3m@yahoo.com>
To: linux-media@vger.kernel.org
Cc: isely@pobox.com,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	Ext745 <stealth3m@yahoo.com>
Subject: [PATCH] media: pvrusb2: don't touch the DVB frontend after leaving digital mode
Date: Wed, 21 Oct 2026 08:05:04 -0400
Message-ID: <20261021120504.1868432-1-stealth3m@yahoo.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20261021120504.1868432-1-stealth3m.ref@yahoo.com>

On hybrid pvrusb2 devices (e.g. the HVR-1950) the digital demodulator is
held in reset while the analog pathway is selected.  When a DVB
application closes the frontend, dvb_frontend_release() releases the bus
at once (ts_bus_ctrl(fe, 0)), but the frontend thread puts the tuner and
demod to sleep afterwards.  If an analog open switches the pathway in
between, the demod is already in reset and those I2C writes fail:

  s5h1411_writereg: writereg error 0x19 0xf5 0x0000, ret == -5)
  s5h1411_writereg: writereg error 0x19 0xf4 0x0001, ret == -5)

Wrap fe[0]'s sleep, i2c_gate_ctrl and tuner sleep so they do nothing
once the device has left digital mode: the demod needs nothing while in
reset, and the shared tuner then belongs to the analog side.  Mark the
pathway analog before the demod is put into reset so the window is
closed.

Tested on an HVR-1950 (751xx), kernel 7.0: ATSC close followed at once
by an analog open logged the errors 6/6 times before, 0/6 after; ATSC
lock (postBER 0) and analog/composite capture unchanged; repeated ATSC
open/close without analog unchanged.

Fixes: 62433e312076 ("V4L/DVB (7309): pvrusb2: Enhance core logic to also control digital streaming")
Assisted-by: Claude Opus 5.5
Signed-off-by: Ext745 <stealth3m@yahoo.com>
---
 drivers/media/usb/pvrusb2/pvrusb2-dvb.c | 64 +++++++++++++++++++++++++
 drivers/media/usb/pvrusb2/pvrusb2-dvb.h |  5 ++
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c |  8 ++++
 3 files changed, 77 insertions(+)

diff --git a/drivers/media/usb/pvrusb2/pvrusb2-dvb.c b/drivers/media/usb/pvrusb2/pvrusb2-dvb.c
index 721075989..0fcf5d045 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-dvb.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-dvb.c
@@ -238,6 +238,68 @@ static int pvr2_dvb_bus_ctrl(struct dvb_frontend *fe, int acquire)
 	    (acquire ? (1 << PVR2_CVAL_INPUT_DTV) : 0));
 }
 
+/*
+ * On a hybrid device the demodulator is held in reset (or powered off)
+ * while the analog pathway is selected.  When the frontend is closed,
+ * dvb-core releases the bus at once but puts the tuner and demod to sleep
+ * later from the frontend thread; if an analog open switches the pathway
+ * in between, those I2C writes fail (e.g. "s5h1411_writereg: writereg
+ * error ... ret == -5").  The demod needs nothing in that state and the
+ * tuner now belongs to the analog side, so skip them.
+ */
+static bool pvr2_dvb_fe_offline(struct dvb_frontend *fe)
+{
+	struct pvr2_dvb_adapter *adap = fe->dvb->priv;
+
+	return READ_ONCE(adap->channel.hdw->pathway_state) !=
+		PVR2_PATHWAY_DIGITAL;
+}
+
+static int pvr2_dvb_fe_sleep(struct dvb_frontend *fe)
+{
+	struct pvr2_dvb_adapter *adap = fe->dvb->priv;
+
+	if (pvr2_dvb_fe_offline(fe))
+		return 0;
+	return adap->fe_sleep(fe);
+}
+
+static int pvr2_dvb_fe_i2c_gate_ctrl(struct dvb_frontend *fe, int enable)
+{
+	struct pvr2_dvb_adapter *adap = fe->dvb->priv;
+
+	if (pvr2_dvb_fe_offline(fe))
+		return 0;
+	return adap->fe_i2c_gate_ctrl(fe, enable);
+}
+
+static int pvr2_dvb_fe_tuner_sleep(struct dvb_frontend *fe)
+{
+	struct pvr2_dvb_adapter *adap = fe->dvb->priv;
+
+	if (pvr2_dvb_fe_offline(fe))
+		return 0;
+	return adap->fe_tuner_sleep(fe);
+}
+
+static void pvr2_dvb_fe_wrap_ops(struct pvr2_dvb_adapter *adap)
+{
+	struct dvb_frontend *fe = adap->fe[0];
+
+	if (fe->ops.sleep) {
+		adap->fe_sleep = fe->ops.sleep;
+		fe->ops.sleep = pvr2_dvb_fe_sleep;
+	}
+	if (fe->ops.i2c_gate_ctrl) {
+		adap->fe_i2c_gate_ctrl = fe->ops.i2c_gate_ctrl;
+		fe->ops.i2c_gate_ctrl = pvr2_dvb_fe_i2c_gate_ctrl;
+	}
+	if (fe->ops.tuner_ops.sleep) {
+		adap->fe_tuner_sleep = fe->ops.tuner_ops.sleep;
+		fe->ops.tuner_ops.sleep = pvr2_dvb_fe_tuner_sleep;
+	}
+}
+
 static int pvr2_dvb_adapter_init(struct pvr2_dvb_adapter *adap)
 {
 	int ret;
@@ -381,6 +443,8 @@ static int pvr2_dvb_frontend_init(struct pvr2_dvb_adapter *adap)
 			   adap->fe[1]->id);
 		adap->fe[1]->ops.ts_bus_ctrl = pvr2_dvb_bus_ctrl;
 	}
+
+	pvr2_dvb_fe_wrap_ops(adap);
 done:
 	pvr2_channel_limit_inputs(&adap->channel, 0);
 	return ret;
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-dvb.h b/drivers/media/usb/pvrusb2/pvrusb2-dvb.h
index c0b27f521..c2c8d80c1 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-dvb.h
+++ b/drivers/media/usb/pvrusb2/pvrusb2-dvb.h
@@ -23,6 +23,11 @@ struct pvr2_dvb_adapter {
 	struct i2c_client	*i2c_client_demod[2];
 	struct i2c_client	*i2c_client_tuner;
 
+	/* fe[0] ops wrapped by pvr2_dvb_fe_*() */
+	int (*fe_sleep)(struct dvb_frontend *fe);
+	int (*fe_i2c_gate_ctrl)(struct dvb_frontend *fe, int enable);
+	int (*fe_tuner_sleep)(struct dvb_frontend *fe);
+
 	int			feedcount;
 	int			max_feed_count;
 
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
index c749ef7e4..a811f8232 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
@@ -4090,6 +4090,14 @@ static void pvr2_hdw_cmd_modeswitch(struct pvr2_hdw *hdw,int digitalFl)
 		return;
 	}
 
+	/*
+	 * Leaving digital mode: mark the demod offline before it goes into
+	 * reset, so the DVB frontend stops talking to it (see
+	 * pvr2_dvb_fe_offline()).
+	 */
+	if (cmode == PVR2_PATHWAY_ANALOG)
+		WRITE_ONCE(hdw->pathway_state, cmode);
+
 	switch (hdw->hdw_desc->digital_control_scheme) {
 	case PVR2_DIGITAL_SCHEME_HAUPPAUGE:
 		pvr2_hdw_cmd_hcw_demod_reset(hdw,digitalFl);
-- 
2.53.0

