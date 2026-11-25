Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795593611;
	b=rDD5ORamhK1H+UdWQsu2qDY68U3KszDzn+l40d1a7847slKD5EvHr8Rjaaq7QueQdvQo
	 33yVheF1Abn7h5+di8mtj5/m67pGFfzyeeAYF94gMQctMxQkKDTiUiAScsKo/FlnVnIBx
	 TaSZ2uV3heVmiXqIaLfCfiWpw+OXIq5HmZeYv1ons/CgHkUYib7xKD8GgnUz005PZfD40
	 yslACXyc60hHmGFYllWn07Z1K6/CzTaCoIKYOtmsuC9jO8iKGnwViFI0ls7JiepfO2V+z
	 GjFREt+44h6dzF17kBzXMeOMpTCDHoAga3Mha+RBR8qIuy+0B9qaVSZlK0ITygdWnTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593611;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yli3tMIg8YYgE4ChJEz71AeTG3CR/r7eofkCH8Sg/jc=;
	b=WHk/0kGFbkPgxWpM6so6DVDKuKRUYmcur40u0PnPH1Gs1sFsdD3ibMLDVN1jul8triwi
	 PLccRGJQQDEW8Lb0ZiuEzyJ3wbRuagU94+MWngjrlpND6lcP2zt89qKHNObQAZVb70h8z
	 iEsSz288Re2juAjoi/+FMCtUv9dIcZRUIGvab2Txs+QO+eULQ5sjnfTCH96B6U/Fw8wlM
	 SF+tJGi+ofq59YjWOtOyEkHWXUTx9OFzDVaEyzuEcR9E5z/ReGlp0p+YnfAzt7v+E4luy
	 DC45Zbe9KPV6caGaGu1YmGBohSUw/7aTMNqC5aWEMzQ7oGZij/StPIMGqvmnlsX1btA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=fail reason="signature verification failed" header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RTMwH1lY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F26606A32E
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 08:00:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96F26606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RTMwH1lY
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68Z4u300019
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 08:00:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yli3tMIg8YY
	gE4ChJEz71AeTG3CR/r7eofkCH8Sg/jc=; b=RTMwH1lY9MsoGdN2QnMSuTv2bcw
	L8q6DRmrYYJVtKTGsFVNE65QE1u8aji7Fc91nS/6uRWK4CrUtQEk+8XwQ5foatnW
	GeNdUPY4fZS9Wxj8V5aEVLRTDdkF0WhWsCXSz8QZ67kpu4Xrd7aCqLwLCnXjqTmO
	JdkMvy5LowrYMbP3zcDcKAUkZYd2EclJRwWei12UtN6fqBlHvS+VaoLLctq0C8tv
	zING0c6N5UnJBfEOs5bEytpTtYhulJspfTKK46vXOCXOn7GA/sI26Xyqb/TXOv2O
	j5/nVyyz6CrPbA/CCw9h13Njmuw6Sn2YVZR8M3CsQjCQoNrvS0zhJmd/Evg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5n6rsf8n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 08:00:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f6f4fe531so842595385a.0
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 00:00:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795593609; x=1796198409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yli3tMIg8YYgE4ChJEz71AeTG3CR/r7eofkCH8Sg/jc=;
        b=VHO2zzu2+wvIw5x+oYWocGgPwbZy4Th3N0dymdFhF8HU33zACm5PpAxDfriW2jxjtL
         L9NI5s7CCB3Uf1//eGDTfkUKHuhQeP9vp82v5CKQMZ5wYsggzgWMyrrj1b/7j0sDooWw
         YKkE+TyfhVDqzECmh/swPeb6VRktrsrHn/0+Ib+zAXMw5d/DsYGlJT457xDduhP3y3AE
         XCwc2GUsBFCOXFVT/S3kfEjOqEMcwiZkMGT4lZSC0Yd05Arppx6M4xILbTg0D2hyvrxF
         fz+FSwLdnKHcIocXOl0Ldu7bDHecCS8fxkZrwP1Y2reTuYBSIqs+Rt65b4ayMPGP1a4U
         b76w==
X-Forwarded-Encrypted: i=1; AL+hErHF7KXumZ6pSY3y4qZ+13Wj17GeaVBJ4pEddn5kLjdMm36Irq2uYndO8zMV0bB5dAoWioNHrHTgpthtfg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8Tg517ZceW7/2pZu44hwchFdKvL23QmfG2wmpZiNaKEm79rrDw
	jQ6QiKuxEIGjhuc5sCTceOs+uRlcVSevHuPyvg4l/p3EnumgEIrbk3B06nAran1XRjqSGZMAmoz
	w6UdL7aqnPyrD/x+136HhhIGQHPGiCJ2cJlKqlWU2KY2IlRMjbw/G6rd7Qr3Niw5S2MFmcdHFI5
	vQ
X-Gm-Gg: AZFdTZcA0HQvnsuJYpJ+Zq7VKN5I5wZLQwVy/PcRzT0QDT1hpNg9NWT7JimLxrANygB
	b5DRtLBMyZ5pMA5rUN27rtSkFvy8QeSsCtjRIwJTvJdqAvXoLe24DZMRhv1vf+51RPzzzi+5UQR
	GidhmpajN7SxuqO7/iVaPMUkC4K0rmYBOlOJeeP5gBvFMO13ph1lTIeaPVhftB/DNdUPFE1lRcn
	ehuT/Qd7tEtKjUnS5uMZ39j2s43uEkKUYTieQ3oNEQlKmamoZSPmtWARR1Y7BIpCFANKk01linZ
	E/F9ZPS0fwDwKFzh24IsvhcM0FG/Mj4OddXpLUkXDOvFnV4XUcnxIdHMkoKDyDUWzZulGm+8SEG
	L5hRXOJASStliB0we4IPBE5QcPgKSo/G6
