Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792898252;
	b=tRegrOua/ThHsHsZVk/goXBXpxloXEUhQ4Bhr5s9PR4r0OZ5qmIqql5QSEj7WRy9XyIv
	 VslrPcW5/ujep1ns0P88Oq3mXla4r3LFHhJ2r4VKEYHY6M4lqrdCraEmldZXWNAL7SQjo
	 471U8TaSYP4mrg3jct1PxAilcGkdmo5w+R1JmlFmZjl/v3rHTXetZ6W389YXV7u+D6VzU
	 OqhfqPXYcLtK26C413sd2zeUa4MxQuSOoqPHqy+lJ/XSKG+kKnJ9BlPwaHc7Uh58xjx21
	 xHLR4DO/dxgAO8rhgS/zZwYUWasTIHQWAVV8HzxPpdRois+xQ9OieB4YIA7jlsgxlqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792898252;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cqDVyaKXq+Dr1Nnq0iNKy30FTmkHBecOrOvcWsTRTNY=;
	b=dVwmw4r18e3ULjFGj3DIaDNhxJgl3wmpNZUmzC5j9Qc6KP72eRxuZwIUfzLcpTi1cePo
	 EEZe06uKyPZ1LX/aCq0RypO3QPb2dwRmQcFW09XDbKedomzhhT2MGA0luJLPGZ4Zd3G/4
	 WkqFAf0LpgBrZn/15Nf6mC8Uh5nLR8CGoyVm4cIIgatS1djUSVHla1CTg/XW142YClazQ
	 Ejnxwa07s8LLAHAkVbRcIjbFfTcpJAcctETfXxGtBtSJa8KsoR2b1w25QT/r5bu2aA/64
	 ucKdbvCUFWlylhK0wa3MCTZeoHVhvTnwpPKSl0FXCPaxFvsGOXnuq6qekpo1L67rpbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P1UHC1Ve;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dJOn0uUW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2F160A3804
	for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 03:17:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE2F160A3804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P1UHC1Ve;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dJOn0uUW
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69P16fRu3584547
	for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 03:17:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cqDVyaKXq+Dr1Nnq0iNKy30FTmkHBecOrOvcWsTRTNY=; b=P1UHC1VebmLt6ZTL
	1Jqz/2iE2BIvp+dVY4Dt9zA5H03AqrVGPgJhnovYdsyEp2xOgN4+ob6DW5vX737J
	4M4S+ZVHq0E5sWtaEEo9lqI8waUYpI2CVjboEuQMDbQaR6tvttMOA1epXoWBNzpf
	W0OTtE6ZCrF9YGAaBY66fdE5slB3+/PaNj3+ha+byHZkBjGxeqb7WPyeJeQacYvQ
	dbLjcZ8V0j6dSrbjXNoUJqXGo62S+QUPngMperhZCq9gLQ0YO94yQJ91T86Kq1ik
	/qf/uHMlLtu3LBV5abzsIJ/kCWLz3dBQQiQlBQvCAx6Dv6fuSOHPvXeqcBm/A5vQ
	kBR9sg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgkp6jdu5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 03:17:30 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3692c5b061bso7399542eec.1
        for <linux-media@vger.kernel.org>; Sat, 24 Oct 2026 20:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792898250; x=1793503050; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cqDVyaKXq+Dr1Nnq0iNKy30FTmkHBecOrOvcWsTRTNY=;
        b=dJOn0uUWLBn/+lRrbYlX+lSc2BjbQS8J0ysvoSiC0/4oEcNf1oN5cYegIHB43TEHoB
         urzoNsDAE9G1+VbvhNUiKd7ZKyxInzXT1zE2hjEcrntpXFDVREPG9HoWghLlZM0RLOtl
         wKLXdxLXZx0sB0NS/opuKh2c3pmMFwJ2c908j/O9IRXA4u0pCeRfru+IjU0Qu53Z2GCE
         6qMcY0bUbhd2WNP+T60pqRmk3sZKuz1XjijlMbtS6Tt/ozoEsStZxx1jqrN+d+Rj/k4D
         g/4TcsVAN+joHuKT7HR+bY0MpIAgwYQJL7qlxdiRpVNc1Uuk0xMAmyWVfsA2uu/PYanb
         CKow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792898250; x=1793503050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cqDVyaKXq+Dr1Nnq0iNKy30FTmkHBecOrOvcWsTRTNY=;
        b=RGDshEKKMdAyqXuB02zR0lH4BodOqbBvY7thaW2mKU1ghpZe/OV6gEFiJncb8g3TCx
         EbxnC8RrwLSpNerrdPv+cTrGyasd6J/n7g1CG0y56BJK83htUc3/IBY5yYbIXrJ0Xil6
         KWpZJ7WBysLppkklQsn20ILAhg0Q/Dv9KlmM/csU3Abl8E6ijPulTGceP+iqTyA/bm+J
         Z92DL8PLJa25nrdvg9yTBZAu6rLYOs/lCTsklpHd8JSSdwDBCqKaEWSQ72AzOkSrVyj+
         K0w9HmZN7IUcSJ8Gl82eQPjs+16p6Ogp4jQ9pYQ0A5TN8SEpl1nDAD+amxSmRZk1xole
         Wa/A==
