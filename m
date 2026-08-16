Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250E03D9526
	for <linux-media@vger.kernel.org>; Sun, 16 Aug 2026 07:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786864160; cv=none; b=Dfeqlttp2BdsgDlIqTpl3iBd2FVQSxRzvT+CA8dxnHtuWzu684H0D3YZpBFcIyhidvBnSBFSW8wGqZemaXEhE7fl6PvItK4sHKaZusJh7Pdx8I5uVOoYfLQro7y2qNhM+09rGmPtz/y+i3GApmFe0rLmwdiKCssbPDmNYT4QvEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786864160; c=relaxed/simple;
	bh=BdBvbhq2Twc997+q969FZrwjfwtQOhZcAyOwyuhPrp8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=djFdiN+fETQnFbHRh+GamPmNN9DPkHGSPb9Csp9wdeK4ccE+O/ojdgCLsTbdPO1WA1EYWJQRzg1roU9abJJ/6lfIgBv83OfHj/QmszD7wxNZBCFLyNfSGg13vqC5n7UHnBJrYEyDlzo3muEhS8Mj/VHg6Ia8f2D4+1/bhaFd49k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TrKz0MF+; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TrKz0MF+"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cbee3777e1cso1265934a12.3
        for <linux-media@vger.kernel.org>; Sun, 16 Aug 2026 00:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786864158; x=1787468958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=arZMRBP8hmya3zuBV6GZjhYaf70eJcG3NfnFA1nrqR8=;
        b=TrKz0MF+li0pyfIpG/GJzd8mzp3PLGc8t9pk3zoOfbgnR4pmM05CopnPvIFOlx2oq4
         GCfXvCRzZHGGJrM4kbhIV4BgnHX67MtLCiyT6AltBwUratD31o+S/zF9axgpN9hEmYxX
         PZ5vFUSukzukezJz+DtV0tzg4TlobDyxnFdgLmLHzhhm4H0M0JoMh+A6Lds+HFojYlpl
         vKiX2YQIy0OOI5l+XQYmMShPaTSJBHucl6utYoK3pI3PcU5LEpOYwKhif2WeSFpHGJ08
         E0jncQdRLVC7zHFhDdSBAO/z/AQioECxwOAc/jqO8hltHwT6nRKk1NDeDfZVBRQFBteu
         f2cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786864158; x=1787468958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=arZMRBP8hmya3zuBV6GZjhYaf70eJcG3NfnFA1nrqR8=;
        b=AB3eKT7zg8eL5P8gc1M/4OYcBs5W+w9bM41SfOU5+YpPvFuxRRMgeKZ3+aWKn+5LP3
         x3g7i1aIcleedYR4He/v6DesGkf/m/cMSvYxA4XhU+BWAU50iVFUD0kCt8dEHp0xdywN
         VziPUjb5cBwqAVwZ1imMM4b7PceZU5USjaYW6/M4ucdcgcUOWSznvT5c1kpBv8gJNfw2
         CepgoHzJizm3f+KCW6uEbL5BHcxhIROcGNUd2F0Od8swQk4Enu123p3dJ5v8c8Vyb8QL
         /OpGXPUMkAJuFG+eIqSP4oYDdQ8F55POXa3Yo8DkYMJZANOVvGEyllubTxH+DZf3wFBW
         P4zg==
X-Forwarded-Encrypted: i=1; AHgh+Rr/8rRVcmGio5OTLIeiOtmNiynII25CyBReGLCtqpx5RgE6ZJ1zp96RvpsW+1etOysShH9Q3G/TasnLQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEMVirOSk7b+Zw24BQp1+J5ZTH0Pu+eDnXb4nM8jxt9UWRYJi0
	iQFs7VGUf8VHQzAaoPAmOlevWtkxo4+5FBC8U0zVfdBznpw+29ov8gt9
