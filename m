Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631042;
	b=JZtXTIIJlHLljPqlQTEfHcEjV1M1l1JPtDxZJ8phWycRFeXdx7LODrACjtn2VE3OTbq9
	 WVqNjw9mbgEMuxQwvuR9dQGrYV5EoraZtZf56mJa+3eIqJLT4SVaZJjg1FFsfoDod8fm5
	 xIUxNsvuhO1MFl4P+UD6mbVj+wNU9AltbvMKQi8Mn8sCFMtg1OQ1aqyROk/qoQ1aHIF0o
	 Bss3D/FSpgnfuN+EkvVBOIAmbRgtMalxT6mmWjF2vKNFjOXE+qglTy8KTiUYilLkwqRYu
	 0yn0Eqo+VRKN/hurhhu1ogcWohftlsbiS+ByPNjRCawVgmZHqxtlH2Okv/4a/ffXwxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631042;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wRm18+EgKanEW0zc1br23SXCiZhY+49AAB/Mm37f4Hg=;
	b=K6vmO6O5agoqZfeJk/17Ad7hhHh0KZZBY79OqlMpu7ypJl/pHDSplTA4Dlox7ebqWpsI
	 AqJwcF4UviJqnWiQ1fcxs7EUXVFW7sLQMEpCvjpPB40MyXpSqiUOFDgP439vjNJvE0d58
	 UIXoAMY/dVZUBBgY+YXFbF/UhpmpSmnRdJIerkvEJwhkiuHQJgrHp7fWHIQ7J3Fj7AUIx
	 Cm3ACGxikt61KHfUPGmdtTKGP2Dg9PYTbQIHs+dJIYj1vMbaIgPGVishfQ9b/TFO5+mmy
	 gcOAWqr0B7CKwiEG/WRhpTWEWDOo3df55X0IGqB45wsUXKPCy+yyu0WqXQCWgyzpiSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="SUWXYa/N";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fckkPCzs;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7083E606A6BE
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 18:24:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7083E606A6BE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SUWXYa/N;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fckkPCzs
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APGQ4jd291083
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 18:24:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wRm18+EgKan
	EW0zc1br23SXCiZhY+49AAB/Mm37f4Hg=; b=SUWXYa/NJtM5c4/BVl/c6aZet2I
	UNm1dkR++rW3OPHIjv6k1Ug+PqTynZhKjcEJc+ELQozJAAV9eldzRM7Ir+awXYah
	UsrXhk9Z8V/we4qHLbtvWzBQ+ZHIF99+SeIpmsfjUQUc+9Nk/8zjDrAr0kOsBEIi
	KJjCQBRyf5/Fmm4CiBhESa5jsULdh2hQQFUr49bWF30CAIvNaCLM/BdfMazSW7YB
	ikd3u+muik91SE32ChDDt8n34KcZJE7Q3XocX/rOROwTX1AmqOUajHTm12DYI45V
	RFeCBpLufRnTYatIeRifSqpx5v87aX7yuyecJxnOuSIR+jsyPE+tC0oHcVw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahs0bh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 18:24:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94975041698so1498504185a.0
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 10:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795631041; x=1796235841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wRm18+EgKanEW0zc1br23SXCiZhY+49AAB/Mm37f4Hg=;
        b=fckkPCzsGWS0j4GRXGa1KyNFHn7BSzeWac4GAqAwbp/d4aMcZ6HeZwGgf13mVssGQ8
         xLtuVihbB2/grH4gMMvj68nVdTgNPtJt6jaSKPDXzHAuF1ZCTZ82xabVuHWLxEEsVTiY
         ILdQUAb3aroq269Qu0G7Pe4e54gKdUl5uJV9EzqzXbHI5wE35Nk1hbQ30HFPvlz5pn/A
         uPDkWbVy3fY2cSmF8MV0yn0Sof0m7s3E3xBN68RI/ZzW0DxS0pJ6P89Vc0uvjLBoYl/G
         CcODN3EbiKyQWxUQwnovUsQRx6VfOuPaudAfEe5S3i4k0lNecnZGkWei/RcrlqkZtEbq
         LVlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795631041; x=1796235841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wRm18+EgKanEW0zc1br23SXCiZhY+49AAB/Mm37f4Hg=;
        b=n0HQo0V5mzVhDFuUQ8lzSJcx3VFzggZVZGt/dyOb67doFDu8+BUYQAXQc5IG6l8J3q
         +m8JqIPi6tPtB9xTf4IsunnvjfhQdSAffQ4uE5Zh0M9gqA+pJIpoFIKcCmhxj1FcoHx2
         A08TskCSEv5BuG/NST7SYHhr4ainHh4N2TNUnwXVsizGFVw746A3sDmtP6T0Z6Z5E/0G
         mozpzFAPkrxgqPQXfI+7T/trUTeqPTDvAF0HtvkR2APw4vFBqPvILwyBcgJ6PCu2uoR9
         Dn5+zzeoJWz9iVlP8c5jRDYVwuL3cR1DuKhG1Ref+B3A+hU2CqJd8mVmuWb9T3KGGISK
         MD0A==
