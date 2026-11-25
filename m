Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795593626;
	b=k521JYYAoQ/1p+smpc7e4LIHXBNTjL+X0LpTBQFWoA9GQaMDYfUA6jpDoWSzKryVAzR+
	 Mv5qt/qk2Ex7VYYQqwEc8cQPymvBW2d8cd4vNlM+3Whh6RmO+LmrTIcZ6bk9kvgSh7/zr
	 D5Q7mjt1u/wslSDqw9jIbnGjUntUncBM7zxqso0QjMY29rPrMPDqqEmc42k5cwh3uBjho
	 cSJQgbuM0BSDxDsiPKr3L+3j09Mm2N4dIUFuZGllD1wDgCrMWP2nd34ihpnHhyEcvADek
	 ny83A6AAjK/zRGTI/pYBZQslWIOeDH6nh2cR80tbTWryyutOqbBHyehFzKg/IWjZV6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593626;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OtpOi8BdB3iXAyuGSzLZNPeux0EufLwrclJTArwQJo4=;
	b=TAHCqJ61SFDCAcDlmiuIlNk+AMjSDS5bsramiNE5M5+hM02zSSAX09+MKfEG8TVcb3bk
	 GtddJLxqTS9DRGMvWhj1m1IcIlUIuH7tgT/9A3jDLpV4PDcC3LVLiOcT5iiY0xNgkN3jM
	 /yTx/56kouPzdZqMdw8kPSbFgSsz8mDlj/stbM2lPbQk76Fs8X30LpoCfnkMLC+IoThD9
	 QPHJ6tQ0nrzFvA6N2GXK4RZ8N+jmb/oSbNEIxz01qyqpUhAvh7C0qj9EVHRMgUWlcvdMX
	 rfWQX/DSYa9lAGH0KOr0h9JN6EBmNBeURUSvvMYGy5QaL0um2XOumdCuYynM6iXsPFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=fail reason="signature verification failed" header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZbtfpBRN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8713560A2630
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 08:00:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8713560A2630
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZbtfpBRN
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP698rm3114990
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 08:00:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OtpOi8BdB3i
	XAyuGSzLZNPeux0EufLwrclJTArwQJo4=; b=ZbtfpBRNx0JTmO/nhCCGVgKbw/n
	1Jkh016yRjwVAxariRUHy85DybEGheo3Ysf3V26fBtL3qHYxowVTeVF06aKcwZv8
	yC/t/zD1CAqbzgZ655nQ4A27fUovem4B289ANuclkUgCAemzjZmFBbbQ3j9q0lKH
	VDuPWUFk4O8vuwDuT9P0fQgRTlGHb1lAMFP5L3Bu7YAaUtT96hvnqa1KDGhrbRDT
	Hye5NU2X2orV7IJzNsj2saPCIb0gHyT9/raNLSyjNGjwGIq/PqEPpzt9jCr4P6Gs
	+CmhidJuNJDJyBoo9g2KpAvVCdwSzR8nbMD9INcR6eOPkoMcdQ5Je++9YPA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gnsadkd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 08:00:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9495a1f5e47so857241385a.1
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 00:00:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795593625; x=1796198425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OtpOi8BdB3iXAyuGSzLZNPeux0EufLwrclJTArwQJo4=;
        b=pLYelHxc/MdMsp+rq2NOG1x2DkQG9gGeVyt8noj7JUOdiHia8524+E+v5vjPgB+ES5
         U6gKF6Tp5YeiZkjj0bKrairYbsHdEJfq+svjH/SOmnkzaqIFj7hwpkhsRZvRbqb8pJeT
         miVpeBbPyEFCU9qDtFLKWmy/IXXOSP2X9aR8LeHscWs492rfrROTzS6a1fbFL6rSyE0y
         D5+U7L8Dc2nAeg3MbLKuLCsmjf67bpce/p5LC5L+wDiJHHprVIA9E8/f4DD23A7xmDLz
         /FI9ikmkSrJDdnZTKFG3WaJ+IaceGxCZdhClOI/Y+cYJUfZmpPnk2N1KHKMbGQbz0J+K
         alLg==
X-Forwarded-Encrypted: i=1; AL+hErF3NY0JT+uofb8uXsxOZaiUXz4qFNqDlEHYX/kNhiH17HVGxGrAGNXqVPuYQNYVH+W+U1u6zjVhNa9ebg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8e8F/OcIdv9bqzv+RgVpLHeTSCTvJ5++/+A8eQ8oMmEdI/7FZ9
	59APb4VFIYHIph4CLVAqZJVvjWjqrZaGP3PbOKtyXf/sSV1A3hcwHR8xj3rz9Teu2DgabJp1oDj
	YZc/PazEFVVH/LvwAx//RjCHEsJO6GjPwLsFWPIU8HoX9dQDugNyeU+h329RxgmRdgQ==
