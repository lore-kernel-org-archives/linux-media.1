Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE71B40F723;
	Thu, 13 Aug 2026 15:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786633686; cv=none; b=phFWqWCDhjxXPnBcwJQ00hftcY8oZGDlstzX8C/IoXhZhKvlh0U6HkeiKfa2ImQD7xY2hps55CKeOgfO7z/NKLsVx7xuS5dYlHeOO9iHvM4gfwrQhdb32zScZeBZdJlS8p16Hfkta+4pigbzGzo5Fx3ajUUMyXqRn0CKYKPVz+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786633686; c=relaxed/simple;
	bh=LUdY/eWxVrnrs9uEwEt2Jal/gM3csHrz3E0Ed663s10=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dpVLH3gM9IRtIta+PKV1k8k+I4ofxFaimKnGQxqtOrt+Pvil89N2TgF43UmDlpbiQ1jRhuO1kqu6AFl3vbg/O4l0m+lX7k3+b/fFC+H66ssZJ5rm8kBv4kKDQNAAcAdZWd7mtCqq/jGtBSAl1uloKffFhGN+KQh8UFrxJa/qXUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowADnu+_P3X1qj_F4BQ--.55852S2;
	Thu, 13 Aug 2026 23:07:59 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH v2] media: ttusb-dec: validate command request and response lengths
Date: Thu, 13 Aug 2026 23:07:58 +0800
Message-ID: <20260813150758.16500-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowADnu+_P3X1qj_F4BQ--.55852S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Wr4rAF18Cr48XFW8Jw4ruFg_yoWfZry5pF
	45KayFyr1UJa18JryfCr40vF9xZ3s2yFyxK34Fg3sIqF4kWa4UGFy8Ka4Yvr18CrZrG3W5
	Xrn8Ka45Kr43W3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyv14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI48J
	MxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AK
	xVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUb3rc3UUUUU==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

The command helper allocates a 60-byte payload after a four-byte
header. A successful USB bulk read can still be shorter than the header
or advertise a payload not contained in the transfer, and callers have
different destination capacities.

Pass destination capacity through the internal frontend callback. Reject
oversized or missing request parameters, short response headers, payloads
outside the actual transfer or fixed buffer, and results larger than the
caller's destination.

Assisted-by: Codex:gpt-5
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
Changes since v1: https://lore.kernel.org/all/20260715084044.35466-1-pengpeng@iscas.ac.cn/
- pass each caller's result capacity through the frontend callback
- validate request parameters and the four-byte response header
- bound the advertised payload by the transfer, fixed buffer and
  destination

The command producers and consumers were reviewed statically; no TTUSB
device or malformed USB response was exercised.

 drivers/media/usb/ttusb-dec/ttusb_dec.c  | 62 +++++++++++++++---------
 drivers/media/usb/ttusb-dec/ttusbdecfe.c |  9 ++--
 drivers/media/usb/ttusb-dec/ttusbdecfe.h |  3 +-
 3 files changed, 47 insertions(+), 27 deletions(-)

