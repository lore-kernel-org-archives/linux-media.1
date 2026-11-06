Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793979110;
	b=EIjxFbiz5D5DkabcNJCs8waDVZGcgu82wZoILSfXQAyEGULc+kMuuBrp+0XGTDmwLMNd
	 Fxs62zWoEoxJKnde7NcN8aJE9HkvhYGrhHLaL9EkjVGFoFH8+DyP1MNxGUGUQ1bdRgztD
	 KK1xGR3lsYf9ELksR0jzPkJBMcAtx+kpJX/7KybTAaL/KJdQD/R51LxeQgPrtT3kHMNR1
	 AwIRH0xJHxu4eW+Nr+N1RrOxMHd3UmKLmHXJMJrg0UuxBPJqzLBDRaAlKp2fuIUbV3PMk
	 1i4m25QDtF0c+qN+9YSngJGh66zZnjRpZ1ecBOUsmWPq2MYnK6uKol6J3rEEGjpiaDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793979110;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=n+0Op+8FH2TFjiXOsZexOm3mLBQWd3rIlu7ImwCUDA8=;
	b=X/XVY3R+rd7amNCLXvp/uH2Zs/Z5WQ7WturpGcgoRaaS1JGTkRTI25o5t3p7adNDZu5z
	 cvhpQj/6G3w8z8iVHM0acAXg6dFPX0qU+BEwAXNn3UrrvzQI33YwwFjA3oaicgmT61ReT
	 JJLr+FxQMERdMgFMSL6iS/hSjwoTrTvB+WuNJMr0b0OfI2pbSgpQ4H6ud7shgxGfrbTBN
	 MJdrzFGu8uz1vX7VDbtYUddEsTLc91FpsgIf6HvLoG3oX1gBwePhhYVNgv0B/BGiRem6g
	 UqsL/+V/XQLRPPQtA0dG4o13q2c88d+88FgloM5wArRhGMaXBNQ+YJhe6WsqBuiMUHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jotD8vg5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="bosJ9Q/a";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE5F606A32F
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 15:31:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACE5F606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jotD8vg5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bosJ9Q/a
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6F01jM1039367
	for <linux-media@vger.kernel.org>; Fri, 6 Nov 2026 15:31:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=n+0Op+8FH2T
	FjiXOsZexOm3mLBQWd3rIlu7ImwCUDA8=; b=jotD8vg5FLHxQY93HuejjBIFQxs
	9QOo3rFsNomi2p0ZyhsJeipYY3jQevgAPXdWMB56NIsH58RwJagMtHJZvpyslk78
	KQ06Ks7oLgEOS2Y8tNfdRPeOGc/uLvl9LA1GHa5ElvdHPST8HuvDlcPtdTszK9n5
	H92rdqMrqEBUydKAorFKBAfExCsUVrb9rFVUUQ8TjdPxwbYZOr08UVVG8smW8qYS
	1gaXhM0fEW/KsSvGP8TJpZyomOjKGKqph6IMeznMTv8lGdirbO5Op8DzvfbpaKMn
	PFG1s5EM54SzHchm+RQG+II148c0lNrI1NEEmsTUyfC043N33kMDGj/hXLA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9ue9h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 15:31:48 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36ecd5db581so2413210eec.0
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 07:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793979108; x=1794583908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n+0Op+8FH2TFjiXOsZexOm3mLBQWd3rIlu7ImwCUDA8=;
        b=bosJ9Q/aDj9Iul3OX/gfjWFCkIhBCR5CG0o/5/zE9Y0xlwU89K+lN+gWkoJGOWlkAu
         Rd3mtTsTB1Fxc4fwxB7qNmCxWyTeGbGmobJk/ZYCUV3Gtti1gwn4wYxPy0z+6uctAaP/
         tY3mQcKl/b7MnoHM7n18UO9AY27XOHrg39BbweausSZ22fzndKmchZpHuBKhaXx3HPaw
         0btFM+Cv3PCPmnBiT3RdJm2YI9+sfDn4yLUQkMXb/9Gw750jhud4Kg+iE7glF7joOcbg
         uE+3F3BMzOHyQ4P17UVlLLe4jiWdcmjttpsCvNp+D4PYoO3LPSv7jNmpJNOh3wMlFnQP
         Yr+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793979108; x=1794583908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n+0Op+8FH2TFjiXOsZexOm3mLBQWd3rIlu7ImwCUDA8=;
        b=14e5xranLbig/9nD7a16FoaSpMBplrY9qjgKQbqHVGp3BFy1N+F/92FCvaSdckSh4c
         SSoy2HbyyCrkoogQs4dkr4pFqq9vs5sAWFyY4EJSROAhemZYHViotQImr1qLbJwv5Lk8
         be4/SgpgRj/rt4SCRpe9CSW35Xl2cn1X425pXWdBcigMl7Mx81/UOkcLcdtTkMoEeCFS
         tHy038XXDXnKu40y0H7Ew7i3cdR8h4BYRtoS8+j+F3DYQE/IpdozS3AIoG1yyqMD5J5h
         3slTdt52gUxkhhsAi93dsExWSKxm2SR8KCLzSAwPWiUw8BWsF+ydfdKvwA6RKxd0A+Vw
         fnBg==
