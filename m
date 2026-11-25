Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795594102;
	b=mT6MHbyCarZU6Lhx3FXIRag9Tn7k9NS5j2NmmZGl4Mducr/Ft96BZVBCx8yilKPNy5d0
	 sskKD3RNePr50RhC9zBchPxwoDijuLM2N+NGHwAyEtinCtv/3KiHaq/Hs+Ly5bkt9d37p
	 tGUPSVdtKK7sW7rE63ihStlLI1cVjo09Z19fzYcHGYWCbP8LllBCKyhNXyfnyqh2tTbFo
	 RbtIYeu3qcYJcYmjQlc+qHLpmJdnd/J2BLoVUbr1mlJ9on5DvP0Mebvvi9k5V+i8UgVJC
	 rTvOGOLN+3H6lwvsg5nx9xWJe0dzrTnYhmVN4rltwUSkhlKteoQdLXUol6MynYb+Kfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594102;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=roKxUa4JIcTuifH94iqMJAT/BBOaH7ODw0ht5sDegWg=;
	b=cVk+SvOOGWGUDLWN7xFdKvTAwSG+6b1CbEXYeNKb+h/SYEY8VV/C58G6S4chfvWkM436
	 791v89JB6vAHvbTWQPt/uSFoOY/ySCGonEVyDICA0ixhTrJbP9KAqLPW5KsMIWMoXzv8V
	 +DlNWxgv9OeOoZAiFt5lUFGLRvB7xNhCRXpV9flvE5sQLiZt65RJkRCcOwyIJcnpEhfsg
	 8IvkBLK8rhtysMPpBUAhadOlT72LdGoxVOcg0JkJAqU3gzNh12z+ZOXuVO90fMrgfiACJ
	 bo1EnPKctc6N/QMpoc+fT8Hxv84t474dM4R2k5oDw6wXfZym1N+yO/d1D5oqUqaygWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=fail reason="signature verification failed" header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k41zDtuP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616AA606A321
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 08:08:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 616AA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k41zDtuP
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP7HcfX3782559
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 08:08:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=roKxUa4JIcT
	uifH94iqMJAT/BBOaH7ODw0ht5sDegWg=; b=k41zDtuPpn7zGE/GWiYmqan+VOk
	kn7JnGcP6AtnIX2ksXuwgxMya9IWF7YhgSZAzMVWiUBYSBtzRtrQwUOnJdMQKZ5k
	J6ujSsL2SSd2wUGOxrT46v7QCD9Eou0hk3cMJd3v+F23e+IjpSigb4pepgVy+1G7
	Cjdt9clWYmJ0ih8Tvt9QuQ5HBvEgqgf0UQHudOVc25mPdfBRsvVi++gA3EfgrUHo
	MvfJBuLRbAicHbO6h5xd6dIBMhr7y5bASCo09mDVdvwBAdxD3xwZ/zRomWTajUXZ
	lgK7+1pdiKFnz3M0Iq8BpLZITW7y60vIi1uEXuJXGjNfCpzfjPwc/bKrF4A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5b804929-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 08:08:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-949b0d322fbso784547285a.3
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 00:08:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594100; x=1796198900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=roKxUa4JIcTuifH94iqMJAT/BBOaH7ODw0ht5sDegWg=;
        b=gK6vzy9YVno9EFH7uOyDKQmcD85Yi3T2BIt1b9/6Ma/N8yz7lPkzVYd6IqHETDbAcv
         JSMUnibEXAP7r2qj48WkhHJVo1GjwwZRZytRKRGeN2bLvi8n2KAsFa3di1WE6HtcoRIj
         IXTEdr+242b2VMzp4XfJxGYms6C1MsaaKSSxqDIkqg70UsTo4P/Zw9cV9Qqfl4GH/41D
         GVoSt71vC289/lBS6oQJsz4phTnrudMgHnQmwwTXsKDTutSTX62eGwnvnG9a0NMpdSmr
         uZUM15UxGSGW4qnn+IOHI2SXfdQ7/9tJYLh4TH64vrX8rnYDsGZkQYlKDanmaI3gurDs
         /AYQ==
X-Forwarded-Encrypted: i=1; AL+hErEgj295P4DJEbmpl6HU9UBs2+p8bIulsndPq+FInI9TNVztRBep7+MbzMm2k1OqMcyw5pE263BkOY5wEA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8GYPm7skJ0bICoqjlmot7mOVtYF4i0QqRZyT49Ztt/pqWRxAVP
	o9Lcyp+o8GociB57kNmi6gRVba+CbTjvpgVhVsPwJpp1nuzNf/9BXMBnjtRYi8lQn8fpFG4YvEE
	KbV6Nrpn/vgiULGl1h+lSRPP1VsKT0BrFDVP7wpWQ0h5RSMUQYPRk6EZJD3H/i4JMeH6VsiyCYp
	Ik