diff --git a/drivers/media/usb/ttusb-dec/ttusb_dec.c b/drivers/media/usb/ttusb-dec/ttusb_dec.c
index 825a3875989d..9321baee018e 100644
--- a/drivers/media/usb/ttusb-dec/ttusb_dec.c
+++ b/drivers/media/usb/ttusb-dec/ttusb_dec.c
@@ -314,12 +314,16 @@ static u16 crc16(u16 crc, const u8 *buf, size_t len)
 
 static int ttusb_dec_send_command(struct ttusb_dec *dec, const u8 command,
 				  int param_length, const u8 params[],
-				  int *result_length, u8 cmd_result[])
+				  int *result_length, u8 cmd_result[],
+				  unsigned int cmd_result_size)
 {
 	int result, actual_len;
 	u8 *b;
 
 	dprintk("%s\n", __func__);
+	if (param_length < 0 || param_length > COMMAND_PACKET_SIZE ||
+	    (param_length && !params))
+		return -EINVAL;
 
 	b = kzalloc(COMMAND_PACKET_SIZE + 4, GFP_KERNEL);
 	if (!b)
@@ -360,18 +364,28 @@ static int ttusb_dec_send_command(struct ttusb_dec *dec, const u8 command,
 		printk("%s: result bulk message failed: error %d\n",
 		       __func__, result);
 		goto err_mutex_unlock;
-	} else {
-		if (debug) {
-			printk(KERN_DEBUG "%s: result: %*ph\n",
-			       __func__, actual_len, b);
-		}
+	}
+
+	dprintk("result: %*ph\n", actual_len, b);
 
-		if (result_length)
-			*result_length = b[3];
-		if (cmd_result && b[3] > 0)
-			memcpy(cmd_result, &b[4], b[3]);
+	if (actual_len < 4) {
+		pr_warn("%s: short result packet\n", __func__);
+		result = -EPROTO;
+		goto err_mutex_unlock;
 	}
 
+	if (b[3] > COMMAND_PACKET_SIZE || b[3] > actual_len - 4 ||
+	    (cmd_result && b[3] > cmd_result_size)) {
+		pr_warn("%s: invalid result length %u\n", __func__, b[3]);
+		result = -EPROTO;
+		goto err_mutex_unlock;
+	}
+
+	if (result_length)
+		*result_length = b[3];
+	if (cmd_result && b[3] > 0)
+		memcpy(cmd_result, &b[4], b[3]);
+
 err_mutex_unlock:
 	mutex_unlock(&dec->usb_mutex);
 err_free:
@@ -389,7 +403,8 @@ static int ttusb_dec_get_stb_state (struct ttusb_dec *dec, unsigned int *mode,
 
 	dprintk("%s\n", __func__);
 
-	result = ttusb_dec_send_command(dec, 0x08, 0, NULL, &c_length, c);
+	result = ttusb_dec_send_command(dec, 0x08, 0, NULL,
+					&c_length, c, sizeof(c));
 	if (result)
 		return result;
 
@@ -448,7 +463,7 @@ static void ttusb_dec_set_pids(struct ttusb_dec *dec)
 	memcpy(&b[2], &audio, 2);
 	memcpy(&b[4], &video, 2);
 
-	ttusb_dec_send_command(dec, 0x50, sizeof(b), b, NULL, NULL);
+	ttusb_dec_send_command(dec, 0x50, sizeof(b), b, NULL, NULL, 0);
 
 	dvb_filter_pes2ts_init(&dec->a_pes2ts, dec->pid[DMX_PES_AUDIO],
 			       ttusb_dec_audio_pes2ts_cb, dec);
@@ -902,7 +917,7 @@ static int ttusb_dec_set_interface(struct ttusb_dec *dec,
 			break;
 		case TTUSB_DEC_INTERFACE_IN:
 			result = ttusb_dec_send_command(dec, 0x80, sizeof(b),
-							b, NULL, NULL);
+							b, NULL, NULL, 0);
 			if (result)
 				return result;
 			result = usb_set_interface(dec->udev, 0, 8);
@@ -1021,7 +1036,7 @@ static int ttusb_dec_start_ts_feed(struct dvb_demux_feed *dvbdmxfeed)
 
 	}
 
-	result = ttusb_dec_send_command(dec, 0x80, sizeof(b0), b0, NULL, NULL);
+	result = ttusb_dec_send_command(dec, 0x80, sizeof(b0), b0, NULL, NULL, 0);
 	if (result)
 		return result;
 
@@ -1056,7 +1071,7 @@ static int ttusb_dec_start_sec_feed(struct dvb_demux_feed *dvbdmxfeed)
 	memcpy(&b0[5], &dvbdmxfeed->filter->filter.filter_value[0], 1);
 
 	result = ttusb_dec_send_command(dec, 0x60, sizeof(b0), b0,
-					&c_length, c);
+					&c_length, c, sizeof(c));
 
 	if (!result) {
 		if (c_length == 2) {
@@ -1114,7 +1129,7 @@ static int ttusb_dec_stop_ts_feed(struct dvb_demux_feed *dvbdmxfeed)
 	struct ttusb_dec *dec = dvbdmxfeed->demux->priv;
 	u8 b0[] = { 0x00 };
 
-	ttusb_dec_send_command(dec, 0x81, sizeof(b0), b0, NULL, NULL);
+	ttusb_dec_send_command(dec, 0x81, sizeof(b0), b0, NULL, NULL, 0);
 
 	dec->pva_stream_count--;
 
@@ -1135,7 +1150,7 @@ static int ttusb_dec_stop_sec_feed(struct dvb_demux_feed *dvbdmxfeed)
 	list_del(&finfo->filter_info_list);
 	spin_unlock_irqrestore(&dec->filter_info_list_lock, flags);
 	kfree(finfo);
-	ttusb_dec_send_command(dec, 0x62, sizeof(b0), b0, NULL, NULL);
+	ttusb_dec_send_command(dec, 0x62, sizeof(b0), b0, NULL, NULL, 0);
 
 	dec->filter_stream_count--;
 
@@ -1238,7 +1253,7 @@ static int ttusb_init_rc( struct ttusb_dec *dec)
 	if (usb_submit_urb(dec->irq_urb, GFP_KERNEL))
 		printk("%s: usb_submit_urb failed\n",__func__);
 	/* enable irq pipe */
-	ttusb_dec_send_command(dec,0xb0,sizeof(b),b,NULL,NULL);
+	ttusb_dec_send_command(dec, 0xb0, sizeof(b), b, NULL, NULL, 0);
 
 	return 0;
 }
@@ -1354,7 +1369,7 @@ static int ttusb_dec_boot_dsp(struct ttusb_dec *dec)
 	firmware_csum_ns = htons(firmware_csum);
 	memcpy(&b0[6], &firmware_csum_ns, 2);
 
-	result = ttusb_dec_send_command(dec, 0x41, sizeof(b0), b0, NULL, NULL);
+	result = ttusb_dec_send_command(dec, 0x41, sizeof(b0), b0, NULL, NULL, 0);
 
 	if (result) {
 		release_firmware(fw_entry);
@@ -1395,7 +1410,7 @@ static int ttusb_dec_boot_dsp(struct ttusb_dec *dec)
 		}
 	}
 
