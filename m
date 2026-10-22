Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.2.68.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792711074;
	b=p4j33RIghKahFdqk6M5yES37hN9xnH3FRTCtYy/Tf3oVILY+p2lFWQDs5l49uO6hTkP7
	 3jXl/01Dj/oPttfvanZrlGqe9dEa70tGp50RekCCRzGuicK2pbSv65qtRJP9bBpDLBDVw
	 zRlt691SZmr5cA2iFHfpe9ttIlOs28CygmSllkpG1SD/E1F99QhJAf5pyvma1S/4CW1YR
	 jKLzT4RAl8pXEUJ+OVjyZ/0fFyzko0fNJM2oCh6cu8gALpmBoFd7vpXRJp+aF0sYy3ZFX
	 trUbtXFJDCi+MTHdPxPU4I7CnUFJ83dBba+EGjQpayP2GkQ0Rz5/B0o8xudQ6LkzwPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792711074;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=maum4O/YFQ/2aDnOCwUAsbauqGVYh7EeHCJDbRwh8ds=;
	b=JCPuDzwrNYQOSdhw+v8tE7HTtGyPA3pGomLC7PEROa4mMifBUMEAkF4voQAYoJ54Zv2O
	 eEUhuQBdL90navVkcQrjsktqP9nrvYSNGYy694RXFXi8530gN7sSB88gysd++jhqhryPP
	 FxbRLlUKVv7XsBkssKo7oIgmMGrlt6RxTFLmitfdT9BEiZbTYaPrjaSSrap/SCMGQHhLR
	 +OTyDZyObfsY+0Wf6gJPfCk2YPpz6c6cTfUdydHcamJntopNMsxO4QnsBBcUMEZFt3kPd
	 ONJaeiMbnwiTCIsSVH85DuQLOimaCPnzB2xohc8+5jHmzAiArbDNVsDSDZiRx+/P5hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=ShrYULvE;
	arc=none smtp.remote-ip=34.2.68.31
Received: from sonic.asd.mail.yahoo.com (sonic-usea4-0032.asd.mail.yahoo.com [34.2.68.31])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6408A606A31A
	for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 23:17:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6408A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=ShrYULvE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1792711072; bh=maum4O/YFQ/2aDnOCwUAsbauqGVYh7EeHCJDbRwh8ds=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=ShrYULvEKzfe7DjXaxcpgZufByWVcKF7q2ows+XgMtJegn4sby4vJODiuQ3J+BpNwakfR/BPe8kk8N3AHsnpYQeJ1uJvQZN3pKRTU+hx8aT9d7X7HzLjer363RFsqrNxdeigj8uYekIYg3Kfsew3JoeR5c5QqAsuUfot9NoIpW4qsFVnCWIJwLb9xZGHeygZzR18pU8KgTooDLDrvElFKibN48aBaLqFUlxsQ+3ltU695DxC2MtROyUiVPWfht8BiA1eKAkoQUhmHN1GBQN5W+rt1woA1whhHCvY3RAFFeW8fvpPof6t/79ti6/9cMuFQx3vVxX9HEyzt7QVHPncFg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1792711072; bh=+YsklB4WvwXcsOdo2XzxvB5ATl7DgRdyBuQRkoSxx8H=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=I/WUoJ1kduC9j13veyU6eDRUz2g4RU+3f1XwxLc8RQBWVOZFslEOJBGmbkR7I9yVYh8Uf6HuSzPTGkbtTQe1Xtf9PGvuyTKWZ6XnsHNQbeCHKint1XLBWGSqmgq1Aa5yWV+SNyHRRVXg+eAAH4Ptw19BTG3SBMQvyxaIgRxmlcKvhktdcEuS/CX0sZU1cya+Y6wpB9GDKS/4v1rCCioJBJiJBUAgFOhzAqYSO/boEzW5mtCSkyS5ziwYM1VPoE6M3SAUpXfI2Oidodgj/bAnEhT02M0SKYsN2kJs8MTKgEIJvVlvLDoqa7Yy+H5rFnezfMVUZ5Qv7qAkcxyFJznDbw==
