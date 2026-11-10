Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794319915;
	b=fhdHl9p4yE0f398bE7amxCz8GmGhKgsxKfOm6ZjBaHHu/s2zoeVf+SRe+yH7JA1Teaq9
	 XjQp3CFgQZreFjbafNgzrbAyhhzm+eVhp9KGoehfwKBkFMKoQSlu6cQEVQ3GWYgFwgqVu
	 a75t80lnWRAX669sT+mDLcq4/HI24/T5zDi676c3N0QbeuPmAhLWefFOkGVmSBLRELdb9
	 UQE3tWcITUXAU70Oe9kj0/HAT++f4sGMIZRagbN1PxRrKamP0OWmyHJqw7TKY+074m4wD
	 yF2pZ4iMEUZOE87FQQOiYvcX5sfE/EHdyL8IK1lUxm9ACJ3HXxfyo7zTuqmuItxuR4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794319915;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zCjH675f3kuYne9GoWN5MZ8oS3jwETZrGoKJ3KcQVJQ=;
	b=wA7mudId2ik8gNkHBgQyP/xbC/uO8igC/Fmp2K+ddbZRwQfciDa7daHAuZQoV6ihPmYg
	 xV7RoXx4toQd2QQS3edahQUVHGbn4/oXmnxLCi0RhxZX8SelEkatpLaU6+9yPS2psRKub
	 Z0WizxitkUS0dVQD30J/8i4h0EN2ja0paO0Mr9oN+glSL+b6pobWh4HB8vX7aQaN+Y7NE
	 3nk0gtsvdGFIfJ4eJWIwbOL7Z4THxdhwq+u8BbowZM5nBVLNI/Lei8URqvdW0K0Gmtnl2
	 GNhS+F0KSwBl5thjmK9fpa3oB7dWsIw7CoCC98RHj27bNlBD1eutGWOHnr97wt9v6Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VG5ulaRL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ktpSXC05;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC63606A334
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 14:11:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CC63606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VG5ulaRL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ktpSXC05
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAE3dWe028787
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 14:11:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zCjH675f3kuYne9GoWN5MZ8oS3jwETZrGoKJ3KcQVJQ=; b=VG5ulaRLlpanHE6a
	ChH3uV//vgiAXZuQT/Gb6YJ9vsYmFfooYPaeFDyJTTPH0lJjLpns2zpwkf62DbsR
	LJAn8XDdz4U81MzIz/a1fdqo6ISVpt2U+r4ZhWs1DZCrfUa++pRkPLZ5oe66C/tR
	pKzisAwH5zS4aEdBSr3S+STggFwCjzI48EvsErWmxJx5Oxt93WCKKulSq4ud+AjE
	SwvJ+mSY//BqLjt/FjLkpplTaJtuw5uIjPD7YxtdXbmOWOYVE3m0RusQA+ERBbZ3
	tbA8lzmUrVEPaSX6R7K9v1A8Pc/DQ1/CpT7Hcebagvm5LgkbQJ9uKacLuO4VJ+UA
	rOcUGQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv4pv8187-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 14:11:54 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-375bac6bd21so399106eec.0
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 06:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794319913; x=1794924713; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zCjH675f3kuYne9GoWN5MZ8oS3jwETZrGoKJ3KcQVJQ=;
        b=ktpSXC05bKSJsaH+RApI5tL2dT5pJ4qtn2Zy/Zfnw/IEtOdVTq7GcUve1Cz+2KaxA8
         f/VtkAsZkWuXu9K/T6c4et9U7L12pi+LqlDhjXC7IwPNlNlpI6t2J4K94UWQchXJXlng
         8Fyu2cG60T38i/WZ8W59rZbd6OWrBLFMUXUv9DWFEETZCqz/i1kz6enFF0qZttorXdSz
         lgpI/C87RR3Rs6vrFEKj+mXEzyoltmFhIEvmrwFr08RUWWa4eDjg+mGWQORY+S5pvYWF
         VgH0mxPTOEOLu69EYIr1b3PtaYyqQdu2LZVrH6sENW3w/tkleMZMin0WOoW0nMcOaw/9
         Xi7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794319913; x=1794924713;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zCjH675f3kuYne9GoWN5MZ8oS3jwETZrGoKJ3KcQVJQ=;
        b=B62WdAJq53kADL5KzRxrfqlgZT/II1nF8XOi81QVhFtbDyvWuES8JCYid8/NBxYHY2
         tZ1JL/ZifsqJkDRv5b4Vv1h0WaXTIwMWr2HYLS0ZxYP7KA1y0n2hbn0dM1Ha1ebhhOTq
         1D7AWCvtw3tDVuid9H3y/oMlNFWGMYaZ0m26mHlSxzsQw4HvdWHsm9+engiI+JMYy9qO
         l+4pk3b0ENS4wZsZcyfNP4BBaLSWUcI5t9EJRUHqR1fyr/ISucmzN3eSpEE+t4TaCTg8
         8Mc2VDJggsqFbtNwBFUsoBt3zem6F29XDfvGUhcnjLDBv6wZ+aQ8WRTNBAsrqRicYUZU
         A67A==