X-Received: by 2002:a05:620a:31a3:b0:947:7f9b:f841 with SMTP id af79cd13be357-949ba9864e1mr3058993585a.31.1795593608846;
        Wed, 25 Nov 2026 00:00:08 -0800 (PST)
X-Received: by 2002:a05:620a:31a3:b0:947:7f9b:f841 with SMTP id af79cd13be357-949ba9864e1mr3058990885a.31.1795593608386;
        Wed, 25 Nov 2026 00:00:08 -0800 (PST)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm585912015e9.11.2026.11.25.00.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:00:07 -0800 (PST)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Hitesh Patel <hitesh@ebytelogic.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Subject: [PATCH v2 01/12] media: qcom: camss: csid_gen3: Fix multi-VC buf-done IRQ mask
Date: Wed, 25 Nov 2026 09:59:50 +0200
Message-Id: <20261125080001.2540101-2-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125080001.2540101-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261125080001.2540101-1-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzMSBTYWx0ZWRfX7DtSCHJtvgMd
 ZsR+xGHQvTS8i8YC8VwOkXXe1dUgOnM8KYLMhqhib0NartEF0azFR7Gfi6wLZcuT7SZQNqsD6YF
 JtHo1vqTBaKSPG0VLkz7G2vTecEjVDgWOzAMFwHHSQy4UGOnkTCjb/XZLo9MTuDgUnvaJmcCQgX
 NPFDin5eATcESDTjkk2R18o2gkfjBRtTvLmY54BXfRqAOAvgZVGY3w0Sa8dhurcdwIqKORE4Ouj
 bLsbEr8L15pPaTZGXp5ctTrOrudgCPLK72VZ6RYiljLbllyU+e+8RFGEeBVieEOC4IA+Usj1YMt
 dYDbyylTFFBK0iASOEsLBmfh8iDSfMvvlv4BFou6Wd/qVP+3+zLW9CFp/sEPgfllWkBHY8Mwq7W
 LfqzT6UoFqnECx5LaMG1fY235N32Ft8xUiqKwfuY3bXbLl5BgUmafVdM4yTcBoftlBRstalrddb
 ETQIw9+8R4bKZatu0Ug==
X-Authority-Analysis: v=2.4 cv=Voa2kO2n c=1 sm=1 tr=0 ts=6b069589 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=XpAv_gt5rlBVVRiKzi8A:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: mGQCzJgKgwmaX35tK2OhSAu1UXbT-JGu
X-Proofpoint-ORIG-GUID: mGQCzJgKgwmaX35tK2OhSAu1UXbT-JGu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzMSBTYWx0ZWRfXyMvS3b7UFU66
 EzfFM0/82ZgG0lDYl7RXzVHE+cyJIQcb9lffzeaIMrKqeTJiJ8TZLFOiavXEeVY0cDf3iIlC7k6
 gz2SXxjWBu8WPDTPmecJixXNeArOS7U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250031

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

Csid reset programs CSID_BUF_DONE_IRQ_MASK with a separate write
per enabled VC instead of accumulating the bits.
This change removes the not needed for cycle and write regs
in one pass.

Confirmed on RB8/SA8775P hardware during TPG multi-VC capture
testing.

Fixes: d96fe1808dcc ("media: qcom: camss: Add CSID 780 support")
Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-csid-gen3.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
index 6a538d825f78..231b53d3e44e 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
@@ -339,7 +339,6 @@ static int csid_reset(struct csid_device *csid)
 {
 	unsigned long time;
 	u32 val;
-	int i;
 
 	reinit_completion(&csid->reset_complete);
 
@@ -347,14 +346,14 @@ static int csid_reset(struct csid_device *csid)
 	writel(1, csid->base + CSID_IRQ_CMD);
 	writel(1, csid->base + CSID_TOP_IRQ_MASK);
 
-	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
-		if (csid->phy.en_vc & BIT(i)) {
-			writel(BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i),
-			       csid->base + CSID_BUF_DONE_IRQ_CLEAR);
-			writel(IRQ_CMD_CLEAR, csid->base + CSID_IRQ_CMD);
-			writel(BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i),
-			       csid->base + CSID_BUF_DONE_IRQ_MASK);
-		}
+	if (csid->phy.en_vc) {
+		u32 vc_mask = GENMASK(MSM_CSID_MAX_SRC_STREAMS - 1, 0);
+
+		val = (csid->phy.en_vc & vc_mask) << BUF_DONE_IRQ_STATUS_RDI_OFFSET;
+		writel(val, csid->base + CSID_BUF_DONE_IRQ_CLEAR);
+		writel(IRQ_CMD_CLEAR, csid->base + CSID_IRQ_CMD);
+		writel(val, csid->base + CSID_BUF_DONE_IRQ_MASK);
+	}
 
 	/* preserve registers */
 	val = RST_LOCATION | RST_MODE;
-- 
2.34.1

