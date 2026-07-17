Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDC0429CFE
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 14:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784298031; cv=none; b=eNSGqotv8FR5TNMMTYzKB940U4C+jatySbJdosnRhcZkARl56oAQvaPwkQ5wZvffS29Pvwf7gDcPNzJoILoAT+LvyKBygKq0UDN3EMzYOd0/r6k/cKPqbdQmBMZOT9Q6Zra5IWwgdzfAFdnFpucySVbhg3xgJv21NLDGM4N4zwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784298031; c=relaxed/simple;
	bh=bFxeOuZY1WENQworymFUFHqlGRpphWDshqbt8T+PX3s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aZSeVPI0d/no1gjcoxCILT8JxbWnPXTgLdl2sQfXWeN2sHFzo3MQHASw7fj6pjEXC7TwK68CettyhyIqRqBfsXVitGKHk/gjPqA9PcHB08uz7gRd6xXuyQTkNN4gOWzPr9yn8DDqfjwAB8uRwzwsErH4wgDb1NEIL+Y0GqQxuD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YdHI2Tyy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yd0Yf7wU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YdHI2Tyy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yd0Yf7wU"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HE7vpc2106297
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 14:20:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YI8okjgDhD9LmAlPNFbrElCB0Y8XPnKT+xQyqggq9l4=; b=YdHI2TyyNhCkaBe+
	h0yEO/mT6Z1ZG4mnwm6M8HCqRioABwdMxBwLhB0dFeFhqSjEr3tmOscF3yT4Z8/H
	J6aNMiNhZcYC7NwSkH6bTrPBKXQlW7W/Gu6rfJPATAx7gLK1NNf+SvyWqQGGhMWj
	3WwhSWCw8ggZLUMnCo/6PNGXx3ByYrFwS2+NI/Pz4s2mxONk/UiYp1rAl2595chw
	ZyVnYPa/U2lBXWXbHUtkOnFSWGZxmY5F1LbtdUYBlpT2ZhkgHr2VJ0S/WvGGBzi5
	odwtDWURmFSV0ElOC9QBKuuI3KQ7RNm8QZGVmYl+sT61fREtKUwAhJXjZSdpsXBa
	92sQZg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffhpfh36h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 14:20:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0f0a0760so176589941cf.2
        for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 07:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784298027; x=1784902827; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YI8okjgDhD9LmAlPNFbrElCB0Y8XPnKT+xQyqggq9l4=;
        b=Yd0Yf7wU6kTcOEdCHJ7IlcTvfjSAnrb2cv68e4+xbFPiY3PMXRhnlJLbOJT9lwSgLQ
         oUZMw59f/lw/+kIMv1bB3Hg+2mYM/4n0Kf6ST33t4O0fosUl6cNaaQTVJHv8WLopKV2t
         qXdTAVaSk4I5WcFio6vxJpPAmkaIT2lnv0y7+pSdwNRXBgCmbm9G67vtKKMReagiJahQ
         UvOMRbHnjtZYot3Sj0QqRd4kndAe1GtZHb+kHbp3Gu3MxFq9QqTjlpoeYYe6wM9Cx2+5
         7vVpzNr+zbURGyohreyn++kDC0sb383/Hmd1BYkahkwdlKMD+63vAnmdfby/pH7om5Gx
         V6sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784298027; x=1784902827;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YI8okjgDhD9LmAlPNFbrElCB0Y8XPnKT+xQyqggq9l4=;
        b=mRZGZpW1n/2ekJmkyOaoV1kdjaN8lRAQ9vTxAqY3IYtQA99uk5H2lA004QIwkqZJyu
         2GqqIYQxJHIsOOUVlDRz+RH+1mAJOFdML9ct8V7mFqgoTlqynbI+bJEHzWW4a3CLN1pk
         NFUKFECxkRR8vYyRnHlai8NjdBwqgAE5hAUKuXeX8NhO08+XnE3DDc8nlyxhlWlwSR+Q
         QRBxn724vTT9c5VaBA/Bhi08clh01ELUMus4uQAWbjiUHNuuxxCkbZ+dS9LOzvbQrbF3
         Tysgy9J/MGvw3LBPigjNsd2sBGBC01KrwJYQ2TlIjG0u6YOsFS9e52yogES1ZAze/sbV
         9q6Q==
X-Gm-Message-State: AOJu0YyALzPwFgcQBBLagVnzXflxlO5TezAcR9S8XUWK+fBXBbeQb3PP
	Vb6EexQQPaga/Iu8Lp1W4oiYZ3Mz9TMBjM0awPdld5ZvD2nIBc3TtQ5sNKnV7g5fYt+Z04RgFmw
	cLJu/u1t8MV58KbC4M/bOrEpFsRtx8KpbmPma9OiZeAlLRE5IXwnyN48n3T/uysIjkf+sIyIv8G
	j9
