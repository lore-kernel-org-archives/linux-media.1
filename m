Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795088765;
	b=BgpOsQz/JeG097Nh0OpO86Ba67HZux24wPv/GD+6uluNNLPD05+5PcKL2DzLhA2rAI3X
	 BXUDFhrEQZCgpGsNMiqy3+9T0tT2LBoH5EzzP0xxk61u7mEe58hSgSq9/AWtqGQllg2Hw
	 82YbDqqd7gAw5CebZP+mbuXx0XPWDkG9+A64g1zR1gT60+AoD+1/Hjd/0QI0kxyNtGsQS
	 QpAAn341o61ScDtaN+T1QQ2JEs6wgXkDGA18USXR5UaxznZoJ3V4p47Vs1Ldchk8qxf2z
	 PK8EsNcbyXYw0kmjCmhltvPcKaSVPyQp0slB4XB2ASWgKsBo4xT4CSdFuUf1G8ZRDhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088765;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=P0gDbpRYwXjrOiNSKkytD4TVz1o4q/cXx/36JYdIpmc=;
	b=qseYOEv3RzRiGohD3s0AXgfl0l99Snz/Qqheiz6B5bSR6tvYjZVDAIr1fipcanvhvlbv
	 nuN5OqgzfewzpzADf8uTi1OusyWTcJpqiKYNj6hTXor3wzDrZzUSrMDiQK2svFRUrdNvX
	 ELDAZi6CIfFKHHLcr6GLlMGLA8p5P7gYaZBgrnxRdZsjq293y12Y5Q1yjS3gtiz+uheEL
	 3GbraeoQAQWrtyKYeJn+d8+l96ns8JkaWVhngDjBp1w8b5d4yt/yfnggUya+EYi7nDqid
	 Vl7/B2zCLywLybMtlMWJ21sifcUnIftnW6SER/ahMJ17mweWYwLI122B/o2p6NujBiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WDOWStr9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kigHcnCh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD5860A2608
	for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 11:46:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDD5860A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WDOWStr9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kigHcnCh
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJBk4K02843718
	for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 11:46:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P0gDbpRYwXjrOiNSKkytD4TVz1o4q/cXx/36JYdIpmc=; b=WDOWStr9mzyuwxBh
	Ydkv7AhoWQcqjQb+t+u7KfCmsDDou8oeLwDPCzk59CIVbwP0sROVTJqdlBrhivt5
	3XKW5sJQg6lJaDX13Gm7cRkZywPTc0cKAEpyQD/x9B92ALJ+QhJ0jEho1Wl0ozLz
	imoo8fv4UaosKn+AYcyIESGfjNikAgfQOODQ4y8exjE1jHSqcExyyn83GEKgQvOm
	49a53cDJRMgyNqBLfQVOdu62ytbghg+y9HEiJNi8e1eCR4kAYmvqsKqMfcSOU2PE
	HvcX7LNBVRdMAn/WHhw25sNeWsdoWmCjyKh8ajT5VSLu45qrG07VpzLDEaX9mrRm
	ZdACSg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1xc6rjqy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 11:46:04 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ae6fda7a00so1775776a91.2
        for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 03:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795088763; x=1795693563; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P0gDbpRYwXjrOiNSKkytD4TVz1o4q/cXx/36JYdIpmc=;
        b=kigHcnChGfGZgUVRzvAJSLjsWvxTfy1ClPeX80WEx+NcmvUu6aB2jUKno6VOYkYyYk
         dSPnA3SMLRe7I4IK6z4nC5B0xl6pwvaaIJCz+Bufy9NbciY22i1rxisrk1WFZceCcAnC
         JK2n6BWc/nySnx6FWIJxg1Pbku/CTI7bFlW5LEESFBMtTYDzMZWzTTRigEas4HXlncK3
         iMPa4HYV1njYl7BA2F1sEjxlBLrezVHiqydCQTaRchCCS0RX29/zF9cewuse9/6UILiR
         bVxluja7QBaSJWq69PGt9tdi6eeWNA3DJohwm3ImLimqyP1P4St6T45+UO9keaime5t1
         YYFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795088763; x=1795693563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P0gDbpRYwXjrOiNSKkytD4TVz1o4q/cXx/36JYdIpmc=;
        b=omoFv5TaAjiVEk+LvHojjxJyx7KjV249xD4/19uxDYTeGcfu9cKymy675OU3TluVRZ
         9PtxG3n+lacHEG3Lo1DSCqbIIvmSGUwSvd9DTtqSpkARzqtufP/3Vn1aFhZUtbVaUpsx
         JjUOIzmZFPr07qUelpvfYe0Um+7NDfwSip7z0L67+H1lKqXKt9qR1Dx7P3tup6qyXQ78
         MCODBJvWS03qNXlI1scUi7E3rf7lzyARJ1vEACcY4+ScfVbly3JX+fmJT3Df5AAVKPlG
         FypCeZRQkd17/NvuBFnRmvjVckiRxM/sl58oFbm58ktBArycavbuK8ceruJGJcUkBzYr
         CnXA==
X-Gm-Message-State: APuU4Z/9i9zlgcceMpbQZjMrWg8C8YW1CD8fq4CLzfLHT3DmyaL/CVTS
	mXXGbNKaQotQI6tAkyFe3o7sV8HP1+JL+rLcnr/FWoiMCmgg4/b2S52tWS/xiU5+IXCVT3MFrB2
	jYC8f5EE0jTuV6nuxXS8LpOknF0M02CIe7Xn9KeLC0LYIK/puuv0i8FBM24/je/W5hQ==
