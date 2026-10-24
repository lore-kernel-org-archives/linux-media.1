Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792834846;
	b=G1baqfRr6sG66yd/KeJTD7HAg3SCcvAsZn5X3NgcGC5IDR+glDylsWCV98fdHOOFCwS+
	 wYvL7dxGRbTrNeqwCCQWg2cfESOA+FsXL59BdJ3/qtK00AQf2j5/f/uFVapZr1RR9Iy3d
	 pqiBPyH4Gl3X+6YHfBzfj+0J+9RX2KLejfp141KGwGB+CBBMu5vcOBwqmMindmSSCEnfx
	 DEKiIpkfTql3TzrkJkSSTpEScCsNYA//y1j04m++mq75Ir2Q64VPjsHVzJTRmDPigw2Pa
	 Listw1/gD9Z3KrZtsbIfAaxyoGK9yOTcEVTbkkkVbCaYW92AMhBtMp9HYvOzMm9QIeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792834846;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pd4mEHoCoIS2QzTItq0USzQlU7bNEJz2BTg/cTGqv+I=;
	b=4bzsrzXFm4JxCuGqBprLEpLR8i5Vu7yNBzVkyIaP6jJJ0wcJqjsLKKwXEKQ0gySYE3p8
	 mqrcGko9cR7+4jbSfSjWFC5dlgXecjWVrZ2Vbvd5EY2+hor10VE9AvjYNVbKdxexnZtIP
	 O2MT0dUI/hH8e3xOBCrqAKukCarNeq1xiEh2yVPRtD6FCqjCd4oOr+7j4q0NTuwUqbG71
	 rkxe03/iNxikTFEny+hqPj26cKPBKGFkR70/DSzMSSGEIOgN633/KkMI0Z0WMeUMLe6xs
	 k5Nko/uMvN1xHllkMAOW+9kqUo9R7OYApQ0cxSDd4r3Ryur1cEj1yeOPu0oeI3TZV3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UbJGQHch;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GnwGLVwM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC0F60A2625
	for <linux-media@vger.kernel.org>; Sat, 24 Oct 2026 09:40:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CC0F60A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UbJGQHch;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GnwGLVwM
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69O8nx0Q1706862
	for <linux-media@vger.kernel.org>; Sat, 24 Oct 2026 09:40:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pd4mEHoCoIS
	2QzTItq0USzQlU7bNEJz2BTg/cTGqv+I=; b=UbJGQHch/Jkcy4/t23CmRiCK2Ac
	SSpuxv9XNcoBWBo7US9DhAM1m8RIGyb+a7zYKoZ52Z1VGEgm9MKMmEr3OlGkQ6fg
	Rvy0SnSDdMbj4KRbt8ao2jCy/PhGVEAHCD3t4Po+oOoU0eH7pX3GAXx7L17uxGSX
	fNhIVBc76cfuSYw4OINvIyxiKI9RifKLzM2h2GMrOqh2g3jv2NjRmNInhLVPEDxM
	ZlWns0GrxwuWnVjzyhKQlwdk0ennMJJOmhOvpZlTQVX4J17My+eB7stITF/WHfjt
	ioPUT/abCck/Ak4WQTkhVkW5vNQCF1c1dAIiipRihxdK5e7vSEgZZhf9p+w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgm8xgq6q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 24 Oct 2026 09:40:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9308eafb465so179983085a.2
        for <linux-media@vger.kernel.org>; Sat, 24 Oct 2026 02:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792834845; x=1793439645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pd4mEHoCoIS2QzTItq0USzQlU7bNEJz2BTg/cTGqv+I=;
        b=GnwGLVwMXT6Mb565UOLsuQgcag4E1IAB/YPA1kLuAi/6zKPinAHfipP4KIqRliO7zM
         R8mbyvtMQMB+ePdvDXkNTLR6hSTY4wLszmfyPkjJKYwNBVPIc2opB74L01wmuWQcDYaT
         AkZcDo8BpGGjRsiSTyo8nqXFsQfwhjWIH+AK3xEbr/xZy6ojBc35mKZHp8uj8DxV+xii
         OAzqt8y2KChOt3q6PVwcRNB5LJd0bdOwm1wVjSWi+Uio2j4V04H3u0a1oIjuN5jdJb2+
         GtvcbSAsfFTAr9rHvc3MZ1TuOkaAGAZPbD91BVWVOUSmk8/S+BHuWxXJfNc0BCpwsC5e
         W4tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792834845; x=1793439645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pd4mEHoCoIS2QzTItq0USzQlU7bNEJz2BTg/cTGqv+I=;
        b=ufUXvfq3ZjB7N8GWD0V2wb9a1vYGBcvNvabq9ANZTxG5gd5zbahcK7yCBRyak4GsQc
         M/bqGrE5lVR2Inl+uvS4IK9mEk6+S7XDN8k/MhPJi4yNYQ8++9PnoseWjC1GGgnJbn+A
         1U87p8Tk34tan+FsOEFmctKDLG6/fc+YiM89HBLzisMrCkjwH5HMBquWD0UeU6alEf6N
         LU7QdC+9/4HzgUDgkpqCEEruMYV8P0U132DKUfsrkvvGINDF7gRp2tJqHZQO/IwKoHaa
         TlqC7egjNTYvv9Nq/7PyjCMaUlS2pA5OyduDqrGGyCApyqkIwaJCLZ6AWEeJXP7mPtM/
         Y2bQ==