X-Gm-Message-State: APuU4Z8XjmHGH6QZl73OgO8vnzj597yrdfPtlzBm/US+WbMJg0hTewlE
	xvOwsuWWuj5/PN1z804QDJ7vul3q6es69POCeEwkQVfKCzpOxosY+R1ZEBh9YtpJtY/PU61pQoa
	jucxXY7MwMnbfZzeC0JCVFVwMDRW+1B8NzjzvUXlD3f6ONoWIdR0zfy+g57duEkvDHiKVS8GLRA
	==
X-Gm-Gg: AYBFou337/fwlPrZDTt1ktlzeLJnyOlskiVkn3vz/AYeoTieWugtfoeX8E5jAGlAUan
	g37Gvbz0tyLdorcd4jRdENdSjCGJzn0mrFmRD8Y4ZF67vLGCBDDAix1fao5o4Rq5XSJejpinKVz
	1wjyagQ4G+T15ntG4GMiljIEQhGZ6dv2iJm5qgclAh5EPaDLCy1fv3Z3wFDUTdjCXQsleGC6H5C
	9z+OUrKBZDk4qrN0VF+X4GQpuk4KtZUDHLebAkYi1WD399R8P4rKBuh937t7zjyGxK8vHCOmGHa
	K2zpjT4mvaBFsOsuNFttlJPaKh32tjtsxw+Q3esFzLZf504FnYkab5R0T2miXw50Q3yCZnvMyeA
	DPlZSWVGErTV6w//4CeGUI4PGGpEm4J8xFBHMFoExZT5SW7mvOL2gWHzDxM9EDf9tM5SealPrWT
	lyST3Fstg=
X-Received: by 2002:a05:7301:6498:b0:369:f3b8:2c48 with SMTP id 5a478bee46e88-36f7700ab25mr3497099eec.34.1793979107889;
        Fri, 06 Nov 2026 07:31:47 -0800 (PST)
X-Received: by 2002:a05:7301:6498:b0:369:f3b8:2c48 with SMTP id 5a478bee46e88-36f7700ab25mr3497060eec.34.1793979107041;
        Fri, 06 Nov 2026 07:31:47 -0800 (PST)