X-Forwarded-Encrypted: i=1; AL+hErF7VN6Dd4WoD4aO3DDh+022NYG8f5vI9+w+HVj943q45c5o9EcwiM9kA9wBG8UIaTAIazXBVBkL6wh2Wg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+HUmoBMvqO/MU4LBd+myU9k2Ygi4BPLHuVXcVPu1GusFC96+Yn
	18DIiz9h6mw2SUVu1LIwdEsErZKa/7eDDJzbOFIOj+VS06+NEPaTRKYQXlkqu9+xYRS43fgMtDr
	GSprJutWKtLbpQy1tfTN/XKfK416RpRZbxbudjyw1Lw4xNe7pUdjBa9PEBU/RBcFRzQ==
X-Gm-Gg: AZFdTZcg5ucq6RuD/wygh7Gg4bR0CrqmeDOO9LPgivETeixyX2i8xnVBnUTBumkYsmL
	LWm4LYmgsWY5XKV24Z6/1lCcyKjQFp9skdaIdDMLBkG9K304/XMhpEoQ+k+m3zzuw9uYFphch31
	QsArbNu9TGl3pH0h96eTSjGMR8FTuhkNZhXwKW8oSR3ur+dz4kk6MdJaIpylPWuCZ6aICqv+PS0
	MBoCBNxtCtvq6pmV1fqKSZzQ6mM2bdD+J83kkZyUjLOimrsGP1/VnhRvBb16YEuZMdgaCJTb8EE
	MTP2dHBdiaLDCIAp5MKdj7sZGKFVGmKOvMVoRjTklKBOQVmPXgCs8Td6wpK9rvd9o0qTClGn8bs
	R6mHqdnFPB/yg9VLVpdMcIs+CIgVa7ia2yYdd4SSBOzzoiXT0vpl343cLTmq/sOv3LH/aY7rtLF
	6azO4A
X-Received: by 2002:a05:620a:199a:b0:949:aceb:b77f with SMTP id af79cd13be357-949b36034edmr3344687085a.30.1795631040849;
        Wed, 25 Nov 2026 10:24:00 -0800 (PST)
X-Received: by 2002:a05:620a:199a:b0:949:aceb:b77f with SMTP id af79cd13be357-949b36034edmr3344681285a.30.1795631040255;
        Wed, 25 Nov 2026 10:24:00 -0800 (PST)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb42absm37185609f8f.1.2026.11.25.10.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:23:59 -0800 (PST)
From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Hitesh Patel <hitesh@ebytelogic.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Subject: [PATCH RESEND v2 11/12] media: qcom: camss: Enable streams API on SA8775P
Date: Wed, 25 Nov 2026 20:23:25 +0200
Message-Id: <20261125182326.2767771-12-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125182326.2767771-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261125182326.2767771-1-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-GUID: cdXPH9O0xARBUF6E2ARExssl43-QuJsJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA3MyBTYWx0ZWRfXzfc8TfNjIJ6m
 dhhzwxSjZb6Yk6xRYZ4WnDHrYQUGhOWkS7p/RWyBU5iZ5E+Afc22pBjRLUSLKA6e7IM/2Qd3Bvh
 FIc7lZTXwZoHwV7ZuO5Vot9DwjxWLFQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA3MyBTYWx0ZWRfX3Yvk5oSBtv4R
 a7KKdIIudF8bpVFO2EMUDyy7L65hx0lmWs3eUE2UTyCFAJKt7KcZw/l8mPBmVjoWv8hCVfDdLI7
 Fzv9QcJk6U6ZA/vquPbBc5SDVF+R2TNpM1HW1X1imm/PwLelxze6CQ+HjoiIh+AOkRVlUk0yhmr
 FMiYSEaBJXMqCjoPqmH4alG6iOHaQbW/HmUSxEEMnppl2q/KTZ01tVCHKuwid3g7Hcxg82s2wCi
 TMcrRn6HBOXI8CA1UiEW1w1nRxNX9mh/2DmCFAuTwW81Am/EsgEAZPhSBR2nJxLwszhTuXrOfRD
 +g4sdsnMQ3UkVrBMY1WtYP8306EzRI/LZ0Gu6gd1yOve/E50HZxVVfbPMSszmk8vNVm5AcFE3Ge
 d1kR8X6tdJGI6U+jw8V4FpBYxv31cL9MKElkwJNGuFuIfr5s6q/ucshVT84Kr7mbXKWOZ8pW9Ij
 Tb9CfJ6qM+WAt9k6FTg==
X-Proofpoint-ORIG-GUID: cdXPH9O0xARBUF6E2ARExssl43-QuJsJ
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b0727c1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=onitAmIIXR4QNx4LYmwA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250073

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

