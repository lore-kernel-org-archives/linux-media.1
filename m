Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795593614;
	b=OUtqfhg732hts9to+yo17n83pWYPn6Qpm4SWFz3uTIKRjb2s1nSRxCNk9KTsFeumm8qi
	 X2jKzl9/HMMD29xiTFKWSndgwfVB0VLNwHY/H8RNBDf86rg6In3Or30VZwBeGiZwXqwU0
	 w7ceup+oyfqbAfrWBz7xObQ7z0SvHrVKnSCNVK1YN7JNkV21fkAuN2EjFvbQr/QNaZYmT
	 q0UZEeZ2EFsn0eBLVo4mzLcz/bRwR2AzI80EunjZwoKnSzB6YZl5m5ZhpwvxawIEBrze0
	 1z1CoFykTMmTGHn2FWzrUyKLhA9MMxKRpPNZwLjdp+XrxE1nyyQl6nz9caMTtSTy8WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593614;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RaTpNYsU+pyqZ2JhTEPeBrlnqy0P3FMeT5rLYhp+Ceg=;
	b=HEAwHp5QDdyuKPHWFmY7WUqpJ0aBCmMg8lRxfCp8xVBmEzF0QpK4Pf7qLZeFPlH0hCOi
	 I8LxBZ3HeHI/rZVDObvNodIyB+A05XFMfOGW5TfK7IvpLWhhvPFgqSsny7lBC4fCi3ghM
	 rh68TQPCSlRBRzy+Vhs8/SFSSGNdXlNsNCx6aZvyHHmFfFv4Rt88jDQzisoDyG5hoiw6w
	 CQZ2AEZcKhO5ZPDxHjYQTp+xxin/StLdog/QCMwQWdQ7K0xX+QKJuwDiRieVdw4F253rQ
	 lL5ORw2MXvScEBQevXGw87wx4eRojMHlho6hkvrtS15wlQIqdfABauqT7NIB1+BLxmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=fail reason="signature verification failed" header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eUeM2dHb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05107606A32C
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 08:00:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05107606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eUeM2dHb
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68bDb3630235
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 08:00:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RaTpNYsU+py
	qZ2JhTEPeBrlnqy0P3FMeT5rLYhp+Ceg=; b=eUeM2dHbZEp6XUeYtUL56y5X27a
	opEmPFJwRR7WZeGDAx92O1N3PsrgIIx9enWpGXvnAywGHAuY7cqe4ssMJcahb5cb
	FNhuVwq7rrINqRMvE91uLvFddSSrvFoIT/VvDNVhmrAOHa24+uvhppcXfS+7cHnh
	LpGL442RrRzH07obaI67WcieFYfrEPgAm3Lv/MT3gulq9/MB+JCWXXLUzJWkzzxP
	5uXZfthwGfaHMRTaXFMpQGAEZshzMNjNhVDumBpqwbNQM+TIjlQ3vX72wyBA0nlg
	kDfxFmtKQ2c+ibSpliALIcIID/xUdEwRuWkSd3Sa7Wjwi+eyfzRqxJWsg8g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5b8047np-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 08:00:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-946038e22f5so136339285a.0
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 00:00:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795593612; x=1796198412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RaTpNYsU+pyqZ2JhTEPeBrlnqy0P3FMeT5rLYhp+Ceg=;
        b=Yk0o8csx92zeb7AZLUIsGs3weu1F9xefUfPA2wBhG9BRIg+5pY/m8J1rd6nFpHL9by
         QiFOPu/ara1XF9PGFbLaEi5M8pHlHxa6AZuMtdNFlyOqW54CEUVBm7VSgNy3cUecpCho
         8iZ3s4eoYHKFeXdiDF7HadSJDR6sk4Jbku5LiEN7x7q030l1+6g1RzoPeWoaIULWMTQp
         IhW6xH/PcAIuBx55zM1VSvf7ST51VM9u8Viacg3xVTlFZOx7h4S0IdhavT3vdjQFkInO
         rYl+mcebkbpgPu0dqHxeglg/qNM8kN9/Xbq5Rhybideye6yl/JZwdxDpr+D+OIYCSDUG
         M8bg==
X-Forwarded-Encrypted: i=1; AL+hErE5gbChJshtujL+SJG8x/hZw0VncrSX8EuUaFO6OpFxnccHdenZYKARVjROuve0DjbPp92LzGqTRWWAmw==@vger.kernel.org
X-Gm-Message-State: APuU4Z83X1vlHHrE0XnyBEYlrwdP0ATFATElGwHEn4o/XSrQIDWRbAJ9
	GFP7Fju5BPvXn+P1DMm07a+ncOlCYd75ivjWLUeyVP3o+YTS0bbzg/JNhfitEHNp5SbzkvqN2wp
	7kOydpzXGFkVT7xdoRW7g86bgqmrN6/d+qVR2TYVukZjDFuWDjSJIntpjzW/uYqMNAw==