X-Gm-Message-State: APuU4Z8czGuVBmJDhAw+vcp42WZHWE3rYWrOybJUOTNM1TVTT/sBOnjv
	xU5SfDK6oeeds+BDC2fSFPVIG+NYQUSXFVRsqMeKON4IIGAd/dFHjoSMUpBUyvQVHYgB1HEwue2
	56zVWTVexoRFTxdzapDH2oQ/+irJ+0rUeaLw+VYAvSytNP9W9RtkOQk27ae9OPLJW3g==
X-Gm-Gg: AYBFou11Mz+nNgZrRz4EEAKZRvVAFiDzInza0TxRvgWZnezHWDD0A6LrZxrvREMBGmw
	VYUN07vIqt6bE9DQMF9c94moCksUcXqUbAyZ/tM9vjiwtIaWlphwB30AbY9NJbeWi7QYoi8xDsq
	MOchgZGM1Aw84OhWkS3DGkd5VhYRf1lnoK1sJCQ2EMCQmVfsFCM90S0d3vlk3N60uxtT+0CNhve
	NTq3ZqwgfwM46+5MIK548i+KUseuZ9KVpQPvJjaW81SRSuI5cLK9CkggUkGn77CW46Zr+Q7Nngu
	+XMWa9BmKwy1oCThX67ENjUZvkqJh/giIbKGUP9+sAbmeFWVr6zKTxa8JcvgulIr0esryfuWQhJ
	Iq0ceTZMMLemoS+esnD76t2FuQLsNDCd31ileEG+IPl7rXORWRQ3e1w1+bsWpl2ff1QoUiuGoNQ
	YOxgmJPhg=
X-Received: by 2002:a05:693c:894f:20b0:36c:dd3b:a3e4 with SMTP id 5a478bee46e88-3751e99aa6bmr3501742eec.3.1794319913089;
        Tue, 10 Nov 2026 06:11:53 -0800 (PST)
X-Received: by 2002:a05:693c:894f:20b0:36c:dd3b:a3e4 with SMTP id 5a478bee46e88-3751e99aa6bmr3501699eec.3.1794319912173;
        Tue, 10 Nov 2026 06:11:52 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375215d8889sm8059128eec.27.2026.11.10.06.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 06:11:51 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 19:39:51 +0530