X-YMail-OSG: uLlAg5MVM1mEZ32jJpMCCoiglIFLjcZilgPX.SjQdt7.f9scgZlnBmkKiyNytP2
 JBg6oMaIWWb2s_nfys42IKwPXmSiKjMaHtGcs3FRpkDqfmIfzs6TaswxEd0y._CdlZbMssk5bP7S
 hM26n6Fv.qzZOkITrMSuopw2O6t8u8kvtYEEn5IHDTNIu7IrJpokGAncrIWm__JQdtFVua1PgE9y
 rJ7WrruesbEhHbl9ByagssQnQJbYliiAJYljYktwCuOSEW9m_TEmstb3aR7UdOW1ZAIblN7AQ9HQ
 jXLGcnEZAaYLRsG1WJLsfpE6a9cn5Iy0NMy3M6TsqQimdTpcXVSQupgzi2XBg9O.gWbkdQI35Jdo
 .U8EGSbAQryQcMgKY_LV7cIXnYuIe4hyErkE35lIMK8wexE8bnk4Ax0XcKBnBZvcKrQAeNxs5mA9
 yggvj5k3TlkjJaVESAh4qsdR4vEb0XDvVUY5zhzwV0cVbtbXP6grofNEaLv8hvtnMNOW.HxXPSVd
 vKj_y_BsdoqBF87LFE52vZmNGUOV.88jM4EQbk66KoQuxM8nirQQn3HIPTu7nUXVndEd_kNVRxu8
 kyGyuWk6FeEDppQwVEFg8i71ZA0v1gnOD99JCHZq4Sj7CC8foOWQ9cpgdyqxdeTJMjHws8rod2gI
 i5etQTicr1PpL1yI2BHVUa3B302NdJey56oem1_SRjffNsGn5YOyP.i_s_9GecXOhkXFdv8xULIL
 9Q8FDur7GHmV.mXYvzWqUfBGAIMspkW3ZHHWv12cjMuoz7Lb0zkpM_jkvQdA3UUrUr7hUWp8CChl
 mBLFnoyAxdwFR.qL8tid8CAoL9tBtXT5265G7hKViz8J9A6VdV2qnAScYCcHm3spYgZ0CHQkLklY
 7m5V8KIchGm1XirfvUoO2bUKUO9QY9.4yfqDy.Y33b07Rrpx8_8tQH04zlTAaLA45r9KwvZ.rKC8
 Pf0RizDkPmK4SqWNUe3pSRXAwgZJg3xvzlW0Y38_LdffKryfgqayhVb2knFZzkHdkDETSmWTByha
 IGxASH0vAGAUUu2ZkoVANREKL7eYqcKBlTdCDKBkq14Rc5YHfgpOna2giU59qNwmb9XjGCR_djgB
 x_FwKxAzzq7GtTRc2XIPN0m6ZTLZn3OyKDwwockhuoqkHvyFFTtdxzqr51A.GUUg0sdYRfjUuNb7
 l.rZcGJF3fmMx5ByR3EqLIgP2MYvZ3F4PkiBFV2o46fHmF92jh5rxwPT_u8sQZH7EeYH.Zqsf9Rq
 Sk_TRmDVSQoHsX5qsCFv3DJoHx_kGLUGt_f9sACNLJPuI24PBc1bjhvHHa8PG1xtecaIFFPv4uMu
 IFGdlwJPgovvdTH7KG39lwtBq1iOhXJ_szvP_1LQNL41OFeBA6xLqdBjFi6NdJSEuqNUzriGmYIP
 kbcPu6.zDDSA_Dk37sLWk6S5gPRX_bJh.3aEJ3lVqk1387w5_Z8Z6Yuzgsf98ZVg90vpumYYbYMO
 evEzgS61tW25cso0cAfAsxB7lB1EasU1UGcBo4OvJf728CDZLb_izI23J1OJps3oJCXhmuwNIkm.
 0Hq33w7y7htl97PFLLsuEtFp4d4KQnlb6A6D4mco5SILSLqQkKOYtpKGWHVtB5LdSRK7RSyvwjXE
 LAI2NkUrcVOOmuQYnQyIMMISjasQqhTVNZ1d2zfjBK6PjytiD7_UytHfEUZSHq_0NMKBaqAfOVy2
 LzKmw1myeTG8eJuQGwm75ieGs34RUesGhQ7f.K7jJOBXyHfTmpxY5mIEKh.fTdnexifEu_3eG63O
 4sACilX7b0KRIRgrWBio5X.4lAEtJm_0anEF5ag_JMC2QnQrwJ_oayPPlPpYfE7NoHiBOyulmPQO
 7Ot1DJKOlsO2Ld5usdV9_Qdm61z_9lBLzMtu1T3zG3XEwBr4T9wbILBMTofbFommbcdFnu7g04kI
 qCwtLZKfYbSWJngaEkUOxd1qB7sepQMG7JwGIIUb_F7t7fmDTinRM4TvchxxXNcaVqYrXVw4i80W
 dwavM97OBdZ4C8YdRDQ--