X-Gm-Gg: AZFdTZd5L/LPSQJj8V3bmVcLtlSCco/1Q6AhxstpCSkJNXN5Z4anSxL3fMYenAnwE1s
	vjSki9SnvpVW7LU/Ap+ZutzWFniD640LbvW1RqcPhDFPSrcWkDkEwPLSWdYm2Lu6xhpXYQn4Hqd
	Ji6XB+BR+bfg3VsoHlLqLWqVjf704ievepipfKR1IE3+H7eJRMaQx5MTkXay/RRQEdJZBDdenlL
	em2vsnMAzMii3ezKzIu27iEQA4uu4Bx1se9Q9kmbejc3eWZRB0xdQiTGfTkek774BAN8VuGyb5X
	+yvPQaVpN9UJAImbBkTex3J7ufkjghat3NQIhqDUK44SHBTLigCk0lUftX5cVUBDNf30PiHs3uk
	oX2zQkdY0YmPS0PMopr1VyxFtf5JEdxYOqlDJzT5wrbPnlgcDFlugwCMWG356WquRRGkmIXWrTC
	BooK3nKuE=
X-Received: by 2002:a17:90b:53cf:b0:3a4:ba6e:65c9 with SMTP id 98e67ed59e1d1-3b3d07e395bmr4885579a91.59.1795088763470;
        Thu, 19 Nov 2026 03:46:03 -0800 (PST)
X-Received: by 2002:a17:90b:53cf:b0:3a4:ba6e:65c9 with SMTP id 98e67ed59e1d1-3b3d07e395bmr4885554a91.59.1795088762992;
        Thu, 19 Nov 2026 03:46:02 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecbd0bsm2397030a91.15.2026.11.19.03.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 03:46:02 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 17:15:30 +0530
Subject: [PATCH v3 1/4] media: iris: Fix runtime PM reference imbalance on
 failed resume
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
Message-Id: <20261119-iris-handle-unbind-v3-1-52d467a13907@oss.qualcomm.com>
References: <20261119-iris-handle-unbind-v3-0-52d467a13907@oss.qualcomm.com>
In-Reply-To: <20261119-iris-handle-unbind-v3-0-52d467a13907@oss.qualcomm.com>
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
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795088753; l=1181;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=uA1DrNWOT1xdT5YBsROagD86Vd8Mo/RENc8c8k3PgK4=;
 b=IsI5L6EEjV4Qdz6e2J2ZakNsX1pWElNbeF15477Ach5NNo61xxfxA3cpi/ZZ1aB4xMWaK3yxt
 UVJrOvLNc9KD11ApcJcsvtR8WVLf2iGJ7BbmrZcEosCsxYQOfEPOky/
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=ef+o7LEH c=1 sm=1 tr=0 ts=6afee17c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ohPow3cFOKvdjjdYMLAA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA0NiBTYWx0ZWRfX0sAE/h9CuvHF
 ABRI/AXSEs39uoP10q9Ii/ZO1PFBUOgwP/McNmWpWQ/uYK9NXjqfRVXnhR4A6YZbYYe/3pPkutx
 297VUiLinwZz2jIo6Frnu84dLBDyu0HjqH9jb+LBBRSyl5UQWda0mxmtzJJoWP6KehmFLmBveTk
 fyFuHzQCJArEnwnvD3OVyIOpBz2cmKER6fs1V5ThmoC0mx/LvXU6PuuAilS0YQpwlazgx9EyJdP
 JVNGCG+0h0N5kkAXPVhUdOLvxDJMLmDCrGr+JoWrFS0VE4nwYFRJT2/F+Dl6D8vWLY8Mqb+N382
 fbqwd3R08i6/QjB7bYLSYM0+drAwnFBt6uLif+NLEZanOrTmE3ZIbaD7LYKAwul7jLNdjmJSCAi
 z+Ie4EqAuicLtJelL4dzRCcJ1AA3PtMV1XidoK1twsDiMVdztCFwjE9tWY0XlQHejT3GQeHdn4z
 k1Uh6Uj86fyRRekx9fg==
X-Proofpoint-ORIG-GUID: PU3CqvOh7lnTQqGN5D0TkKxq_pPgkQCr
X-Proofpoint-GUID: PU3CqvOh7lnTQqGN5D0TkKxq_pPgkQCr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA0NiBTYWx0ZWRfX8hhqOUJdS+Wj
 nOIP3L++v3hSG36rJlWS4AiydNfYnKWnp9B9a8cawvBntRq9cPst8/q9g87CLTwLLzlniPoBnpY
 BSD7shtGo6A0L2whg08T9bpcLsfgX+Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190046

pm_runtime_resume_and_get() drops its usage count when the resume
fails. iris_hfi_queue_cmd_write() dropped it a second time on that
path, resulting in a runtime PM usage count underflow warning:

  qcom-iris aa00000.video-codec: Runtime PM usage count underflow!

Fixes: bb8a95aa038e ("media: iris: implement power management")
Cc: stable@vger.kernel.org
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_queue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.c b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
index bf6db23b53e21..545bbe75e1740 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
@@ -132,7 +132,7 @@ int iris_hfi_queue_cmd_write(struct iris_core *core, void *pkt, u32 pkt_size)
 
 	ret = pm_runtime_resume_and_get(core->dev);
 	if (ret < 0)
-		goto exit;
+		return ret;
 
 	mutex_lock(&core->lock);
 	ret = iris_hfi_queue_cmd_write_locked(core, pkt, pkt_size);

-- 
2.34.1