X-Forwarded-Encrypted: i=1; AKwUvBwBOHgdEN4PHt4W2qAjvMoaFg2GwjWXCfuLN/xyictrb7Ma/sQOfbl9t4UXXBZ3KARnwriV1GA5pRxTaA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIvhzkoy5D0c9JeEt7ziNWt0mpRs4xIVkRsLYPm/Zs3J12D+12i
	ZDsZT9ZYWPCAPLFF2YadSS2KwLQ/HDDqW1DMAY+1FI6btHpdSTjY9Rw8YG830n5uXjL0JUV3Ch+
	nbzYqjv0U3Pdh1bXtQjS7zhHjCQjtQAqdbD0mizPPzhM1A2lokWsZj96jZ01BckTu6r6IS632rw
	==
X-Gm-Gg: AYBFou2nca09bUHm301ux0HY5mZXWjUBffE16xNUzD1d7Rm2DVyHzdGBzthgERSEC5Y
	sVx0I+0nyCItKBNSgFsNfAlh1EryFNjBYw/CKkLW3S5y1Mhm+GBnq6rPm1G05HZmEySZjI5GQlM
	zNgm3gZ3jHOZR2rSRJnjVTCcc7k3lvWOJdoaNbA9/zEs4ieKtdYNkX8d3h/N1abFo7/FnW6A7rK
	2uRmjHFosKOrXxMeobps0s/3JCpB9KasqieqTEdNiy5Ddgjk2zXvRqRXymq69/iIU2rC+9kkhVH
	zfgTTG2waDengC9oWlUwNlh6gaLhvp4Y3gajc8KP3a0TPLp8ifMiN2uo10pHDLQIeLoClb2af9o
	+KGBBlg527xPZ/fQW2g6AWu3yh0pD4e+to0ECodX6y8yqdDMScL3IzpUIE7cbFnt++l4bJrdcik
	ECHfFCu9PxEA==
X-Received: by 2002:a05:7300:ae18:b0:366:f9c2:9b16 with SMTP id 5a478bee46e88-369e8502798mr5254311eec.31.1792898249663;
        Sat, 24 Oct 2026 20:17:29 -0700 (PDT)
X-Received: by 2002:a05:7300:ae18:b0:366:f9c2:9b16 with SMTP id 5a478bee46e88-369e8502798mr5254281eec.31.1792898249063;
        Sat, 24 Oct 2026 20:17:29 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm24133054eec.23.2026.10.24.20.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:17:28 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 20:17:23 -0700