X-Gm-Gg: AZFdTZf9bxdqD7P/69xt8GWnQmJHJhss1i0yuFtZw0+f/aMA3DTzaZBWy3BLLdCtojN
	/4o5ZimTvfjJJG0LpbbgqeG1Ify3dhSMxHwv7m1ylk2s8IvoptIu4SYDVqpj0ZsBypSCa048k0W
	p/GCUuHxWE76rGf8d8S9Eo+OD34JCBcROVS8Fq1pdsOCIzoEpCgt61k2Wu1UwdosaXgITzhtRBd
	JNWlrLt6pWogIn9259mZfZusClm/8xdczxDikxBNPWshA7FLrZFHwChLg46qFmFHhhUVzcojNhc
	z8wRfVIL9NFsxmfgcjyfmYbMI/mo7/TzGKv9wa/ID2pz0KyP7GGVjDKlGAMXvaWdGzAY9lAm4Iy
	w3sTwY/DctNbDlKRdp2485FmQmwI10Bd4
X-Received: by 2002:a05:620a:8015:b0:945:fe1c:82bf with SMTP id af79cd13be357-949bab54098mr2838319385a.61.1795593612414;
        Wed, 25 Nov 2026 00:00:12 -0800 (PST)
X-Received: by 2002:a05:620a:8015:b0:945:fe1c:82bf with SMTP id af79cd13be357-949bab54098mr2838314485a.61.1795593611865;
        Wed, 25 Nov 2026 00:00:11 -0800 (PST)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm585912015e9.11.2026.11.25.00.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:00:10 -0800 (PST)
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
Subject: [PATCH v2 03/12] media: qcom: camss: Add streams enable field to camss resources
Date: Wed, 25 Nov 2026 09:59:52 +0200
Message-Id: <20261125080001.2540101-4-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzMSBTYWx0ZWRfX/Oz0dlJZ0CKa
 tEGeg4oCJEoxXQiiyK0WPgcUtykqYc4zfpYb1iQsvUyA3jlKAXuxOigJTfG4NLR94MdrDbX8tv7
 Y02lHw/9UpaNEKTyDezeMu1m/PIxn0UADbkUenDe3MvtMVt9UOl+5eahIq+B3F1JgZ9Dwo4dqN/
 9+unIx5UvHoWxcIyKEcJZK7niL+x+WZgRkMSnpS+PIEy8kou+a5j1pUbCZZ8pATJv7Xv/+kHRVa
 AgPoU4H9KAMO4vJ9g5DDZIy/7H3fgCAkIcd/0aYMTU4O4m92x4sXOyPh1ngW1Vi94oXjwA9QoVX
 yREQI9Aepys/mpqm4JuXlfpETYzDPKHzjBBWvYcwkcPKNSH307v3g8F0dreD8CIBdK4z0nsQS03
 O/tFKyyh5x0zk9DSQHTIMOQasmSWiHL4WrKLjwg4JLbltISQISs3WmYvJ47ywReNMRTitMXBR6G
 iuuU7taRYSN2KEMjMvA==
X-Authority-Analysis: v=2.4 cv=K5W3jCWI c=1 sm=1 tr=0 ts=6b06958c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=Zc0e2cZeo9r8mepgbREA:9 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: loX5Tfa1jMN_mXJJ0WE4iTL6YNU8VSwZ
X-Proofpoint-GUID: loX5Tfa1jMN_mXJJ0WE4iTL6YNU8VSwZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzMSBTYWx0ZWRfX1baHcTMso+dV
 QvamLOr0yfldSqnLz8AvlufSOGrtoLAaol3lDFyKq6yVfwt4ZW/DVbsvYxZys1NgYlPHo7jmFzh
 EbOWSlbp7aM2hZfNtdu0cTNq3jfojWU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250031

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

Add a per-SoC streams_enable field to struct camss_resources, used by
subsequent subdevices to select between the legacy s_stream()-based
pipeline and the V4L2 subdev streams API.

Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 7564a7c46fa2..621ea2e3eba1 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -121,6 +121,7 @@ struct camss_resources {
 	const unsigned int tpg_num;
 	const unsigned int csid_num;
 	const unsigned int vfe_num;
+	const bool streams_enable;
 };
 
 struct camss {
-- 
2.34.1