X-Gm-Gg: AR+sD1155ZZJucfZb4LHy6AIfIXLQzva/zz52bck///GSNj0YFrj1wh0/WTEtyqIGlA
	rrmBU92JXHjkfjOyI9JqOaqati6K8XCJTQjkrD4eeztxHjnTNvgmPl3720VzMPMAbrG943iMljk
	xQfWfbmqmR/rDBUE/T+JsbQsXz0FMxHNNcZlPQpWYvY0gDa6XqXRIUZBRBWtUF73kHeCmOQNKRq
	Fj/iNmnvSYsK884efNmc2kXNnryTq91hTlnZoLp0ILLQVZ4+yoTonErHZHRMaN7z0x6cfQWU8QP
	4Dkauzwky9F6++EuTpWkd7eqprUHtME5FLhWJCju6v23IyIMv8wLgPz3b+LHwKaej2QvVqGCMTm
	AZkjWypeC7srVRvIGIr1XyJ+Z2nvOubX84NK4nRCkjcWPe4qG4Y+Y0u73EGztc+Ye/9VVjciBYu
	KuMSJ5i6Igbd6uD46e0e1enJIiwfnWzcfDFun49+r0VNABRxlEnHKVrOI3vykX2spG+9LF1FSw1
	KArCEXQ/c+qIPTxKYrX9w+6
X-Received: by 2002:a05:6a20:3ca1:b0:3c8:e313:8d42 with SMTP id adf61e73a8af0-3cc71d3eae1mr19621970637.31.1786864158197;
        Sun, 16 Aug 2026 00:09:18 -0700 (PDT)
