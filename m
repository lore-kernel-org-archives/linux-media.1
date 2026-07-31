Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D5F3D9DB9
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 08:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785488083; cv=none; b=WwwbdXRoz/s1x3j9npc9cIYkdW3akId3DcHkyNi1nkoAFZSRTRSNVFz0CCxruerkrK8cS/9CqFkJCiL7XnG86RlvsEUM4PEqVUuyxJdYx+DbBuhb6rgGr94U9pMyhY4XSF5+hSJ4DnqdUOoaroadFBHgzaYj3dBrFp75EFWYlX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785488083; c=relaxed/simple;
	bh=HRt0sENsNCg5TdKNkCgya6lDVoy/7AWXDcNPAdbMVAc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MBRMMG1O0/5bWph/B544zSV9aVqtljlxcA+QqG+VQ8/q4+SaM55jWCH+aEx2Mp5UPeW7kGuK+bwy6xrbQx81thfWOtCAwqw4q2gAAeEqZQ5olK0ApiNXzU7+mxmVrbBXJQE5oGR1wiG+GdhgZM4xJJD5K74lBe4FeXo67MwnkaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mrpLLmWX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SCdV+5q8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mrpLLmWX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SCdV+5q8"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V8mrff3993466
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 08:54:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2GbqD5VxK+C+Q7QSDdKxrIg/DseTMU+6U8ntfH9MGA8=; b=mrpLLmWXT8NUY65b
	NtRkkC3/V43piqloPgUZjAqnkBZDu8JI3W4upCEJRgcqcmGq0s41g5ncTUDZpDFK
	bMa6cLz+vL6j5vnnrvrOkNV3AYJ0qdNyCR6JJLca1GgNhTEwYK9r4yQeBJAkOY95
	l6lfSF/qN6iIDT0DCTMo1H82mUXytuHnjjMgmKrnjftLKXEtc9xl0vnguRTwgqNR
	O2AyzzQydUdYpTfSc6mhkv5eJdIzTRK+gopYHl7Wa/0vIrjF0jF5OXPQxvgotFcs
	UqERTdxSEXU1VJHfyiupGcJMIqxPHtCpklVtLUUSHGdwnuj/ZWxmxV7uPyGcW2GC
	l1Kwlg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frrhar0ua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 08:54:41 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ef18406878so7260156d6.2
        for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 01:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785488080; x=1786092880; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2GbqD5VxK+C+Q7QSDdKxrIg/DseTMU+6U8ntfH9MGA8=;
        b=SCdV+5q8J8IH2hsBGJly/8bWiVmv9Qd9imoq2wEalowId8VmaEpM892g76eK0ChRGv
         WgQ4aYgeLWIw6RmcKLFTyW7pqeoMJDMe/OhZdSviJFPhGFA6ECVq2OpzRizFwgf08kl9
         /BptCKCJA1iiX//E4R3R2e7F06n5/TL7W0w7MOkdDipTx8mMwGBU0mDq1jsExNzP2x4k
         KXHF+6u4Q5+qkzllF5WEzFrmQQyXS+rNq3DUHWZWgbniW+fJV4zOi+sEHRg8Ww0pBmCC
         KM6zPygWpON3pG5rG3YXBnAHOgK+6IgtqNDi1Qg7SmAcNiAj9rfi+8M7KT1MDEoQp39P
         eHVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785488080; x=1786092880;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2GbqD5VxK+C+Q7QSDdKxrIg/DseTMU+6U8ntfH9MGA8=;
        b=OKDrfncvwMf7I8JtW2R7dZm+eN9vZS3vohtK/IANFkvgVN0d7obZmVWr7SV8Ad4+wx
         M7cuRCkCEYOEAxfGlQTbhOCH4e0I5Bk3Com92fqy/0RVEHugZenOgQPAXtFF2stPHrm8
         MYCSBvKnSluy2MDParzyhI9H3tIbwbAFuEYuXkMOzmEo1lFeBh/2bojIEi2ypVXrDbPu
         1yDf4wt1UWm10CjS74oBn5JheRvnt+uanUbwRk6g0t+YF5JtJqC+dtTXWFzHWzCjxvMt
         2tT20+I56Yxm+ip0lrT7PbBxJBmqtsOFOcNFNfaNcLFGlL0r7o9FTXGFULJBj+czlCy4
         5glg==
X-Gm-Message-State: AOJu0Yza9fe3tcian6wLh8HtS6qnI95l6H/meQvIXHZPEz0jTHtZmEe5
	J5QeM8AiiYm1f5XurWUCNpnxHMVXjiM2AhHi7tKeXO0wwfOLr3mIj98D22Qjx3xKKruPKg3V0y7
	d08POHU5U5a6IrxSRCpMH4jE2R1VrWOcFhz+OfjoGxAzTV0kK725FBoMZMAkMZiO/Jw==