X-Sonic-MF: <stealth3m@yahoo.com>
X-Sonic-ID: 01a26e7e-3a95-411d-9adf-3e24e7bfc485
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-usea4-prod-sonicconsumer-svc-102 with HTTP; Thu, 22 Oct 2026 23:17:52 +0000
Received: from dip33.lsn.bf1.yahoo.com ([67.195.177.42])
          by hello (SMTP) with SMTP ID 3929f4de24b4946555b6450106bd75fd;
          Thu, 22 Oct 2026 23:17:51 +0000 (UTC)
From: Ext745 <stealth3m@yahoo.com>
To: linux-media@vger.kernel.org
Cc: isely@pobox.com,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	Ext745 <stealth3m@yahoo.com>
Subject: [PATCH v2] media: pvrusb2: don't touch the DVB frontend after leaving digital mode
Date: Thu, 22 Oct 2026 19:17:28 -0400
Message-ID: <20261022231728.517427-1-stealth3m@yahoo.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261021120504.1868432-1-stealth3m@yahoo.com>
References: <20261021120504.1868432-1-stealth3m@yahoo.com>
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

On the HVR-1900 and HVR-1950 the digital demodulator is held in reset
while the analog pathway is selected.  When a DVB application closes the
frontend, dvb_frontend_release() releases the bus at once
(ts_bus_ctrl(fe, 0)), but the frontend thread puts the tuner and demod to
sleep afterwards.  If an analog open switches the pathway in between, the
demod is already in reset and those I2C writes fail:

  s5h1411_writereg: writereg error 0x19 0xf5 0x0000, ret == -5)
  s5h1411_writereg: writereg error 0x19 0xf4 0x0001, ret == -5)

On these devices, wrap fe[0]'s sleep, i2c_gate_ctrl and tuner sleep so
they do nothing once the device has left digital mode: the demod needs
nothing while in reset, and the shared tuner then belongs to the analog
side.  The pathway check and the call are made under big_lock, which
pvr2_hdw_cmd_modeswitch() runs under, so the demod can't be put into
reset while a wrapped op is running.

The HVR-1955 and HVR-1975 (160xxx) are left alone: their demod is not
reset in analog mode, so their sleep ops, which tristate the lgdt3306a
TS outputs and stop the si2157 statistics work, must still run.

Tested on an HVR-1950 (751xx), kernel 7.0: ATSC close followed at once
by an analog open logged the errors 6/6 times before, 0/6 after; ATSC
lock (postBER 0) and analog/composite capture unchanged; repeated ATSC
open/close without analog unchanged.

Fixes: 62433e312076 ("V4L/DVB (7309): pvrusb2: Enhance core logic to also control digital streaming")
Assisted-by: Claude Opus 5.5
Signed-off-by: Ext745 <stealth3m@yahoo.com>
---
Changes in v2 (from the Sashiko review of v1):
- Only wrap the ops on devices whose demod really is held in reset in
  analog mode (Hauppauge digital scheme, not 160xxx).  The HVR-1955/1975
  only toggle the demod sleep pin, so their sleep ops (lgdt3306a TS
  tristate, si2157 stat_work cancel) must keep running.  This also
  leaves fe[1], which only the HVR-1975 has, untouched.
- Make the pathway check and the wrapped call under big_lock, which
  pvr2_hdw_cmd_modeswitch() runs under, instead of a lockless check; the
  early WRITE_ONCE() of pathway_state in pvr2_hdw_cmd_modeswitch() is no
  longer needed and is dropped.  i2c_gate_ctrl called back from inside a
  wrapped tuner sleep (tda18271) is let through via fe_lock_owner.
- Wrap sleep/i2c_gate_ctrl before dvb_register_frontend(), and tuner
  sleep right after tuner_attach, instead of at the end of
  pvr2_dvb_frontend_init().
- Factor the 160xxx USB ID check out of pvr2_hdw_cmd_hcw_demod_reset().
- Retested on the HVR-1950 (751xx) as for v1.  The HVR-1955/1975 path
  is untested, as I don't have either card.
- Link to v1: https://lore.kernel.org/r/20261021120504.1868432-1-stealth3m@yahoo.com

 drivers/media/usb/pvrusb2/pvrusb2-dvb.c | 94 +++++++++++++++++++++++++
 drivers/media/usb/pvrusb2/pvrusb2-dvb.h |  6 ++
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c | 18 ++++-
 drivers/media/usb/pvrusb2/pvrusb2-hdw.h |  3 +
 4 files changed, 118 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/pvrusb2/pvrusb2-dvb.c b/drivers/media/usb/pvrusb2/pvrusb2-dvb.c
