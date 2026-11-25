Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795593628;
	b=hE/tBHLhEB0F5psKDPYJM6/GYfbIYehSw9k9mm+BpXzOCdojWv8aSQmsQ/KutPgfrIf0
	 DOSvh1L00MWH4UsNmOZwtzeh5q9JHZhtewgaQljNJv0rTW6ykA6wA2xfuT5i4EhY/FNj5
	 G8+OQdYjUd0I4VFzsNtIgs8YwgwlFdpDzu9bIsTIOiuYHh5osgDXuHbO57n/oE8LisNAH
	 h3nQFen/2pPFqMew+h7v1ltFk2/OSXtm4qErofpl1pC/hCkKG/hBfRtgXqTOk5xf04SCA
	 MROMY9P0f6VjLCdMl0G8D4xaVQit/+y/8TmqMaaXaR6DsxSK+qoTdEzoWhz5Fy26rJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593628;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KnJ4D2byKSqvUlVSKEd0aDJoKvrePMH3zxEo+TVbVxw=;
	b=IgxTd2R5qvO/R5BkkxA+PEtU5nYmp8n0T/Xn4dcjotynEYbpR9e4UHFb8Db1nMpU/WII
	 Z7vDiYK9yCdln/gV/7PkgGb9yvI5lLWlc28JncQXciFUx5OfajPKA/mIloJgv/sV/wMAQ
	 kbqXonNC2mWlBupOIQ7a8mgwLyRFytT8vxQeoQMAZciwBi/gMKjB2ktR6JhEJuJk99Q+6
	 2vN7pPVjIpUMqHuDRmUUBvgVA0yA/SrHBrUy/TCqJOMTuHdIMYyr4aTZTtXDctQfvV6jZ
	 Nq89BwSYy9fXbIPjfYDbkOcmoNpzFVdueT8KwSwfG2nEcKDAtZT+Ka/ksCGscG/+CMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=fail reason="signature verification failed" header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ev6xJXyZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F12D606A32E
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 08:00:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F12D606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ev6xJXyZ
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68YJB3534220
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 08:00:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KnJ4D2byKSq
	vUlVSKEd0aDJoKvrePMH3zxEo+TVbVxw=; b=Ev6xJXyZ6aecoiO1HM5wUNfbmme
	hU7apthnajHIz1fmbUpbjcuO1MneckKvv8Mm6VF1q0Jzm9nGLIaMmZAlWvUg5Uq6
	PZDdeYtDvfbIv1rRWzZXplYT2KF/yodJgs/FhEBnMrftEsWFJzeBnF/pJ9gQffBV
	Y8Wt+BRxVykjZs1bq/cka0l13+T0e1hefWgDJUXd+cYjCcvXoSLMnfTMos91y2S7
	itKAbbzyy8RW1sNp5M1qR1LebddLQHZOJtboDn5KBTk/E5tW/nLyHJwHqWGS37wO
	armtdl1wVHSk4RPjkO6Jx8ACevlWJ18bxxMtm+a0QEMdSgeNBDM6jhwH1yA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mqbhhq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 08:00:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94960131befso808835985a.0
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 00:00:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795593627; x=1796198427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KnJ4D2byKSqvUlVSKEd0aDJoKvrePMH3zxEo+TVbVxw=;
        b=GDeQA+McFV4p0KGxj8f/h9uX2FlXOIC5foezuTfC3Ugw51h11ZoLaEAR0uBFgLO9hy
         aHGTrMDb5Xw7BBzjUaUtPM1eJm2RdsmyUEnyNlDtHfnl3Ott0J2uThaFaUqUGN154brE
         xELPuse5FODRQJLDz4uaw61fP5Yo9Q8jIXHbUCAOTKmq/kGt0vwTvQCKtCLPWvHJ9bvF
         oTQUWHc+nyrQ6CW02dT0MbWjPjba43a6qqHUZRnaQ6wLf9rBoHVscuw4ER9eA8ccQfDn
         rVk4XEyPlBnc1ZSs/Wvm3t+qVQXffisXyioJ+x3qfuunr5X4jnxdS7cuYvb8NHY/GXnh
         He2w==
X-Forwarded-Encrypted: i=1; AL+hErF97PApe4Vv1TvytJBOGtlHR/UZuOKASkBvmrGEqhAfidrt2logIv6SIW/v51kSptiSeow22rCMuu7a/Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z+vsHOTyeaJU2EgWZDCVJU/aVU2Rn3dylIBJhp1/cDNDEKjTwGn
	V/DCUlfwzxxY98ng0rSuRneowuz53hh+TnEt07mwH6PfDIwvKPSy/bee3N/cLv9m7nG3bdYOHqw
	oxybEAlUteWA4kMDdd/3QTIClhhBrIO/4fF4DB49NCWt0FBzysx3vw44O1f5q83HG1g==
