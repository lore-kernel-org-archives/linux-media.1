Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793972694;
	b=IQpz1msX8El4X2SxiUKlrVWXKMzz99UvTpBRYFAeOXjrUctN/NPv8xVfEKLmdFpjZnV1
	 zYcV5DS++R9kHWKprhbt6IquOJjqkSCcBiyULilj+jGr9UHbVbeGnRkXvUzPaB+aBqVMg
	 M7xXeu0CWRJkyn6SUTxhPCUQIstAkNcfYhS/vxcsMG+jdXIZRbwlc6+PPuLmQzd+8JlH4
	 YNf+zNiYtGhal1WfG70QMTGEHCrnCLzw2pTOCEpxMwnEHTHHiQj9NQQFtjrSigHX3nkp1
	 rokpoItS1umTktwK3nQaO9N8+o8RSOebGKEQ87FDj/HhSLRdAykK5M+Y2ElCpBiQ5Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793972694;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KFMOrkADVP+8BGFWWz5DwK17BKn+/vVaPVTQ4G5cEjo=;
	b=I1u5U/eY1kSBUd5qgn0w4KERRGDd4qTyMgUUT0ASo+GKaqgJb5g6sCRzHzQvbfaga61p
	 1NR22708aLmI6SNlXrwAvjyZnmfxIMl/LFZyPPnRK3VytbQ7QgklSanw0yvNCFsx+adjv
	 0tFn33LYw7x+KMC30TnRYZDctIwMW7W3WP6HXHHysFmWmDt6gyLilfrei3BtelfYMrdPd
	 oUKIYMrKhBuG9w/IkFkxC6UCW6dGP6zEbV8fyX8dO130oKgh0x/POx3OUBBUP1wztN/yG
	 H5CNjgPk1S2FN/4pTQ90AoRn2VT3vd989ikXspRfduBiM4iwtBnFuBR8pl1T3sWCyrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kWjrqTBg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cdUHqTsg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63608608360C
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 13:44:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63608608360C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kWjrqTBg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cdUHqTsg
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6AP4XH2731797
	for <linux-media@vger.kernel.org>; Fri, 6 Nov 2026 13:44:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KFMOrkADVP+8BGFWWz5DwK17BKn+/vVaPVTQ4G5cEjo=; b=kWjrqTBgogdaHeUL
	sEZfG7dvzXh3zIWl1p/IilIITI1lE7uLTWgz38momuwDYjDjNXzWWyCPDeSp+AOk
	lQvLWzgGYr3ZJW1UidMfrHgtGODYKv+R7WxX+Y7yqAfDuZtEk5wI8Vp8cz0bPL59
	wDP0h/W0QGeiTO9KWVskOGjQxdP8obWIhc9g2tNK+Wq91BEPCbljudWYvwPKyU9H
	kHAG6nBiVx9/oeVnBbJJsxpk2aaBn0jOmLBsjXEvkrj4uPcVE0f35UF45jELtkhh
	pxpDZKp5xFZI6aaqyvbXInPncRgbseb2YszsBVse7pPGRTnkNCYjEuy+AOOHVqhw
	UcdvFA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9b27u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 13:44:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93caf6c528aso132663485a.0
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 05:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793972693; x=1794577493; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KFMOrkADVP+8BGFWWz5DwK17BKn+/vVaPVTQ4G5cEjo=;
        b=cdUHqTsgnkgbCxjtfGyIRIBlscQRXr/4VETE6SyX3VVINGuvsYigfINOQ3G/DDwqaK
         olbC7j1vcAb8z+bIqOp1T/WZhsRu6lC0FGjisIwTtlkz7kR8PhuFXj7jhe5Guqle272/
         z7ofSlhx/bMFsSp0+ideQJcx8TXHfFw9ccXTy3+TKzCZShBL96T8XV+Y9CGgq36iok7i
         gQp07OXHHCQMNgeIeWLe5GUUMK/lsbc7NbEdlwUbqDuBmEw4sAvHI8xXKreLPW8Sp4W3
         EylgcckOKfl2NmifOGuo7C18xK3qW0dbxwh17x3pPvsN9ea3fNeHOf6EGwF+UYWYz+C1
         Ud/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793972693; x=1794577493;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KFMOrkADVP+8BGFWWz5DwK17BKn+/vVaPVTQ4G5cEjo=;
        b=doSoQd8Qm5qO4pFxLc3Tq0XLD82LQYl+XgJvwLaKFBoGxza2f+OoywTxx/lojpPjwo
         6N7Cn6HfHu0DEfXpWTLDOrJk8g7257fOtvtU1B/aaZBIzoN7ek2TahAEEaj0GWChCw7a
         d7B6DE4umcbR8/O4vBtT7/jobZl/Jj0t1m5AlQEBf1Mj94dLSIvd15x7DdHXWkSq24kU
         iXbGy4kRCapjGVFoVOJJFeDjbQXUioRouo13G71thV1Hh7uqsIyLOo8TN5Fe6wiCkmM4
         xklXcaZdBoxJUxnw6eX20mHhdg+mNSZCckE/9cwEeRf/l4o3LTPmBWUJjS//+FVhMCKM
         +TKQ==