index 721075989..a1d1e451c 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-dvb.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-dvb.c
@@ -238,6 +238,98 @@ static int pvr2_dvb_bus_ctrl(struct dvb_frontend *fe, int acquire)
 	    (acquire ? (1 << PVR2_CVAL_INPUT_DTV) : 0));
 }
 
+/*
+ * On some hybrid devices (e.g. the HVR-1950) the demodulator is held in
+ * reset while the analog pathway is selected.  When the frontend is
+ * closed, dvb-core releases the bus at once but puts the tuner and demod
+ * to sleep later from the frontend thread; if an analog open switches the
+ * pathway in between, those I2C writes fail (e.g. "s5h1411_writereg:
+ * writereg error ... ret == -5").  The demod needs nothing in that state
+ * and the tuner now belongs to the analog side, so skip them.
+ *
+ * The check and the call are made under big_lock, which
+ * pvr2_hdw_cmd_modeswitch() runs under, so the pathway can't change in
+ * between.  A tuner sleep calls back into i2c_gate_ctrl with the lock
+ * already held; fe_lock_owner lets that nested call through.
+ */
+static int pvr2_dvb_fe_call(struct dvb_frontend *fe,
+			    int (*op)(struct dvb_frontend *fe))
+{
+	struct pvr2_dvb_adapter *adap = fe->dvb->priv;
+	struct pvr2_hdw *hdw = adap->channel.hdw;
+	int ret = 0;
+
+	LOCK_TAKE(hdw->big_lock);
+	if (hdw->pathway_state == PVR2_PATHWAY_DIGITAL) {
+		WRITE_ONCE(adap->fe_lock_owner, current);
+		ret = op(fe);
+		WRITE_ONCE(adap->fe_lock_owner, NULL);
+	}
+	LOCK_GIVE(hdw->big_lock);
+	return ret;
+}
+
+static int pvr2_dvb_fe_sleep(struct dvb_frontend *fe)
+{
+	struct pvr2_dvb_adapter *adap = fe->dvb->priv;
+
+	return pvr2_dvb_fe_call(fe, adap->fe_sleep);
+}
+
+static int pvr2_dvb_fe_tuner_sleep(struct dvb_frontend *fe)
+{
+	struct pvr2_dvb_adapter *adap = fe->dvb->priv;
+
+	return pvr2_dvb_fe_call(fe, adap->fe_tuner_sleep);
+}
+
+static int pvr2_dvb_fe_i2c_gate_ctrl(struct dvb_frontend *fe, int enable)
+{
+	struct pvr2_dvb_adapter *adap = fe->dvb->priv;
+	struct pvr2_hdw *hdw = adap->channel.hdw;
+	int ret = 0;
+
+	/* Nested in pvr2_dvb_fe_call(): already checked, lock held */
+	if (READ_ONCE(adap->fe_lock_owner) == current)
+		return adap->fe_i2c_gate_ctrl(fe, enable);
+
+	LOCK_TAKE(hdw->big_lock);
+	if (hdw->pathway_state == PVR2_PATHWAY_DIGITAL)
+		ret = adap->fe_i2c_gate_ctrl(fe, enable);
+	LOCK_GIVE(hdw->big_lock);
+	return ret;
+}
+
+/* Called before fe[0] is registered */
+static void pvr2_dvb_fe_wrap_ops(struct pvr2_dvb_adapter *adap)
+{
+	struct dvb_frontend *fe = adap->fe[0];
+
+	if (!pvr2_hdw_demod_reset_in_analog(adap->channel.hdw))
+		return;
+	if (fe->ops.sleep) {
+		adap->fe_sleep = fe->ops.sleep;
+		fe->ops.sleep = pvr2_dvb_fe_sleep;
+	}
+	if (fe->ops.i2c_gate_ctrl) {
+		adap->fe_i2c_gate_ctrl = fe->ops.i2c_gate_ctrl;
+		fe->ops.i2c_gate_ctrl = pvr2_dvb_fe_i2c_gate_ctrl;
+	}
+}
+
+/* Called once the tuner is attached to fe[0] */
+static void pvr2_dvb_fe_wrap_tuner_ops(struct pvr2_dvb_adapter *adap)
+{
+	struct dvb_frontend *fe = adap->fe[0];
+
+	if (!pvr2_hdw_demod_reset_in_analog(adap->channel.hdw))
+		return;
+	if (fe->ops.tuner_ops.sleep) {
+		adap->fe_tuner_sleep = fe->ops.tuner_ops.sleep;
+		fe->ops.tuner_ops.sleep = pvr2_dvb_fe_tuner_sleep;
+	}
+}
+
 static int pvr2_dvb_adapter_init(struct pvr2_dvb_adapter *adap)
 {
 	int ret;
@@ -333,6 +425,7 @@ static int pvr2_dvb_frontend_init(struct pvr2_dvb_adapter *adap)
 	}
 
 	if (dvb_props->frontend_attach(adap) == 0 && adap->fe[0]) {
+		pvr2_dvb_fe_wrap_ops(adap);
 		if (dvb_register_frontend(&adap->dvb_adap, adap->fe[0])) {
 			pvr2_trace(PVR2_TRACE_ERROR_LEGS,
 				   "frontend registration failed!");
@@ -357,6 +450,7 @@ static int pvr2_dvb_frontend_init(struct pvr2_dvb_adapter *adap)
 		ret = -ENODEV;
 		goto fail_tuner;
 	}
+	pvr2_dvb_fe_wrap_tuner_ops(adap);
 
 	if (adap->fe[1]) {
 		adap->fe[1]->id = 1;
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-dvb.h b/drivers/media/usb/pvrusb2/pvrusb2-dvb.h
index c0b27f521..a997c8893 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-dvb.h
+++ b/drivers/media/usb/pvrusb2/pvrusb2-dvb.h
@@ -23,6 +23,12 @@ struct pvr2_dvb_adapter {
 	struct i2c_client	*i2c_client_demod[2];
 	struct i2c_client	*i2c_client_tuner;
 
+	/* fe[0] ops wrapped by pvr2_dvb_fe_*() */
+	int (*fe_sleep)(struct dvb_frontend *fe);
+	int (*fe_i2c_gate_ctrl)(struct dvb_frontend *fe, int enable);
+	int (*fe_tuner_sleep)(struct dvb_frontend *fe);
+	struct task_struct	*fe_lock_owner;
+
 	int			feedcount;
 	int			max_feed_count;
 
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
index c749ef7e4..5e34c0148 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
@@ -4037,14 +4037,26 @@ int pvr2_hdw_cmd_decoder_reset(struct pvr2_hdw *hdw)
 }
 
 
+static int pvr2_hdw_is_hcw_160xxx(struct pvr2_hdw *hdw)
+{
+	return le16_to_cpu(hdw->usb_dev->descriptor.idVendor) == 0x2040 &&
+	       (le16_to_cpu(hdw->usb_dev->descriptor.idProduct) == 0x7502 ||
+		le16_to_cpu(hdw->usb_dev->descriptor.idProduct) == 0x7510);
+}
+
+/* Nonzero if the demod is held in reset while in analog mode */
+int pvr2_hdw_demod_reset_in_analog(struct pvr2_hdw *hdw)
+{
+	return hdw->hdw_desc->digital_control_scheme ==
+		PVR2_DIGITAL_SCHEME_HAUPPAUGE && !pvr2_hdw_is_hcw_160xxx(hdw);
+}
+
 static int pvr2_hdw_cmd_hcw_demod_reset(struct pvr2_hdw *hdw, int onoff)
 {
 	hdw->flag_ok = !0;
 
 	/* Use this for Hauppauge 160xxx only */
-	if (le16_to_cpu(hdw->usb_dev->descriptor.idVendor) == 0x2040 &&
-	    (le16_to_cpu(hdw->usb_dev->descriptor.idProduct) == 0x7502 ||
-	     le16_to_cpu(hdw->usb_dev->descriptor.idProduct) == 0x7510)) {
+	if (pvr2_hdw_is_hcw_160xxx(hdw)) {
 		pr_debug("%s(): resetting demod on Hauppauge 160xxx platform skipped\n",
 			 __func__);
 		/* Can't reset 160xxx or it will trash Demod tristate */
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.h b/drivers/media/usb/pvrusb2/pvrusb2-hdw.h
index 860f0a6b0..09f05ab77 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.h
+++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.h
@@ -165,6 +165,9 @@ int pvr2_hdw_set_input_allowed(struct pvr2_hdw *,
 			       unsigned int change_mask,
 			       unsigned int change_val);
 
+/* Nonzero if the digital demod is held in reset while in analog mode */
+int pvr2_hdw_demod_reset_in_analog(struct pvr2_hdw *hdw);
+
 /* Return name for this driver instance */
 const char *pvr2_hdw_get_driver_name(struct pvr2_hdw *);
 
-- 
2.53.0