Subject: [PATCH v22 04/14] media: qcom: camss: Add addr_update hooks and
 guard CSID reg_update
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
Message-Id: <20261024-kaanapali-camss-v22-4-7da3ea49c8a1@oss.qualcomm.com>
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
In-Reply-To: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-ORIG-GUID: __bzyhXsxOO4lM5Ndbqz8e86Daa4Nej6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfX5N9iIRrYYE0L
 99D0HfuSnQZ2OUDfmJeJ2RmySu9e14FWl+3+xWY3HCaslRYoPOB0WMa4kakKF6FCJZm0y2FD3FA
 c85BP7DFiPbfWL2RjLZRwqHQBQZFOx4=
X-Proofpoint-GUID: __bzyhXsxOO4lM5Ndbqz8e86Daa4Nej6
X-Authority-Analysis: v=2.4 cv=bq/Zl0ai c=1 sm=1 tr=0 ts=6add74ca cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=8v9F0_qJuxzZnZknmOQA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfX2ldamggsYFXs
 DprzqrS/mxze6gLQ6a6fx4MtZo/PHkKy6dHxW7SiLmzS/SwZiXy9RPRbJUI4FgBFXURPXrOFVbu
 E1EsSwR5gEQJnxAeKafmEJqShigGeY7UB8M+4eM4s7y0sIxkcyRRLMOmNji85DZdTR80Ho+voyo
 tYcCHXPjyhvYoMvEABDmC2kebZtzS+gaKBmzGoKYYtqCmmE1VOAl3erFESKvFCM6vifpTe9wqoN
 mnRhMMP44srMmZxqh/FWtSSYd3IMfT9PK8M0FSEH0vA6++z+w+PFMp1cvDIzqoS8HSijYmjbMX+
 0a9K2+ETCRC9IWkHPO7gb2NPToVF0gf0zEhqUyTjtZN0mtvoIJFtQIfRtd2hJZL3CXgpxvoYk+G
 ME9qvxoW4hShfQBxxPn2OU/GrTGSd1V+Zf7iKxWFt9h6PjtzxN4obfzFvDdeeizVC0Bzqj2MA/U
 GoZvqM80fMbZYb3wMIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610250012

From CSID 680 on, CAMIF was moved into the CSID and the CSID became
responsible for issuing RUP commands. Starting with CSID 980, RUP and
AUP are issued separately, and each command must have its corresponding
SET bit asserted in RUP_AUP_CMD; otherwise, the hardware ignores it.

CSID 980 and newer require a specific stream-on sequence. After the RX
is configured and before the RDI path is enabled, the CSID must first
issue an AUP and then a RUP. A RUP issued before that point would leave
the VFE without a BUF_DONE event. Therefore, once addr_update is set,
the VFE must skip the initial RUP during stream-on.