X-Gm-Gg: AR+sD13PGTFkOl62Cg8Kuo+7ykMrQyjUf5ZZC0Jnl3NgyB6ZfB37GN7lKilGD/Ux5u8
	8LS26KT21sdgE3fvtob7k0Qe6hGafr3oMRyDx85TdCBLzZr3CgzwnonXepas6duFwpWGFiKREFM
	HIuEM57fxG9FsxcX2InYvQ7FOTP8KbLQdxx5tDEtnaV8K/d4sXp/LL+KUatB8JqjZdTWd664OPh
	hDD4vwZkIzcKLHqsBhVmdcQL8mjbrOo3gDzTsCMB2JlLtEqHEI3UCLFXHPwQaFofEFZqxx+cpnN
	zym3Y65DBLfs6rkq9y5awjzuDoPBBwnRsX2W6X3P6/Lpoqsu4pWY7+Um2/4I6zJM+huESTfVAAp
	crNVpaOztiGLbinAxDIx3Aym+hW2hf+4JeG3x5wI+AFgsx23seF0fiB/etWMKbBzN4f/ZWQ4iqF
	FZRGWGePHW1ujHoF1DBk77rf4SL8d5Dn2mQKoQ3EP3hDMBKF+byTsF
X-Received: by 2002:ac8:590a:0:b0:51b:8539:e8f7 with SMTP id d75a77b69052e-52b4b04fb35mr12426231cf.42.1785488080098;
        Fri, 31 Jul 2026 01:54:40 -0700 (PDT)
X-Received: by 2002:ac8:590a:0:b0:51b:8539:e8f7 with SMTP id d75a77b69052e-52b4b04fb35mr12425921cf.42.1785488079517;
        Fri, 31 Jul 2026 01:54:39 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:61cd:dcd3:c61a:ac3c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd44e9f0bsm61899366b.43.2026.07.31.01.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 01:54:38 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 10:54:35 +0200
Subject: [PATCH v4 2/4] media: qcom: camss: Add PM clock definitions for
 QCM2290
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-camss-version-v4-2-be8b716a8c4d@oss.qualcomm.com>
References: <20260731-camss-version-v4-0-be8b716a8c4d@oss.qualcomm.com>
In-Reply-To: <20260731-camss-version-v4-0-be8b716a8c4d@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: V2laurUIJSX90QDdBv7tSVjznXV7jp_4
X-Proofpoint-GUID: V2laurUIJSX90QDdBv7tSVjznXV7jp_4
X-Authority-Analysis: v=2.4 cv=DvdmPm/+ c=1 sm=1 tr=0 ts=6a6c62d1 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=KKAkSRfTAAAA:8
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=AlTZOvFHHOWiQJBrp14A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA2MyBTYWx0ZWRfXzjqDmD4QdF0n
 IP1aN2ZRF0J36xlvH9qJqHRWAgLXu5eWoMdp0pf7drFJ/2oT1XDW7VVBZNXk56UrEcNZSJtLVne
 ayzEc1ZaiDcJGDHX0pjBtA42DeaSnzsMvA2Z1/cjniZLTpdwqVWARHTOkjfwsO1DqdvDcWs/x4r
 Coo9kt6w6CXQV8OSUf2GQqqvXH3dubWZKhT5tKn/gz+19UhixAKjIrLQzcaUxLKBQrateU17Puk
 tioCrPI3bCPF8sjcH89GoZ2eXjecz7hkMOvT4c1jtfUa/ZwDlrXoBrEgRqAWf+oqnJzgD9fwhyX
 NyE6OKqkHLrauS7hrBPsNOwZXUp4h++6ybGyf/Kya/yeepGcgG48I0CPqBICVhzFksWF8IeM2gm
 y5u/8W4Sb8sNzQLjAilEzUeT00QzHgLznhTNHrMUUy/BsWmZ5ChLOQ0ZeESx6XLdujSzbm4KQQJ
 eTkkKqHHKaojtS98Yeg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA2MyBTYWx0ZWRfX0d8yLWRMjOHt
 lxfL2uYmAtWfFuOB3fDxVz/1q6LvgpldbPvlvtAoS/ia6+zsnxGRM04eyh7yoqbeF2dnEF6H21C
 WT3TEiIqG/Vhfm6UCTpTZHBQ9TrPtDU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310063

Provide the required CAMSS PM clock descriptors for the QCM2290
platform. Register the top_ahb, ahb and axi clocks so they can be
managed automatically through the PM clock framework (they are part
of the camss-top group).

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index b541071e97fe02f38aebda1d9b096b930d1cfde5..8827613d34fc77d43d865e1bd05aa0cc14a4cfca 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5594,6 +5594,7 @@ static const struct camss_resources msm8996_resources = {
 
 static const struct camss_resources qcm2290_resources = {
 	.version = CAMSS_2290,
+	.pm_clks = { "top_ahb", "ahb", "axi" },
 	.csiphy_res = csiphy_res_2290,
 	.csid_res = csid_res_2290,
 	.vfe_res = vfe_res_2290,

-- 
2.34.1