X-Gm-Gg: AZFdTZdXy+yQD3E0VPnh6Sy7nDy1RKsNcWe2Zr/n5BVzCJd2sEzZBCQeJOAC73hNKln
	cwnpzFCK1edfp8D4ttXnn1Gwdc4Yt0zJ45e9MJXNEf8czAnNMOygpB+miKYOdqdUGs7auedptpM
	tpiQbMU34AJGZXSrKZJwtU+kwj9EnOyMOz6rrt0p6B5H5wYPnUgtc7tskjtUESMzK53iwuQP3OO
	tC64Grin9eR6cTmz6IvgAvDrGiSI1ow3G1ZR7U4tyB20ho9H4EY3YXTmR0CvjR+tRXfcpU+i8DS
	GOoV8YzDRua6mt03+Nl7+mgul+8g3RXC9inMZaU7CyxyI5hTygXKAf/0Il430oZ3oHq/K0ugA/c
	GA1YpKb4p3/OKF3of8HLSrKBs3Lj8HS2L
X-Received: by 2002:a05:620a:5394:10b0:949:bda2:194d with SMTP id af79cd13be357-949bda21c95mr2062740885a.83.1795593626663;
        Wed, 25 Nov 2026 00:00:26 -0800 (PST)
X-Received: by 2002:a05:620a:5394:10b0:949:bda2:194d with SMTP id af79cd13be357-949bda21c95mr2062728585a.83.1795593625623;
        Wed, 25 Nov 2026 00:00:25 -0800 (PST)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm585912015e9.11.2026.11.25.00.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:00:24 -0800 (PST)
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
Subject: [PATCH v2 11/12] media: qcom: camss: Enable streams API on SA8775P
Date: Wed, 25 Nov 2026 10:00:00 +0200
Message-Id: <20261125080001.2540101-12-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzMSBTYWx0ZWRfX5gek8yGkbf0F
 tbD9F4oaRcfUm3HJrT4uEJbf2KoFyhJrg0kgrKmvPGq/Dm6aLRSJ5H/R+0+C465RHE9jLm3lDi0
 6Bd3j6xCME8gb9gMK3PrCPpkCiq6+v8=
X-Authority-Analysis: v=2.4 cv=Bb9NQbt2 c=1 sm=1 tr=0 ts=6b06959b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=onitAmIIXR4QNx4LYmwA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzMSBTYWx0ZWRfX/8EB3oSCqB95
 vT7Erq3xzjBJAwliI/uY9/yMf5SxZKM1MIUs3A+5wnM1GX/EKfpfl8L8McYRkotBSchchggjmMw
 7tIbSmEuQ6329N0e0hGhUk0USb4LyUE2uEnYhBHEusIw9R9ybqbtHlVOSNX0H1Dk6KBNNzAWZYZ
 Py8cLqG0CFuwU7mMQeYKh4oLVj8AAzZ41+NjNOPvRMdwiP9QAZYSXnYxXn8fgeNefUJbQcD/wJM
 mhSlxa8hKWZ6tcvGGvFpd52Au41tUgvBrmxCviwinTbRMkgEyIeTEruDRAfcjLvpaQJAMteb0/2
 4sxpvMUDU7i9lzVbZH+hZeGqHUGQHZ2+tj8ZtP/Xr8bWQD2iyyrCgK7bDStkrjCijpehRs2p1a8
 OpJnoPyDDNPYdfN/VXUfMsew9gV6sirZsOgdwnM0CI4v7BOlgx4wEhpjIQFoX8LzjTJMQ0cYO0e
 JMin735cJA+sVGxBJJA==
X-Proofpoint-ORIG-GUID: nMH15v11jHAfu8XK9JJ_KfFlCXCQIj6Z
X-Proofpoint-GUID: nMH15v11jHAfu8XK9JJ_KfFlCXCQIj6Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250031

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

Set streams_enable on sa8775p_resources so CSIPHY, CSID, and VFE
register their streams-API subdev ops and probe with
V4L2_SUBDEV_FL_STREAMS instead of the legacy .s_stream() path, same
as already done for SM8250.

Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 77fa80dd79c4..e444c29fe847 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5719,6 +5719,7 @@ static const struct camss_resources sa8775p_resources = {
 	.csid_num = ARRAY_SIZE(csid_res_8775p),
 	.vfe_num = ARRAY_SIZE(vfe_res_8775p),
 	.icc_path_num = ARRAY_SIZE(icc_res_sa8775p),
+	.streams_enable = true,
 };
 
 static const struct camss_resources sdm660_resources = {
-- 
2.34.1