X-Forwarded-Encrypted: i=1; AKwUvByUbw86PKk4zwLT0NDxbNFmWE8mZjyeMJXxisxO/RD4M3kqd3nGLH9+TTsJwStAf+rae6d/iYxRksHDWA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6IeRDsE1/uuuIwkkI93Q1+iwMFWzMArU/bJH274NxmGNo3lDu
	Zf1btVdeHuip/HXST1n9NmgKRqFvwDNpsYoK/8MuuAVGqGBqWYid+FYOBS6cnwn7wbIgDHMdBn5
	x1acH0EApu++1U8RB6IANZIyNPeuz0tXP2tJrw+Lpm5LbBwijrIkKeivYvObiCubv9g==
X-Gm-Gg: AYBFou0EE+MhNw1NBtvgOEqVPstXQ3xZdfj7JkhLEwvE1zkpuGRr+qLcPGrB7/3CcU7
	1Da1V0g1KQS89sg2xj3t0i4mvqdAdAqD3lqm5ctOqX5oOCcqmVUjd0GQmeljhqhnGB72EKmgjXF
	QQBmepeacvxJexTRZv4B9fWoUWT1kr20FqwXztauXHaGzf7237MQUAao0OX3waiVDgfwFeRiusb
	YiEDEd7nc6so16HLa89VgCX80TMdjctHopATPII9pmEUL+ZnM14662LBsH5A10HhGpz+TwhDCqV
	LoGVSGKLJ5ElV/8mbUzqvMzrtt3ySBLXKwUEahbQi3m8MkIeWU8G82jfatGqmdgwzy+LmwpnKyf
	q3IChBzx8AaDZRNe6SI44isth
X-Received: by 2002:a05:620a:2b4e:b0:93b:d7a1:ba16 with SMTP id af79cd13be357-940ef9457c0mr190203585a.65.1792834844210;
        Sat, 24 Oct 2026 02:40:44 -0700 (PDT)
X-Received: by 2002:a05:620a:2b4e:b0:93b:d7a1:ba16 with SMTP id af79cd13be357-940ef9457c0mr190201385a.65.1792834843748;
        Sat, 24 Oct 2026 02:40:43 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3bcdsm2857166f8f.13.2026.10.24.02.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 02:40:42 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] media: qcom: camss: sm8250: set the VFE AREG clock rate from the VFE