Received: from OMEN ([103.148.21.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm30296302c88.2.2026.08.16.00.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 00:09:16 -0700 (PDT)
From: George Emmanuel Thomas <georgeemmanuelthomas@gmail.com>
To: mchehab@kernel.org
Cc: kees@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	George Emmanuel Thomas <georgeemmanuelthomas@gmail.com>
Subject: [PATCH] media: ttusb-dec: validate command response length
Date: Sun, 16 Aug 2026 12:38:44 +0530
Message-ID: <20260816070844.252438-1-georgeemmanuelthomas@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ttusb_dec_send_command() uses a length supplied by the USB device to
copy command response data without validating it against the amount of
data actually received. A malformed device can therefore cause an
out-of-bounds read from the response buffer.

The helper also does not know the size of the caller-provided response
buffer. This can cause an out-of-bounds write when the device reports a
response larger than the destination buffer.

Pass the destination buffer size to ttusb_dec_send_command() and reject
responses whose payload exceeds either the received data or the
destination buffer.

Signed-off-by: George Emmanuel Thomas <georgeemmanuelthomas@gmail.com>
---
 drivers/media/usb/ttusb-dec/ttusb_dec.c  | 42 ++++++++++++++++--------
 drivers/media/usb/ttusb-dec/ttusbdecfe.c |  9 ++---
 drivers/media/usb/ttusb-dec/ttusbdecfe.h |  3 +-
 3 files changed, 36 insertions(+), 18 deletions(-)

diff --git a/drivers/media/usb/ttusb-dec/ttusb_dec.c b/drivers/media/usb/ttusb-dec/ttusb_dec.c
index 825a3875989d..2701e9275724 100644
--- a/drivers/media/usb/ttusb-dec/ttusb_dec.c
+++ b/drivers/media/usb/ttusb-dec/ttusb_dec.c
@@ -314,7 +314,8 @@ static u16 crc16(u16 crc, const u8 *buf, size_t len)
 
 static int ttusb_dec_send_command(struct ttusb_dec *dec, const u8 command,
 				  int param_length, const u8 params[],
-				  int *result_length, u8 cmd_result[])
+				  int *result_length, u8 cmd_result[],
+				  size_t cmd_result_size)
 {
 	int result, actual_len;
 	u8 *b;
@@ -366,6 +367,15 @@ static int ttusb_dec_send_command(struct ttusb_dec *dec, const u8 command,
 			       __func__, actual_len, b);
 		}
 
+		if (actual_len < 4 || b[3] > actual_len - 4) {
+			result = -EIO;
+			goto err_mutex_unlock;
+		}
+
+		if (cmd_result && b[3] > cmd_result_size) {
+			result = -EIO;
+			goto err_mutex_unlock;
+		}
 		if (result_length)
 			*result_length = b[3];
 		if (cmd_result && b[3] > 0)
@@ -389,7 +399,8 @@ static int ttusb_dec_get_stb_state (struct ttusb_dec *dec, unsigned int *mode,
 
 	dprintk("%s\n", __func__);
 
-	result = ttusb_dec_send_command(dec, 0x08, 0, NULL, &c_length, c);
+	result = ttusb_dec_send_command(dec, 0x08, 0, NULL, &c_length, c,
+					sizeof(c));
 	if (result)
 		return result;
 
@@ -448,7 +459,7 @@ static void ttusb_dec_set_pids(struct ttusb_dec *dec)
 	memcpy(&b[2], &audio, 2);
 	memcpy(&b[4], &video, 2);
 
-	ttusb_dec_send_command(dec, 0x50, sizeof(b), b, NULL, NULL);
+	ttusb_dec_send_command(dec, 0x50, sizeof(b), b, NULL, NULL, 0);
 
 	dvb_filter_pes2ts_init(&dec->a_pes2ts, dec->pid[DMX_PES_AUDIO],
 			       ttusb_dec_audio_pes2ts_cb, dec);
@@ -902,7 +913,7 @@ static int ttusb_dec_set_interface(struct ttusb_dec *dec,
 			break;
 		case TTUSB_DEC_INTERFACE_IN:
 			result = ttusb_dec_send_command(dec, 0x80, sizeof(b),
-							b, NULL, NULL);
+							b, NULL, NULL, 0);
 			if (result)
 				return result;
 			result = usb_set_interface(dec->udev, 0, 8);
@@ -1021,7 +1032,8 @@ static int ttusb_dec_start_ts_feed(struct dvb_demux_feed *dvbdmxfeed)
 
 	}
 
-	result = ttusb_dec_send_command(dec, 0x80, sizeof(b0), b0, NULL, NULL);
+	result = ttusb_dec_send_command(dec, 0x80, sizeof(b0), b0,
+					NULL, NULL, 0);
 	if (result)
 		return result;
 
@@ -1056,7 +1068,7 @@ static int ttusb_dec_start_sec_feed(struct dvb_demux_feed *dvbdmxfeed)
 	memcpy(&b0[5], &dvbdmxfeed->filter->filter.filter_value[0], 1);
 
 	result = ttusb_dec_send_command(dec, 0x60, sizeof(b0), b0,
-					&c_length, c);
+					&c_length, c, sizeof(c));
 
 	if (!result) {
 		if (c_length == 2) {
@@ -1114,7 +1126,7 @@ static int ttusb_dec_stop_ts_feed(struct dvb_demux_feed *dvbdmxfeed)
 	struct ttusb_dec *dec = dvbdmxfeed->demux->priv;
 	u8 b0[] = { 0x00 };
 
-	ttusb_dec_send_command(dec, 0x81, sizeof(b0), b0, NULL, NULL);
+	ttusb_dec_send_command(dec, 0x81, sizeof(b0), b0, NULL, NULL, 0);
 
 	dec->pva_stream_count--;
 
@@ -1135,7 +1147,7 @@ static int ttusb_dec_stop_sec_feed(struct dvb_demux_feed *dvbdmxfeed)
 	list_del(&finfo->filter_info_list);
 	spin_unlock_irqrestore(&dec->filter_info_list_lock, flags);
 	kfree(finfo);
-	ttusb_dec_send_command(dec, 0x62, sizeof(b0), b0, NULL, NULL);
+	ttusb_dec_send_command(dec, 0x62, sizeof(b0), b0, NULL, NULL, 0);
 
 	dec->filter_stream_count--;
 
@@ -1238,7 +1250,7 @@ static int ttusb_init_rc( struct ttusb_dec *dec)
 	if (usb_submit_urb(dec->irq_urb, GFP_KERNEL))
 		printk("%s: usb_submit_urb failed\n",__func__);
 	/* enable irq pipe */
-	ttusb_dec_send_command(dec,0xb0,sizeof(b),b,NULL,NULL);
+	ttusb_dec_send_command(dec, 0xb0, sizeof(b), b, NULL, NULL, 0);
 
 	return 0;
 }
@@ -1354,7 +1366,8 @@ static int ttusb_dec_boot_dsp(struct ttusb_dec *dec)
 	firmware_csum_ns = htons(firmware_csum);
 	memcpy(&b0[6], &firmware_csum_ns, 2);
 
-	result = ttusb_dec_send_command(dec, 0x41, sizeof(b0), b0, NULL, NULL);
+	result = ttusb_dec_send_command(dec, 0x41, sizeof(b0), b0,
+					NULL, NULL, 0);
 
 	if (result) {
 		release_firmware(fw_entry);
@@ -1395,7 +1408,8 @@ static int ttusb_dec_boot_dsp(struct ttusb_dec *dec)
 		}
 	}
 