-	result = ttusb_dec_send_command(dec, 0x43, sizeof(b1), b1, NULL, NULL);
+	result = ttusb_dec_send_command(dec, 0x43, sizeof(b1), b1, NULL, NULL, 0);
 
 	release_firmware(fw_entry);
 	kfree(b);
@@ -1621,10 +1636,13 @@ static void ttusb_dec_exit_filters(struct ttusb_dec *dec)
 
 static int fe_send_command(struct dvb_frontend* fe, const u8 command,
 			   int param_length, const u8 params[],
-			   int *result_length, u8 cmd_result[])
+			   int *result_length, u8 cmd_result[],
+			   unsigned int cmd_result_size)
 {
 	struct ttusb_dec* dec = fe->dvb->priv;
-	return ttusb_dec_send_command(dec, command, param_length, params, result_length, cmd_result);
+
+	return ttusb_dec_send_command(dec, command, param_length, params,
+				      result_length, cmd_result, cmd_result_size);
 }
 
 static const struct ttusbdecfe_config fe_config = {
diff --git a/drivers/media/usb/ttusb-dec/ttusbdecfe.c b/drivers/media/usb/ttusb-dec/ttusbdecfe.c
index 215221370c19..b013d6dfcbee 100644
--- a/drivers/media/usb/ttusb-dec/ttusbdecfe.c
+++ b/drivers/media/usb/ttusb-dec/ttusbdecfe.c
@@ -44,7 +44,8 @@ static int ttusbdecfe_dvbt_read_status(struct dvb_frontend *fe,
 
 	*status=0;
 
-	ret=state->config->send_command(fe, 0x73, sizeof(b), b, &len, result);
+	ret = state->config->send_command(fe, 0x73, sizeof(b), b, &len, result,
+					  sizeof(result));
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
index 73828bb2258c..339711f83ff0 100644
--- a/drivers/media/usb/ttusb-dec/ttusbdecfe.h
+++ b/drivers/media/usb/ttusb-dec/ttusbdecfe.h
@@ -14,7 +14,8 @@ struct ttusbdecfe_config
 {
 	int (*send_command)(struct dvb_frontend* fe, const u8 command,
 			    int param_length, const u8 params[],
-			    int *result_length, u8 cmd_result[]);
+			    int *result_length, u8 cmd_result[],
+			    unsigned int cmd_result_size);
 };
 
 extern struct dvb_frontend* ttusbdecfe_dvbs_attach(const struct ttusbdecfe_config* config);
-- 
2.50.1 (Apple Git-155)