X-Gm-Gg: AZFdTZdMfqrf0iVrqjH7TTeqlHp4ByMemN+QgvQf0GIRuGVp69q6RXpw+rapHrXyynO
	7pSFWs8TlsLG2fCVKMHqEMOYvcYEXNFNOQTluNoKVLwFQIRUNp2fL39ICWuBCTpGSO3oR68Rcsl
	8/mwBn0x/4fwJ9+M9Q4pUZ0maAalvMjsEokdjQYG2H1sa/J6/Vqt0W6Ie7hHC+ZpTE+Nip1dHll
	H3HxXYeIBRq541L0JMu3BCRTIvlPuFqJqw79AJOVdLrQRDHbbQQJ9E0NJH7Xj5zEBih8uD0OWh0
	kojNkDkxtHWuyQp0SQSud6555HMafHuJnPYtLu8KJ6oh+EoThV6biZx2albaAnqk/GbilQnFbKu
	IFVvOx5iLf13oqhveM1izYUl/KpjmUYmZ
X-Received: by 2002:a05:620a:4713:b0:93f:735:6c83 with SMTP id af79cd13be357-949ba9e9b76mr2891042185a.56.1795594100598;
        Wed, 25 Nov 2026 00:08:20 -0800 (PST)
X-Received: by 2002:a05:620a:5386:10b0:949:bed0:b895 with SMTP id af79cd13be357-949bed0b9a7mr2140957585a.72.1795593627354;
        Wed, 25 Nov 2026 00:00:27 -0800 (PST)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm585912015e9.11.2026.11.25.00.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:00:26 -0800 (PST)
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
Subject: [PATCH v2 12/12] media: qcom: camss: Enable streams API on SC7280
Date: Wed, 25 Nov 2026 10:00:01 +0200
Message-Id: <20261125080001.2540101-13-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzMiBTYWx0ZWRfX12rSMoOremPX
 oJPsDkAYtFsAgUyByqUS1Z00O9dOCHgvPv4OU8bMjHM2rqZen3cKSHgClmnIo2qBdUjIFZh0lvo
 GnHtiz97PqAEQvog3AQvVuKPM+5O2xkMnJWwJ8QD+KwHJ1WaRPq4N60uDTpH548Wc0CfLA5TT1a
 LOEaTKMzadcLRCdJXWNfkMZt64aoP+p0Kklu2zBKONY0wMh82Ngw1lrxmyNuHmnxEkYMbQCJ5Jt
 WwYcYsky0HtLuvFE89AHDEeUnUUBdXDVPkr3jRs7UeockGAxsax2kdfX03XfVCmrU+PhmvNLzO9
 W7w3ipbTensLHPZzI5MtbRgANIf9WVmdLif6OeSN6QgbA/uBafUEw0hyHS9NbESt4n2dtizfkGo
 vI/rraptJBXwNLR3SPWlPbW+FFRDWRuhYvmddZ40Ly8DEE3oSjY6dHpsH9l4W8RTuDZzmbSVxAl
 qYw1HwWmdbszzBR1FOg==
X-Authority-Analysis: v=2.4 cv=K5W3jCWI c=1 sm=1 tr=0 ts=6b069775 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=ZovgdgjKAAAA:8 a=EUspDBNiAAAA:8
 a=nrc8VjnkgqnvnCm6B8AA:9 a=PEH46H7Ffwr30OY-TuGO:22 a=VOxKbm1zgHvARWIDjr3b:22
X-Proofpoint-ORIG-GUID: PLy5Uj1bITuSRx5j7MbFijh98CeVhFCH
X-Proofpoint-GUID: PLy5Uj1bITuSRx5j7MbFijh98CeVhFCH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzMiBTYWx0ZWRfX9H3sZfyC7J5y
 3IR7Fd4hAZQjt9rHraLFrT79fGOIdLOXB5oY62XY1EMN2+XfGePsAub37lLkiM+jxUwI5M+CnhZ
 z6YSHnV5uBoHFF9cnMu3DHtA+rfzir4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250032

From: Hitesh Patel <hitesh@ebytelogic.com>

Tested on RB3 Gen2 (QCS6490) with two GMSL cameras behind a MAX9296A
deserializer, one camera per CSI-2 port, so two independent pipelines
share the deserializer subdev: both cameras stream concurrently, and
each can be started and stopped repeatedly while the other keeps
streaming, without the WARN in call_s_stream() and without the second
pipeline tearing the first one down that the legacy s_stream path
produces. The CSID test pattern generator keeps working.

SC7280 has no camss child node named "phy", so camss_detect_legacy_phy()
puts it in legacy PHY mode; the streams path dispatches the lane
enable/disable accordingly.

Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index e444c29fe847..60d3d21f6548 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5819,6 +5819,7 @@ static const struct camss_resources sc7280_resources = {
 	.csiphy_num = ARRAY_SIZE(csiphy_res_7280),
 	.csid_num = ARRAY_SIZE(csid_res_7280),
 	.vfe_num = ARRAY_SIZE(vfe_res_7280),
+	.streams_enable = true,
 };
 
 static const struct camss_resources sm8550_resources = {
-- 
2.34.1