Subject: [PATCH v2 3/5] media: iris: Fix use-after-free on unbind with open
 sessions
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-iris-handle-unbind-v2-3-86d5f6f1dea8@oss.qualcomm.com>
References: <20261110-iris-handle-unbind-v2-0-86d5f6f1dea8@oss.qualcomm.com>
In-Reply-To: <20261110-iris-handle-unbind-v2-0-86d5f6f1dea8@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        sashiko-bot <sashiko-bot@kernel.org>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794319890; l=9323;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=ZqoXdUS7QaD15+//zvyejFZXoLuK6O3XVCrKMHt26lI=;
 b=STNdofpjTMz0tOXen+MVwr8xtB+0ODo7DEsRhVpsErdW3kwef7du69ld8FgH+rPVxVoT/ai7T
 oZzVeqqYz72CnYG1dHA65OTLKtA6neLmWvJzC/Ag9G+Jmc6adyaTAQP
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=XqZvqlF9 c=1 sm=1 tr=0 ts=6af3262a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vR0_CB0LkmFek0KcXmEA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: rQBYvRdqWgS6hgILdE974p3vILRRYh4n
X-Proofpoint-GUID: rQBYvRdqWgS6hgILdE974p3vILRRYh4n
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1NSBTYWx0ZWRfX5he8gyQ1H6oj
 tcdfJi0e61WIFXkzPLu2OSWWDWMrO2VAC1JQB2ZiADc7ZZ1fkrrFZ5Jhee/VOM+G2JpfjfeO0YE
 2BBPM+DRJlDo6oxUlpwMcDYNsEr/THo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1NSBTYWx0ZWRfX9ipOH0NGLSYE
 02el1m5oeZI1SmJt6Bjhm0buQvJB54ZW+L7fxoyfPnpgTEv+BuLvnQic/0DhVVTqQ9qC2j8bX6V
 ce5Gts7FyIVH01mpJ5IO3iBRb6PUh2hIh0nSu5XOExdLJShdRpypHmLjRFx38Y6rSDIDNDqhtDU
 CzOQq/1EWyKIwTyk2AfxuMqcza410V6k267H4+TmFb4NlUfFtW1TT0ggHFOyFbJcRRGaNDAieXd
 ItlijWXHX3H4MMLgZmuvdw+5nvtl7f+dD8T+5Po8Ru6oIgPpImaiKJpY3bjU+nET1NIyfKR86Il
 DotrlDXTntexxHqmk8usLBtzbbT2YgeEIJTQ8f8yIs6CSuc3Cxip5uVoWPEBIIn/nOjkNOl8qdL
 i5JymsX8UWOR6xNdDrB9Lz3eHV0ameXxFvJeVXxHPW7qXQ53uw+EZErGD3SD/jXV/wApH3dO2EX
 XytqzUvpMtjArUPXqsg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100055

The driver can be unbound through sysfs while a client has a video
session open. The core is devm allocated and freed when remove()
returns, so the open sessions then use freed memory.

Only the core structure needs to outlive remove(), because it is the
only thing the file operations of an open session still use. Allocate
it with kzalloc and tie it to the reference count of its v4l2_device,
which every registered video device holds. It is freed when the last
file descriptor is closed. The other devm resources (register mapping,
response packet, clocks, power domains, interconnects) are only used by
the power on/off sequence, the clock and bandwidth votes and the
interrupt handler. All of them are released with the unbind, after the
core is shut down.

To make sure nothing uses them afterwards, set a removing flag at the
start of iris_remove(). It makes core init, new sessions, command
writes and the clock and interconnect votes fail with -ENODEV, so a
client still holding a file descriptor cannot power the hardware on or
vote for resources that are gone. A client waiting for the firmware
only times out and returns an error without touching them. Runtime PM
is also disabled explicitly in iris_remove() instead of with devm,
because its callbacks use the core.

Fixes: 38506cb7e8d2 ("media: iris: add platform driver for iris video device")
Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260926064921.976721F000FF@smtp.kernel.org
Cc: stable@vger.kernel.org
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.c      | 10 +++++-
 drivers/media/platform/qcom/iris/iris_core.h      |  2 ++
 drivers/media/platform/qcom/iris/iris_hfi_queue.c | 15 +++++++-
 drivers/media/platform/qcom/iris/iris_power.c     | 13 +++++++
 drivers/media/platform/qcom/iris/iris_probe.c     | 44 ++++++++++++++++++-----
 drivers/media/platform/qcom/iris/iris_vidc.c      |  3 ++
 6 files changed, 76 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