Date: Sat, 24 Oct 2026 12:40:26 +0300
Message-Id: <20261024094027.3095475-6-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261024094027.3095475-1-atanas.filipov@oss.qualcomm.com>
References: <20261024094027.3095475-1-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-GUID: Z9yGqWN3IoRyCv-w3YcViLRrPie72Fo6
X-Authority-Analysis: v=2.4 cv=Ra0FmFtv c=1 sm=1 tr=0 ts=6adc7d1d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=XspRBnjjJwGwxb89TBgA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAzOCBTYWx0ZWRfX+6Es1SPOgKLj
 Cm5bqi3uhVSGVdGFSPVRZ8vl7KWY6Y2TQRHuWL1EsD94Lk1lCU0g1ViGUFCWpMXQDT0FQeDWfCH
 mYZeqLS7AfWevaWIeKPMVI3cEXj5RgI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAzOCBTYWx0ZWRfX6JoVUggVy2Ra
 eFzm00Rwi8vULbKlLu1XVcH4DCTyl4XAeExHml2qplkQXzStkXx15rv+bBQOuLgt3xVviQxKF/E
 +JG044Ps2krpCHtc3f+i+iz/r3tTNcK6pvGtn+F3J1aeI5W/kJdZ5YEpmtxqDosuo/+LJCtq69r
 EhsfHvh/r7REnfejwSUW1t3a73fNXZ/vuNcgYcX38L3iriEoJh2bUUTlUFYOJPJfRr2/4gdtAg+
 MwIy7ID+2HKc2D1+XS4MzDT54IJHkzBh5ELai9epjM17ek0dnccV9YpDj0vEvLyUoGhkmr8fTzn
 RGoDF8tcj51SMrpeUv9oapMepoC8McaGef0FP6rUvQSyDEed3bxNQmI9CB2OBtPX1ZW8LWoOXvC
 Za2d/TMfktZuf6b3AqONhzCVBw2pUfiNzK3xYkeiuG7Hk0stxQ9PARnoT+RtxLY3QaVrCjjBVMx
 4XLGHRADWy5pYV/vAfg==
X-Proofpoint-ORIG-GUID: Z9yGqWN3IoRyCv-w3YcViLRrPie72Fo6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240038

The SM8250 VFE AREG clock lists four rates, 100, 200, 300 and 400 MHz,
in both the VFE and the CSID resources. The VFE only enables it, as
vfe_match_clock_names() does not match the AREG clock name, so its rate
is set by the CSID, which always selects the lowest one.

Match the VFE AREG clock in vfe_match_clock_names(), so that the VFE
selects its rate from the pixel rate of its lines like for its other
clocks, and drop its levels from the CSID resources. The AREG clocks of
VFE0 and VFE1 share the fast AHB source, which then runs at the highest
rate requested by the two VFEs.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 3 +++
 drivers/media/platform/qcom/camss/camss.c     | 4 ++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 614497235eb4..948f0e12d542 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -907,12 +907,15 @@ static int vfe_match_clock_names(struct vfe_device *vfe,
 {
 	char vfe_name[7]; /* vfeXXX\0 */
 	char vfe_lite_name[12]; /* vfe_liteXXX\0 */
+	char vfe_areg_name[12]; /* vfeXXX_areg\0 */
 
 	snprintf(vfe_name, sizeof(vfe_name), "vfe%d", vfe->id);
 	snprintf(vfe_lite_name, sizeof(vfe_lite_name), "vfe_lite%d", vfe->id);
+	snprintf(vfe_areg_name, sizeof(vfe_areg_name), "vfe%d_areg", vfe->id);
 
 	return (!strcmp(clock->name, vfe_name) ||
 		!strcmp(clock->name, vfe_lite_name) ||
+		!strcmp(clock->name, vfe_areg_name) ||
 		!strcmp(clock->name, "vfe_lite") ||
 		!strcmp(clock->name, "camnoc_axi") ||
 		!strcmp(clock->name, "camnoc_rt_axi"));
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 68b43a720869..100612d97fa7 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2053,7 +2053,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
 				{ 0 },
-				{ 100000000, 200000000, 300000000, 400000000 },
+				{ 0 },
 				{ 0 } },
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
@@ -2070,7 +2070,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
 				{ 0 },
-				{ 100000000, 200000000, 300000000, 400000000 },
+				{ 0 },
 				{ 0 } },
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
-- 
2.34.1