Add addr_update hooks and camss_addr_update, and make camss_reg_update
handle a missing callback safely. The VFE keeps issuing its initial RUP
during stream-on and behavior is unchanged if nullify addr_update. The
skip takes effect once a generation that sets addr_update is enabled.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid.h |  8 ++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c  |  9 ++++++++-
 drivers/media/platform/qcom/camss/camss-vfe.h  |  3 +++
 drivers/media/platform/qcom/camss/camss.c      | 15 ++++++++++++++-
 drivers/media/platform/qcom/camss/camss.h      |  2 ++
 5 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index 5296b10f6bac..2f7e593defed 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -137,6 +137,14 @@ struct csid_hw_ops {
 	 * @is_clear: Indicate if it is clearing reg update or setting reg update
 	 */
 	void (*reg_update)(struct csid_device *csid, int port_id, bool is_clear);
+
+	/*
+	 * addr_update - latch buffer address update through AUP
+	 * @csid: CSID device
+	 * @port_id: Port id
+	 * @is_clear: Indicate if it is clearing addr update or setting addr update
+	 */
+	void (*addr_update)(struct csid_device *csid, int port_id, bool is_clear);
 };
 
 struct csid_subdev_resources {
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 2680a9914765..4f8867daea4c 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -487,6 +487,8 @@ void vfe_buf_done(struct vfe_device *vfe, int wm)
 		ops->vfe_wm_update(vfe, output->wm_idx[0],
 				   output->buf[index]->addr[0],
 				   line);
+		if (ops->addr_update)
+			ops->addr_update(vfe, line->id);
 		ops->reg_update(vfe, line->id);
 	} else {
 		output->gen2.active_num--;
@@ -525,6 +527,8 @@ int vfe_enable_output_v2(struct vfe_line *line)
 
 	spin_lock_irqsave(&vfe->output_lock, flags);
 
+	if (ops->addr_update_clear)
+		ops->addr_update_clear(vfe, line->id);
 	ops->reg_update_clear(vfe, line->id);
 
 	if (output->state > VFE_OUTPUT_RESERVED) {
@@ -552,7 +556,8 @@ int vfe_enable_output_v2(struct vfe_line *line)
 		output->gen2.active_num++;
 		ops->vfe_wm_update(vfe, output->wm_idx[0],
 				   output->buf[i]->addr[0], line);
-		ops->reg_update(vfe, line->id);
+		if (!ops->addr_update)
+			ops->reg_update(vfe, line->id);
 	}
 
 	spin_unlock_irqrestore(&vfe->output_lock, flags);
@@ -588,6 +593,8 @@ int vfe_queue_buffer_v2(struct camss_video *vid,
 		output->buf[output->gen2.active_num++] = buf;
 		ops->vfe_wm_update(vfe, output->wm_idx[0],
 				   buf->addr[0], line);
+		if (ops->addr_update)
+			ops->addr_update(vfe, line->id);
 		ops->reg_update(vfe, line->id);
 	} else {
 		vfe_buf_add_pending(output, buf);
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index ae9dad353a37..8312e4c91e98 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -99,6 +99,9 @@ struct vfe_line {
 struct vfe_device;
 
 struct vfe_hw_ops {
+	void (*addr_update)(struct vfe_device *vfe, enum vfe_line_id line_id);
+	void (*addr_update_clear)(struct vfe_device *vfe,
+				  enum vfe_line_id line_id);
 	void (*enable_irq)(struct vfe_device *vfe);
 	void (*global_reset)(struct vfe_device *vfe);
 	u32 (*hw_version)(struct vfe_device *vfe);
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index c54185c93a8a..be58a39f4a8b 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5049,7 +5049,20 @@ void camss_reg_update(struct camss *camss, int hw_id, int port_id, bool is_clear
 	if (hw_id < camss->res->csid_num) {
 		csid = &camss->csid[hw_id];
 
-		csid->res->hw_ops->reg_update(csid, port_id, is_clear);
+		if (csid->res->hw_ops->reg_update)
+			csid->res->hw_ops->reg_update(csid, port_id, is_clear);
+	}
+}
+
+void camss_addr_update(struct camss *camss, int hw_id, int port_id, bool is_clear)
+{
+	struct csid_device *csid;
+
+	if (hw_id < camss->res->csid_num) {
+		csid = &camss->csid[hw_id];
+
+		if (csid->res->hw_ops->addr_update)
+			csid->res->hw_ops->addr_update(csid, port_id, is_clear);
 	}
 }
 
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 7dc2fd9f03e0..431afeb381aa 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -182,5 +182,7 @@ void camss_delete(struct camss *camss);
 void camss_buf_done(struct camss *camss, int hw_id, int port_id);
 void camss_reg_update(struct camss *camss, int hw_id,
 		      int port_id, bool is_clear);
+void camss_addr_update(struct camss *camss, int hw_id,
+		       int port_id, bool is_clear);
 
 #endif /* QC_MSM_CAMSS_H */

-- 
2.34.1