X-Forwarded-Encrypted: i=1; AKwUvBwT7g//T8SNxT84Lp1IyHBeqUUn7BreOVYoPvw1QA8nzTDhNsoM3KASuI42jVpQqiWqQZs2kjXm/yBl+w==@vger.kernel.org
X-Gm-Message-State: APuU4Z9j21j7G+1+paUrkFMzecy7an9VNZB3g/vy3ZQILOsOhH6DRRUf
	G0bXDsu/INfawDegPYPJ8OYfFA0WU92JNgKfoIobXHvrsVNjNhWYKwOp3qTa6g004EklOfktfmf
	v/PvddPLf4kTakaiktpuBoh03UHTCiaiAIX86hvSdVIgBQSWnDlRhZvZiLjwnKnZj6Q==
X-Gm-Gg: AYBFou20mqGKFrwEYtkGvs4uTBc3LIZ9/D0/i0TEm3Gt6iItaM6k/lUt3mrjkVR/whJ
	S9tfC+1t0xBFgAqARAuWoura9UjxGXXDW/zthRMQqTQ5EO3U8CEz95l/BVJqKA09J+6Uj9Shi/K
	Q4KzcTEtNeDzgOBD6to6mp9atsyr+Y26LNJG0TaBzxaRLvBtkQVDyjPxgXTK+bRjpRVa/t64PJn
	quWub/nEjXNHcrqW1xoIb6sXNH1GT/gk9HjF/q/yhshDacXxjdS0PhN4aeYWcwvhVdzYpkSJCTS
	/CLyZd6jEinLOEBg9P17dhkriI96T5tVaLcOakDTbxhdLi4JUsLfil2jpK+VsgR4vZaGblKofZq
	UqEIUgiUCb6uBd4khyu4JaHvIZB6sHgi2d+seSgugdzhefHsV0NWu8VzTD34Ppqn71LnYuQnd+8
	mhVactFSrJysu8NAWhmCZQkh3PcYAravANJRCB1LYB4xZkCExrIPiB3cPEZfNyCA==
X-Received: by 2002:a05:620a:4107:b0:93e:d364:c9ee with SMTP id af79cd13be357-945f35650e8mr365627085a.74.1793972692541;
        Fri, 06 Nov 2026 05:44:52 -0800 (PST)
X-Received: by 2002:a05:620a:4107:b0:93e:d364:c9ee with SMTP id af79cd13be357-945f35650e8mr365622185a.74.1793972692010;
        Fri, 06 Nov 2026 05:44:52 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c003055a5csm382747e87.13.2026.11.06.05.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:44:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 15:44:14 +0200