X-Gm-Gg: AfdE7ckfHGADMLI39rxiA6yz5vEtac3yitsHaKS1X472Fd3vHBtFjMz1ViB8dNOw2Xo
	MfiuifRgdPk1U9OkygrLGqDOS2kIaDAUyF/0QXdHk1Ylc48UD1D6ie7n5EnM+hLfIaqGX+p+TTH
	LoGAnVy72B7fA5/1TUXqSdmkMW3uLw9acdVMgyz81TrTrA7mZ36YNPgqHAcWDepBYMDgWlhUeh2
	5BE3NtVSnF3xDkrpAqFIA6x/hQeMjNfGE1sGXBkaf76nKobCulN79AkGGmUd+IAuwx1Rotr5RSK
	k0+cVF+8qvbA5/9tGXn9br9W1UDVyC1auFzWzD+u6YaI9lW78pPkmAQ4/c/XUoyNCL0VOV1QgKj
	Jim820lVEVABx5geJqRA3pzfa98igRp+LKUto6K6uybgtGQFGeWqnYjEzg1OIybgONAGS1Wer/L
	2k3qH6u7IUpZFbCc3cBNHB/X6CLTHYClFzGuwxP0CNxN5hh0vLxn8=
X-Received: by 2002:a05:622a:87:b0:51c:7b11:41a7 with SMTP id d75a77b69052e-5213f959efcmr24739661cf.84.1784298027289;
        Fri, 17 Jul 2026 07:20:27 -0700 (PDT)
X-Received: by 2002:a05:622a:87:b0:51c:7b11:41a7 with SMTP id d75a77b69052e-5213f959efcmr24739221cf.84.1784298026803;
        Fri, 17 Jul 2026 07:20:26 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1740bf91bdsm79085966b.63.2026.07.17.07.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 07:20:25 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 16:20:21 +0200
Subject: [PATCH 2/4] media: qcom: camss: Add PM clock definitions for
 QCM2290
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-camss-version-v1-2-7ed71fea95e8@oss.qualcomm.com>
References: <20260717-camss-version-v1-0-7ed71fea95e8@oss.qualcomm.com>
In-Reply-To: <20260717-camss-version-v1-0-7ed71fea95e8@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE0NiBTYWx0ZWRfX9ml2/xSjJk3Y
 hcaxdliSR2IWgO+Q/b5Ea+ZaqZFOZgNkov1tm60NiZuZc4bRmVWbi45qQNHQaheJBKMUcjfZ7o1
 MMxfe8FJuB6KsCNmlzKL5Jk8CelagDFQ0eYwGOsr3G4+CN6f0t17cJ1gNrAloHsylqdcXe2MVLG
 DkT8NtFL23+jP5NpsHest9ZaKUMdF988Y7vhgOx+2LgWCcivO65hB74cle8+GpV3O0DNn0I9vRZ
 nQnqTt22Es8qt678GfoTJrFdMhcl4Sk/Wvmk0YIXpczWYfnDRzz5hfMwEqwvcFfqpMrUZp3/Ydx
 EDSROK9NM10SNkG3H1dfSWrHOs2PJ1YE2kPD2vHGSA50lBux1PwoysRUk3KxAinTwmxMHJkcTEg
 dLGYlQL9vCicNrw/w4TJNg7aztbbJavww4K7coG0j5S8Dyr9zTQ31VhLSp5CCNvBoA9iMMwmdk2
 E6U6WUNURO2Nch3wOwg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE0NiBTYWx0ZWRfX2HPw84MRCc8C
 p6sEnqpKrl0SmsAW3VaDidfuAEEvJLitNv6ZTGwNySx5PGhxex7ImuIiM+JuNU/gyAu1xwKBBsa
 rOo4bufwP9pDzuFwGPn3udTR/0XGeDA=
X-Authority-Analysis: v=2.4 cv=YeWNIQRf c=1 sm=1 tr=0 ts=6a5a3a2b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=gZ4aIBoJpEVIEF-KsNAA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: Lh0gJYnNXgByOE2y3nQOUKoeTnkykvIb
X-Proofpoint-ORIG-GUID: Lh0gJYnNXgByOE2y3nQOUKoeTnkykvIb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_04,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170146

Provide the required CAMSS PM clock descriptors for the QCM2290
platform. Register the top_ahb, ahb and axi clocks so they can be
managed automatically through the PM clock framework (they are part
of the camss-top group).

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 6a2bf3373e8755805c8cd0f8fe5037b788d68fa2..04b5601eb0b53110ce1b94248323dad1c08da9ca 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5589,6 +5589,7 @@ static const struct camss_resources msm8996_resources = {
 
 static const struct camss_resources qcm2290_resources = {
 	.version = CAMSS_2290,
+	.pm_clks = { "top_ahb", "ahb", "axi" },
 	.csiphy_res = csiphy_res_2290,
 	.csid_res = csid_res_2290,
 	.vfe_res = vfe_res_2290,

-- 
2.34.1