X-Gm-Gg: AZFdTZeXwaZkba+ukOODCa/7x3s6yI86/+sODfHhKDhs2DyeiUCDVRc58fL0PgeQUoY
	W6gXw7tGcXTKs2BSkU+RST6l+YqHY/oQXjteDyg98cG7Sj8mUFh61kaPHXWhZrH2lUZz1x7BdEp
	7wpFXMy9l9TVubCxUWoMh0m9hmBh4vz4kGs7zP8q0kGh6l34qTthY2Y3TsqNFZGbYs3ztCGMcAC
	3LWtRTmo7stQgS0Y01WvLRz9zM1C8F2jDLbIuvtENaZPw5BsYBg+5rIREcS9yfhma4N4WLE+7YP
	6IdC3JbdECox5g2BfWF8OiV9WmAG1qc0OdwIxWMTlAF8Ph+u+6iAaiDo+Fzfib1WomQg9VcuPtx
	/P6aWKvnX1fwtzQUDA+uFS47tNfPCKcQK
X-Received: by 2002:a05:620a:f10:b0:949:5ee9:ab27 with SMTP id af79cd13be357-949bab4dee9mr2883044485a.83.1795593624357;
        Wed, 25 Nov 2026 00:00:24 -0800 (PST)
X-Received: by 2002:a05:620a:f10:b0:949:5ee9:ab27 with SMTP id af79cd13be357-949bab4dee9mr2883034085a.83.1795593623848;
        Wed, 25 Nov 2026 00:00:23 -0800 (PST)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm585912015e9.11.2026.11.25.00.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:00:23 -0800 (PST)
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
Subject: [PATCH v2 10/12] media: qcom: camss: Enable streams API on SM8250
Date: Wed, 25 Nov 2026 09:59:59 +0200
Message-Id: <20261125080001.2540101-11-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-GUID: 5PhQwgH5U_23IzovYIOQt2wwtDFbt1R_
X-Authority-Analysis: v=2.4 cv=G+SJgNk5 c=1 sm=1 tr=0 ts=6b06959a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=onitAmIIXR4QNx4LYmwA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzMSBTYWx0ZWRfXyKCYjejn7SH+
 nIuv2Jftixd+nY1PY9q9rse36I4fTDdCCIa0U2l+/trqtiXKxD684uqdMuwKAjYr97qyk4AlZ+3
 BnqBxhBG7ivAoJL/kvdjbcAFy1tLRfU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzMSBTYWx0ZWRfX1IqchFKKWgIC
 uxFjTRzJZHOb2ZdksKZMtEA555r5GtXmDA0dnaXQR58jjEpwkUbt9Fq3hhaiZJmqIEf/xHWSq6t
 4L3qOh6hfQEdd3YIN7x7B4U860TeClfJWjj4piV/x05z4LyfTScvLrHJEl5UHDJDSf0vIPgPzW9
 fZw0umPgwZL0fLxtvpR0ZNmqbuL5dp3BA164tJ+uWp1UMqHRGfMmzGzrZqnAy972PuXd64I666g
 HfpA0pk1/A6TN6UaSR2wReETxw0ar4PVNf0cJGirsbqr0zwtxCiUX4ohvu3BMas5ARy7NW4M47d
 5+6nUCcHMi6Pc6NukyCf44IEhlVQUoIi5I5pQ7lFNwdYhI8g65LJAq15tKE0WZeg2uTsa0hZx6D
 E7Ydqo5PJiu/F+BMuIDaiZHQiB3cwwdlZH90nQlqTxK2mXJh9trLhQXzShUT7tl/C8DeNcDMCN4
 sCEi1OMtLPqN7fki2Ew==
X-Proofpoint-ORIG-GUID: 5PhQwgH5U_23IzovYIOQt2wwtDFbt1R_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250031

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

Set streams_enable on sm8250_resources so CSIPHY, CSID, and VFE
register their streams-API subdev ops and probe with
V4L2_SUBDEV_FL_STREAMS instead of the legacy .s_stream() path.

Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index ac12960264ad..77fa80dd79c4 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5790,6 +5790,7 @@ static const struct camss_resources sm8250_resources = {
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8250),
 	.csid_num = ARRAY_SIZE(csid_res_8250),
 	.vfe_num = ARRAY_SIZE(vfe_res_8250),
+	.streams_enable = true,
 };
 
 static const struct camss_resources sc8280xp_resources = {
-- 
2.34.1