Subject: [PATCH v2 8/8] media: qcom: iris: describe QC10C as P030 (TP10)
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
Message-Id: <20261106-ubwc-format-docs-v2-8-82949f88f030@oss.qualcomm.com>
References: <20261106-ubwc-format-docs-v2-0-82949f88f030@oss.qualcomm.com>
In-Reply-To: <20261106-ubwc-format-docs-v2-0-82949f88f030@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>, linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Robert Mader <robert.mader@collabora.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1055;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=iqfuEamj2XlYNE5hnAH8AT8Abj9VyJ9jbobRw0cnh4U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq7dm+CuAs9qhMdIEzhgPgtp3QrLIHoNoaQQRqo
 5AS3EfM2waJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCau3ZvgAKCRCLPIo+Aiko
 1dACB/9wA5t9MLN7WDxdbjgtqULBKGm0SpbExAmy9p6mSMbiTO8Le6urnKTjbKIOZ7ASp+GT6Xb
 9tp9oF3nSmHKUuPJVN62rnCYy/aCCQf6kQNRbs+DGOtdl2JYO5oAz2be+16k2a4HQ4jYknMmt6d
 jWUmU94ZXRhvL+VmecHbdAomLNoe0edTG1B2hGpkrdCqOjliSumqwgR3VnadosCpLd5yUZRsHfB
 QDmfQpLALm+DQiBohVvSnl3WAKBEoE/uzWuUzeQqwKaAh5ST8z5n92RMp49LL+feneDBClJ0+F3
 H6QXQd0qaxqniymZG2q+iw8NRfjarePkUshiri/P0SLz5Rtu
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: liX7xC2EGjTw7Gb6M-g_TebGY0gvms3z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1NCBTYWx0ZWRfX56DaH3jJGq+n
 qaNS0Ns0hh4RChxKuhJtzgP3ZPel853XTqdtBxMaK950JDGhK7Bwj3XPGoxDY+nufbEE5FoevO7
 RztOiYbbv8WBgQYzJiqFALN1abqnlh67QhilV6J2fpYxROyQfRb804AU5G5H/Fb0dz3RnOeqS9p
 MQZQ0WIz88orDT36XzqOiu3o7fkBgaW09BaZe1/vEksAP0/PqvwYaZMrPzaWRKxsbTwIZ8fQ8FT
 xLuIgOezXouVx+f84QBrBgy3o0R8zZB6jICvm0qUjV2k+ofoU8UOH4YhlgvAkKZr/YXgJy+CdZd
 qVly628OjraKMrNnehx1FyPOn5p75VEPV3+P9PdI7XYkTDUMEOzczCKQSdDywICvb+IyTr84mNq
 mnZHC/npqDHPJ6fvp/HYY6jiDj5ElUrrnd3CbV2PNXWTRX0yJaKCXx2nbGOEi/3rrmdYXj++clg
 /3NblXt5ZizKWq7Zmog==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1NCBTYWx0ZWRfX5ZqqMF9m98CT
 E8pZiWeiosNx/CvacBHpluh0gBp97dZ32AyMrEDA/GEQqSZsIgMHvGlImRJySXt2JcxBsQ2+2NK
 MuR4JtLKDbEYRBMe+s1Pw5aZPM+SIHs=
X-Authority-Analysis: v=2.4 cv=WMzqzXsR c=1 sm=1 tr=0 ts=6aedd9d5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=w2mF-G9HTFYObF59u-MA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: liX7xC2EGjTw7Gb6M-g_TebGY0gvms3z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060054

The comment describing the QC10C buffer layout calls it a compressed
P010. It is not: P010 stores each sample in 16 bits, QC10C packs three
10-bit samples in each 32-bit word, which is P030 (TP10) and what the
stride computed below (width * 4 / 3) assumes. Name the format correctly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index eb8de60c1177..19a984d2ff3b 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -266,7 +266,7 @@ static u32 iris_yuv_buffer_size_qc08c(struct iris_inst *inst)
 
 /*
  * QC10C:
- * UBWC-compressed format for P010.
+ * UBWC-compressed P030 (TP10), YUV 4:2:0, three 10 bit samples in 32 bits.
  * Contains 4 planes in the following order -
  * (A) Y_Meta_Plane
  * (B) Y_UBWC_Plane

-- 
2.47.3