-	result = ttusb_dec_send_command(dec, 0x43, sizeof(b1), b1, NULL, NULL);
+	result = ttusb_dec_send_command(dec, 0x43, sizeof(b1), b1,
+					NULL, NULL, 0);
 
 	release_firmware(fw_entry);
 	kfree(b);
@@ -1621,10 +1635,12 @@ static void ttusb_dec_exit_filters(struct ttusb_dec *dec)
 
 static int fe_send_command(struct dvb_frontend* fe, const u8 command,
 			   int param_length, const u8 params[],
-			   int *result_length, u8 cmd_result[])
+			   int *result_length, u8 cmd_result[],
+			   size_t cmd_result_size)
 {
 	struct ttusb_dec* dec = fe->dvb->priv;
-	return ttusb_dec_send_command(dec, command, param_length, params, result_length, cmd_result);
+	return ttusb_dec_send_command(dec, command, param_length, params,
+				      result_length, cmd_result, cmd_result_size);
 }
 
 static const struct ttusbdecfe_config fe_config = {
diff --git a/drivers/media/usb/ttusb-dec/ttusbdecfe.c b/drivers/media/usb/ttusb-dec/ttusbdecfe.c
index 215221370c19..1c2892a1e268 100644
--- a/drivers/media/usb/ttusb-dec/ttusbdecfe.c
+++ b/drivers/media/usb/ttusb-dec/ttusbdecfe.c
@@ -44,7 +44,8 @@ static int ttusbdecfe_dvbt_read_status(struct dvb_frontend *fe,
 
 	*status=0;
 
-	ret=state->config->send_command(fe, 0x73, sizeof(b), b, &len, result);
+	ret = state->config->send_command(fe, 0x73, sizeof(b), b, &len,
+					  result, sizeof(result));
 	if(ret)
 		return ret;
 
@@ -85,7 +86,7 @@ static int ttusbdecfe_dvbt_set_frontend(struct dvb_frontend *fe)
 
 	__be32 freq = htonl(p->frequency / 1000);
 	memcpy(&b[4], &freq, sizeof (u32));
-	state->config->send_command(fe, 0x71, sizeof(b), b, NULL, NULL);
+	state->config->send_command(fe, 0x71, sizeof(b), b, NULL, NULL, 0);
 
 	return 0;
 }
@@ -130,7 +131,7 @@ static int ttusbdecfe_dvbs_set_frontend(struct dvb_frontend *fe)
 	lnb_voltage = htonl(state->voltage);
 	memcpy(&b[28], &lnb_voltage, sizeof(u32));
 
-	state->config->send_command(fe, 0x71, sizeof(b), b, NULL, NULL);
+	state->config->send_command(fe, 0x71, sizeof(b), b, NULL, NULL, 0);
 
 	return 0;
 }
@@ -149,7 +150,7 @@ static int ttusbdecfe_dvbs_diseqc_send_master_cmd(struct dvb_frontend* fe, struc
 
 	state->config->send_command(fe, 0x72,
 				    sizeof(b) - (6 - cmd->msg_len), b,
-				    NULL, NULL);
+				    NULL, NULL, 0);
 
 	return 0;
 }
diff --git a/drivers/media/usb/ttusb-dec/ttusbdecfe.h b/drivers/media/usb/ttusb-dec/ttusbdecfe.h
index 73828bb2258c..b757e093365c 100644
--- a/drivers/media/usb/ttusb-dec/ttusbdecfe.h
+++ b/drivers/media/usb/ttusb-dec/ttusbdecfe.h
@@ -14,7 +14,8 @@ struct ttusbdecfe_config
 {
 	int (*send_command)(struct dvb_frontend* fe, const u8 command,
 			    int param_length, const u8 params[],
-			    int *result_length, u8 cmd_result[]);
+			    int *result_length, u8 cmd_result[],
+			    size_t cmd_result_size);
 };
 
 extern struct dvb_frontend* ttusbdecfe_dvbs_attach(const struct ttusbdecfe_config* config);
-- 
2.53.0