Received: from QCOM-seNJUcZa74.qualcomm.com ([183.82.133.69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea75fsm13618197eec.15.2026.11.06.07.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:31:46 -0800 (PST)
From: Dipayaan Roy <dipayaan.roy@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        abhinav.kumar@linux.dev, bod@kernel.org, mchehab@kernel.org,
        p.zabel@pengutronix.de, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] media: qcom: iris: Improve diagnostics for system and session failures
Date: Fri,  6 Nov 2026 15:31:25 +0000
Message-ID: <20261106153126.120858-4-dipayaan.roy@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106153126.120858-1-dipayaan.roy@oss.qualcomm.com>
References: <20261106153126.120858-1-dipayaan.roy@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA2MSBTYWx0ZWRfX0mOsBl+90Yvr
 8KKPkGwQTmnaFuGlBG6QWAPK+Lgil56CqBOI3WvuwpVlrYK02UmA7ZAuP60tBbWZUuBahT68C2Z
 7mKEo8AnaRpAojymHR8ow/EiTrRTN2I=
X-Proofpoint-GUID: zeq4dxeF1j2-Sw7yIAtebPpwiPZdwluj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA2MSBTYWx0ZWRfXz29nwo+V3UZy
 AeVmlvf9Zx8i7VKf3Y7xI8JqZk4WwqnAbKhQaryshWUQ+en5hg4cVzr6zIrijC9i+jkZnBRRDlY
 LbagFR9Oe8O9eDH9XvFW2isquwxRG1Y3NWoE8Plc2FbeL1tU8h1aPJJ8EFWXkrkh89S+/D/N1Zr
 KLiEYWDTQJZdmdQ+0yIVmzg5O3rk5+v5L3XYBcUlKzKAX7dNkMvASiwWkcN6pxmWPu622R5apP2
 PChRFkM5HKYQLTk+etalJVvndVyAsScBdqedYRgckShA9h+0Z4ZaFLBI/kfwk7MjtlYK/m24Y1K
 xXPc/tYULEjWVtw8pw7Ltcl8p1rlQDXPX7rXO/DlyJ4Mv/vinfkc3aiLprezJrQRVHelewKR8hh
 b3pDo0kyrzezRCyapDAHoMn6pVJyu+1suKZBiMkEK6DBCdsxpf31U7cPB7wyesERuQqO0vlpzPd
 //UgPhozxX9uZox7QgQ==
X-Proofpoint-ORIG-GUID: zeq4dxeF1j2-Sw7yIAtebPpwiPZdwluj
X-Authority-Analysis: v=2.4 cv=ZIZCCn7b c=1 sm=1 tr=0 ts=6aedf2e4 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=4lT0C3RFl5dsjxM0/Vd6wg==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=paZWWTHyrK40Bv6ze5sA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060061

Log system and session response timeouts, firmware-reported failures,
and failed recovery attempts so the cause of an error is visible.

Add debug messages for unknown sessions, invalid state transitions,
and successful recovery. Avoid a redundant system init timeout message
after firmware reports an error, and rate-limit Gen2 session response
errors.

Signed-off-by: Dipayaan Roy <dipayaan.roy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.c              |  2 ++
 drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c |  8 +++++++-
 drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 13 ++++++++++++-
 drivers/media/platform/qcom/iris/iris_probe.c             |  8 +++++++-
 drivers/media/platform/qcom/iris/iris_state.c             |  5 ++++-
 drivers/media/platform/qcom/iris/iris_utils.c             |  2 ++
 6 files changed, 34 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
index d558475986ff..4224feaf1caf 100644
--- a/drivers/media/platform/qcom/iris/iris_core.c
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -43,6 +43,8 @@ static int iris_wait_for_system_response(struct iris_core *core)
 	ret = wait_for_completion_timeout(&core->core_init_done,
 					  msecs_to_jiffies(HW_RESPONSE_TIMEOUT_VALUE));
 	if (!ret) {
+		if (core->state != IRIS_CORE_ERROR)
+			dev_err(core->dev, "system init response timed out\n");
 		core->state = IRIS_CORE_ERROR;
 		return -ETIMEDOUT;
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index 1ce7f97d4087..5c411e69e5fd 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -284,6 +284,8 @@ static void iris_hfi_gen1_sys_init_done(struct iris_core *core, void *packet)
 	struct hfi_msg_sys_init_done_pkt *pkt = packet;
 
 	if (pkt->error_type != HFI_ERR_NONE) {
+		dev_err(core->dev, "system init failed (HFI error %#x)\n",
+			pkt->error_type);
 		core->state = IRIS_CORE_ERROR;
 		return;
 	}
@@ -740,8 +742,12 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
 			struct hfi_msg_session_hdr_pkt *shdr;
 
 			shdr = (struct hfi_msg_session_hdr_pkt *)hdr;
-			if (shdr->error_type != HFI_ERR_NONE)
+			if (shdr->error_type != HFI_ERR_NONE) {
+				dev_err(dev, "session %#x response %#x failed (HFI error %#x)\n",
+					inst->session_id, hdr->pkt_type,
+					shdr->error_type);
 				iris_inst_change_state(inst, IRIS_INST_ERROR);
+			}
 
 			if (pkt_info->pkt == HFI_MSG_SESSION_FLUSH) {
 				if (!(--inst->flush_responses_pending))
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index b82f50458fe1..d5b4b27e0549 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -296,6 +296,8 @@ static int iris_hfi_gen2_handle_system_init(struct iris_core *core,
 					    struct iris_hfi_packet *pkt)
 {
 	if (!(pkt->flags & HFI_FW_FLAGS_SUCCESS)) {
+		dev_err(core->dev, "system command %#x failed (flags %#x)\n",
+			pkt->type, pkt->flags);
 		core->state = IRIS_CORE_ERROR;
 		return 0;
 	}
@@ -929,8 +931,11 @@ static int iris_hfi_gen2_handle_session_response(struct iris_core *core,
 	};
 
 	inst = iris_get_instance(core, hdr->session_id);
-	if (!inst)
+	if (!inst) {
+		dev_dbg(core->dev, "response for unknown session %#x\n",
+			hdr->session_id);
 		return -EINVAL;
+	}
 
 	mutex_lock(&inst->lock);
 	inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
@@ -958,6 +963,12 @@ static int iris_hfi_gen2_handle_session_response(struct iris_core *core,
 			if (packet->type > range[i].begin && packet->type < range[i].end) {
 				dequeue |= (packet->type == HFI_CMD_BUFFER);
 				ret = range[i].handle(inst, packet);
+				if (ret && !(packet->flags &
+					     HFI_FW_FLAGS_SESSION_ERROR))
+					dev_err_ratelimited(core->dev,
+							    "session %#x response %#x failed: %d\n",
+							    inst->session_id,
+							    packet->type, ret);
 				if (ret)
 					iris_inst_change_state(inst, IRIS_INST_ERROR);
 			}
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index dd48fa750013..9cefe090466b 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -306,9 +306,15 @@ static void iris_sys_error_handler(struct work_struct *work)
 {
 	struct iris_core *core =
 			container_of(work, struct iris_core, sys_error_handler.work);
+	int ret;
 
 	iris_core_deinit(core);
-	iris_core_init(core);
+	ret = iris_core_init(core);
+	if (ret)
+		dev_err(core->dev, "failed to recover from system error: %d\n",
+			ret);
+	else
+		dev_dbg(core->dev, "recovered from system error\n");
 }
 
 static int iris_probe(struct platform_device *pdev)
diff --git a/drivers/media/platform/qcom/iris/iris_state.c b/drivers/media/platform/qcom/iris/iris_state.c
index 5552725c614e..bcb138ccf08c 100644
--- a/drivers/media/platform/qcom/iris/iris_state.c
+++ b/drivers/media/platform/qcom/iris/iris_state.c
@@ -56,8 +56,11 @@ int iris_inst_change_state(struct iris_inst *inst,
 	if (request_state == IRIS_INST_ERROR)
 		goto change_state;
 
-	if (!iris_allow_inst_state_change(inst, request_state))
+	if (!iris_allow_inst_state_change(inst, request_state)) {
+		dev_dbg(inst->core->dev, "session %#x invalid state change %x -> %x\n",
+			inst->session_id, inst->state, request_state);
 		return -EINVAL;
+	}
 
 change_state:
 	dev_dbg(inst->core->dev, "state changed from %x to %x\n",
diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
index 1096cc4b01c3..5ca4d8e0836b 100644
--- a/drivers/media/platform/qcom/iris/iris_utils.c
+++ b/drivers/media/platform/qcom/iris/iris_utils.c
@@ -78,6 +78,8 @@ int iris_wait_for_session_response(struct iris_inst *inst, bool is_flush)
 	ret = wait_for_completion_timeout(done, msecs_to_jiffies(HW_RESPONSE_TIMEOUT_VALUE));
 	mutex_lock(&inst->lock);
 	if (!ret) {
+		dev_err(inst->core->dev, "session %#x %s response timed out\n",
+			inst->session_id, is_flush ? "flush" : "command");
 		iris_inst_change_state(inst, IRIS_INST_ERROR);
 		return -ETIMEDOUT;
 	}

-- 
2.43.0