index d558475986ff0..bdac6b8c98e44 100644
--- a/drivers/media/platform/qcom/iris/iris_core.c
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -43,7 +43,10 @@ static int iris_wait_for_system_response(struct iris_core *core)
 	ret = wait_for_completion_timeout(&core->core_init_done,
 					  msecs_to_jiffies(HW_RESPONSE_TIMEOUT_VALUE));
 	if (!ret) {
-		core->state = IRIS_CORE_ERROR;
+		mutex_lock(&core->lock);
+		if (!core->removing)
+			core->state = IRIS_CORE_ERROR;
+		mutex_unlock(&core->lock);
 		return -ETIMEDOUT;
 	}
 
@@ -56,6 +59,11 @@ int iris_core_init(struct iris_core *core)
 	int ret;
 
 	mutex_lock(&core->lock);
+	if (core->removing) {
+		ret = -ENODEV;
+		goto exit;
+	}
+
 	if (core->state == IRIS_CORE_INIT) {
 		ret = 0;
 		goto exit;
diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index 3e4cf652bf39a..379f0666a42cb 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -62,6 +62,7 @@ struct qcom_ubwc_cfg_data;
  * @iris_firmware_desc: a pointer to the firmware-specific descriptive data
  * @ubwc_cfg: UBWC configuration for the platform
  * @state: current state of core
+ * @removing: set when driver removal starts, blocks core init and resource votes
  * @iface_q_table_daddr: device address for interface queue table memory
  * @sfr_daddr: device address for SFR (Sub System Failure Reason) register memory
  * @iface_q_table_vaddr: virtual address for interface queue table memory
@@ -108,6 +109,7 @@ struct iris_core {
 	const struct iris_firmware_desc		*iris_firmware_desc;
 	const struct qcom_ubwc_cfg_data		*ubwc_cfg;
 	enum iris_core_state			state;
+	bool					removing;
 	dma_addr_t				iface_q_table_daddr;
 	dma_addr_t				sfr_daddr;
 	void					*iface_q_table_vaddr;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.c b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
index 545bbe75e1740..e0cfa5107d1d9 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
@@ -128,13 +128,26 @@ int iris_hfi_queue_cmd_write_locked(struct iris_core *core, void *pkt, u32 pkt_s
 
 int iris_hfi_queue_cmd_write(struct iris_core *core, void *pkt, u32 pkt_size)
 {
-	int ret;
+	int ret = 0;
+
+	mutex_lock(&core->lock);
+	if (core->removing)
+		ret = -ENODEV;
+	mutex_unlock(&core->lock);
+	if (ret)
+		return ret;
 
 	ret = pm_runtime_resume_and_get(core->dev);
 	if (ret < 0)
 		return ret;
 
 	mutex_lock(&core->lock);
+	if (core->removing) {
+		mutex_unlock(&core->lock);
+		ret = -ENODEV;
+		goto exit;
+	}
+
 	ret = iris_hfi_queue_cmd_write_locked(core, pkt, pkt_size);
 	if (ret) {
 		mutex_unlock(&core->lock);
diff --git a/drivers/media/platform/qcom/iris/iris_power.c b/drivers/media/platform/qcom/iris/iris_power.c
index 91aa21d4070eb..1f2a7e1bb9e1f 100644
--- a/drivers/media/platform/qcom/iris/iris_power.c
+++ b/drivers/media/platform/qcom/iris/iris_power.c
@@ -47,6 +47,11 @@ static int iris_set_interconnects(struct iris_inst *inst)
 	int ret;
 
 	mutex_lock(&core->lock);
+	if (core->removing) {
+		ret = -ENODEV;
+		goto exit;
+	}
+
 	list_for_each_entry(instance, &core->instances, list) {
 		if (!instance->max_input_data_size)
 			continue;
@@ -56,6 +61,7 @@ static int iris_set_interconnects(struct iris_inst *inst)
 
 	ret = iris_set_icc_bw(core, total_bw_ddr);
 
+exit:
 	mutex_unlock(&core->lock);
 
 	return ret;
@@ -83,6 +89,11 @@ static int iris_set_clocks(struct iris_inst *inst)
 	int ret;
 
 	mutex_lock(&core->lock);
+	if (core->removing) {
+		ret = -ENODEV;
+		goto exit;
+	}
+
 	list_for_each_entry(instance, &core->instances, list) {
 		if (!instance->max_input_data_size)
 			continue;
@@ -92,6 +103,8 @@ static int iris_set_clocks(struct iris_inst *inst)
 
 	core->power.clk_freq = freq;
 	ret = iris_opp_set_rate(core->dev, freq);
+
+exit:
 	mutex_unlock(&core->lock);
 
 	return ret;
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 6f02bb629867b..dc83daccea5f7 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -243,6 +243,22 @@ static int iris_register_video_device(struct iris_core *core, enum domain_type t
 	return ret;
 }
 
+static void iris_core_release(struct v4l2_device *v4l2_dev)
+{
+	struct iris_core *core = container_of(v4l2_dev, struct iris_core, v4l2_dev);
+
+	mutex_destroy(&core->lock);
+	put_device(core->dev);
+	kfree(core);
+}
+
+static void iris_core_put(void *data)
+{
+	struct iris_core *core = data;
+
+	v4l2_device_put(&core->v4l2_dev);
+}
+
 static void iris_remove(struct platform_device *pdev)
 {
 	struct iris_core *core;
@@ -251,18 +267,23 @@ static void iris_remove(struct platform_device *pdev)
 	if (!core)
 		return;
 
+	mutex_lock(&core->lock);
+	core->removing = true;
+	mutex_unlock(&core->lock);
+
+	video_unregister_device(core->vdev_dec);
+	video_unregister_device(core->vdev_enc);
+
 	disable_delayed_work_sync(&core->sys_error_handler);
 
 	iris_core_deinit(core);
 
-	video_unregister_device(core->vdev_dec);
-	video_unregister_device(core->vdev_enc);
+	pm_runtime_dont_use_autosuspend(core->dev);
+	pm_runtime_disable(core->dev);
 
 	v4l2_device_unregister(&core->v4l2_dev);
 
 	iris_unreserve_iova_region(core->dev, core->iova_state);
-
-	mutex_destroy(&core->lock);
 }
 
 static void iris_sys_error_handler(struct work_struct *work)
@@ -281,15 +302,22 @@ static int iris_probe(struct platform_device *pdev)
 	u64 dma_mask;
 	int ret;
 
-	core = devm_kzalloc_obj(&pdev->dev, *core);
+	core = kzalloc_obj(*core);
 	if (!core)
 		return -ENOMEM;
-	core->dev = dev;
+	core->dev = get_device(dev);
+
+	core->v4l2_dev.release = iris_core_release;
+	kref_init(&core->v4l2_dev.ref);
 
 	core->state = IRIS_CORE_DEINIT;
 	mutex_init(&core->lock);
 	init_completion(&core->core_init_done);
 
+	ret = devm_add_action_or_reset(dev, iris_core_put, core);
+	if (ret)
+		return ret;
+
 	core->response_packet = devm_kzalloc(core->dev, IFACEQ_CORE_PKT_SIZE, GFP_KERNEL);
 	if (!core->response_packet)
 		return -ENOMEM;
@@ -354,9 +382,7 @@ static int iris_probe(struct platform_device *pdev)
 
 	pm_runtime_set_autosuspend_delay(core->dev, AUTOSUSPEND_DELAY_VALUE);
 	pm_runtime_use_autosuspend(core->dev);
-	ret = devm_pm_runtime_enable(core->dev);
-	if (ret)
-		goto err_vdev_unreg_enc;
+	pm_runtime_enable(core->dev);
 
 	return 0;
 
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 05aab6e3005d5..04bd37b934457 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -64,6 +64,9 @@ static int iris_add_session(struct iris_inst *inst)
 
 	guard(mutex)(&core->lock);
 
+	if (core->removing)
+		return -ENODEV;
+
 	list_for_each_entry(iter, &core->instances, list)
 		count++;
 

-- 
2.34.1

